var listElementTmpl = "\
<div class=\"mdl-cell mdl-cell--4-col-desktop mdl-cell--4-col-tablet mdl-cell--6-col-phone mdl-card mdl-shadow--2dp  graybox \">\
    <div name=\"QuizTitle\" class=\"mdl-card__title max-height \" style=\"background: linear-gradient(0deg,${Color}44,${Color}77),url(img/quiz.jpg)bottom right 15% no-repeat #2fa398\">\
        <h2 class=\"mdl-card__title-text\">${name}</h2>\
    </div>\
    <div class=\"mdl-card__supporting-text mdl-card--expand\">\
    Kennungs-Nummer: ${id}\
    <hr>\
        ${description}\
    </div>\
    <div class=\"mdl-card__actions mdl-card--border\">\
        <button class=\"mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect\" onclick=\"playAQuiz(${id})\">\
            Play\
        </button>\
    </div>\
</div>\
";

var globalQuizLoad;
var globalSet = false;


function toArr(Obj){
    var array = $.map(Obj, function(value, index) {
        return [value];
    });
    return array;
}

function shuffle(array) {
    var currentIndex = array.length, temporaryValue, randomIndex;

    while (0 !== currentIndex) {

      randomIndex = Math.floor(Math.random() * currentIndex);
      currentIndex -= 1;

      temporaryValue = array[currentIndex];
      array[currentIndex] = array[randomIndex];
      array[randomIndex] = temporaryValue;
    }
  
    return array;
  }
  

var getRandomColor = function () {
    var letters = '0123456789ABCDEF';
    var color = '#';
    for (var i = 0; i < 6; i++) {
        color += letters[Math.floor(Math.random() * 16)];
    }
    return color;
}
var cancelQuiz = function(){
    $('#mainGrid').show();
    $('[name=QuizPlay]').remove();
    $('#questionGrid').hide();
}
var playAQuiz = function(id){
    getFullQuizById(id,function(data){
        $('#mainGrid').hide();
        $('#questionGrid').show();
        if(typeof(data)=="string"){
            data = JSON.parse(data);
        }
        var questions = toArr(data[5]);
        questions = shuffle(questions);
        
    });
};

var displayQuizzes = function (data) {
    //var result = JSON.parse(data);
    if(typeof(data)=="string"){
        data = JSON.parse(data);
    }
    var result = data;
    globalQuizLoad = data;
    globalSet = true;

    for(var i=0; i<result.length;i++){
        //console.log("looping for"+thing.name);
        var obj = result[i];
        obj.Color = getRandomColor();
        $.tmpl(listElementTmpl, obj).appendTo("#mainGrid");
    }
}

$(function () { 

    //INITIAL OVERVIEW ON PAGELOAD
    getFullQuizzes(displayQuizzes);


    
    //SNACKBAR
    $('#snack').click(function(){
        var notification = document.querySelector('.mdl-js-snackbar');
        var data = {
        message: 'Message Sent',
        actionHandler: function(event) { notification.MaterialSnackbar.cleanup_()},
        actionText: 'Undo',
        timeout: 10000
        };
        notification.MaterialSnackbar.showSnackbar(data);

    });
    
    //Login Dialog setup   
    $("#login").dialog({
        autoOpen : false, modal : true, closeOnEscape : true, draggable: false, resizable: false, width: "auto",
        buttons: [
            {
              text: "Anmelden",
              click: function() {
                $( this ).dialog( "close" );
              }
            },
            {
                text: "Registrieren",
                click: function() {
                  $( this ).dialog( "close" );
                }
              }
          ]
      });
    
      // OPEN DIALOG
      $('[name="goToLogin"]').click(function() {
        $("#login").dialog("open");
        return false;
      });
    //VIEW
    


    
    //SHOW OVERVIEW
    $('[name="Overview"]').click(function(){
        //$('#login').hide();
        $('#Oview').show();
    });

    //Searchbar functionality
    $('#barSearch').click(function(){

        $('#barSearchInput >form :input').val("");
        $('#barSearchInput').fadeIn(500);
    })

    //search bar submit
    $('#barSearchInput').submit(function(){
        $(this).fadeOut(500);
    });



}); //ENDOF JQUERY RDY


