{{-- <!DOCTYPE html> --}}
{{-- <html lang="en"> --}}
{{-- @include('vendors.includes.head') --}}

{{-- <body class="g-sidenav-show bg-gray-100"> --}}
{{--    <aside class="sidenav navbar navbar-vertical navbar-expand-xs border-0 border-radius-xl my-3 fixed-start ms-3" --}}
{{--        style="background: linear-gradient(#2c3e50 , #2c3e50)" id="sidenav-main"> --}}
{{--        @include('vendors.includes.logo') --}}
{{--        <hr class="horizontal dark mt-0" style="background:white"> --}}
{{--        @include('vendors.includes.nav') --}}
{{--    </aside> --}}
{{--    <main class="main-content position-relative max-height-vh-100 h-100 border-radius-lg "> --}}
{{--        <div> --}}
{{--            </br> --}}
{{--        </div> --}}
{{--        <!-- hearder --> --}}
{{--        @include('vendors.includes.header') --}}
@extends('adminlte::page')

@section('title', 'Dashboard')

@section('content_header')
    <h1>Dashboard</h1>
@stop

@section('content')
    <div class="container py-4">
        <div class="row mb-4">
            {{-- <div class="col-lg-4 col-6">
                
                <div class="small-box bg-secondary p-2">
                    <div class="inner">
                        <h3>{{ $products }}</h3>
                        <p>Total Products</p>
                    </div>
                    <div class="icon">
                        <i class="nav-icon fas fa-cube"></i>
                    </div>
                    <a href="{{ route('vendor.products.index') }}" class="small-box-footer">More Info <i
                            class="fas fa-arrow-circle-right"></i></a>
                </div>
            </div> --}}
            {{-- <div class="col-lg-4 col-6">
        
                <div class="small-box bg-warning p-2">
                    <div class="inner">
                        <h3>{{ $orders }}</h3>
                        <p>Total Orders</p>
                    </div>
                    <div class="icon">
                        <i class="nav-icon fas fa-cube"></i>
                    </div>
                    <a href="{{ route('vendor.orders.index') }}" class="small-box-footer">More Info <i
                            class="fas fa-arrow-circle-right"></i></a>
                </div>
            </div> --}}
            {{-- <div class="col-lg-4 col-6">
                
                <div class="small-box bg-info p-2">
                    <div class="inner">
                        <h3>{{ $sales }}</h3>
                        <p>Total Sales</p>
                    </div>
                    <div class="icon">
                        <i class="nav-icon fas fa-cube"></i>
                    </div>
                    <a href="{{ route('vendor.orders.index') }}" class="small-box-footer">More Info <i
                            class="fas fa-arrow-circle-right"></i></a>
                </div>
            </div> --}}
        </div>
        {{-- <div class="row">
            <div class="col-md-6">
                {!! $chart1->renderHtml() !!}
            </div>
            <div class="col-md-6">
                {!! $chart2->renderHtml() !!}
            </div>

            <div class="col-md-6">
                {!! $chart3->renderHtml() !!}
            </div>

            <div class="col-md-6">
                {!! $chart4->renderHtml() !!}
            </div>
        </div> --}}
    </div>
    </main>


    <form action="{{ route('logout') }}" method="POST" id="logout-form-b">
        @csrf
        <!-- <button type="submit" class="btn btn-primary btn-block">Logout</button> -->
    </form>

@stop
@section('js')

    <!--   Core JS Files   -->
    {{--    <script src="{{ asset('soft_ui/js/core/popper.min.js') }}"></script> --}}
    {{--    <script src="{{ asset('soft_ui/js/core/bootstrap.min.js') }}"></script> --}}

    {{--    <!-- Plugin for the charts, full documentation here: https://www.chartjs.org/ --> --}}
    {{--    <script src="{{ asset('soft_ui/js/plugins/chartjs.min.js') }}"></script> --}}
    {{--    <script src="{{ asset('soft_ui/js/plugins/Chart.extension.js') }}"></script> --}}

    {{--    <!-- Control Center for Soft UI Dashboard: parallax effects, scripts for the example pages etc --> --}}
    {{--    <script src="{{ asset('soft_ui/js/soft-ui-dashboard.min.js') }}"></script> --}}

    {!! $chart1->renderChartJsLibrary() !!}

    {!! $chart1->renderJs() !!}
    {!! $chart2->renderJs() !!}
    {!! $chart3->renderJs() !!}
    {!! $chart4->renderJs() !!}\

@stop
{{-- </body> --}}

{{-- </html> --}}
