@extends('layouts.vendor')
@section('content')
    <div class="container py-5">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-body">
                        Sorry {{ auth()->user()->name }}, Your account is not active yet !
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
