<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Http\Controllers\Api\BaseController as BaseController;
use App\Models\Category;
use App\Http\Resources\Category as CategoryResource;

class CategoryController extends BaseController
{

    public function allCategory()
    {
        try {
            $categories = Category::all();
            return response()->json([
                'status' => true,
                'data' => ['categories' => $categories]
            ], 201);
        } catch (\Exception $e) {
            return $this->sendError($e->getMessage());
        }
    }
}
