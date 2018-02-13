$(window).on('load', function () {
    $(".js_loader_inner").fadeOut();
    $(".js_loader").delay(800).fadeOut("slow");
});

$(document).ready(function(){

	/***INIT MOBILE MENU***/
	$(".button-collapse").sideNav();

	/***INIT SELECT***/
	$('select').material_select();

	/***INIT Scrollspy***/
	$('.scrollspy').scrollSpy();

	/***INIT FROM BRIF PAGE***/
	Materialize.updateTextFields();
	
	/***INIT MODAL***/
	$('.modal').modal({
		startingTop: '4%', // Starting top style attribute
    	endingTop: '10%', // Ending top style attribute
    	ready: function(modal, trigger) { // Callback for Modal open. Modal and trigger parameters available.
			$('.over').addClass("overview_modal");
		},
		complete: function() { $('.over').removeClass("overview_modal"); }
	});

	$('form[name="callback"]').submit(function() {
        var form = $(this),
            data = {},
            fields = form.find('input[type="text"],' +
                'textarea,' +
                'input[type="hidden"],' +
                'select,' +
                'input[type="radio"]:checked,' +
                'input[type="checkbox"]');
        fields.each(function () {
            data[$(this).attr('name')] = $(this).val();
        });
        data = JSON.stringify(data);
        
        console.log(data);

        return false;
    });

	/***INIT CAROUSEL***/
	$('.greeting-carousel').owlCarousel({
		loop:false,
		margin:10,
		nav:true,
		autoplay:true,
		autoplayTimeout:7000,
		autoplayHoverPause:true,
		responsive:{
		    0:{
		        items:1
		    },
		    600:{
		        items:1
		    },
		    1000:{
		        items:1
		    }
		}
	});

	//Отзывы
	$('.reviews-carousel').owlCarousel({
		loop:false,
		margin:0,
		nav:true,
		autoplay:false,
		autoplayTimeout:10000,
		autoplayHoverPause:true,
		responsive:{
		    0:{
		        items:1
		    },
		    600:{
		        items:2
		    },
		    1280:{
		        items:3
		    },
		    1680:{
		        items:4
		    }
		}
	});

	/***ANIMATION***/
	$('#btn_hide_greeting_box').click(function(){
		$('.greeting_box').addClass('hidde_block_left');
	});
	function showpanel(){
		$('.main.animate').addClass('__visible');
		$('.mein_menu').addClass('__visible_menu');
	}
	setTimeout(showpanel, 500);

	//Услуги
	$('.collaps_list .animation_item a').on('click', function(e) {
	    e.preventDefault();
    	
    	$btn_id = '#'+$(this).attr('btn_id');
    	$('#service_btn_send').attr('href', $btn_id);

    	$id = '#'+$(this).attr('animate');
	    
	    if($(this).parent().hasClass("active")){		//Повторный клик на елементе
			$(this).parent().removeClass('active');

	    	$('.desc_service_block').find($id).addClass('hide_animate').removeClass('show_animate');

	    }else{											//Первый клик на елементе
	    	$('.collaps_list .animation_item').removeClass('active');
	    	$(this).parent().addClass('active');

	    	if($('.desc_service_block .item_desc').hasClass("show_animate")){
				$('.desc_service_block .item_desc').removeClass('show_animate').addClass('hide_animate');
	    	}

			$('.desc_service_block').find($id).addClass('show_animate').removeClass('hide_animate');
	    }
	});

	/***PORTFOLIOS GRID INIT***/
	$('#grid').mediaBoxes({
		filterContainer: '#filter',
		boxesToLoadStart: 8,
		boxesToLoad: 4,
		verticalSpaceBetweenBoxes: 20,
		loadMoreWord: 'Показать еще',
		LoadingWord: 'Загружаю...',
		noMoreEntriesWord: 'Нет больше работ',
		resolutions: [
			    {
			        maxWidth: 1400,
			        columnWidth: 'auto',
			        columns: 3,
			    },
			    {
			        maxWidth: 992,
			        columnWidth: 'auto',
			        columns: 2,
			        horizontalSpaceBetweenBoxes: 15,
			        verticalSpaceBetweenBoxes: 15,
			    },
			    {
			        maxWidth: 480,
			        columnWidth: 'auto',
			        columns: 1,
			        horizontalSpaceBetweenBoxes: 12,
			        verticalSpaceBetweenBoxes: 12,
			    },
			]
	});

	/***BLOG GRID INIT***/
	$('#grid_blog').mediaBoxes({
		boxesToLoadStart: 8,
		boxesToLoad: 4,
		columns: 2,
		verticalSpaceBetweenBoxes: 20,
		loadMoreWord: 'Показать еще',
		LoadingWord: 'Загружаю...',
		noMoreEntriesWord: 'Нет больше постов',
		resolutions: [
			    {
			        maxWidth: 768,
			        columnWidth: 'auto',
			        columns: 1,
			        horizontalSpaceBetweenBoxes: 12,
			        verticalSpaceBetweenBoxes: 12,
			    },
			]
	});

	$('#grid_blog_popylar_post').mediaBoxes({
		boxesToLoadStart: 3,
		boxesToLoad: 3,
		columns: 3,
		verticalSpaceBetweenBoxes: 20,
		loadMoreWord: 'Показать еще',
		LoadingWord: 'Загружаю...',
		noMoreEntriesWord: 'Нет больше постов',
		resolutions: [
			    {
			        maxWidth: 1024,
			        columnWidth: 'auto',
			        columns: 2,
			    },
			    {
			        maxWidth: 600,
			        columnWidth: 'auto',
			        columns: 1,
			        horizontalSpaceBetweenBoxes: 12,
			        verticalSpaceBetweenBoxes: 12,
			    },
			]
	});

    //Send CONTACT
    $('#formContact').on('submit', function(e){
        e.preventDefault();
        $.ajax({
            type: "POST",
            url: $(this).attr('action'),
            data: $(this).serialize(),
            dataType: "json",
            beforeSend: function(){
                $modal_send = $('#formContact');
                $modal_send.find('.btn_send_modal').addClass('disabled');
                $modal_send.find('.loader_block').css('display', 'flex');
                $modal_send.find('.select-dropdown').removeClass('validate invalid');
            },
            success: function(data) {
                console.log(data);
                $formContact = $('#formContact');
                if(data['text_error']){
                    if(data.errors.service){
                        $select = $formContact.find('#con_form_service').parent();
                        $select.find('.select-dropdown').addClass('validate invalid');
                        $select.parent().find('label').attr('data-error', data.errors.service);
                    }if(data.errors.name){
                        $formContact.find('#con_form_name').addClass('validate invalid').parent().find('label').attr('data-error', data.errors.name);
                    }if(data.errors.phone){
                        $formContact.find('#con_form_phone').addClass('validate invalid').parent().find('label').attr('data-error', data.errors.phone);
                    }if(data.errors.email){
                        $formContact.find('#con_form_email').addClass('validate invalid').parent().find('label').attr('data-error', data.errors.email);
                    }if(data.errors.text){
                        $formContact.find('#con_form_text').addClass('validate invalid').parent().find('label').attr('data-error', data.errors.text);
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
                    $formContact.find('#con_form_service, #con_form_name, #con_form_phone, #con_form_email, #con_form_text').val('');
                }
            },
            error:function (xhr, ajaxOptions, thrownError){
                console.log(xhr, ajaxOptions, thrownError);
            },
            complete: function(){
                $modal_send = $('#formContact');
                $modal_send.find('.btn_send_modal').removeClass('disabled');
                $modal_send.find('.loader_block').css('display', 'none');
            }
        });
    });

    //Send ORDER
    $('#order_form').on('submit', function(e){
        e.preventDefault();
        $.ajax({
            type: "POST",
            url: $(this).attr('action'),
            data: $(this).serialize(),
            dataType: "json",
            beforeSend: function(){
                $modal_send = $('#order_form');
                $modal_send.find('.btn_send_modal').addClass('disabled');
                $modal_send.find('.loader_block').css('display', 'flex');
                $modal_send.find('.select-dropdown').removeClass('validate invalid');
            },
            success: function(data) {
                console.log(data);
                $formContact = $('#order_form');
                if(data['text_error']){
                    if(data.errors.service){
                        $select = $formContact.find('#inp_service').parent();
                        $select.find('.select-dropdown').addClass('validate invalid');
                        $select.parent().find('label').attr('data-error', data.errors.service);
                    }if(data.errors.name){
                        $formContact.find('#inp_name').addClass('validate invalid').parent().find('label').attr('data-error', data.errors.name);
                    }if(data.errors.phone){
                        $formContact.find('#inp_phone').addClass('validate invalid').parent().find('label').attr('data-error', data.errors.phone);
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
                    $formContact.find('#con_form_service, #con_form_name, #con_form_phone, #con_form_email, #con_form_text').val('');
                }
            },
            error:function (xhr, ajaxOptions, thrownError){
                console.log(xhr, ajaxOptions, thrownError);
            },
            complete: function(){
                $modal_send = $('#order_form');
                $modal_send.find('.btn_send_modal').removeClass('disabled');
                $modal_send.find('.loader_block').css('display', 'none');
            }
        });
    });
	
});