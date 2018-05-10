<?php
require 'rb-mysql.php';
R::setup('mysql:host=localhost;dbname=db_quiz_vs','root','root');
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