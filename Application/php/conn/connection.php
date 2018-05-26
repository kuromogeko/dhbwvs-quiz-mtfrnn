<?php
require 'rb-mysql.php';
R::setup('mysql:host=127.0.0.1;dbname=db_quiz_vs','groot','gr00t');
R::freeze(true);



function checkSession($token){
    $result = R::findOne('sessions','token LIKE ?',[$token]);
    if(!empty($result)){
        return true;
    }else{
        return false;
    }
}



?>
