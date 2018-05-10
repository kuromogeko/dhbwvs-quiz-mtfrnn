<?php
//Necesseties
use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;
require_once 'conn/connection.php';
require './vendor/autoload.php';

header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS');
header('Access-Control-Allow-Headers: *');


$configuration = [
    'settings' => [
        'displayErrorDetails' => true,
    ],
];
$c = new \Slim\Container($configuration);

$app = new \Slim\App($c);
//ENDOF Necessities
function sendError($response){
    header('Content-Type: application/json');
    $response->withStatus(400);
    return $response->getBody()->write(json_encode(array("status"=>"failed")));
}

function sendResponse($response, $dat){
    header('Content-Type: application/json');
    $response->withStatus(200);
    return $response->getBody()->write(json_encode($dat));
}
//TRYOUT
$app->get('/hello/{name}', function (Request $request, Response $response, array $args) {
    $name = $args['name'];
    $response->getBody()->write("Hello, $name");

    return $response;
});
//ENDOF TRYOUT
//CATEGORY RELATED REQUEST HANDLING

//GET ALL CATEGORIES
$app->get('/category', function(Request $request, Response $response, array $args){
    $cats=R::findAll('category', 'order by NAME ASC');
        if(!empty($cats)|| !is_null($cats)){
            return sendResponse($response, $cats);
        }else{
            return sendError($response);
        }
});
//GET CATEGORY BY ID
$app->get('/category/{id}',function(Request $request, Response $response, array $args){
    $catID=$args['id']; 
    $cat = R::findOne('category', 'ID = ?',[$catID]);
    if(!empty($cat)|| !is_null($cat)){
        sendResponse($response, $cat); 
    }else{
    sendError($response);
}
});

//POST NEW CATEGORY
$app->post('/category', function(Request $request, Response $response, array $args){
    if($request->hasHeader('token') && checkSession($request->getHeader('token')[0])){
       $req = $request->getParsedBody();
       $newCategory = R::dispense('category');
       $newCategory->name = $req['name'];
       $newID = R::store($newCategory);
       sendResponse($response, array('status'=>'ok','id'=>$newID));
    }else{
        sendError($response);
    }
});

//CHANGE CATEGORY PICK BY ID
$app->put('/category/{id}', function(Request $request, Response $response, array $args){
    if($request->hasHeader('token') && checkSession($request->getHeader('token')[0])){
        $req = $request->getParsedBody();
            //add id to object
        $req['id'] = $args['id'];
            //find Object to update
        $upObj = R::findOne('category','id = ?',[$req['id']]);
            //change property 
        $upObj->name = $req['name'];
            //commit change 
        R::store($upObj);
            sendResponse($response, array('status'=>'ok'));
    }else{
    sendError($response);
    }
});

//DELETE CATEGORY BY ID
$app->delete('/category/{id}', function(Request $request, Response $response, array $args){
    if($request->hasHeader('token') && checkSession($request->getHeader('token')[0])){
        $dId = $args['id'];
        //find object
        $delObj = R::findOne('category','id = ?',[$dId]);
        //if found delete else send Error
        if(!empty($delObj)|| !is_null($delObj)){
            R::trash($delObj);
            sendResponse($response, array('status'=>'ok'));
        }else{
            sendError($response);
        }
    }else{
    sendError($response);
    }
});
//ENDOF CATEGORY RELATED REQUEST HANDLING

//USER RELATED CATEGORIES
$app->get('/login', function(Request $request, Response $response, array $args){
    $uname = $request->getHeader('uname')[0];
    $pass = $request->getHeader('pwd')[0];
    $user = R::findOne('user','uname = ? AND pwd = Password(?)', [$uname,$pass]);
    if(!empty($user)|| !is_null($user)){
        $newSession = R::dispense('sessions');
        $newSession->user_iduser = $user->id;
        $newSession->token = hash("sha256", (time().$user->id));
        $commit = R::store($newSession);
        if(!empty($commit) || !is_null($commit)){
            sendResponse($response, array('status'=>'ok','token'=>$newSession->token));
        }else{
            sendError($response);
        }
    }else{
        sendError($response);
    }
});

//GET USER BY ID
$app->get('/user/{id}', function(Request $request, Response $response, array $args){
    $uid= $args['id'];
    $res = R::findOne('user', 'id = ?',[$uid]);
    if(!empty($res)|| !is_null($res)){
        sendResponse($response, array("id"=>$uid,"uname"=>$res->uname,"description"=>$res->description));
    }else{
        sendError($response);
    }  
});

//GET USER BY NAME
$app->get('/user/name/{name}', function(Request $request, Response $response, array $args){
    $uname = $args['name'];
    $res = R::findOne('user', 'uname=?', [$uname]);
    if(!empty($res)|| !is_null($res)){

        sendResponse($response, array("id"=>$res->id,"uname"=>$res->uname,"description"=>$res->description));
        }else{
        sendError($response);
        }
    });

    //Create NEW USER
$app->post('/user', function(Request $request, Response $response, array $args){
    $input = $request->getParsedBody();
    $newUser = R::dispense('user');
    $newUser->uname=$input['uname'];
    $newUser->pwd=$input['pwd'];
    $newUser->description=$input['description'];
    $res= R::store($newUser);
    R::exec("UPDATE user set pwd = Password(?) WHERE ID = ?", [$input['pwd'],$res]);

    if(!empty($res)||!is_null($res)){
        sendResponse($response,array("status"=>"ok", 'id'=>$res));
    }else{
        sendError($response);
    }
});

//CHANGE USER BY ID PUT
$app->put('/user/{id}', function(Request $request, Response $response, array $args){
    if($request->hasHeader('token') && $request->hasHeader('token') && checkSession($request->getHeader('token')[0]) && !empty(R::findOne('sessions', 'user_iduser = ? and token = ?',[$args['id'],$request->getHeader('token')[0]]))){
        $uid = $args['id'];
        $user = R::findOne('user','ID = ? and pwd=Password(?) ', [$uid,$request->getHeader('pwd')[0]]);
        if(empty($user) || is_null($user)){
            return sendError($response);
        }
        $input = $request->getParsedBody();
        $user->description = $input['description'];
        $user->pwd = $input['pwd'];

        R::store($user);
        R::exec("UPDATE user set pwd = Password(?) WHERE ID = ?", [$input['pwd'],$uid]);
        sendResponse($response, array("status"=>"ok"));
    }
});

//DELETE USER BY ID
$app->delete('/user/{id}', function(Request $request, Response $response, array $args){
    if($request->hasHeader('token') && $request->hasHeader('token') && checkSession($request->getHeader('token')[0]) && !empty(R::findOne('sessions', 'user_iduser = ? and token = ?',[$args['id'],$request->getHeader('token')[0]]))){
        $uid = $args['id'];
        $user = R::findOne('user','ID = ? and pwd=Password(?) ', [$uid,$request->getHeader('pwd')[0]]);
        if(empty($user) || is_null($user)){
            return sendError($response);
        }
        $quiz = R::findOne('quiz', 'user_iduser =  ?', [$uid]);
        if(!empty($quiz) || !is_null($quiz)){
            return sendError($response);
        }
        $session = R::findOne('sessions', 'user_iduser = ? and token = ?',[$args['id'],$request->getHeader('token')[0]]);
        R::trash($session);
        R::trash($user);
        sendResponse($response, array("status"=>"ok"));
    }else {
        sendError($response);
    }
});

//QUESTION RELATED CATEGORIES

//GET QUESTIONS FOR QUIZ
$app->get('/question/quiz/{id}', function(Request $request, Response $response, array $args){
    $qid = $args['id'];
    $res = R::findAll('question', 'quiz_idquiz = ? ', [$qid]);

    if(!empty($res)||!is_null($res)){
        sendResponse($response, $res);
    }else{
        sendError($response);
    }
});

//GET QUESTION BY ID
$app->get('/question/{id}', function(Request $request, Response $response, array $args){

    $quid = $args['id'];
    $res = R::findOne('question', 'id = ?', [$quid]);

    if(!empty($res)|| !is_null($res)){

        sendResponse($response, $res);
    }else{
        sendError($response);
    }
});

//POST QUESTION / CREATE
$app->post('/question', function(Request $request, Response $response, array $args){
    if($request->hasHeader('token') && checkSession($request->getHeader('token')[0])){
        $body = $request->getParsedBody();
        $newQuestion = R::dispense('question');
        $newQuestion->text = $body['text'];
        $newQuestion->quiz_idquiz = $body['quiz_idquiz'];
        $nQId = R::store($newQuestion);
        sendResponse($response,array("status"=>"ok", "id"=>$nQId));
    }else{
        sendError($response);
    }
});

//CHANGE QUESTION / PUT
$app->put('/question/{id}', function(Request $request, Response $response, array $args){
    if($request->hasHeader('token') && checkSession($request->getHeader('token')[0])){
        $qid = $args['id'];
        $body = $request->getParsedBody();
        $pq = R::findOne('question', 'id = ?',[$qid] );
        $pq->text = $body['text'];
        $pq->quiz_idquiz = $body['quiz_idquiz'];
        R::store($pq);
        sendResponse($response, array("status"=>"ok"));
    }else{
    sendError($response);
    }
});

//TODO: EXTENDED PERMISSION CHECK
//DELETE QUESTION BY ID
$app->delete('/question/{id}', function(Request $request, Response $response, array $args){
if($request->hasHeader('token') && checkSession($request->getHeader('token')[0])){
    $qid = $args['id'];
    $search = R::findOne ('answer', 'question_idquestion = ?', [$qid]);
    if(!empty($search) || !is_null($search)){
        sendError($response);
        return;
    }
    $question = R::findOne('question', 'id=?', [$qid]);
    R::trash($question);
    sendResponse($response, array("status"=>"ok"));
}else{
    sendError($response);
}
});

//ANSWER RELATED REQUESTS
//GET ANSWERS RELATED TO QUESTION
$app->get('/answer/question/{id}', function(Request $request, Response $response, array $args){

    $qid = $args['id'];
    $res = R::findAll('answer', 'question_idquestion = ?', [$qid]);
    if(!empty($res) || !is_null($res)){

        sendResponse($response, $res);
    }else{
        sendError($response);
    }
});

//GET SINGLE ANSWER
$app->get('/answer/{id}', function(Request $request, Response $response, array $args){

    $aid = $args['id'];
    $res = R::findOne('answer', 'id = ?', [$aid]);
    if(!empty($res)|| !is_null($res)){

    sendResponse($response, $res);
    }else{
    sendError($response);
    }
});

//POST NEW ANSWER
$app->post('/answer', function(Request $request, Response $response, array $args){
    if($request->hasHeader('token') && checkSession($request->getHeader('token')[0])){
        $body = $request->getParsedBody();
        $newAnswer = R::dispense('answer');
        $newAnswer->text = $body['text'];
        $newAnswer->question_idquestion = $body['question_idquestion'];
        $newAnswer->is_correct = $body['is_correct'];
        $newID = R::store($newAnswer);
        sendResponse($response, array("status"=>"ok", "id"=>$newID));
    }else{
    sendError($response);
    }
});

//TODO: ENHANCE SECURITY
//CHANGE ANSWER BASED ON ID / PUT
$app->put('/answer/{id}', function(Request $request, Response $response, array $args){

    if($request->hasHeader('token') && checkSession($request->getHeader('token')[0])){
        $aid = $args['id'];
        $body = $request->getParsedBody();
        $answer = R::findOne('answer', 'id = ?', [$aid]);
        $answer->text = $body['text'];
        $answer->question_idquestion = $body['question_idquestion'];
        $answer->is_correct = $body['is_correct'];
        R::store($answer);
        sendResponse($response, array("status"=>"ok"));
    }else{
        sendError($response);
    }
});

//TODO: ENHANCE SECURITY
//DELETE ANSWER BASED ON ID
$app->delete('/answer/{id}', function(Request $request, Response $response, array $args){
if($request->hasHeader('token') && checkSession($request->getHeader('token')[0])){
    $aid= $args['id'];
    $dAnswer = R::findOne('answer','id=?', [$aid]);
    R::trash($dAnswer);
    sendResponse($response, array("status"=>"ok"));
}else{
    sendError($response);
}
});

//execute
$app->run();

?>