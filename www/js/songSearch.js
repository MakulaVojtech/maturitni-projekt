$(document).ready(function(){
    $("#songSearch").keyup(function () {
        // Declare variables
        var input, filter, ul, pisnicky, a, i, txtValue;
        input = document.getElementById('songSearch');
        filter = input.value.toUpperCase();
        pisnicky = document.getElementsByClassName('pisnicka');

        // Loop through all list items, and hide those who don't match the search query
        for (i = 0; i < pisnicky.length; i++) {
            a = pisnicky[i].getElementsByTagName("h1")[0];
            txtValue = a.textContent || a.innerText;
            if (txtValue.toUpperCase().indexOf(filter) > -1) {
                pisnicky[i].style.display = "";
            } else {
                pisnicky[i].style.display = "none";
            }
        }
    });
});