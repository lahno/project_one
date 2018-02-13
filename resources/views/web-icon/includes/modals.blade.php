<!-- Modal Structure -->
<div id="modal_send" class="modal">
    <div class="modal-content">
        <h4>{{trans('main.make_order')}}</h4>
        <form id="order_form" class="col s12" action="{{route('post_order')}}" method="POST">
            {{ csrf_field() }}
            <div class="row">
                <div class="input-field col s12">
                    <input id="inp_name" name="name" autocomplete='name' type="text">
                    <label for="inp_name">{{trans('main.form_name')}}</label>
                </div>
                <div class="input-field col s12">
                    <input id="inp_phone" name="phone" autocomplete='phone' type="text">
                    <label for="inp_phone">{{trans('main.form_phone')}}</label>
                </div>
                <div class="input-field col s12">
                    <select name="service" id="inp_service">
                        <option disabled selected>{{trans('main.form_select_1')}}</option>
                        @foreach($services as $service)
                            <option value="{{$service->id}}">{{(LaravelLocalization::getCurrentLocale() == 'ru') ? $service->name : $service->name_en}}</option>
                        @endforeach
                    </select>
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
                <button type="submit" class="btn_send_modal box_shadow hoverable waves-effect waves-orange"><i class="material-icons">send</i> {{trans('main.btn_popup')}}</button>
            </div>
        </form>
        <div class="row m-b-none">
            <div class="col s12">
                <p class="small_text text-right">{{trans('main.or_write_to')}}: <a href="mailto:{{env('SITE_EMAIL')}}" target="_blank">{{env('SITE_EMAIL')}}</a></p>
            </div>
        </div>
    </div>
</div>
<!-- Modal OK -->
<div id="modal_send_ok" class="modal">
    <div class="modal-content">
        <h4>{{trans('main.form_send_ok_title')}}</h4>
        <p>{{trans('main.form_send_ok_pod_title')}}</p>
    </div>
</div>

@if(Route::currentRouteName() == 'services' || Route::currentRouteName() == 'service')
    <!-- Modal Structure SERVICE -->
    <script src="{{asset('js/jquery-2.2.4.min.js')}}"></script>
    @foreach($services as $key => $service)
        <div id="modal_send_servise_{{$key+1}}" class="modal modal_send_servise" style="max-height:inherit!important;">
            <div class="modal-content">
                <h4>{{(LaravelLocalization::getCurrentLocale() == 'ru') ? $service->form_title : $service->form_title_en}}</h4>
                <p class="pod_title text-center">
                    {{(LaravelLocalization::getCurrentLocale() == 'ru') ? $service->form_pod_title : $service->form_pod_title_en}}
                </p>
                <form action="{{route('post_service')}}" method="POST" id="formService_{{$key+1}}" class="col s12 formService">
                    {{ csrf_field() }}
                    <input class="service_form_service" name="service" type="hidden" value="{{$service->id}}">
                    <div class="row m-b-none">
                        <div class="input-field col s12 l4">
                            <input id="service_form_name_{{$key+1}}" class="service_form_name" autocomplete='name' name="name" type="text">
                            <label for="service_form_name_{{$key+1}}">{{trans('main.form_name')}}</label>
                        </div>
                        <div class="input-field col s12 l4">
                            <input id="service_form_phone_{{$key+1}}" class="service_form_phone" autocomplete='phone' name="phone" type="text">
                            <label for="service_form_phone_{{$key+1}}">{{trans('main.form_phone')}}</label>
                        </div>
                        <div class="input-field col s12 l4">
                            <input id="service_form_email_{{$key+1}}" class="service_form_email" autocomplete='email' name="email" type="text">
                            <label for="service_form_email_{{$key+1}}">E-mail</label>
                        </div>
                        <div class="input-field col s12">
                            <textarea id="service_form_text_{{$key+1}}" class="service_form_text materialize-textarea" name="text"></textarea>
                            <label for="service_form_text_{{$key+1}}">{{trans('main.message')}}</label>
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
                            <i class="material-icons">send</i> {{trans('main.btn_popup')}}
                        </button>
                    </div>
                </form>
            </div>
        </div>
        <script>
            //Send SERVICE
            $('#formService_{{$key+1}}').on('submit', function(e){
                e.preventDefault();
                $.ajax({
                    type: "POST",
                    url: $(this).attr('action'),
                    data: $(this).serialize(),
                    dataType: "json",
                    beforeSend: function(){
                        $modal_send = $('#modal_send_servise_{{$key+1}}');
                        $modal_send.find('.btn_send_modal').addClass('disabled');
                        $modal_send.find('.loader_block').css('display', 'flex');
                    },
                    success: function(data) {
                        console.log(data);
                        $formContact = $('#modal_send_servise_{{$key+1}}');
                        if(data['text_error']){
                            if(data.errors.name){
                                $formContact.find('#service_form_name_{{$key+1}}').addClass('validate invalid').parent().find('label').attr('data-error', data.errors.name);
                            }if(data.errors.phone){
                                $formContact.find('#service_form_phone_{{$key+1}}').addClass('validate invalid').parent().find('label').attr('data-error', data.errors.phone);
                            }if(data.errors.email){
                                $formContact.find('#service_form_email_{{$key+1}}').addClass('validate invalid').parent().find('label').attr('data-error', data.errors.email);
                            }if(data.errors.text){
                                $formContact.find('#service_form_text_{{$key+1}}').addClass('validate invalid').parent().find('label').attr('data-error', data.errors.text);
                            }
                        }else{
                            $formContact.modal('close');
                            $modal = $('#modal_send_ok');
                            $modal.find('h4').text(data[0]);
                            $modal.find('p').text(data[1]);
                            $modal.modal('open',{
                                startingTop: '4%', // Starting top style attribute
                                endingTop: '25%', // Ending top style attribute
                                ready: function(modal, trigger) { // Callback for Modal open. Modal and trigger parameters available.
                                    $('.over').addClass("overview_modal");
                                },
                                complete: function() { $('.over').removeClass("overview_modal"); }
                            });
                            $formContact.find('#service_form_name_{{$key+1}}, #service_form_email_{{$key+1}}, #service_form_text_{{$key+1}}, #service_form_phone_{{$key+1}}, .service_form_service').val('');
                        }
                    },
                    error:function (xhr, ajaxOptions, thrownError){
                        console.log(xhr, ajaxOptions, thrownError);
                    },
                    complete: function(){
                        $modal_send = $('#modal_send_servise_{{$key+1}}');
                        $modal_send.find('.btn_send_modal').removeClass('disabled');
                        $modal_send.find('.loader_block').css('display', 'none');
                    }
                });
            });
        </script>
    @endforeach
@endif

@foreach($services as $key => $service)
    <div id="modal_service_{{$key+1}}" class="modal">
        <div class="modal-content">
            <h5>{{(LaravelLocalization::getCurrentLocale() == 'ru') ? $service->name : $service->name_en}}</h5>
            <ul class="list_check">
                @foreach(json_decode((LaravelLocalization::getCurrentLocale() == 'ru') ? $service->service_list : $service->service_list_en) as $key => $item)
                    @if($key <= 5)
                        <li><i class="material-icons">check</i>{{$item}}</li>
                    @endif
                @endforeach
                <li><i class="material-icons">check</i><a href="">{{trans('main.service_list_more')}}</a></li>
            </ul>
        </div>
    </div>
@endforeach