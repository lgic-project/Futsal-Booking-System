<?php

use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Auth;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return redirect()->to('/login');
});

Auth::routes();

Route::post('/login-user', [App\Http\Controllers\Auth\LoginController::class, 'loginUser'])->name('login.user');

Route::get('/redirect', function () {
    if (\App\Helpers\TypeHelper::check() === "vendor") {
        return redirect()->route('vendor.home');
    } else {
        return redirect()->route('admin.home');
    }
})->name('redirect');

// Route::group(['as' => 'vendor.', 'prefix' => 'vendor', 'middleware' => ['auth']], function () {
// });

Route::group(['as' => 'admin.', 'prefix' => 'admin', 'middleware' => 'admin'], function () {
    Route::get('/dashboard', [App\Http\Controllers\AdminController::class, 'adminDashboard'])->name('home');
    //self
    Route::get('/profile', [App\Http\Controllers\Admin\AdminController::class, 'index'])->name('profile');
    //users
    Route::post('users/{user}/status', [App\Http\Controllers\Admin\UserController::class, 'status'])->name('users.status');
    Route::resource('users', App\Http\Controllers\Admin\UserController::class);
    Route::resource('venues', App\Http\Controllers\Admin\VenueController::class);
    Route::resource('products', App\Http\Controllers\Admin\ProductController::class);
    Route::resource('profile', App\Http\Controllers\Admin\AdminController::class);
    Route::resource('orders', App\Http\Controllers\Admin\OrderController::class);
});
