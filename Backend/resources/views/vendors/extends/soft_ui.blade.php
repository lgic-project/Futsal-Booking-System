<!DOCTYPE html>
<html lang="en">
<link href="https://fonts.googleapis.com/css?family=Raleway+Dots" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
@include('vendors.includes.head')


<aside class="sidenav navbar navbar-vertical navbar-expand-xs border-0 border-radius-xl my-3 fixed-start ms-3 "
    style="background: linear-gradient(#2c3e50 , #2c3e50)" id="sidenav-main">
    @include('vendors.includes.logo')
    <hr class="horizontal dark mt-0" style="background:white">
    @include('vendors.includes.nav')
</aside>
<main class="main-content position-relative max-height-vh-100 h-100 border-radius-lg ">
    <div>
        </br>
    </div>
    <!-- Navbar -->
    @include('vendors.includes.header')
    <!-- End Navbar -->
    <div class="container-fluid py-4">
        @yield('content')
    </div>
</main>


<form action="{{ route('logout') }}" method="POST" id="logout-form-b">
    @csrf
    <!-- <button type="submit" class="btn btn-primary btn-block">Logout</button> -->
</form>

<!--   Core JS Files   -->
<script src="{{ asset('soft_ui/js/core/popper.min.js') }}"></script>
<script src="{{ asset('soft_ui/js/core/bootstrap.min.js') }}"></script>

<!-- Plugin for the charts, full documentation here: https://www.chartjs.org/ -->
<script src="{{ asset('soft_ui/js/plugins/chartjs.min.js') }}"></script>
<script src="{{ asset('soft_ui/js/plugins/Chart.extension.js') }}"></script>

<!-- Control Center for Soft UI Dashboard: parallax effects, scripts for the example pages etc -->
<script src="{{ asset('soft_ui/js/soft-ui-dashboard.min.js') }}"></script>
</body>

</html>

@section('js')
    @stack('scripts')
@stop
