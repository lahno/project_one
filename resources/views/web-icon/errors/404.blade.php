<!--[if lt IE 7 ]><html class="ie ie6" lang="{{ app()->getLocale() }}"> <![endif]-->
<!--[if IE 7 ]><html class="ie ie7" lang="{{ app()->getLocale() }}"> <![endif]-->
<!--[if IE 8 ]><html class="ie ie8" lang="{{ app()->getLocale() }}"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--><html lang="{{ app()->getLocale() }}"> <!--<![endif]-->
<head>
    <meta charset="UTF-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Page error 404</title>
    <!--Let browser know website is optimized for mobile-->
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1">
    <link rel="shortcut icon" href="{{ asset('img/favicon/favicon.ico') }}" type="image/x-icon">
    <link rel="apple-touch-icon" href="{{ asset('img/favicon/apple-touch-icon.png') }}">
    <link rel="apple-touch-icon" sizes="72x72" href="{{ asset('img/favicon/apple-touch-icon-72x72.png') }}">
    <link rel="apple-touch-icon" sizes="114x114" href="{{ asset('img/favicon/apple-touch-icon-114x114.png') }}">
    <link href="{{ asset('css/libs.min.css') }}" rel="stylesheet">
    <link href="{{ asset('css/main.css') }}" rel="stylesheet">
</head>
<body class="bg_error_page">
<div class="over">

    <div class="blur_bg"><div class="brightness"></div></div>
    <div class="content_page">
        <!-- MENU -->
        @include(env('THEME').'.menu')
        <!-- MENU -->
        <div class="main animate">
            <h1 class="title_page no-pod_title_text text-center" style="padding-top: 10%;">{{trans('main.404_title')}}<br>{{trans('main.404_pod_title')}}</h1>
        </div>
    </div>

    <footer>
        <p class="text-center">2017 © Web-icon.com.ua {{trans('main.copy_past')}}</p>
    </footer>
</div>
<!-- SCRIPTS -->
<!--[if lt IE 9]>
<script src="{{ asset('js/html5shiv/es5-shim.min.js') }}"></script>
<script src="{{ asset('js/html5shiv/html5shiv.min.js') }}"></script>
<script src="{{ asset('js/html5shiv/html5shiv-printshiv.min.js') }}"></script>
<script src="{{ asset('js/respond/respond.min.js') }}"></script>
<![endif]-->
<script src="{{ asset('js/libs.min.js') }}"></script>
<script src="{{ asset('js/main.js') }}"></script>
<!-- SCRIPTS -->
</body>
</html>