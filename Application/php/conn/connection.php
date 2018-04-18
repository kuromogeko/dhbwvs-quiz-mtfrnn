<?php
require 'rb-mysql.php';
R::setup('mysql:host=localhost;dbname=db_quiz_vs','root','root');
R::freeze(true);
header('Content-Type: application/json');
function checkSession($token){
    $result = R::findOne('sessions','token LIKE ?',[$token]);
    if(!empty($result)){
        return true;
    }else{
        return false;
    }
}

function sendError(){
    http_response_code(400);
    echo json_encode(array('status'=>'failed'));
}

function sendResponse($dat){
    echo json_encode($dat);
}

?>