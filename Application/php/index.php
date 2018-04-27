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
    $response->withStatus(400);
    return $response->getBody()->write(json_encode(array("status"=>"failed")));
}

function sendResponse($response, $dat){
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

    //TODO: STILL MISSING PAssword()
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



//execute
$app->run();

?>