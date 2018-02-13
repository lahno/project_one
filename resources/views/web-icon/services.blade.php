<div class="blur_bg"><div class="brightness"></div></div>
<div class="content_page">
    <!-- MENU -->
@include(env('THEME').'.menu')
<!-- MENU -->
    <div class="main animate">
        <h1 class="title_page no-pod_title_text text-center">{{trans('main.our_services')}}</h1>
        <div class="container service_container">
            <div class="row m-b-none">
                <div class="col s12 block_container">
                    <div class="block_title_darck text-center box_radius col s12 m12 l12 xl7">
                        <p>{{trans('main.our_services_desc')}}</p>
                    </div>
                    <div class="sheath_main">
                        <div class="block_main box_radius box_shadow col s12 m8 l6 xl7">
                            <ul class="collaps_list">
                                @foreach($services as $key => $service)
                                    <li class="hide-on-large-only">
                                        <a href="#modal_service_{{$key+1}}">
                                            {{(LaravelLocalization::getCurrentLocale() == 'ru') ? $service->name : $service->name_en}}
                                        </a>
                                    </li>
                                    <li class="hide-on-med-and-down animation_item {{($key == 0) ? 'active' : ''}}">
                                        <a href="#" animate="desc_service_{{$key+1}}" btn_id="modal_send_servise_{{$key+1}}">
                                            {{(LaravelLocalization::getCurrentLocale() == 'ru') ? $service->name : $service->name_en}}
                                        </a>
                                    </li>
                                @endforeach
                            </ul>
                            <div class="block_icon_animate text-center valign-wrapper hide-on-small-only">
                                <i class="material-icons">trending_down</i>
                                <span class="dotted"></span>
                                <i class="material-icons">public</i>
                                <span class="dotted"></span>
                                <i class="material-icons">trending_up</i>
                            </div>
                        </div>
                        <div class="clearfix"></div>

                        <div class="desc_service_block hide-on-med-and-down col s12 m8 l6 xl7">
                            @foreach($services as $key => $service)
                                <div id="desc_service_{{$key+1}}" class="item_desc box_radius box_shadow hoverable xl5 {{($key == 0) ? 'show_animate' : ''}}">
                                    <ul class="list_check">
                                        @foreach(json_decode((LaravelLocalization::getCurrentLocale() == 'ru') ? $service->service_list : $service->service_list_en) as $key => $item)
                                            @if($key <= 3)
                                                <li><i class="material-icons">check</i>{{str_limit($item, 28)}}</li>
                                            @endif
                                        @endforeach
                                        <li><i class="material-icons">check</i><a href="{{route('service',['alias'=>$service->alias])}}">{{trans('main.service_list_more')}}</a></li>
                                    </ul>
                                </div>
                            @endforeach
                        </div>
                    </div>
                    <div class="btn_modal_box valign-wrapper">
                        <a href="#modal_send_servise_1" id="service_btn_send" class="btn_send_modal box_shadow hoverable waves-effect waves-orange">
                            <i class="material-icons">send</i> {{trans('main.btn_popup')}}
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>