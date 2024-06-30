@extends('adminlte::page')

@section('title', 'Dashboard')

@section('content_header')
    <h1>Add Users</h1>
@stop
@section('content')
    <form action="{{ route('admin.users.store') }}" method="POST" enctype="multipart/form-data">
        @csrf()
        <div class="main-content">
            <div class="container-fluid mt--7">
                <div class="row">
                    <div class="col">
                        <div class="card shadow">
                            <div class="card-header border-0">
                                <!-- <form> -->
                                <div class="form-group">
                                    <div class="form-group col-md-6">
                                        <label for="inputEmail4">Name</label>
                                        <input type="text" class="form-control" id="input1" placeholder="Name"
                                            required name="username">
                                    </div>

                                </div>
                                <div class="form-group">
                                    <div class="form-group col-md-6">
                                        <label for="inputEmail4">Email</label>
                                        <input type="email" class="form-control" id="input2" placeholder="Email"
                                            required name="email">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="form-group col-md-6">
                                        <label for="inputEmail4">Phone Number</label>
                                        <input type="big-number" class="form-control" id="input3" name="phone_number"
                                            required placeholder="Phone Number">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="form-group col-md-6">
                                        <label for="inputEmail4">Type</label>
                                        <input type="big-number" class="form-control" id="input3" name="type" required
                                            placeholder="Type">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="form-group col-md-6">
                                        <label for="inputState">Type</label>
                                        <select id="inputState" class="form-control" name="type">
                                            <option selected>Choose...</option>
                                            <option>user</option>
                                            <option>vendor</option>

                                        </select>
                                    </div>

                                </div>
                                <!-- <div class="form-group ">
                                    <div class="form-group col-md-6">
                                        <label for="inputState"> Image</label>
                                        <input type="file" class="form-control" name="user_image" id="image" required>
                                        </br>
                                    </div>
                                </div> -->
                                <div class="form-group">
                                    <div class="form-group col-md-6">
                                        <label for="inputEmail4">Password</label>
                                        <input type="big-number" class="form-control" id="input4" placeholder="Password"
                                            name="password" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="form-group col-md-6">
                                        <label for="inputEmail4">Confirm Password</label>
                                        <input type="big-number" class="form-control" id="input5"
                                            placeholder="Confirm Password">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="gridCheck" required>
                                        <label class="form-check-label" for="gridCheck">
                                            Agree to terms and conditions
                                        </label>
                                    </div>
                                </div>
                                <!-- </form> -->
                                <button type="submit" class="btn btn-primary">Add User</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </div>
    </form>



    </form>
@stop

@section('css')
    <link rel="stylesheet" href="/css/admin_custom.css">
@stop

@section('js')
    <script>
        console.log('Hi!');
    </script>
@stop
