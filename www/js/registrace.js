'use strict'
$(document).ready(function () {
    $("#loginName").keyup(function (e) {
        var inputValue = $(this).val();
        if (inputValue.length) {
            $.get("Base:registraceForm", {
                registrace: inputValue
            }).done(function (data) {
                if (data == 1) {
                    $("#loginName").addClass("fail").removeClass("nofail");
                   $("#nameErr").slideDown("fast");
                } else if (data == 0) {
                    $("#loginName").addClass("nofail").removeClass("fail");
                    $("#nameErr").slideUp("fast");
                }
            });
        } else {
            $("#loginName").removeClass("fail").removeClass("nofail");
        }
    });
    $("#password").keyup(function(e){
        var $regexp = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}$/;
        var inputValue = $(this).val();
        if(!inputValue.match($regexp)){
            $("#passErr").slideDown("fast");
            $("#password").addClass("fail").removeClass("nofail");
        }else if(inputValue.match($regexp)){
            $("#password").addClass("nofail").removeClass("fail");
            $("#passErr").slideUp("fast");
        }
    });
    $("#passAgain").keyup(function(e){
        if($("#password").val() != $("#passAgain").val()){
            $("#againErr").slideDown("fast");
            $("#passAgain").addClass("fail").removeClass("nofail");
        }else if($("#password").val() == $("#passAgain").val()){
            $("#againErr").slideUp("fast");
            $("#passAgain").addClass("nofail").removeClass("fail");
        }
    });
    $("input").change(function(e){
        if($(".nofail").length == 3){
            $("#submit").prop('disabled', false)
        }
    });
});