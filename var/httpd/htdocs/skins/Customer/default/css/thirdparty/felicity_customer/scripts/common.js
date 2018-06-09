// JavaScript Document
$(document).ready(function($) {
    "use strict";

    /*Tooltips*/
    $('[data-toggle="tooltip"]').tooltip();


    /*Scroll top*/
    $('.scroll-to-top').hide();
    $(window).scroll(function() {
        if ($(this).scrollTop() > 100) {
            $('.scroll-to-top').fadeIn();
        } else {
            $('.scroll-to-top').fadeOut();
        }
    });
    $('.scroll-to-top').click(function() {
        $('html, body').animate({ scrollTop: 0 }, 800);
        return false;
    });


    $('#side-bar-btn').click(function() {
        $('#sidebar_con').show();
        $('#sidebar #Navigation').addClass('scroll-box');
    });
    $('#sidebar_con').click(function() {
        $('#sidebar_con').hide();
    });
    $('#side-bar-close').click(function() {
        $('#sidebar_con').hide();
    });




});