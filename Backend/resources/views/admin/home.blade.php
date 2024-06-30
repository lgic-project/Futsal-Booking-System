@extends('adminlte::page')

@section('title', 'Dashboard')

@section('content_header')
    <h1>Dashboard</h1>
@stop

@section('content')
    <div class="container py-4">
        <div class="row mb-4">
            <div class="col-lg-4 col-6">
                <!-- small box -->
                <div class="small-box bg-secondary p-2">
                    <div class="inner">
                        <h3>{{ $users }}</h3>
                        <p>Total users</p>
                    </div>
                    <div class="icon">
                        <i class="fas fa-users"></i>
                    </div>
                    <a href="{{ route('admin.users.index') }}" class="small-box-footer">More Info <i
                            class="fas fa-arrow-circle-right"></i></a>
                </div>
            </div>

            <div class="col-lg-4 col-6">
                <!-- small box -->
                <div class="small-box bg-secondary p-2">
                    <div class="inner">
                        <h3>{{ $venues }}</h3>
                        <p>Total Venue</p>
                    </div>
                    <div class="icon">
                        <i class="fas fa-users"></i>
                    </div>
                    <a href="{{ route('admin.users.index') }}" class="small-box-footer">More Info <i
                            class="fas fa-arrow-circle-right"></i></a>
                </div>
            </div>

            <div class="col-lg-4 col-6">
                <!-- small box -->
                <div class="small-box bg-info p-2">
                    <div class="inner">
                        <h3>{{ $orders }}</h3>
                        <p>Total Orders</p>
                    </div>
                    <div class="icon">
                        <i class="fas fa-solid fa-cube"></i>
                    </div>
                    <a href="{{ route('admin.orders.index') }}" class="small-box-footer">More Info <i
                            class="fas fa-arrow-circle-right"></i></a>
                </div>
            </div>

            <div class="col-lg-4 col-6">
                <!-- small box -->
                <div class="small-box bg-info p-2">
                    <div class="inner">
                        <h3>{{ $sales }}</h3>
                        <p>Total Sales</p>
                    </div>
                    <div class="icon">
                        <i class="fas fa-solid fa-cube"></i>
                    </div>
                    <a href="{{ route('admin.orders.index') }}" class="small-box-footer">More Info <i
                            class="fas fa-arrow-circle-right"></i></a>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                {!! $chart1->renderHtml() !!}
            </div>
            <div class="col-md-6">
                {!! $chart2->renderHtml() !!}
            </div>

            <div class="col-md-6">
                {!! $chart3->renderHtml() !!}
            </div>

            {{-- <div class="col-md-6">
                {!! $chart4->renderHtml() !!}
            </div> --}}
        </div>
    </div>

@stop


@section('css')
    <link rel="stylesheet" href="/css/admin_custom.css">
@stop

@section('js')
    {!! $chart1->renderChartJsLibrary() !!}

    {!! $chart1->renderJs() !!}
    {!! $chart2->renderJs() !!}
    {!! $chart3->renderJs() !!}
    {!! $chart4->renderJs() !!}
@stop
