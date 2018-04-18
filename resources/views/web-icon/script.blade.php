@include(env('THEME').'.includes.modals')

@if(Route::currentRouteName() == 'home')
    <div class="js_loader">
        <div class="js_loader_inner"></div>
    </div>
@endif

<!--[if lt IE 9]>
<script src="{{ asset('js/html5shiv/es5-shim.min.js') }}"></script>
<script src="{{ asset('js/html5shiv/html5shiv.min.js') }}"></script>
<script src="{{ asset('js/html5shiv/html5shiv-printshiv.min.js') }}"></script>
<script src="{{ asset('js/respond/respond.min.js') }}"></script>
<![endif]-->
<script src="{{ asset('js/libs.min.js') }}"></script>

@if(Route::currentRouteName() == 'article')
    <script src="{{ asset('packages/sleepingowl/ckeditor/plugins/codesnippet/lib/highlight/highlight.pack.js') }}" rel="stylesheet"></script>
    <script>hljs.initHighlightingOnLoad();</script>
@endif
@if(Route::currentRouteName() == 'blog' || Route::currentRouteName() == 'cat_blog' || Route::currentRouteName() == 'tag_blog')
    {{--Facebook Posts--}}
    <script>
        function postFB(href) {
            FB.ui({
                method: 'share',
                mobile_iframe: true,
                href: href
            }, function(response){});
        }
    </script>
@endif

    {{--Test 5--}}