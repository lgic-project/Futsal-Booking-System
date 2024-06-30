<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Api\BaseController as BaseController;
use App\Models\Order;
use App\Models\Payment;
use Illuminate\Http\Request;
use Carbon\Carbon;


class OrderController extends BaseController
{


    public function searchBookings(Request $request)
    {
        try {
            $user = auth()->user();
            $validator = \Illuminate\Support\Facades\Validator::make($request->all(), [
                'start_date' => 'required',
                'end_date' => 'required',
            ]);

            if ($validator->fails()) {
                $response = [
                    'status' => false,
                    'message' => $validator->messages()->first()
                ];
                return response()->json($response, 400);
            }

            // Convert datetime format
            $startDatetime = Carbon::createFromFormat('Y-m-d H:i:s', $request->start_date)->format('Y-m-d H:i:s');
            $endDatetime = Carbon::createFromFormat('Y-m-d H:i:s', $request->end_date)->format('Y-m-d H:i:s');

            $existingOrder = Order::where(function ($query) use ($startDatetime, $endDatetime) {
                $query->where(function ($query) use ($startDatetime, $endDatetime) {
                    $query->whereBetween('start_date', [$startDatetime, $endDatetime])
                        ->orWhereBetween('end_date', [$startDatetime, $endDatetime])
                        ->orWhere(function ($query) use ($startDatetime, $endDatetime) {
                            $query->where('start_date', '<=', $startDatetime)
                                ->where('end_date', '>=', $endDatetime);
                        });
                });
            })->exists();

            if ($existingOrder) {
                $response = [
                    'status' => false,
                    'message' => 'There are existing bookings within the given time frame.'
                ];
                return response()->json($response, 200);
            }

            $response = [
                'status' => true,
                'message' => 'No bookings found within the given time frame.'
            ];
            return response()->json($response, 200);
        } catch (\Exception $e) {
            return $this->sendError($e->getMessage());
        }
    }


    public function postOrder(Request $request)
    {
        try {
            $user = auth()->user();
            $validator = \Illuminate\Support\Facades\Validator::make($request->all(), [
                'start_date' => 'required|date',
                'end_date' => 'required|date|after:start_date',
                'total' => 'required|numeric',
                'payment_method' => 'required',
            ]);

            if ($validator->fails()) {
                $response['message'] = $validator->messages()->first();
                $response['status'] = false;
                return $response;
            } else {
                $order = new Order([
                    'user_id' => $user->id,
                    'start_date' => $request->start_date,
                    'end_date' => $request->end_date,
                    'total' => $request->total,
                    'payment_method' => $request->payment_method,
                ]);
                $order->save();

                $payment = new Payment([
                    'user_id' => $user->id,
                    'order_id' => $order->id,
                    'payment_method' => $request->payment_method,
                    'total' => $request->total, // Provide the 'total' value here
                ]);
                $payment->save();

                return response()->json([
                    'status' => true,
                    'message' => 'Order added successfully.',
                    'data' => [
                        'order' => $order,
                    ]
                ]);
            }
        } catch (\Exception $e) {
            return $this->sendError($e->getMessage());
        }
    }





    public function verifyPayment(Request $request)
    {
        $token = $request->token;
        $amount = $request->amount;

        $args = http_build_query(array(
            'token' => $token,
            'amount'  => $amount
        ));

        $url = "https://khalti.com/api/v2/payment/verify/";

        # Make the call using API.
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $args);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);

        $headers = ['Authorization: Key test_secret_key_37e47644e0be4e2590ca7134949f7305'];
        curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);

        // Response
        $response = curl_exec($ch);
        $status_code = curl_getinfo($ch, CURLINFO_HTTP_CODE);
        curl_close($ch);

        return $response;
    }



    public function viewOrder(Request $request)
    {
        try {
            $user = auth()->user();

            $orders = Order::where('user_id', $user->id)
                ->get();

            return response()->json([
                'status' => true,
                'data' => [
                    'orders' => $orders,
                ],
            ], 200);
        } catch (\Exception $e) {
            return $this->sendError($e->getMessage());
        }
    }
}