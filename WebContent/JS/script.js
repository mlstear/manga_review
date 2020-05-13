$(function() {

    setTimeout(function() {
        $('#flush_success').fadeOut();
    }, 4000);

    $('#accordion_content').hide();

    $('.icon').click(function(){
        $(this).next().slideToggle();
    });



});