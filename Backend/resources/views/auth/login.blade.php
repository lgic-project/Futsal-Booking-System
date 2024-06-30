<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Leo Futsal</title>
    <link rel="stylesheet" href="{{ asset('login.css') }}">
</head>

<body>

    <div class="login-box">
        <h2>Welcome to Leo Futsal</h2>
        <form action="{{ route('login.user') }}" method="POST" id="login-form">
            @csrf
            <div class="user-box">
                <input type="text" name="email" required="true" placeholder="Email">

                @if ($errors->has('email'))
                    <p class="text-danger" style="color: red;">
                        {{ $errors->first('email') }}
                    </p>
                @endif
            </div>

            <div class="user-box">
                <input type="password" name="password" required="true" placeholder="Password">

                @if ($errors->has('password'))
                    <p class="text-danger" style="color: red;">
                        {{ $errors->first('password') }}
                    </p>
                @endif
            </div>
            <button type="submit" class="submit-button">
                Submit
            </button>
            <br />
            <br />
        </form>
    </div>

</body>

</html>
