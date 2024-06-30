<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Crypt;
use App\Http\Controllers\BaseController;


class UserController extends BaseController
{

    public function __construct()
    {
        $this->title = 'User';
        $this->resources = 'admin.user.';
        parent::__construct();
        $this->route = 'admin.users.';
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $data = $this->crudInfo();
        $data['users'] = User::all();
        $data['hideEdit'] = true;
        return view($this->indexResource(), $data);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
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
            'username' => 'required',
            'email' => 'required|unique:users',
            'phone_number' => 'required|min:8|max:11',
            'type' => 'required',
            'password' => 'required|min:8'
        ]);

       
        $user = new User();
        $user->name = $request->input('username');
        $user->email = $request->input('email');
        $user->phone_number = $request->input('phone_number');
        $user->type = $request->input('type');
        // $user->image = $imagename;
        if ($request->type == 'user') {
            $user->password = bcrypt($request->input('password'));
        } else {

            $user->password = Crypt::encryptString($request->input('password'));
        }
        $user->save();
        return redirect()->route($this->indexRoute())->with('success', 'User added successfully!');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(User $user)
    {
        //
        $data = $this->crudInfo();
        $data['hideEdit'] = true;
        $data['item'] = $user;
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
    public function destroy(User $user)
    {
        //

        $user->delete();

        return redirect()->route($this->indexRoute())->with('delete', 'User deleted successfully!');
    }

    public function status(User $user)
    {
        $user->approved = !$user->approved;
        $user->save();
        return redirect()->back()->with('success', 'User Status Changed Successfully');
    }
}