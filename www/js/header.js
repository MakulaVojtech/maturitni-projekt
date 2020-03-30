'use strict'
let position = $(window).scrollTop()
$(window).scroll(function () {
   if($(window).width() > 1300){
    let scroll = $(window).scrollTop();
    if (position - scroll < -20) {
        $("header").addClass("headerScroll");
        $("#logo").css("display", "hidden")
    } else if (position - scroll > -20) {
        $("header").removeClass("headerScroll");
    }
   }
});
window.onload = () => {
    $("ul li").hover(function(){
        $(".dropdown-menu", this).slideDown(100);
      }, function(){
        $(".dropdown-menu", this).stop().slideUp(100);
      });
    $("#toggler").click(function () {
        $("nav").slideToggle("fast");
        $("header").toggleClass("headerOpen");
    });

    $("#i6").mouseenter(function () {
        $("#img2").css("background-image", "url('/akrobacie_kratka.gif')");
    });
    $("#i6").mouseleave(function () {
        $("#img2").css("background-image", "");
    });
    $("#i4").mouseenter(function () {
        $("#img2").css("background-image", "url('/boj_kratky.gif')");
    });
    $("#i4").mouseleave(function () {
        $("#img2").css("background-image", "");
    });
    $("#i8").mouseenter(function () {
        $("#img2").css("background-image", "url('/hudba_kratka.gif')");
    });
    $("#i8").mouseleave(function () {
        $("#img2").css("background-image", "");
    });
}

$(window).ready(function(){document.getElementById("year").innerHTML = "&copy;&nbsp;2019&nbsp;-&nbsp;"+ new Date().getFullYear();});
