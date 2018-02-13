<div class="blur_bg"><div class="brightness"></div></div>
<div class="content_page">
    <!-- MENU -->
@include(env('THEME').'.menu')
<!-- MENU -->
    <div class="main animate">
        <h1 class="title_page no-pod_title_text text-center">{{trans('main.contact')}}</h1>
        <div class="container contact_container">
            <div class="row m-b-none">
                <div class="col s12 block_container">
                    <div class="block_contacts mob box_radius box_shadow hoverable col s12 m7 hide-on-large-only">
                        <div class="col s12">
                            <p class="tell"><i class="material-icons">call</i> <a href="tel:{{str_replace(['(',')','-', ' '], "", env('SITE_TELL'))}}">{{env('SITE_TELL')}}</a><span>(WhatsApp, Viber, Telegramm)</span></p>
                        </div>
                        <div class="col s12">
                            <p class="mail"><i class="material-icons">email</i> <a href="mailto:{{env('SITE_EMAIL')}}" target="_blank">{{env('SITE_EMAIL')}}</a></p>
                        </div>
                        <div class="col s12">
                            <ul class="soc_icon_list">
                                <li><a href="{{env('SOC_GP')}}" class="btn-floating color_google_plus_btn" target="_blank"><i class="fa fa-google-plus"></i></a></li>
                                <li><a href="{{env('SOC_FB')}}" class="btn-floating color_facebook_btn" target="_blank"><i class="fa fa-facebook"></i></a></li>
                                <li><a href="{{env('SOC_VK')}}" class="btn-floating color_vk_btn" target="_blank"><i class="fa fa-vk"></i></a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="block_title_darck text-center box_radius col s12 m12 l7 xl7">
                        <p>{{trans('main.contact_title')}}</p>
                        <p class="pod_title">{{trans('main.contact_pod_title')}}</p>
                    </div>
                    <div class="clearfix"></div>
                    <div class="sheath_main">
                        <div class="block_main box_radius box_shadow col s12 l7 xl7">
                            <form action="{{route('post_contact')}}" method="POST" id="formContact" class="col s12">
                                {{ csrf_field() }}
                                <div class="row m-b-none">
                                    <div class="input-field col s12 l6">
                                        <select name="service" id="con_form_service">
                                            <option disabled selected>{{trans('main.contact_select_1')}}</option>
                                            @foreach($services as $service)
                                            <option value="{{$service->id}}">{{(LaravelLocalization::getCurrentLocale() == 'ru') ? $service->name : $service->name_en}}</option>
                                            @endforeach
                                            <option value="{{env('ID_TOPIC_OTHER')}}">{{trans('main.other')}}</option>
                                        </select>
                                        <label for="con_form_service" id="label_service" data-error="" data-success=""></label>
                                    </div>
                                    <div class="input-field col s12 l6">
                                        <input id="con_form_name" autocomplete='name' name="name" type="text">
                                        <label for="con_form_name" data-error="" data-success="">{{trans('main.form_name')}}</label>
                                    </div>
                                    <div class="input-field col s12 l6">
                                        <input id="con_form_phone" autocomplete='phone' name="phone" type="text">
                                        <label for="con_form_phone" data-error="" data-success="">{{trans('main.form_phone')}}</label>
                                    </div>
                                    <div class="input-field col s12 l6">
                                        <input id="con_form_email" autocomplete='email' name="email" type="text">
                                        <label for="con_form_email" data-error="" data-success="">E-mail</label>
                                    </div>
                                    <div class="input-field col s12">
                                        <textarea id="con_form_text" name="text" class="materialize-textarea"></textarea>
                                        <label for="con_form_text">{{trans('main.message')}}</label>
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
                                    <button type="submit" class="btn_send_modal box_shadow hoverable waves-effect waves-orange">
                                        <i class="material-icons">send</i> {{trans('main.btn_send')}}
                                    </button>
                                </div>
                            </form>
                        </div>
                        <div class="block_contacts box_large box_radius box_shadow hoverable hide-on-med-and-down col l5 xl5">
                            <div class="col s12">
                                <p class="tell"><i class="material-icons">call</i> <a href="tel:{{str_replace(['(',')','-', ' '], "", env('SITE_TELL'))}}">{{env('SITE_TELL')}}</a><span>(WhatsApp, Viber, Telegramm)</span></p>
                            </div>
                            <div class="col s12">
                                <p class="mail"><i class="material-icons">email</i> <a href="mailto:{{env('SITE_EMAIL')}}" target="_blank">{{env('SITE_EMAIL')}}</a></p>
                            </div>
                            <div class="col s12">
                                <ul class="soc_icon_list">
                                    <li><a href="{{env('SOC_GP')}}" class="btn-floating color_google_plus_btn" target="_blank"><i class="fa fa-google-plus"></i></a></li>
                                    <li><a href="{{env('SOC_FB')}}" class="btn-floating color_facebook_btn" target="_blank"><i class="fa fa-facebook"></i></a></li>
                                    <li><a href="{{env('SOC_VK')}}" class="btn-floating color_vk_btn" target="_blank"><i class="fa fa-vk"></i></a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>