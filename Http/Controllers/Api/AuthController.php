<?php

namespace App\Http\Controllers\Api;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use App\Http\Controllers\Api\BaseController as BaseController;
use Illuminate\Support\Facades\Mail;

use Illuminate\Support\Facades\Crypt;
use Carbon\Carbon;

use App\Helpers\ImageHelper;
use App\Mail\OtpMail;

class AuthController extends BaseController
{


    //register user 
    public function register(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required',
            'phone_number' => 'required|numeric|unique:users',
            'email' => 'required||email|unique:users',
            'password' => 'required',

        ]);
        if ($validator->fails()) {
            $response['message'] = $validator->messages()->first();
            $response['status'] = false;
            return $response;
        } else {
            $user = new User([
                'name' => $request->name,
                'phone_number' => $request->phone_number,
                'email' => $request->email,
                'password' => bcrypt($request->password),
                'email_verified_at' => Carbon::now(),
                'type' => "user"
            ]);
            $user->save();

            $tokenResult = $user->createToken('Personal Access Token');
            $token = $tokenResult->token;
            $token->expires_at = Carbon::now()->addMonths(3);
            $token->save();
            $customer = $user;
            $token = [
                'access_token' => $tokenResult->accessToken,
                'token_type' => 'Bearer',
                'expires_at' => Carbon::parse(
                    $tokenResult->token->expires_at
                )->toDateTimeString()
            ];

            return response()->json([
                'status' => true,
                'message' => 'User Registered SUccessfully.',
                'data' =>  ['user' => $customer, 'token' => $token]
            ]);
        }
    }

    //login user 
    public function login(Request $request)
    {
        try {
            $validator = \Illuminate\Support\Facades\Validator::make($request->all(), [
                'email' => 'nullable',
                'password' => 'required|string',
            ]);
            if ($validator->fails()) {
                $response['message'] = $validator->messages()->first();
                $response['status'] = false;
                return $response;
            } else {
                $credentials = request(['email', 'password']);
                $credentials = ['email' => $request->get('email'), 'password' => $request->get('password')];

                if (!Auth::guard()->attempt($credentials))
                    return response()->json([
                        'status' => false,
                        'message' => 'The email or password is incorrect.'
                    ]);
                $user = $request->user();

                $tokenResult = $user->createToken('Personal Access Token');
                $token = $tokenResult->token;
                if ($request->remember_me)
                    $token->expires_at = \Illuminate\Support\Carbon::now()->addMonths(3);
                $token->save();
                $token = [
                    'access_token' => $tokenResult->accessToken,
                    'token_type' => 'Bearer',
                    'expires_at' => Carbon::parse(
                        $tokenResult->token->expires_at
                    )->toDateTimeString()
                ];

                return response()->json([
                    'status' => true,
                    'data' => ['user' => $user, 'token' => $token]
                ]);
            }
        } catch (\Exception $e) {
            return $this->sendError($e->getMessage());
        }
    }

    //reset user password 
    public function resetPassword(Request $request)
    {
        try {
            //validation
            $validator = Validator::make($request->all(), [
                'customer_id' => 'required',
                'otp' => 'required',
                'new_password' => 'required|string|min:8',
            ]);

            if ($validator->fails()) {
                $response['data'] = $validator->messages();
                $response['success'] = false;
                return $response;
            }

            $customer = User::where('id', $request->customer_id)->first();
            if (!$customer) {
                return response()->json([
                    'success' => false,
                    'message' => 'Invalid customer id. Please try again.'
                ]);
            }
            if ($request->otp != $customer->otp) {
                return response()->json([
                    'success' => false,
                    'message' => 'Invalid otp.'
                ]);
            }

            $customer->password = bcrypt($request->new_password);
            $customer->update();
            return response()->json([
                'success' => true,
                'message' => 'Password Reset Successfully.'
            ]);
        } catch (\Exception $e) {
            return $this->sendError($e->getMessage());
        }
    }

    public function updateProfile(Request $request)
    {

        $customer = auth()->user();
        //validation
        $validator = Validator::make($request->all(), [
            'name' => 'required',
            'phone_number' => 'required|numeric',
        ]);
        if ($validator->fails()) {
            $response['message'] = $validator->messages()->first();
            $response['status'] = false;
            return $response;
        }
        try {

            $customer->Update($request->only('name', 'phone_number'));

            if ($request->hasFile('profile_image') && $request->profile_image != '') {

                if ($customer->profile_image) {
                    ImageHelper::deleteImage($customer->profile_image);
                }

                $file = $request->file('profile_image');
                $extension = $file->getClientOriginalExtension();
                $filename = time() . '.' . $extension;

                $filename = ImageHelper::saveImage($file, '/users/profile-images', $filename);
                $customer->profile_image = $filename;

                $customer->update();
            }
        } catch (\Exception $e) {
            return response()->json(
                [
                    $e,
                    'status' => false,
                    'message' => 'Could\'t update the profile'
                ]
            );
        }
        return response()->json([
            'status' => true,
            'message' => 'Profile updated successfully',
            'data' => ['user' => $customer]
        ]);
    }



    public function forgetPassword(Request $request)
    {
        try {
            //validation
            $validator = Validator::make($request->all(), [
                'email' => 'required',
            ]);

            if ($validator->fails()) {
                $response['data'] = $validator->messages();
                $response['success'] = false;
                return $response;
            }
            $customer = User::where('email', $request->email)
                ->where('type', 'user')
                ->first();

            if (!$customer) {
                return response()->json([
                    'success' => false,
                    'message' => 'Invalid email. Please try again.'
                ]);
            }

            $otp = mt_rand(10000, 99999);
            $customer->otp = $otp;
            $customer->update();

            $mail_details = [
                'subject' => 'OTP Verification',
                'body' => $otp
            ];

            Mail::to($request->email)->send(new OtpMail($mail_details));
            return response()->json([
                'success' => true,
                'data' => [
                    'customer' => $customer->id,
                    'otp' => $otp
                ]
            ]);
        } catch (\Exception $e) {
            return $this->sendError($e->getMessage());
        }
    }

    //change password of the user
    public function changePassword(Request $request)
    {
        try {
            $user = auth()->user();
            //validation
            $validator = Validator::make($request->all(), [
                'old_password' => 'required|string|min:8',
                'new_password' => 'required|string|min:8',
            ]);

            if ($validator->fails()) {
                $response['data'] = $validator->messages();
                $response['status'] = false;
                return $response;
            }

            // Crypt::encryptString()
            bcrypt($request->input('password'));
            if (!(Hash::check($request->get('old_password'), $user->getAuthPassword()))) {
                // The passwords matches
                return response()->json(['status' => false, 'message' => 'Your current password does not match with the password you provided. Please try again.']);
            }

            //update
            if (strcmp($request->get('old_password'), $request->get('new_password')) == 0) {
                //Current password and new password are same
                return response()->json(['success' => false, 'message' => 'New Password cannot be same as your current password. Please choose a different password.']);
            }
            $user->password = bcrypt($request->get('new_password'));
            $user->save();
            return response()->json([
                'status' => true,
                'message' => 'Password updated successfully',
                'data' => $user,
            ]);
        } catch (\Exception $e) {
            return $this->sendError($e->getMessage());
        }
    }


    public function logout(Request $request)
    {
        $request->user()->token()->revoke();
        return response()->json([
            'status' => true,
            'message' => 'Successfully logged out'
        ]);
    }
}