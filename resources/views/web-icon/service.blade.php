<div class="blur_bg"><div class="brightness"></div></div>
<div class="content_page">
    <!-- MENU -->
    @include(env('THEME').'.menu')
    <!-- MENU -->
    <div class="main animate">
        <h1 class="title_page no-pod_title_text text-center">{{(LaravelLocalization::getCurrentLocale() == 'ru') ? $service->name : $service->name_en}}</h1>
        <div class="container box_radius container_breadcram">
            <div class="row m-b-none">
                <div class="col s12">
                    <ul class="breadcram_list">
                        <li><a href="/">{{trans('main.home')}}</a> <i class="material-icons">keyboard_arrow_right</i></li>
                        <li><a href="{{route('services')}}">{{trans('main.service')}}</a> <i class="material-icons">keyboard_arrow_right</i></li>
                        <li>{{(LaravelLocalization::getCurrentLocale() == 'ru') ? $service->name : $service->name_en}}</li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="container container_content color_white box_radius box_shadow">
            <div class="content_page_box">
                <div class="row">
                    <div class="col s12">
                        {!!(LaravelLocalization::getCurrentLocale() == 'ru') ? $service->desc : $service->desc_en!!}
                        @if($service->service_list)
                            <ul class="list_check">
                                @foreach(json_decode((LaravelLocalization::getCurrentLocale() == 'ru') ? $service->service_list : $service->service_list_en) as $item)
                                    <li><i class="material-icons">check</i>{{$item}}</li>
                                @endforeach
                            </ul>
                        @endif
                        <div class="btn_modal_box valign-wrapper">
                            <a href="#modal_send_servise_{{$service->id}}" id="service_btn_send" class="btn_send_modal box_shadow hoverable waves-effect waves-orange">
                                <i class="material-icons">send</i> {{trans('main.btn_popup')}}
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>