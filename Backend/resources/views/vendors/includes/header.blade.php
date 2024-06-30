<nav class="navbar navbar-main navbar-expand-lg px-0 mx-4 shadow-none border-radius-xl "
    style="background: linear-gradient(#2c3e50 , #2c3e50)"id=" navbarBlur" navbar-scroll="true">
    <div class="container-fluid py-1 px-3">
        <nav aria-label="breadcrumb">
            <h6 class="font-weight-bolder mb-0" id="greeting" style="color:white;font-weight:400">Good Morning</h6>
            <h6 class="font-weight-bolder mb-0" style="color:white">{{ auth()->user()->name }}</h6>
        </nav>
        <div class="collapse navbar-collapse mt-sm-0 mt-2 me-md-0 me-sm-4" id="navbar">
            <div class="ms-md-auto pe-md-3 d-flex align-items-center">
            </div>
            <ul class="navbar-nav  justify-content-end">

                <li class="nav-item d-flex align-items-center my-2 ml-3">
                    <a href="javascript:;" class="nav-link text-body font-weight-bold px-0 padding">
                        <i class="fa fa-user me-sm-1" style="color:white"></i>

                        <span class="d-sm-inline d-none " onclick="document.getElementById('logout-form-b').submit();"
                            style="color:white">Sign Out</span>
                    </a>
                </li>



            </ul>
        </div>
    </div>

</nav>


<script>
    var greeting = document.getElementById("greeting");
    var time = new Date().getHours();

    if (time >= 0 && time < 5) {
        greeting.innerHTML = "Good Night";
    } else if (time >= 5 && time < 12) {
        greeting.innerHTML = "Good Morning";
    } else if (time >= 12 && time < 18) {
        greeting.innerHTML = "Good Afternoon";
    } else {
        greeting.innerHTML = "Good Evening";
    }
</script>
