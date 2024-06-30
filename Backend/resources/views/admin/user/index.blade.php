@extends('admin.template.index')

@push('styles')
@endpush

@section('index_content')
    <div class="table-responsive">
        <table class="table table-hover">
            <thead>
                <tr>
                    <th scope="col"> ID</th>
                    <th scope="col">Name</th>
                    <th scope="col">Email</th>
                    <th scope="col">Type</th>
                    <th>
                        Action
                    </th>
                </tr>
            </thead>
            <tbody>
                @foreach ($users as $item)
                    <tr>
                        <td> {{ $item->id }}</td>
                        <td> {{ $item->name }}</td>
                        <td> {{ $item->email }}</td>
                        <td> {{ $item->type }}</td>
                        @if ($item->type !== 'admin')
                            <td class="d-flex align-items-center">
                                <a href="{{ route('admin.users.show', $item->id) }}"
                                    class="btn btn-sm btn-clean btn-icon btn-hover-primary"><i class="fa fa-eye"></i></a>
                                {{-- <a href="{{ route('admin.users.edit', $item->id) }}"
                                    class="btn btn-sm btn-clean btn-icon btn-hover-info btn-edit"><i
                                        class="fa fa-pencil-alt"></i></a> --}}

                                <form class="d-inline" action="{{ route('admin.users.destroy', $item->id) }}"
                                    method="POST">
                                    @csrf
                                    @method('DELETE')
                                    <button class="btn-delete btn btn-sm btn-clean btn-icon btn-hover-danger"
                                        onclick="return confirm('Are you sure?')"><i class="fa fa-trash"></i></button>
                                </form>

                                {{-- @include('admin.template.index_action') --}}
                            </td>
                        @endif
                    </tr>
                @endforeach
            </tbody>
        </table>
    </div>
@endsection

@push('scripts')
@endpush



{{-- @extends('adminlte::page')

@section('title', 'Dashboard')

@section('content_header')
<h1>All Users</h1>
@stop
@section('content')

<div class="main-content">
    <div class="container-fluid mt--7">
        <div class="row">
            <div class="col">
                <div class="card shadow">
                    <div class="card-header border-0">
                        <div class="row align-items-center">
                            <div class="col-8">
                                @if (session('status'))
                                <div class="alert alert-success" role="alert">
                                    {{ session('status') }}
                                </div>
                                @endif
                                @if (session('deleteStatus'))
                                <div class="alert alert-danger" role="alert">
                                    {{ session('deleteStatus') }}
                                </div>
                                @endif
                                <h4 class="card-title ">Users</h4>
                                <style>
                                .card-title {
                                    margin-left: 10px;
                                }
                                </style>
                            </div>
                            <div class="col-4 text-right">
                                <a href="{{ route('admin.users.store') }}" class="btn btn-sm btn-primary">Add Users</a>
                                <style>
                                .btn {
                                    margin-left: 150px;
                                }
                                </style>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-hover">
                                        <thead>
                                            <tr>
                                                <th scope="col"> ID</th>
                                                <th scope="col">Name</th>
                                                <th scope="col">Email</th>
                                                <th scope="col">Type</th>
                                                <th>
                                                    Action
                                                </th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @foreach ($users as $User)
                                            <tr>

                                                <td> {{ $User->id }}</td>
                                                <td> {{ $User->name }}</td>
                                                <td> {{ $User->email }}</td>
                                                <td> {{ $User->type }}</td>
                                                <td>
                                                    <a href="{{ route('admin.users.destroy', $User->id) }}">Delete</a>
                                                </td>
                                            </tr>
                                            @endforeach
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@stop

@section('css')
<link rel="stylesheet" href="/css/admin_custom.css">
@stop

@section('js')
<script>
console.log('Hi!');
</script>
@stop --}}
