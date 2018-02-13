@extends(env('THEME').'.layouts.site')

@section('content')

    @if (!Cookie::get('greeting'))
    <div class="greeting_box">
        <div class="substrate"></div>
        <div class="container">
            <div class="row">
                <div class="col s6 offset-s3 m8 offset-m2 l6 offset-l3 xl4 offset-xl4 text-center logo_box">
                    <div class="shape">
                        <div>
                            <svg xmlns="http://www.w3.org/2000/svg" width="678.69" height="199.01" viewBox="0 0 678.69 199.01" class="logo_svg">
                                <g>
                                    <g>
                                        <path class="a" d="M221.5,136.53q0,6.82,10.28,6.82h27q11.46,0,11.46,8.1a10.26,10.26,0,0,1-4,8.64q-4,3.1-11.33,3.09H229.14q-14.38,0-21.88-7.1t-7.51-20.74A42.92,42.92,0,0,1,211.63,105q11.87-12.74,28.25-12.74,11.92,0,19.15,6.23T266.26,115q0,12.28-10,18.2-5.55,3.37-16.56,3.37ZM225.86,120h10q9.73,0,9.46-4.28-.27-4.82-6.28-4.82Q230.69,110.87,225.86,120Z"/>
                                        <path class="a" d="M318.85,93.58a24.88,24.88,0,0,1,7.28-1.27,21.19,21.19,0,0,1,17.11,7.87q6.55,7.87,6.55,20.43,0,24.29-18.74,37.85a23,23,0,0,1-13.65,4.73h-8.64a20.8,20.8,0,0,1-15.38-6.46q-3.82,6.46-12,6.46a9.37,9.37,0,0,1-6.64-2.55,8.15,8.15,0,0,1-2.73-6.19,16.86,16.86,0,0,1,1.46-6.28l1-2.46,38.12-94,1-2.55Q317.85,39,326.77,39a9.88,9.88,0,0,1,6.87,2.5,8,8,0,0,1,2.77,6.14A16.39,16.39,0,0,1,335,53.91l-1,2.55Zm-18.11,44.58q4.55,5.82,10.65,5.82a11.26,11.26,0,0,0,7.37-2.46,27.85,27.85,0,0,0,7.32-10,28.39,28.39,0,0,0,3.14-11.92,9.54,9.54,0,0,0-2.37-6.69,8,8,0,0,0-6.19-2.59q-8.64,0-13.83,12.83Z"/>
                                        <path class="a" d="M363.43,116.6h16.65q8.64,0,8.64,7.73t-8.64,7.83H361.7a9,9,0,0,1-6.23-2.14,7.86,7.86,0,0,1,0-11.28,9,9,0,0,1,6.28-2.14Z"/>
                                        <path class="a" d="M415.57,143.35h10.28q11.46,0,11.46,8.1a10.26,10.26,0,0,1-4,8.64q-4.05,3.1-11.33,3.09H407.47q-8,0-12.6-3.28a10.38,10.38,0,0,1-4.59-8.92,21.14,21.14,0,0,1,1.91-7.64l15-36.94,1-2.55q4.18-10.28,13.47-10.28a9.43,9.43,0,0,1,6.6,2.55,8,8,0,0,1,2.77,6.1q0,2.91-2.46,8.92Zm12-78.79a12.67,12.67,0,0,1,9,21.61,12.67,12.67,0,0,1-17.92-17.92A12.2,12.2,0,0,1,427.58,64.56Z"/>
                                        <path class="a" d="M492.9,163.19H466.52q-11.37,0-18.52-8t-7.14-20.74a41.88,41.88,0,0,1,11.74-29.57q11.74-12.56,27.57-12.56,10.73,0,17.47,6A20,20,0,0,1,504.37,114,17.46,17.46,0,0,1,501,125a10.48,10.48,0,0,1-8.64,4.32q-8.37,0-8.37-7.82v-2q.09-1,.09-1.91,0-6.37-6.28-6.37-5.92,0-10.78,6.28a22.31,22.31,0,0,0-4.87,14q0,6.46,4,9.14t13.42,2.68h17.2q11.55,0,11.55,8.1a10.2,10.2,0,0,1-4.14,8.6Q500,163.19,492.9,163.19Z"/>
                                        <path class="a" d="M553.77,92.31q13.19,0,21.7,8.37T584,122a45.52,45.52,0,0,1-4.46,19.33A42,42,0,0,1,568,156.64a28,28,0,0,1-9.78,5.14q-5,1.41-14.15,1.41-14.83,0-20-3.55-12.19-8.37-12.19-24.75,0-17.29,12.46-29.93T553.77,92.31Zm-2.18,19.38q-6.74,0-12.28,6.64A22.33,22.33,0,0,0,533.76,133q0,10.56,11.83,10.55,6.91,0,10.65-4.28a23.51,23.51,0,0,0,6.19-16,11.7,11.7,0,0,0-3-8.37A10.26,10.26,0,0,0,551.59,111.69Z"/>
                                        <path class="a" d="M656.22,143.35h10.92q11.55,0,11.56,8.1a10.21,10.21,0,0,1-4.09,8.64q-4.09,3.1-11.28,3.09h-19a13.5,13.5,0,0,1-9.33-3.37,10.85,10.85,0,0,1-3.78-8.46q0-3.09,2.55-9.28l8-19.83a16,16,0,0,0,1.36-5,4.44,4.44,0,0,0-1.77-3.73,7.24,7.24,0,0,0-4.78-1.55q-9.37,0-15.1,14.1l-10.74,26.39q-4.82,12-14.37,12a9.8,9.8,0,0,1-6.64-2.37,7.41,7.41,0,0,1-2.73-5.82,16.56,16.56,0,0,1,1.46-6.1l1-2.46,18.38-45.31q3.55-8.82,12.1-8.83a10.32,10.32,0,0,1,10,6.19q9.73-7.46,18.56-7.46,8.55,0,14.1,4.91a15.92,15.92,0,0,1,5.55,12.46,25,25,0,0,1-2,9.19Z"/>
                                    </g>
                                    <path class="a" d="M199,99.5A99.43,99.43,0,1,1,189,56l-.74.94-2.87,3.63-35.57,46.32,4.23-38c.1-1.11.16-2.83.16-5.15q0-8.48-5.15-13.47t-13.93-5q-14.22,0-25,15.44L76.42,109l4.24-42.39c.2-2.11.3-4,.3-5.75q0-15.59-14.22-15.59-9.54,0-15.07,6.59T45.24,70.7L41,134.12a25.41,25.41,0,0,0-.15,3q0,12.42,6.51,20.29A20.67,20.67,0,0,0,64,165.31q11.8,0,21.5-14.08l30.87-44.35-5,27.24a36.32,36.32,0,0,0-.45,5.61,25.86,25.86,0,0,0,6.81,18.16,21.76,21.76,0,0,0,16.65,7.42q12,0,23.16-14.08L199,99.06C199,99.21,199,99.35,199,99.5Z"/>
                                </g>
                            </svg>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row carusel_box">
                <div class="col s12 m10 offset-m1 l10 offset-l1 xl6 offset-xl3">
                    <div class="owl-carousel greeting-carousel">
                        <div class="item text-center">
                            <i class="material-icons md-15">important_devices</i>
                            <p>{{trans('main.welcome_screen_1')}}</p>
                        </div>
                        <div class="item text-center">
                            <i class="material-icons md-15">rowing</i>
                            <p>{{trans('main.welcome_screen_2')}}</p>
                        </div>
                        <div class="item text-center">
                            <i class="material-icons md-15">thumb_up</i>
                            <p>{{trans('main.welcome_screen_3')}}</p>
                        </div>
                        <div class="item text-center">
                            <i class="material-icons md-15">verified_user</i>
                            <p>{{trans('main.welcome_screen_4')}}</p>
                        </div>
                        <div class="item text-center">
                            <i class="material-icons md-15">card_travel</i>
                            <p>{{trans('main.welcome_screen_5')}}</p>
                        </div>
                        <div class="item text-center">
                            <i class="material-icons md-15">devices_other</i>
                            <p>{{trans('main.welcome_screen_6')}}</p>
                        </div>
                        <div class="item text-center">
                            <i class="material-icons md-15">perm_phone_msg</i>
                            <p>E-mail: <a href="mailto:{{env('SITE_EMAIL')}}" target="_blank">{{env('SITE_EMAIL')}}</a>
                                <br>{{trans('main.tell')}}: <a href="tel:{{str_replace(['(',')','-', ' '], "", env('SITE_TELL'))}}">{{env('SITE_TELL')}}</a></p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row btn_box">
                <div class="btn_block">
                    <a id="btn_hide_greeting_box" class="btn_actions waves-effect waves-light btn-large">
                        {{trans('main.btn_to_site')}}
                    </a>
                </div>
            </div>
        </div>
    </div>
    @endif

    <div class="content_home">
        {{-- MENU --}}
        @include(env('THEME').'.menu')
        {{-- MENU --}}
        <div class="container-fluid home_menu_mob_size hide-on-large-only">
            <div class="row m-b-none">
                <div class="col s12 l4 valign-wrapper">
                    <div class="box_cart">
                        <div class="bg_box" style="background-image: url(img/bg/portfolio_bg.jpg);"></div>
                        <a href="{{route('portfolios')}}">
                            <i class="material-icons">color_lens</i>
                            <h3>{{trans('main.portfolio')}}</h3>
                            <p class="hide-on-small-only">{{trans('main.portfolio_desc')}}</p>
                        </a>
                    </div>
                </div>
                <div class="col s12 l4 valign-wrapper">
                    <div class="box_cart">
                        <div class="bg_box" style="background-image: url(img/bg/service_bg.jpg);"></div>
                        <a href="{{route('services')}}">
                            <i class="material-icons">style</i>
                            <h3>{{trans('main.our_services')}}</h3>
                            <p class="hide-on-small-only">{{trans('main.our_services_desc')}}</p>
                        </a>
                    </div>
                </div>
                <div class="col s12 l4 valign-wrapper">
                    <div class="box_cart">
                        <div class="bg_box" style="background-image: url(img/bg/blog_bg.jpg);"></div>
                        <a href="{{route('blog')}}">
                            <i class="material-icons">chat_bubble_outline</i>
                            <h3>{{trans('main.blog')}}</h3>
                            <p class="hide-on-small-only">{{trans('main.blog_desc')}}</p>
                        </a>
                    </div>
                </div>
            </div>
        </div>

        <div class="container home_menu hide-on-med-and-down">
            <div class="row">
                <div class="col s12 l4 bg_box" style="background-image: url(img/bg/portfolio_bg.jpg);">
                    <div class="box_cart valign-wrapper">
                        <a href="{{route('portfolios')}}" style="width:100%;height:100%;position:absolute;"></a>
                        <a href="{{route('portfolios')}}">
                            <i class="material-icons">color_lens</i>
                            <h3>{{trans('main.portfolio')}}</h3>
                            <p>{{trans('main.portfolio_desc')}}</p>
                        </a>
                    </div>
                </div>
                <div class="col s12 l4 bg_box" style="background-image: url(img/bg/service_bg.jpg);">
                    <div class="box_cart valign-wrapper">
                        <a href="{{route('services')}}" style="width:100%;height:100%;position:absolute;"></a>
                        <a href="{{route('services')}}">
                            <i class="material-icons">style</i>
                            <h3>{{trans('main.our_services')}}</h3>
                            <p>{{trans('main.our_services_desc')}}</p>
                        </a>
                    </div>
                </div>
                <div class="col s12 l4 bg_box" style="background-image: url(img/bg/blog_bg.jpg);">
                    <div class="box_cart valign-wrapper">
                        <a href="{{route('blog')}}" style="width:100%;height:100%;position:absolute;"></a>
                        <a href="{{route('blog')}}">
                            <i class="material-icons">chat_bubble_outline</i>
                            <h3>{{trans('main.blog')}}</h3>
                            <p>{{trans('main.blog_desc')}}</p>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@section('scripts')
    {!! $scripts !!}
@endsection