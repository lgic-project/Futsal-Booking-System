<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\BaseController;
use App\Models\Venue;

use App\Helpers\ImageHelper;
use Illuminate\Http\Request;

class VenueController extends  BaseController
{
    public function __construct()
    {
        $this->title = 'Venue';
        $this->resources = 'admin.venue.';
        parent::__construct();
        $this->route = 'admin.venues.';
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $data = $this->crudInfo();
        $data['venues'] = Venue::all();

        if ($data['venues']->count() === 1) {
            $data['hideCreate'] = true;
        } elseif ($data['venues']->count() === 0) {
            unset($data['hideCreate']);
        }

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
        $data = $this->crudInfo();
        return view($this->createResource(), $data);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {

        $request->validate([
            'image' => 'required|mimes:jpeg,jpg,png|max:10000',
        ]);


        $venue = new Venue();
        $venue->name = $request->input('name');
        $venue->cost = $request->input('cost');
        $venue->description = $request->input('description');
        $venue->rules = $request->input('rules');
        if ($request->hasFile('image') && $request->image != '') {
            $file = $request->file('image');
            $extension = $file->getClientOriginalExtension();
            $filename = time() . '.' . $extension;

            $filename = ImageHelper::saveImage($file, '/venues', $filename);
            $venue->image = $filename;
        }
        $venue->save();
        return redirect()->route($this->indexRoute())->with('success', 'venue added successfully!');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(Venue $venue)
    {
        //
        $data = $this->crudInfo();
        $data['item'] = $venue;
        return view($this->showResource(), $data);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit(Venue $venue)
    {
        //

        $data = $this->crudInfo();
        $data['item'] = $venue;
        return view($this->editResource(), $data);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Venue $venue)
    {
        //
        $request->validate([
            'cost' => 'required',
            'description' => 'required',
            'rules' => 'required',
            'image' => 'mimes:jpeg,jpg,png|max:10000',
        ]);

        $venue->name = $request->input('name');
        $venue->cost = $request->input('cost');
        $venue->description = $request->input('description');
        $venue->rules = $request->input('rules');


        if ($request->hasFile('image') && $request->image != '') {
            ImageHelper::deleteImage($venue->image);
            $file = $request->file('image');
            $extension = $file->getClientOriginalExtension();
            $filename = time() . '.' . $extension;
            $filename = ImageHelper::saveImage($file, '/venues', $filename);
            $venue->image = $filename;
        }
        $venue->save();

        return redirect()->route($this->indexRoute())->with('success', 'venue edited successfully!');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Venue $venue)
    {
        //
        // if ($venue->image != '') {
        //     ImageHelper::deleteImage($venue->image);
        // }
        $venue->delete();
        return redirect()->route($this->indexRoute())->with('delete', 'venue deleted successfully!');
    }
}
