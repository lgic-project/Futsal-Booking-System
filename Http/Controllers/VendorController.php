<?php

namespace App\Http\Controllers;

use App\Http\Controllers\BaseController;
use App\Models\Order;
use App\Models\Product;
use App\Models\Vehicle;
use LaravelDaily\LaravelCharts\Classes\LaravelChart;

class VendorController extends BaseController
{
    //
    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */

    public function statusFailed()
    {
        return view('vendors.disapprove');
    }
    public function vendorDashboard()
    {


        return view('layouts.vendor', []);
    }
}