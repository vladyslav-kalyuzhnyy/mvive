/*global $*/
/*global alert*/


/* FUNCTIONS FOR VIEWS */

//
//Функція для центрування блоку по розмірах екрану
var centerForDisplay, // Центрування елемента за розмірами екрану
    verticalAlignInBlock, // Центрування елемента по вертикалі в блоці
    verticalMenuPosition, // Menu vertical align center
    popOverCenterPosition; // Modal windows center position

popOverCenterPosition = function(class_name) {
    var top_pos,
        left_pos,
        pop_over_window;

    pop_over_window = $(class_name);

    top_pos = $('body').height() / 2 - pop_over_window.height() / 2;
    left_pos = $('body').width() / 2 - pop_over_window.width() / 2;

    pop_over_window.css({
        position: 'absolute',
        top: top_pos,
        left: left_pos
    });
};

centerForDisplay = function(class_name) {
    var top_pos,
        left_pos,
        obj;

    obj = $(class_name);

    top_pos = $(window).height() / 2 - obj.height() / 2;
    left_pos = Math.max($(window).width() - obj.width(), 0) / 2;

    obj.css({
        position: 'absolute',
        top: top_pos,
        left: left_pos
    });
};

//
// Функція для центрування блоку по висоті батьківського блоку
verticalAlignInBlock = function(non_editable, editable) {
    var top_pos = 0,
        obj_ne,
        obj_e;

    obj_ne = $(non_editable);
    obj_e = $(editable);

    top_pos = obj_ne.outerHeight() / 2;
    obj_e.css({
        marginTop: top_pos - obj_e.height() / 2 - 15
    });
};

verticalMenuPosition = function(class_name) {
    var top_pos,
        our_menu;

    our_menu = $(class_name);
    top_pos = $(window).height() / 2 - our_menu.height() / 2;
    our_menu.css({
        position: 'absolute',
        top: top_pos + 10
    });
};



$(document).ready(function() {
    'use strict';
    var type_of_user,
        type_of_user_search; //Змінна, яка прийме значення типу юзера і передасть в невидимий input

    //
    // Поява з анімацією
    $('.content_anim15').addClass('animated fadeInUp');
    $('.content_anim16').addClass('animated3 fadeInUp');
    $('.content_anim17').addClass('animated3 fadeInUp');

    //
    // Виклик функцій центрування
    popOverCenterPosition('#first-reg-scale');
    popOverCenterPosition('#second-reg-scale');
    popOverCenterPosition('#login-scale');
    popOverCenterPosition('#mailer-form');
    verticalAlignInBlock('.block-user', '#photo-icon');
    verticalAlignInBlock('.block-user', '#model-icon');
    verticalAlignInBlock('.block-user', '#modeller-icon');
    verticalAlignInBlock('.block-user', '#cosmetics');
    verticalMenuPosition('.navigation');

    //
    // Показ форм
    $('.to-instruction').click(function() {
        $('#second-reg-scale').hide();
        $('#mailer-form').show();
    });

    $('#reset-button-mailer').click(function() {
        $('#mailer-form').hide();
        $('.overlay').hide();
    });

    $('#reg-block').click(function() {
        $('.overlay').show();
        $('#first-reg-scale').show(300);
        $('.content_anim1').addClass('animated fadeInUp');
        $('.content_anim2').addClass('animated fadeInUp');
        $('.content_anim3').addClass('animated fadeInUp');
        $('.content_anim4').addClass('animated fadeInUp');
    });

    $('#log-block').click(function() {
        $('.overlay').show();
        $('#login-scale').show(300);
        $('.content_anim9').addClass('animated fadeInUp');
        $('.content_anim10').addClass('animated fadeInUp');
        $('.content_anim11').addClass('animated fadeInUp');
        $('.content_anim12').addClass('animated fadeInUp');
        $('.content_anim13').addClass('animated fadeInUp');
        $('.content_anim14').addClass('animated fadeInUp');
    });

    $('.block-user').click(function() {
        $('#first-reg-scale').hide();
        $('.overlay').show();
        $('#second-reg-scale').show(300);
        $('.content_anim4').addClass('animated fadeInUp');
        $('.content_anim5').addClass('animated fadeInUp');
        $('.content_anim6').addClass('animated fadeInUp');
        $('.content_anim7').addClass('animated fadeInUp');
        $('.content_anim8').addClass('animated fadeInUp');
    });

    $('.close-button').click(function() {
        $('.overlay').hide();
        $('#first-reg-scale').hide();
        $('#second-reg-scale').hide();
        $('#login-scale').hide();
        $('#mailer-form').hide();
    });

    $('.overlay').click(function() {
        $('.overlay').hide();
        $('#first-reg-scale').hide();
        $('#second-reg-scale').hide();
        $('#login-scale').hide();
        $('.write-message').hide();
        $('.overlay-photo-profile').show();
    });

    $('#reset-button').click(function() {
        $('#second-reg-scale').hide();
        $('.overlay').hide();
    });

    $('#reset-button-log').click(function() {
        $('#login-scale').hide();
        $('.overlay').hide();
    });

    //
    // Заповнення типу юзера
    $('#first-block-user').click(function() {
        type_of_user = "Photographer";
        $('#invisible-input').val(type_of_user);
    });

    $('#second-block-user').click(function() {
        type_of_user = "Model";
        $('#invisible-input').val(type_of_user);
    });

    $('#third-block-user').click(function() {
        type_of_user = "Designer";
        $('#invisible-input').val(type_of_user);
    });

    $('#fourth-block-user').click(function() {
        type_of_user = "Stylist";
        $('#invisible-input').val(type_of_user);
    });
    //search

    $('#type-user-single-model').click(function() {
        type_of_user_search = "Photographer";
        $('#invisible-search').val(type_of_user_search);
    });

    $('#type-user-single-photographer').click(function() {
        type_of_user_search = "Model";
        $('#invisible-search').val(type_of_user_search);
    });

    $('#type-user-single-designer').click(function() {
        type_of_user_search = "Designer";
        $('#invisible-search').val(type_of_user_search);
    });

    $('#type-user-single-stylist').click(function() {
        type_of_user_search = "Stylist";
        $('#invisible-search').val(type_of_user_search);
    });

    //
    // Абсолютне позиціювання елементів профілю
    if ($(window).width() < 768) {
        $('.overlay-photo-profile').css({
            width: $(window).width()
        });
    };
/*
    $('.cover-menu').css({
        width: $(window).width() - $('.fixed-vertical-menu').width()
    });
    */


    $('.cover-menu-center div a').click(function() {
        $('.cover-menu-center div a').removeClass('active-profile-menu-link');
        $(this).addClass('active-profile-menu-link');
    });

    //
    // Межі робочої області


    $('.feed-profile').css({
        paddingLeft: $('.fixed-vertical-menu').width()
    });

    $('.overlay-photo-profile').css({
        left: $('.fixed-vertical-menu').width(),
        width: $(window).width() - $('.fixed-vertical-menu').width()
    });

    $('.profile-user-info-block').css({
        left: $('.fixed-vertical-menu').width() + 100
    });

    $('.feed').css({
        paddingLeft: $('.fixed-vertical-menu').width()
    });

    //
    // Adaptive fixing
    if ($(window).width() <= 768) {

        $('.overlay-photo-profile').css({
            width: $(window).width()
        });

        $('.feed-profile').css({
            paddingLeft: 0
        });

        $('.overlay-photo-profile').css({
            left: 0
        });

        $('.profile-user-info-block').css({
            left: 100
        });

        $('.cover-menu').css({
            width: $(window).width()
        });

        $('.feed').css({
            paddingLeft: 0
        });
    };

    //
    // Анімація меню
    $('.settings-menu-item').click(function() {
        $('.settings-menu-item').removeClass('settings-menu-item-active');
        $(this).addClass('settings-menu-item-active');
    });

    //
    // Анімація хрестика для селект тегу
    $('#set-country').hover(function() {
        $('.select-plus').css({
            transform: 'rotate(135deg)'
        });
    }, function() {
        $('.select-plus').css({
            transform: 'rotate(0deg)'
        });
    });

    $('#work-experience').hover(function() {
        $('.select-plus-exp').css({
            transform: 'rotate(135deg)'
        });
    }, function() {
        $('.select-plus-exp').css({
            transform: 'rotate(0deg)'
        });
    });

    $('.multiselect-list').hover(function() {
        $('.multiselect-plus').css({
            transform: 'rotate(135deg)'
        });
    }, function() {
        $('.multiselect-plus').css({
            transform: 'rotate(0deg)'
        });
    });

    $('#multiselect-license-list').hover(function() {
        $('.multiselect-license-plus').css({
            transform: 'rotate(135deg)'
        });
    }, function() {
        $('.multiselect-license-plus').css({
            transform: 'rotate(0deg)'
        });
    });

    $('#set-sex').hover(function() {
        $('.select-sex-plus').css({
            transform: 'rotate(135deg)'
        });
    }, function() {
        $('.select-sex-plus').css({
            transform: 'rotate(0deg)'
        });
    });

    //
    // Multiselect list
    jQuery.fn.multiselect = function() {
        $(this).each(function() {
            var checkboxes = $(this).find("input:checkbox");
            checkboxes.each(function() {
                var checkbox = $(this);
                // Highlight pre-selected checkboxes
                if (checkbox.prop("checked"))
                    checkbox.parent().css({
                        color: '#fff',
                        backgroundColor: '#1f1e24'
                    });

                // Highlight checkboxes that the user selects
                checkbox.click(function() {
                    if (checkbox.prop("checked"))
                        checkbox.parent().css({
                            color: '#fff',
                            backgroundColor: '#1f1e24'
                        });
                    else
                        checkbox.parent().css({
                            color: '#1f1e24',
                            backgroundColor: 'transparent'
                        });
                });
            });
        });
    };
    $(function() {
        $('.multiselect-list').multiselect();
    });
    //
    // settings menu tabbing
    $('#private-menu-item').click(function() {
        $('#for-work-form').hide(300);
        $('#private-forms').show(300);
    });

    $('#workinfo-menu-item').click(function() {
        $('#private-forms').hide(300);
        $('#for-work-form').show(300);
    });

    //
    // Dynamical change label for photo upload
    $(function() {
        $('#set-avatar').change(function() {
            var fileName = $(this).val();
            $('#label-avatar-change').html(fileName);
        });
        $('#set-cover').change(function() {
            var fileName = $(this).val();
            $('#label-cover-change').html(fileName);
        });
        $('#push-photo').change(function() {
            var fileName = $(this).val();
            $('#label-push-photo').html(fileName);
        });
    });

    //
    // Max selected checkbox with attr 'data-max'
    $(':checkbox').on('click', function() {
        var $block = $(this).parents('[data-max]');
        if ($block.find(':checked').size() > $block.data('max')) {
            this.checked = false;
            alert('Максимум возможно выбрать\nтолько ' + $block.data('max') + ' cпециализаций!');
        }
    });
    //
    //Profile menu script
    $('#menu-profile-about').click(function() {
        $('.info-frame-subscribes').hide('fast');
        $('.portfolio').hide('fast');
        $('.info-frame-feedbacks').hide('fast');
        $('.cover-menu-center div').children('p').removeClass('active-profile-menu-link');
        $('#menu-profile-about p').addClass('active-profile-menu-link');
        $('.about-user-block').show('fast');
    });

    $('#menu-profile-portfolio').click(function() {
        $('.info-frame-subscribes').hide('fast');
        $('.info-frame-feedbacks').hide('fast');
        $('.about-user-block').hide('fast');
        $('.cover-menu-center div').children('p').removeClass('active-profile-menu-link');
        $('#menu-profile-portfolio p').addClass('active-profile-menu-link');
        $('.portfolio').show('fast');
    });

    $('#menu-profile-subscribes').click(function() {
        $('.about-user-block').hide('fast');
        $('.portfolio').hide('fast');
        $('.info-frame-feedbacks').hide('fast');
        $('.cover-menu-center div').children('p').removeClass('active-profile-menu-link');
        $('#menu-profile-subscribes p').addClass('active-profile-menu-link');
        $('.info-frame-subscribes').show('fast');
    });

    $('#menu-profile-feedbacks').click(function() {
        $('.about-user-block').hide('fast');
        $('.portfolio').hide('fast');
        $('.info-frame-subscribes').hide('fast');
        $('.cover-menu-center div').children('p').removeClass('active-profile-menu-link');
        $('#menu-profile-feedbacks p').addClass('active-profile-menu-link');
        $('.info-frame-feedbacks').show('fast');
    });

    //
    // search click events
    $('.type-user-single').click(function() {
        $('.type-user-block-search').children('div').removeClass('type-user-single-active');
        $(this).addClass('type-user-single-active');
    });

    //
    // Add event in invisible input
    var event_name = "";
    $('.event-designer-button').click(function () {
        event_name = $('#add-event').val();
        $('#event-list').html($('#event-list').html() + '<div class="event-tag"><p>' + event_name +'</p><i class="fa fa-close delete-event"></i><input style="display: none;" name="designer_profile[events][]" value="' + event_name + '"></div>');
        $('.delete-event').click(function () {
            $(this).parent().remove();
        });
    });
    $('.event-model-button').click(function () {
        event_name = $('#add-event').val();
        $('#event-list').html($('#event-list').html() + '<div class="event-tag"><p>' + event_name +'</p><i class="fa fa-close delete-event"></i><input style="display: none;" name="model_profile[events][]" value="' + event_name + '"></div>');
        $('.delete-event').click(function () {
            $(this).parent().remove();
        });
    });
    //
    // specialisation of model
    $('.specialisation-model-block').click(function() {
        $(this).parent().children().removeClass('active-specialisation-model-block');
        $(this).addClass('active-specialisation-model-block');
    });

    $('#podium-model').click(function() {
        $('.hidden-ganre').hide();
        $('#set-specialisation-model').val('Подиумная модель');
    });

    $('#simple-model').click(function() {
        $('#set-specialisation-model').val('Фотомодель');
        $('.hidden-ganre').show();
    });

    //
    // select search specialization model

    $('#select-spec-model').change(function () {
        if($(this).val() == 'Фотомодель') {
            $('#select-for-photo-model').removeAttr('disabled');
        } else {
            $('#select-for-photo-model').attr({
                disabled : 'disabled'
            });
        }
    });

    //search

    $('#type-user-single-model').click(function() {
        type_of_user_search = "Model";
        $('.invisible-search').val(type_of_user_search);
        $('.property-user-block-search').hide();
        $('#search-model').show();
    });

    $('#type-user-single-photographer').click(function() {
        type_of_user_search = "Photographer";
        $('.invisible-search').val(type_of_user_search);
        $('.property-user-block-search').hide();
        $('#search-photographer').show();
    });

    $('#type-user-single-designer').click(function() {
        type_of_user_search = "Designer";
        $('.invisible-search').val(type_of_user_search);
        $('.property-user-block-search').hide();
        $('#search-designer').show();
    });

    $('#type-user-single-stylist').click(function() {
        type_of_user_search = "Stylist";
        $('.invisible-search').val(type_of_user_search);
        $('.property-user-block-search').hide();
        $('#search-stylist').show();
    });

    $('.property-user-block-search').submit(function(e) {
  		return $(this).find('select,input').map(function(i, e) {
    		return e.disabled = !$(e).val();
  		});
	});
    $('#casting-search').submit(function(e) {
        return $(this).find('select,input').map(function (i, e) {
            return e.disabled = !$(e).val();
        });
    });

    /*show form add comment for casting*/
    verticalAlignInBlock('.settings-scope','.add-comment-casting');
    $('.add-comment-casting').css({
        left: ($('.settings-scope').width() - 300) / 2 + 230
    });
    $('.show-casting-single').click(function () {
        $('.overlay').show();
        $('.add-comment-casting').show();
    });
    $('#cancel').click(function () {
        $('.overlay').hide();
        $('.add-comment-casting').hide();
    });

    /* message form */
    $('.write-message').css({
        left: ($('.feed-profile').width() - 300) / 2 + 230
    });
    $('.profile-write-button').click(function () {
        $('.overlay').show();
        $('.write-message').show();
        $('.overlay-photo-profile').hide();
    });

    $('#cancel-message').click(function () {
        $('.overlay').hide();
        $('.write-message').hide();
        $('.overlay-photo-profile').show();
    });

   /*  var photo_id;
	$('.gallery').children('div').children('a').click(function () {
		photo_id = $(this).parent().attr('id');
		console.log(photo_id);
	});
    $('.like').click(function () {

        $("#like_form_" + photo_id).submit();
    }); */
});

/* DYNAMICAL ITEM RESIZE IF NEEDED */

$(window).resize(function() {
    /*
    $('.overlay-photo-profile').css({
        width: $(window).width() - $('.fixed-vertical-menu').width()
    });

    $('.cover-menu').css({
        width: $(window).width() - $('.fixed-vertical-menu').width()
    });

    */

    popOverCenterPosition('#first-reg-scale');
    popOverCenterPosition('#second-reg-scale');
    popOverCenterPosition('#login-scale');
    popOverCenterPosition('#mailer-form');
    verticalAlignInBlock('.block-user', '#photo-icon');
    verticalAlignInBlock('.block-user', '#model-icon');
    verticalAlignInBlock('.block-user', '#modeller-icon');
    verticalAlignInBlock('.block-user', '#cosmetics');
    verticalMenuPosition('.navigation');
});

/* FUNCTIONS FOR SERVER RESPONSES */


$(document).ready(function() {
    'use strict';
   	$("#login-scale").on("ajax:success", function(e, data, status, xhr) {
   		$('#login-exception').text();
        var object_json = JSON.parse(xhr.responseText);
        window.location.href = object_json.redirect;
	}).on("ajax:error", function(e, xhr, status, error) {
		$('#login-exception').text();
		$('#login-exception').text('Неверный логин или пароль.');
	});

	$("#second-reg-scale").on("ajax:success", function(e, data, status, xhr) {
		$('#reg-exception').html();
		$('.to-instruction').show(300);
	}).on("ajax:error", function(e, xhr, status, error) {
		$('#reg-exception').html();
		var object_json = JSON.parse(xhr.responseText);
                if (object_json.login) {
                    $('#reg-exception').html($('#reg-exception').html() + '<p class="reg-exeption-text">' + "login " + object_json.login[0] + '</p>');
                }
                if (object_json.email) {
                    $('#reg-exception').html($('#reg-exception').html() + '<p style="text-align: center; font-size: 12px; color: #fff;">' + "email " + object_json.email[0] + '</p>');
                }
                if (object_json.password) {
                    $('#reg-exception').html($('#reg-exception').html() + '<p style="text-align: center; font-size: 12px; color: #fff;">' + "password " + object_json.password[0] + '</p>');
                }
                if (object_json.password_confirmation) {
                    $('#reg-exception').html($('#reg-exception').html() + '<p style="text-align: center; font-size: 12px; color: #fff;">' + "password confirmation " + object_json.password_confirmation[0] + '</p>');
                }
                popOverCenterPosition("#second-reg-scale");
	});

});
