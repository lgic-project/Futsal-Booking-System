<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Providers\RouteServiceProvider;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Http\Request;
use App\Models\User;

class LoginController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Login Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles authenticating users for the application and
    | redirecting them to your home screen. The controller uses a trait
    | to conveniently provide its functionality to your applications.
    |
    */

    use AuthenticatesUsers;

    /**
     * Where to redirect users after login.
     *
     * @var string
     */


    protected $redirectTo = RouteServiceProvider::HOME;

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest')->except('logout');
    }
    public function loginUser(Request $request)
    {
        $this->validate($request, [
            'email' => 'required|email',
            'password' => 'required|string|min:8'
        ]);
        $user = User::where('email', $request->email)->first();
        $remember_me  = (!empty($request->remember)) ? TRUE : FALSE;
        // Crypt::encryptString()

        if ($user) {
            if (Crypt::decryptString($user->password) === $request->password) {


                auth()->guard()->login($user, $remember_me);
                // dd($user->is_admin);
                if ($user->type == "admin") {
                    // return redirect('/admin/home');
                    return redirect()->route('admin.home');
                }
            } else {
                $error = \Illuminate\Validation\ValidationException::withMessages([
                    'password' => ['Your password is incorrect'],
                ]);
                throw $error;
            }
        } else {
            $error = \Illuminate\Validation\ValidationException::withMessages([
                'email' => ['Your email is incorrect'],
            ]);
            throw $error;
        }
        return back()->withInput($request->only('email', 'remember'));
    }
}
