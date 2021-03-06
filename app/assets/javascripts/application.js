// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

$(document).on('turbolinks:load',function(){
    $('.tab-bar').click(function(){
        $('.tab-active').removeClass('tab-active');
        $(this).addClass('tab-active');
        $('.box-show').removeClass('box-show');
        const index=$(this).index();
        $('.post-index').eq(index).addClass('box-show');
    });
});

$(document).on('turbolinks:load',function(){
    $('#sidebarCollapse').click(function(){
        $('#sidebar').toggleClass('close');
        $('.sidebar-icon').toggleClass('open');
    });
});