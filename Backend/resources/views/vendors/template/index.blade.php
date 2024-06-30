@extends('vendors.extends.soft_ui')
@section('content')
@section('title', $title)

@section('content_header')
    <h1>{{ $title }} List</h1>
@stop

@section('css')
    @stack('styles')
@stop

@section('content')
    @if (session('success'))
        <div class="alert alert-success p-3">
            {{-- <button type="button" class="close" data-dismiss="alert">×</button> --}}
            {{ session('success') }}
            {{-- <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button> --}}
        </div>
    @endif
    @if (session('delete'))
        <div class="alert alert-danger alert-block p-3">
            <button type="button" class="close" data-dismiss="alert">×</button>
            {{ session('delete') }}
        </div>
    @endif
    <section class="content">
        <div class="container-fluid">
            <div class="d-flex justify-content-between align-items-center mb-4">
                <h3>{{ $title }}</h3>
                @if (!isset($hideCreate))
                    <a href="{{ route($route . 'create') }}" class="btn btn-primary">
                        <i class="fa fa-plus"></i>
                        <span class="kt-hidden-mobile">Add new</span>
                    </a>
                @endif
            </div>
            <div class="row">
                <div class="col">
                    <div class="card">
                        <div class="card-body">
                            @yield('index_content')
                        </div>
                        <!-- /.card-body -->
                    </div>
                    <!-- /.card -->
                </div>
            </div>
            <!-- /.row -->
        </div>

        <!-- /.container-fluid -->
    </section>
@endsection
@endsection

@section('js')
@stack('scripts')
@stop
