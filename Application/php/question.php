<?php
require 'conn/connection.php';

/**
 * Created by PhpStorm.
 * User: Florian Riedlinger
 * Date: 25.04.2018
 * Time: 14:42
 */

//GET Method
if($_SERVER['REQUEST_METHOD'] == 'GET') {
    if($_SERVER['HTTP_ACTION'] == 'getQuestion') {
        $qID = $_SERVER['HTTP_ID'];
        $qstn = R::find('Question', 'id = ?', [$qID]);

        if(!empty($qstn) && !is_null($qstn)) {
            http_response_code(200);
            sendResponse($qstn);
        }
        else {
            sendError();
        }
    }
    else if($_SERVER['HTTP_ACTION'] == 'entry') {

    }
}
else if($_SERVER['REQUEST_METHOD'] == 'POST') {

}
else if($_SERVER['REQUEST_METHOD'] == 'PUT') {

}
else if($_SERVER['REQUEST_METHOD'] == 'DELETE') {

}
?>