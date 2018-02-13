<div class="blur_bg"><div class="brightness"></div></div>
<div class="content_page">

    <!-- MENU -->
@include(env('THEME').'.menu')
<!-- MENU -->

    <div class="main animate">
        <h1 class="title_page no-pod_title_text text-center">{{(LaravelLocalization::getCurrentLocale() == 'ru')?$page->name:$page->name_en}}</h1>
        <div class="container container_content color_white box_radius box_shadow">
            <div class="content_page_box">
                <div class="row">
                    <div class="col s12">
                        {!!(LaravelLocalization::getCurrentLocale() == 'ru')?$page->desc:$page->desc_en!!}
                        <div class="btn_modal_box valign-wrapper">
                            <a href="#modal_send" id="service_btn_send" class="btn_send_modal box_shadow hoverable waves-effect waves-orange">
                                <i class="material-icons">send</i> {{trans('main.btn_popup')}}
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>