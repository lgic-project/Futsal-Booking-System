<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Product;
use Illuminate\Http\Request;

class ProductController extends BaseController
{
    //
    public function allProduct()
    {
        try {
            // Retrieve all products along with their associated users
            $products = Product::with('user')->get();

            // Transforming the structure to replace 'user' with 'vendor'
            $transformedProducts = $products->map(function ($product) {
                $productArray = $product->toArray();
                $productArray['vendor'] = $productArray['user']; // Rename 'user' key to 'vendor'
                unset($productArray['user']); // Remove the 'user' key
                return $productArray;
            });

            // Return response with JSON
            return response()->json([
                'status' => true,
                'data' => ['products' => $transformedProducts]
            ], 200);
        } catch (\Exception $e) {
            // If an exception occurs, send error response
            return $this->sendError($e->getMessage());
        }
    }
}
