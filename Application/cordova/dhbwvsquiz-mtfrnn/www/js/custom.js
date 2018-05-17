var listElementTmpl = "\
<div class=\"mdl-cell mdl-cell--4-col-desktop mdl-cell--4-col-tablet mdl-cell--6-col-phone mdl-card mdl-shadow--2dp  graybox \">\
    <div name=\"QuizTitle\" class=\"mdl-card__title max-height \" style=\"background: linear-gradient(0deg,${Color}44,${Color}77),url(img/quiz.jpg)bottom right 15% no-repeat #2fa398\">\
        <h2 class=\"mdl-card__title-text\">${name}</h2>\
    </div>\
    <div class=\"mdl-card__supporting-text mdl-card--expand\">\
        ${description}\
    </div>\
    <div class=\"mdl-card__actions mdl-card--border\">\
        <a class=\"mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect\" data-playID=\"${id}\">\
            Play\
        </a>\
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

var displayQuizzes = function (data) {
    var result = JSON.parse(data);
    for(var i=0; i<result.length;i++){
        //console.log("looping for"+thing.name);
        var obj = result[i];
        obj.Color = getRandomColor();
        $.tmpl(listElementTmpl, obj).appendTo("#mainGrid");
    }
}

$(function () { // JQUERY RDY
    //ADD QUIZ BY TEMPLATE. GIVE RANDOM COLOR
    //OH MY GOD THIS IS SUCH A COOL HACK

    //INITIAL OVERVIEW ON PAGELOAD
    
    //SNACKBAR
    $('#snack').click(function(){
        var notification = document.querySelector('.mdl-js-snackbar');
        var data = {
        message: 'Message Sent',
        actionHandler: function(event) {},
        actionText: 'Undo',
        timeout: 10000
        };
        notification.MaterialSnackbar.showSnackbar(data);

    });
    

    //VIEW
    
    $("#appbutton").click(function(){
        getFullQuizzes(displayQuizzes);
    });
    
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
