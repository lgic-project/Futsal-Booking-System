<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\BaseController;
use App\Models\Category;
use App\Helpers\ImageHelper;
use App\Models\Product;

class ProductController extends BaseController
{

    public function __construct()
    {
        $this->title = 'Products';
        $this->resources = 'admin.product.';
        parent::__construct();
        $this->route = 'admin.products.';
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        //
        $data = $this->crudInfo();
        $data['hideCreate'] = true;
        $data['hideEdit'] = true;
        $data['products'] = Product::all();

        return view($this->indexResource(), $data);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
        $categories = Category::all();
        $data = $this->crudInfo();
        return view($this->createResource(), $data, compact('categories'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $product = new Product();
        $product->product_name = $request->input('vehicle_name');
        $product->brand_name = $request->input('brand');
        $product->category_id = $request->input('category_id');
        $product->color = $request->input('color');
        $product->quantity = $request->input('seat');
        $product->cost = $request->input('cost');
        $product->product_description = $request->input('decription');
        $product->user_id = auth()->user()->id;

        if ($request->hasFile('image') && $request->image != '') {
            $file = $request->file('image');
            $extension = $file->getClientOriginalExtension();
            $filename = time() . '.' . $extension;

            $filename = ImageHelper::saveImage($file, '/vehicles', $filename);
            $product->image = $filename;
        }
        $product->save();
        return redirect()->route($this->indexRoute())->with('success', 'User added successfully!');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(Product $product)
    {
        //

        $data = $this->crudInfo();
        $data['item'] = $product;

        $data['hideEdit'] = true;
        return view($this->showResource(), $data);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Product $product)
    {
        //
        if ($product->image != '') {
            ImageHelper::deleteImage($product->image);
        }
        $product->delete();

        return redirect()->route($this->indexRoute())->with('delete', 'Product deleted successfully!');
    }
}
