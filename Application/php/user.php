<?php
require 'conn/connection.php';
if($_SERVER['REQUEST_METHOD']=='GET'){
    if($_SERVER['HTTP_ACTION']=='getLogin'){
        $uname = $_SERVER['HTTP_UNAME'];
        $pass = $_SERVER['HTTP_PWD'];
        $user = R::findOne('user','uname = ? AND pwd = Password(?)', [$uname,$pass]);
        if(!empty($user)|| !is_null($user)){
            $newSession = R::dispense('sessions');
            $newSession->user_iduser = $user->id;
            $newSession->token = hash("sha256", (time().$user->id));
            $commit = R::store($newSession);
            if(!empty($commit) || !is_null($commit)){
                sendResponse(array('status'=>'ok','token'=>$newSession->token));
            }else{
                sendError();
            }
        }else{
            sendError();
        }
    }
}else if($_SERVER['REQUEST_METHOD']=='POST'){
    
}if($_SERVER['REQUEST_METHOD']=='PUT'){
    
}if($_SERVER['REQUEST_METHOD']=='DELETE'){
    
}
?>