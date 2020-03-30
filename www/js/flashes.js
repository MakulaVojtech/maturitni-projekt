'use strict'
let closers = document.getElementsByClassName("flash-closer");

for(let closer of closers){
    closer.addEventListener("click", function(){
        closer.parentElement.parentElement.style.display = "none"
    })
}