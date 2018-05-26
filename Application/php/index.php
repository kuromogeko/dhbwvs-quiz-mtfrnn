<?php
//Necesseties
use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;
require_once 'conn/connection.php';
require './vendor/autoload.php';
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
    $array= array();
    $i=0;
    foreach($dat as $row){
        $array[$i]= $row;
        $i++;
    };
    return $response->getBody()->write(json_encode($array));
}
//TRYOUT
$app->get('/hello/{name}', function (Request $request, Response $response, array $args) {
    $name = $args['name'];
    $response->getBody()->write("Hello, $name");
    return $response;
});
//ENDOF TRYOUT
//CATEGORY RELATED REqUEST HANDLING
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
//ENDOF CATEGORY RELATED REqUEST HANDLING
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
    }else{
        return sendError($response);
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

//qUESTION RELATED CATEGORIES

//GET qUESTIONS FOR qUIZ
$app->get('/question/quiz/{id}', function(Request $request, Response $response, array $args){
    $qid = $args['id'];
    $res = R::findAll('question', 'quiz_idquiz = ? ', [$qid]);
    if(!empty($res)||!is_null($res)){
        sendResponse($response, $res);
    }else{
        sendError($response);
    }
});
//GET qUESTION BY ID
$app->get('/question/{id}', function(Request $request, Response $response, array $args){
    $quid = $args['id'];
    $res = R::findOne('question', 'id = ?', [$quid]);
    if(!empty($res)|| !is_null($res)){
        sendResponse($response, $res);
    }else{
        sendError($response);
    }
});

//POST qUESTION / CREATE
$app->post('/question', function(Request $request, Response $response, array $args){
    if($request->hasHeader('token') && checkSession($request->getHeader('token')[0])){
        $body = $request->getParsedBody();
        $newquestion = R::dispense('question');
        $newquestion->text = $body['text'];
        $newquestion->quiz_idquiz = $body['quiz_idquiz'];
        $nqId = R::store($newquestion);
        sendResponse($response,array("status"=>"ok", "id"=>$nqId));
    }else{
        sendError($response);
    }
});

//CHANGE qUESTION / PUT
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
//DELETE qUESTION BY ID
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
//ANSWER RELATED REqUESTS
//GET ANSWERS RELATED TO qUESTION
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
        $newanswer = R::dispense('answer');
        $newanswer->text = $body['text'];
        $newanswer->question_idquestion = $body['question_idquestion'];
        $newanswer->is_correct = $body['is_correct'];
        $newID = R::store($newanswer);
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
        $danswer = R::findOne('answer','id=?', [$aid]);
        R::trash($danswer);
        sendResponse($response, array("status"=>"ok"));
    }else{
        sendError($response);
    }
});

//qUIZ RELATED REqUEST HANDLING
//GET LIST OF ALL qUIZZES
$app->get('/quiz', function(Request $request, Response $response, array $args) {
    $quiz = R::findAll('quiz', 'order by NAME ASC');

    if(!empty($quiz)|| !is_null($quiz)){
        sendResponse($response, $quiz);
    } else{
        sendError($response);
    }
});

//GET A SINGLE qUIZ BY ID
$app->get('/quiz/{id}', function(Request $request, Response $response, array $args) {
    $qid = $args['id'];
    $quiz = R::findOne('quiz', 'id = ?', [$qid]);

    if(!empty($quiz)|| !is_null($quiz)){
        $rquestions = R::findAll('question', 'quiz_idquiz = ?', [$quiz->id]);
        $quiz->questions = $rquestions;
        foreach($quiz->questions as $rq){
            $ranswers = R::findAll('answer', 'question_idquestion = ?',[$rq->id]);
            $rq->answers = $ranswers;
        }
        return sendResponse($response, $quiz);
    } else{
        return sendError($response);
    }
});

//GET LIST OF ALL qUIZZES WITH AFFILIATED qUESTIONS AND ALL AFFILIATED ANSWERS
$app->get('/quizFull', function(Request $request, Response $response, array $args) {
    $result = 0;
    $quizEntries = R::findAll('quiz');

    if(!empty($quizEntries) || !is_null($quizEntries)) {
        foreach ($quizEntries as $quizEntry) {
            //$result = $result + R::findOne('quiz', 'id = ?', [$quizEntry['id']]);

            $quizEntry->questions = R::findAll('question', 'quiz_idquiz = ?', [$quizEntry['id']]);
            foreach ($quizEntry->questions as $questionEntry) {
                //$questionTemp = R::findOne('question', 'id = ?', [$questionEntry['id']]);
                $questionEntry->answers = R::findAll('answer', 'question_idquestion = ?', [$quizEntry['id']]);
                //$result = $result + $questionTemp + $answerTemp;
            }
        }

        return sendResponse($response,$quizEntries);
    }
    else {
        return sendError($response);
    }
});

//POST A NEW qUIZ
$app->post('/quiz', function(Request $request, Response $response, array $args) {
    if($request->hasHeader('token') && checkSession($request->getHeader('token')[0])){
        $req = $request->getParsedBody();
        $quiz = R::dispense('quiz');

        $quiz->name = $req['name'];
        $quiz->description = $req['description'];
        $quiz->user_iduser = $req['user_iduser'];
        $quiz->category_idcategory = $req['category_idcategory'];

        $newID = R::store($quiz);
        sendResponse($response, array('status'=>'ok','id'=>$newID));
    }
    else {
        sendError($response);
    }
});

//CHANGE qUIZ ELEMENTS BY ID PUT
$app->put('/quiz/{id}', function(Request $request, Response $response, array $args){
    if($request->hasHeader('token') && checkSession($request->getHeader('token')[0])){
        $qid = $args['id'];
        $quiz = R::findOne('quiz', 'id = ?', [$qid]);

        if(empty($quiz) || is_null($quiz)) {
            return sendError($response);
        }

        $input = $request->getParsedBody();
        $quiz->name = $input['name'];
        $quiz->description = $input['description'];
        $quiz->user_iduser = $input['user_iduser']; //REVIEW: POTENTIAL FALSE NAME, MAY BE "user_iduser"
        $quiz->category_idcategory = $input['category_idcategory'];

        R::store($quiz);
        //R::exec("UPDATE quiz set name = ?, description = ?, user_iduser = ?, category_idcategory = ? WHERE id = ?"
        //    ,[$input['name'], $input['description'], $input['user_iduser'], $input['category_idcategory'], $qid]);

        return sendResponse($response, array("status"=>"ok"));
    } else {
        return sendError();
    }
});

//DELETE A qUIZ IF ALL qUESTIONS WITH AFFILIATED qUIZ ID ARE EMPTY or DELETE A qUIZ AND ALL ASSOCIATED qUESTIONS AND ANSWERS FOR THAT qUIZ
$app->delete('/quiz/{id}', function(Request $request, Response $response, array $args) {
    if($request->hasHeader('token') && checkSession($request->getHeader('token')[0])){
        $dID = $args['id'];
        $quiz = R::findOne('quiz', 'id = ?', [$dID]);
        $remainingquestions = R::findAll('question', 'quiz_idquiz = ?', [$dID]);

        if(!empty($remainingquestions) || !is_null($remainingquestions)) {
            if(!empty($quiz) || !is_null($quiz)) {
                R::trash($quiz);
                return sendResponse($response, array("status"=>"ok"));
            }
            else {
                return sendError($response);
            }
        }
        return sendError($response);
    }
    else {
        return sendError($response);
    }
});

//execute
$app->run();

?>
