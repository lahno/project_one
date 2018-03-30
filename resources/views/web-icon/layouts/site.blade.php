<!--[if lt IE 7 ]><html class="ie ie6" lang="{{ app()->getLocale() }}"> <![endif]-->
<!--[if IE 7 ]><html class="ie ie7" lang="{{ app()->getLocale() }}"> <![endif]-->
<!--[if IE 8 ]><html class="ie ie8" lang="{{ app()->getLocale() }}"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--><html lang="{{ app()->getLocale() }}"> <!--<![endif]-->
<head>
    <!-- Global site tag (gtag.js) - Google Analytics -->
    <script async src="https://www.googletagmanager.com/gtag/js?id=UA-13270840-2"></script>
    <script>
        window.dataLayer = window.dataLayer || [];
        function gtag(){dataLayer.push(arguments);}
        gtag('js', new Date());

        gtag('config', 'UA-13270840-2');
    </script>

    <meta charset="UTF-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>{{ (LaravelLocalization::getCurrentLocale() == 'ru') ? $title : $title_en }}</title>
    <meta name="description" content="{{(LaravelLocalization::getCurrentLocale() == 'ru') ? $description : $description_en}}"/>
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <meta property="og:url" content="{{Request::fullUrl()}}">
    <meta property="og:type" content="article">
    <meta property="og:title" content="{{ (LaravelLocalization::getCurrentLocale() == 'ru') ? $title : $title_en }}">
    <meta property="og:description" content="{{(LaravelLocalization::getCurrentLocale() == 'ru') ? $description : $description_en}}">
    <meta property="og:image" content="{{asset($title_img)}}">
    <!--Let browser know website is optimized for mobile-->
    @if(Route::currentRouteName() == 'portfolio')
        <meta name="viewport" content="width=1000, user-scalable=no">
    @else
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1">
    @endif
    <link rel="shortcut icon" href="{{ asset('img/favicon/favicon.ico') }}" type="image/x-icon">
    <link rel="apple-touch-icon" href="{{ asset('img/favicon/apple-touch-icon.png') }}">
    <link rel="apple-touch-icon" sizes="72x72" href="{{ asset('img/favicon/apple-touch-icon-72x72.png') }}">
    <link rel="apple-touch-icon" sizes="114x114" href="{{ asset('img/favicon/apple-touch-icon-114x114.png') }}">
    <link href="{{ asset('css/libs.min.css') }}" rel="stylesheet">
    <link href="{{ asset('css/main.css') }}" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    @if(Route::currentRouteName() == 'article')
        <link href="{{ asset('packages/sleepingowl/ckeditor/plugins/codesnippet/lib/highlight/styles/monokai_sublime.css') }}" rel="stylesheet">
    @endif
</head>
<body class="bg_{{(Route::currentRouteName() == 'about') ? 'page' : Route::currentRouteName()}}">
<div class="over">

    <!-- CONTENT -->
    @yield('content')
    <!-- CONTENT -->

    <div class="fixed-action-btn btn-floating-regular">
        <a href="#modal_send" class="btn-floating btn-large waves-effect waves-light modal-trigger"><i class="material-icons">send</i></a>
    </div>

    <footer>
        <p class="text-center">2018 © Web-icon.com.ua {{trans('main.copy_past')}}</p>
    </footer>
</div>

    <!-- SCRIPTS -->
    @yield('scripts')
    <!-- SCRIPTS -->

</body>
</html>