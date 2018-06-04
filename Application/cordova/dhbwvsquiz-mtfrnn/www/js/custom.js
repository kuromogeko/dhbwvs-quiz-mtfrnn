var newQuestionTemplate = "<div class=\"mdl-cell mdl-cell--12-col-desktop mdl-cell--12-col-tablet mdl-cell--12-col-phone mdl-card mdl-shadow--2dp  graybox \" name=\"newQuestion\">\
                        <div class=\"mdl-card__title max-height \" style=\"background: linear-gradient(0deg,#00000044,#FFFFFF77),url(img/quiz.jpg)bottom right 15% repeat #2fa398\">\
                            <h2 class=\"mdl-card__title-text\">Frage Nummer: ${rid}</h2>\
                        </div>\
                        <div class=\"mdl-card__supporting-text mdl-card--expand\">\
                            <form action=\"javascript:void(0);\">\
                                    <div class=\"mdl-textfield mdl-js-textfield mdl-textfield--floating-label\">\
                                        <input class=\"mdl-textfield__input\" type=\"text\" id=\"questionRunid${rid}\">\
                                        <label class=\"mdl-textfield__label\" for=\"newQuestion\">Fragetext</label>\
                                    </div> <hr>\
                                          \
                                <div class=\"mdl-textfield mdl-js-textfield mdl-textfield--floating-label\">\
                                  <input class=\"mdl-textfield__input\" type=\"text\" id=\"moneRunid${rid}\">\
                                  <label class=\"mdl-textfield__label\" for=\"newQuestion\">M&ouml;glichkeit 1</label>\
                                </div>\
                                <label class=\"mdl-switch mdl-js-switch mdl-js-ripple-effect\" for=\"moneswitchRunid${rid}\">\
                                    <input type=\"checkbox\" id=\"moneswitchRunid${rid}\" class=\"mdl-switch__input\">\
                                    <span class=\"mdl-switch__label\">Antwort stimmt</span>\
                                </label>\
                                      \
                                <div class=\"mdl-textfield mdl-js-textfield mdl-textfield--floating-label\">\
                                    <input class=\"mdl-textfield__input\" type=\"text\" id=\"mtwoRunid${rid}\">\
                                    <label class=\"mdl-textfield__label\" for=\"mtwoRunid${rid}\">M&ouml;glichkeit 2</label>\
                                </div>\
                                <label class=\"mdl-switch mdl-js-switch mdl-js-ripple-effect\" for=\"mtwoswitchRunid${rid}\">\
                                    <input type=\"checkbox\" id=\"mtwoswitchRunid${rid}\" class=\"mdl-switch__input\">\
                                    <span class=\"mdl-switch__label\">Antwort stimmt</span>\
                                </label>\
\
                                <div class=\"mdl-textfield mdl-js-textfield mdl-textfield--floating-label\">\
                                    <input class=\"mdl-textfield__input\" type=\"text\" id=\"mthreeRunid${rid}\">\
                                    <label class=\"mdl-textfield__label\" for=\"mthreeRunid${rid}\">M&ouml;glichkeit 3</label>\
                                </div>\
                                <label class=\"mdl-switch mdl-js-switch mdl-js-ripple-effect\" for=\"mthreeswitchRunid${rid}\">\
                                    <input type=\"checkbox\" id=\"mthreeswitchRunid${rid}\" class=\"mdl-switch__input\">\
                                    <span class=\"mdl-switch__label\">Antwort stimmt</span>\
                                </label>\
\
                                <div class=\"mdl-textfield mdl-js-textfield mdl-textfield--floating-label\">\
                                    <input class=\"mdl-textfield__input\" type=\"text\" id=\"mfourRunid${rid}\">\
                                    <label class=\"mdl-textfield__label\" for=\"mfourRunid${rid}\">M&ouml;glichkeit 4</label>\
                                </div>\
                                <label class=\"mdl-switch mdl-js-switch mdl-js-ripple-effect\" for=\"mfourswitchRunid${rid}\">\
                                    <input type=\"checkbox\" id=\"mfourswitchRunid${rid}\" class=\"mdl-switch__input\">\
                                    <span class=\"mdl-switch__label\">Antwort stimmt</span>\
                                </label>\
                          </form>\
                        </div>\
                    </div>";

var listElementTmpl = "\
<div class=\"mdl-cell mdl-cell--4-col-desktop mdl-cell--4-col-tablet mdl-cell--6-col-phone mdl-card mdl-shadow--2dp  graybox \">\
    <div name=\"QuizTitle\" class=\"mdl-card__title max-height \" style=\"background: linear-gradient(0deg,${Color}44,${Color}77),url(img/quiz.jpg)bottom right 15% no-repeat #2fa398\">\
        <h2 class=\"mdl-card__title-text\">${name}</h2>\
    </div>\
    <div class=\"mdl-card__supporting-text mdl-card--expand\">\
    Kennungs-Nummer: ${id}\
    <hr>Von: ${creator}\
    <hr>Kategorie: ${category}\
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

var questionElemTmpl = "\
<div name=\"QuizPlay\" class=\"mdl-cell mdl-card mdl-cell--12-col-desktop mdl-cell--12-col-tablet mdl-cell--12-col-phone mdl-shadow--2dp  graybox\">\
                            <div name=\"QuizPlay\" class=\"mdl-card__title max-height \" style=\"background: linear-gradient(0deg,#FFFFFF44,#FFFFFF77),url(img/quiz.jpg)bottom right 15% repeat #2fa398\">\
                                <h2 class=\"mdl-card__title-text\">Frage:</h2>\
                            </div>\
                            <div class=\"mdl-card__supporting-text mdl-card--expand\">\
                            ${text}\
                            <hr>\
                            <div id=\"Frage${id}\" data-questionid=${id}>{{each answers }}\
                            <label>\
                                    <input name=\"quizBox\" data-answerid=\"${id}\" type=\"checkbox\"><span>${text}</span>\
                            </label><br>\
                            {{/each}}\
                            </div>\
                            </div>\
                            <div class=\"mdl-card__actions mdl-card--border\">\
                                <button id=\"lock${id}\" class=\"mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect\" onclick=\"LockQuestion('${id}'); \">\
                                    Einlocken\
                                </button>\
                            </div>\
                    </div>\
";

var quizSubmissionTempl = "<div name=\"QuizPlay\" class=\"mdl-cell mdl-card mdl-cell--12-col-desktop mdl-cell--12-col-tablet mdl-cell--12-col-phone mdl-shadow--2dp  graybox\">\
<div name=\"QuizPlay\" class=\"mdl-card__title max-height \" style=\"background: linear-gradient(0deg,#FFFFFF44,#FFFFFF77),url(img/quiz.jpg)bottom right 15% repeat #2fa398\">\
    <h2 class=\"mdl-card__title-text\">Abgabe</h2>\
</div>\
<div class=\"mdl-card__supporting-text mdl-card--expand\">\
    Hier kann das Quiz abgegeben werden. Dazu m&uuml;ssen alle Antworten eingelockt sein.\
    Alternativ kann das Quiz abgebrochen werden. \
</div>\
<div class=\"mdl-card__actions mdl-card--border\">\
    <button id=\"enterQuiz\" class=\"mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect\" onclick=\"submitQuiz(); \">\
        Abgeben\
    </button>\
    <button id=\"cancelQuizBottom\"  onclick=\"cancelQuiz()\" class=\"mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect\">\
        Quiz Abbrechen\
    </button>\
</div>\
</div>";

var globalQuizLoad;
var globalSet = false;
var quizActive=false;
var quests;
var loggedIn = false;
var logToken ="";
var creationRunningId = 0;

function LockQuestion(q){
    $('#Frage'+q).children().children('input[type=checkbox]').attr("disabled",true);
    $('#Frage'+q).attr("style","background: #00000022");
    $('#lock'+q).attr("disabled", true);
}

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
  

var loggedInView = function(usaa){
    $('[data-login="true"]').show();
    $('[data-login="false"]').hide();
    $('#LogoutButton').html(usaa + " abmelden");
};

var loggedOutView = function(){
    $('[data-login="false"]').show();
    $('[data-login="true"]').hide();
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
    $('#questionGrid').fadeOut(500);
    $('#mainGrid').fadeIn(1000);
    $('[name=QuizPlay]').remove();
    $('#cancelQuiz').hide();
    quizActive=false;
}
var playAQuiz = function(id){
    getFullQuizById(id,function(data){
        $('#mainGrid').hide();
        $('#questionGrid').show();
        $('#cancelQuiz').show();
        quizActive= true;
        if(typeof(data)=="string"){
            data = JSON.parse(data);
        }
        var questions = toArr(data[5]);
        questions = shuffle(questions);
        quests = questions;

        //console.log(questions);
        for(var i=0; i<questions.length; i++){
            //console.log(questions[i]);
            $.tmpl(questionElemTmpl, questions[i]).appendTo('#questionGrid');
        }
        $.tmpl(quizSubmissionTempl, {}).appendTo('#questionGrid');
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
var searchDisplayQuizzes = function (data) {
    //var result = JSON.parse(data);
    if(typeof(data)=="string"){
        data = JSON.parse(data);
    }
    var result = data;

    for(var i=0; i<result.length;i++){
        //console.log("looping for"+thing.name);
        var obj = result[i];
        obj.Color = getRandomColor();
        $.tmpl(listElementTmpl, obj).appendTo("#mainGrid");
    }
}

var submitQuiz = function(){
    if(quizActive==true){
        //TODO: Lock in Check
        var qsLocked = 0;
        for(var k=0; k<quests.length; k++){
            if($('#Frage'+quests[k].id).children().children('input[type=checkbox]').is(":disabled")){
                qsLocked++;
            }
        }
        if(qsLocked >=quests.length){
            var corrs = 0;

            for(var i = 0; i<quests.length; i++){
                //console.log(quests[i]);
                if($('#Frage'+quests[i].id).children().children('input[type=checkbox]').is(":disabled")){
                    //TODO: Durch antworten gehen
                    //console.log(quests[i].answers.length);
                    var allCorrect = true;
                    for(var j=0;j<quests[i].answers.length;j++){
                        console.log(quests[i].answers[j].text);
                        if($('[data-answerid='+quests[i].answers[j].id+']').is(":checked")==true){
                            if(quests[i].answers[j].is_correct==1){
                                //console.log("yay");
                            }else{
                                allCorrect = false;
                            }
                        }else{
                            console.log("Is Correct? "+ quests[i].answers[j].is_correct);
                            if(quests[i].answers[j].is_correct==0){
                                //console.log("yay");
                            }else{
                                allCorrect = false;
                            }
                        }
                    }
                    if(allCorrect==true){
                        console.log("+1!");
                        corrs++;
                    }
                }else{
                    //console.log("NOPE!");
                }
            }
            console.log("Fragen richtig: "+corrs+ " von "+quests.length);
            var notification = document.querySelector('.mdl-js-snackbar');
            var data = {
            message: corrs+' Fragen von '+quests.length+' korrekt beantwortet',
            actionHandler: function(event) { notification.MaterialSnackbar.cleanup_()},
            actionText: 'Ok',
            timeout: 5000
            };
            notification.MaterialSnackbar.showSnackbar(data);
            cancelQuiz();
        }else{
            //console.log("Nicht alle Fragen gelockt!");
            var notification = document.querySelector('.mdl-js-snackbar');
            var data = {
            message: 'Nicht alle Fragen eingelockt!',
            actionHandler: function(event) { notification.MaterialSnackbar.cleanup_()},
            actionText: 'Ok',
            timeout: 5000
            };
            notification.MaterialSnackbar.showSnackbar(data);
        }
    }else{
        var notification = document.querySelector('.mdl-js-snackbar');
            var data = {
            message: 'Unbekannter Fehler, bitte Quiz neu starten.',
            actionHandler: function(event) { notification.MaterialSnackbar.cleanup_()},
            actionText: 'Ups!',
            timeout: 5000
            };
            notification.MaterialSnackbar.showSnackbar(data);
    }
}

function addQuestion(){
    $.tmpl(newQuestionTemplate, {rid: creationRunningId}).appendTo('#createInsert');
    creationRunningId++;
    console.log(creationRunningId);
}

function cancelCreateQuiz(){
    creationRunningId= 0;
    $('[name="newQuestion"]').remove();
    $('#CreateView').hide();
    $('#mainGrid').html('');
    $('#mainGrid').show();
    searchDisplayQuizzes(globalQuizLoad);
    $('#Oview').show();
}

function hideCreateQuiz(){
    creationRunningId= 0;
    $('[name="newQuestion"]').remove();
    $('#CreateView').hide();
    $('#mainGrid').show();
};

var callCreateQuiz= function(){
  //  console.log("I HATE JS!");
  
  cancelQuiz();
  $('#mainGrid').hide();
  $('#CreateView').show();
  addQuestion();
};

function saveQuiz(){
    //add the quiz, retrieve its id
    //alle Bed für zufügen?
    if(true){
    addQuiz($('#newTitle').val(),$('#newDesc').val(),$('#newCategory').val(),logToken, function(data){
        if(typeof(data)=="string"){
            data = JSON.parse(data);
        }
        if(data[0]=="failed"){
            console.log("Could not create quiz");
        }else{
            var newid = data[1];
          //  console.log("data");
           // console.log(data);
            for(var i = 0;i< creationRunningId && i<=10;i++){
                addRemoteQuestion($('#questionRunid'+i).val(),newid, logToken, function(data, i){
                    if(typeof(data)=="string"){
                        data = JSON.parse(data);
                    }
                    if(data[0] == "failed"){
                    }else{
                     //   console.log("added a question"+ "Indicator is: "+i);
                       var aqid = data[1];

                       var a = $('#moneRunid'+i).val();
                       var a2 = $('#moneswitchRunid'+i).prop("checked");

                       var b= $('#mtwoRunid'+i).val();
                        var b2= $('#mtwoswitchRunid'+i).prop("checked");

                        var c =$('#mthreeRunid'+i).val();
                        var c2 = $('#mthreeswitchRunid'+i).prop("checked");

                        var d = $('#mfourRunid'+i).val();
                        var d2 = $('#mfourswitchRunid'+i).prop("checked");

                        //console.log( "" +a + a2 + b +b2+ c +c2 +d +d2);
                        addAnswer(a,a2,aqid,logToken,function(data){
                            console.log("aw 1 callback");
                            if(typeof(data)=="string"){
                                data = JSON.parse(data);
                            }
                            if(data[0] == "failed"){
                                console.log("Erstellung von AW 1 fehlgeschlagen");
                            }
                            
                        });

                        addAnswer(b,b2,aqid,logToken,function(data){
                            console.log("aw 2 callback");
                            if(typeof(data)=="string"){
                                data = JSON.parse(data);
                            }
                            if(data[0] == "failed"){
                                console.log("Erstellung von AW 2 fehlgeschlagen");
                            }
                            
                        });

                        addAnswer(c,c2,aqid,logToken,function(data){
                            console.log("aw 3 callback");
                            if(typeof(data)=="string"){
                                data = JSON.parse(data);
                            }
                            if(data[0] == "failed"){
                                console.log("Erstellung von AW 3 fehlgeschlagen");
                            }
                            
                        });

                        addAnswer(d,d2,aqid,logToken,function(data){
                            console.log("aw 4 callback");
                            if(typeof(data)=="string"){
                                data = JSON.parse(data);
                            }
                            if(data[0] == "failed"){
                                console.log("Erstellung von AW 4 fehlgeschlagen");
                            }
                            
                        });
                    }
                },i);
            }
        }
    });
    }
};

$(function () { 

    //INITIAL OVERVIEW ON PAGELOAD
    getFullQuizzes(displayQuizzes);


    
    //SNACKBAR
    /*$('#snack').click(function(){
        var notification = document.querySelector('.mdl-js-snackbar');
        var data = {
        message: 'Message Sent',
        actionHandler: function(event) { notification.MaterialSnackbar.cleanup_()},
        actionText: 'Undo',
        timeout: 10000
        };
        notification.MaterialSnackbar.showSnackbar(data);

    });*/
    
    

    //Login Dialog setup   
    $("#login").dialog({
        autoOpen : false, modal : true, closeOnEscape : true, draggable: false, resizable: false, width: "auto",
        buttons: [
            {
              text: "Anmelden",
              click: function() {
                loginUser($('#uname').val(),$('#pass').val(),function(data){
                    if(typeof(data)=="string"){
                        data = JSON.parse(data);
                    }
                    if(data[0]=="ok"){
                        //console.log("Name: "+$('#uname').val());
                        loggedInView($('#uname').val()); 
                        loggedIn =true;
                        logToken = data[1];
                        var notification = document.querySelector('.mdl-js-snackbar');
                       
                        var data = {
                        message: 'Nutzer erfolgreich angemeldet!',
                        actionHandler: function(event) { notification.MaterialSnackbar.cleanup_()},
                        actionText: 'Ok',
                        timeout: 5000
                        };
                        notification.MaterialSnackbar.showSnackbar(data);
                        
                    }
                });
                $( this ).dialog( "close" );
              }
            },
            {
                text: "Registrieren",
                click: function() {
                    console.log("Register click");
                    getUserByName($('#uname').val(),function(data){
                        if(typeof(data)=="string"){
                            data = JSON.parse(data);
                        }
                        if(data[0] == "failed" ){
                           addUser($('#uname').val(),$('#pass').val(),"A new user", function(data){
                            if(typeof(data)=="string"){
                                data = JSON.parse(data);
                            }
                            console.log(data);
                            if(data[0] == "ok"){
                                var notification = document.querySelector('.mdl-js-snackbar');
                                var data = {
                                message: 'Nutzer erfolgreich angelegt! Bitte anmelden.',
                                actionHandler: function(event) { notification.MaterialSnackbar.cleanup_()},
                                actionText: 'Ok',
                                timeout: 5000
                                };
                                notification.MaterialSnackbar.showSnackbar(data);   
                            }else{
                                var notification = document.querySelector('.mdl-js-snackbar');
                                var data = {
                                message: 'Unbekannter Fehler bei Registrierung!',
                                actionHandler: function(event) { notification.MaterialSnackbar.cleanup_()},
                                actionText: 'Ok',
                                timeout: 5000
                                };
                                notification.MaterialSnackbar.showSnackbar(data);
                            }
                           });
                        }else{
                            var notification = document.querySelector('.mdl-js-snackbar');
                            var data = {
                            message: 'Nutzername existiert bereits!',
                            actionHandler: function(event) { notification.MaterialSnackbar.cleanup_()},
                            actionText: 'Ok',
                            timeout: 5000
                            };
                            notification.MaterialSnackbar.showSnackbar(data);
                        }
                    });
                  $( this ).dialog( "close" );
                }
              },
              {
                  text: "Abbrechen",
                  click:function(){
                      $(this).dialog("close");
                  }
              }
          ]
      });
    

      // OPEN DIALOG
      $('[name="goToLogin"]').click(function() {
        $("#login").dialog("open");
        return false;
      });

      

      $('#LogoutButton').click(function(){
          //console.log(logToken);
        logoutUser(logToken, function(data){
            if(typeof(data)=="string"){
                data = JSON.parse(data);
            }
            //console.log(data);
            if(data[0]=="ok"){
                loggedOutView();
                cancelQuiz();
                cancelCreateQuiz();
                loggedIn = false;
                logToken  = "";
                var notification = document.querySelector('.mdl-js-snackbar');
                            var data = {
                            message: 'Erfolreich abgemeldet',
                            actionHandler: function(event) { notification.MaterialSnackbar.cleanup_()},
                            actionText: 'Ok',
                            timeout: 5000
                            };
                            notification.MaterialSnackbar.showSnackbar(data);
            }else{
                var notification = document.querySelector('.mdl-js-snackbar');
                            var data = {
                            message: 'Fehler! Neu laden zum abmelden.',
                            actionHandler: function(event) { notification.MaterialSnackbar.cleanup_()},
                            actionText: 'Ok',
                            timeout: 5000
                            };
                            notification.MaterialSnackbar.showSnackbar(data);
            }
            
        });      

      });
    //VIEW
    


    
    //SHOW OVERVIEW
    $('[name="Overview"]').click(function(){
        //$('#login').hide();
        cancelQuiz();
        $('#mainGrid').html('');
        searchDisplayQuizzes(globalQuizLoad);
        $('#Oview').show();
        hideCreateQuiz();
    });

    //Searchbar functionality
    $('#barSearch').click(function(){

        $('#barSearchInput >form :input').val("");
        $('#barSearchInput').fadeIn(500);
    })

    //search bar submit
    $('#barSearchInput').submit(function(){
        cancelQuiz();
        cancelCreateQuiz();
        var searchTerm = $('#barInputLine').val();
        if(searchTerm.trim() == "" ){
           
            $('#mainGrid').html('');
            searchDisplayQuizzes(globalQuizLoad);
        }else{
            var newResult= globalQuizLoad.filter(function(el){
                return el.name.includes(searchTerm) || el.id.includes(searchTerm) || el.category.includes(searchTerm) || el.category.includes(searchTerm);
            });
           $('#mainGrid').html('');
           searchDisplayQuizzes(newResult); 
           if(newResult.length==0){
               $('#mainGrid').text("Kein Ergebnis gefunden :(");
           }
        }
        $(this).fadeOut(500);
    });

}); //ENDOF JQUERY RDY


