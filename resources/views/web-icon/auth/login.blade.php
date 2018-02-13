<!doctype html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Administrator panel</title>

    <link href="{{ asset('css/libs.min.css') }}" rel="stylesheet">
    <link href="{{ asset('css/main.css') }}" rel="stylesheet">
    <style>
        form{
            background: #fff;
            padding: 30px .75rem!important;
        }
        .btn-link{
            margin-left: 20px;
            font-size: 14px;
        }
        h1{
            font-size: 18px;
            text-align: center;
        }
    </style>
</head>
<body>
<div class="container" style="padding-top: 10%;">
    <div class="row">
        <div class="col s6 offset-s3">
            <form id="formLogin" class="col s12" action="{{route('login')}}" method="POST">
                {{ csrf_field() }}
                <div class="container">
                    <h1>Login</h1>
                    <div class="row">
                        <div class="input-field col s12">
                            <input id="inp_email" name="email" value="{{ old('email') }}" type="text" class="validate">
                            <label for="inp_email">Email</label>
                        </div>
                        <div class="input-field col s12">
                            <input id="inp_password" name="password" type="password" required>
                            <label for="inp_password">Password</label>
                        </div>
                        <div class="col s12">
                            <p>
                                <input id="check_remember" type="checkbox" name="remember" {{ old('remember') ? 'checked' : '' }}>
                                <label for="check_remember">Remember Me</label>
                            </p>
                        </div>
                        {{--LOADER--}}
                        <div class="loader_block valign-wrapper">
                            <div class="center">
                                <div class="preloader-wrapper active">
                                    <div class="spinner-layer spinner-blue">
                                        <div class="circle-clipper left">
                                            <div class="circle"></div>
                                        </div><div class="gap-patch">
                                            <div class="circle"></div>
                                        </div><div class="circle-clipper right">
                                            <div class="circle"></div>
                                        </div>
                                    </div>

                                    <div class="spinner-layer spinner-red">
                                        <div class="circle-clipper left">
                                            <div class="circle"></div>
                                        </div><div class="gap-patch">
                                            <div class="circle"></div>
                                        </div><div class="circle-clipper right">
                                            <div class="circle"></div>
                                        </div>
                                    </div>

                                    <div class="spinner-layer spinner-yellow">
                                        <div class="circle-clipper left">
                                            <div class="circle"></div>
                                        </div><div class="gap-patch">
                                            <div class="circle"></div>
                                        </div><div class="circle-clipper right">
                                            <div class="circle"></div>
                                        </div>
                                    </div>

                                    <div class="spinner-layer spinner-green">
                                        <div class="circle-clipper left">
                                            <div class="circle"></div>
                                        </div><div class="gap-patch">
                                            <div class="circle"></div>
                                        </div><div class="circle-clipper right">
                                            <div class="circle"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="btn_modal_box valign-wrapper">
                        <button class="btn btn_send waves-effect waves-light" type="submit" name="action">Login</button>
                        <a class="btn-link" href="{{ route('password.request') }}">
                            Forgot Your Password?
                        </a>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<script src="{{ asset('js/libs.min.js') }}"></script>
<script src="{{ asset('js/main.js') }}"></script>
</body>
</html>