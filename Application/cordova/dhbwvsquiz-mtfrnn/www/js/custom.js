var Base = "http://localhost";
var listElementTmpl = "\
<div class=\"mdl-cell mdl-cell--4-col-desktop mdl-cell--4-col-tablet mdl-cell--6-col-phone  graybox \">\
<div class=\"mdl-card mdl-shadow--2dp\">\
    <div class=\"mdl-card__title mdl-card--expand\" style=\"background: linear-gradient(0deg,${Color}44,${Color}77),url(img/quiz.jpg)bottom right 15% no-repeat #2fa398\">\
        <h2 class=\"mdl-card__title-text\">${Titel}</h2>\
    </div>\
    <div class=\"mdl-card__supporting-text\">\
        ${Info}\
    </div>\
    <div class=\"mdl-card__actions mdl-card--border\">\
        <a class=\"mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect\" data-playID=\"${playID}\">\
            Play\
        </a>\
    </div>\
</div>\
</div>\
";



var getRandomColor = function () {
    var letters = '0123456789ABCDEF';
    var color = '#';
    for (var i = 0; i < 6; i++) {
        color += letters[Math.floor(Math.random() * 16)];
    }
    return color;
}

var displayQuiz = function (event) {
    var obj = event.data;
    obj.Color = getRandomColor();
    $.tmpl(listElementTmpl, obj).appendTo("#mainGrid");
}

$(function () { // JQUERY RDY
    //ADD QUIZ BY TEMPLATE. GIVE RANDOM COLOR
    //OH MY GOD THIS IS SUCH A COOL HACK

    //VIEW
    
    $("#appbutton").click( {"Titel": "JS STUPID", "Info": "JQUERY UND JS SIND DOOOOOF", "playID": 5}, displayQuiz);
    
    //SHOW LOGIN FORM
    $('[name="goToLogin"]').click(function(){
        $('#login').show();
        $('#Oview').hide();
    });

    $('[name="Overview"]').click(function(){
        $('#login').hide();
        $('#Oview').show();
    });

    $('#barSearch').click(function(){

        $('#barSearchInput >form :input').val("");
        $('#barSearchInput').fadeIn(500);
    })

    $('#barSearchInput').submit(function(){
        $(this).fadeOut(500);
    });



}); //ENDOF JQUERY RDY

