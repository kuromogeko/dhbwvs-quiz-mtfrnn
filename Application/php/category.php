<?php
require 'conn/connection.php';

//GET Methods
if($_SERVER['REQUEST_METHOD']=='GET'){
    //Find all the categories and return them assorted by NAME
    if($_SERVER['HTTP_ACTION']=='getAllCategories'){
        $cats=R::findAll('category', 'order by NAME ASC');
        if(!empty($cats)|| !is_null($cats)){
            http_response_code(200);
            sendResponse($cats);
        }else{
            sendError();
        }
        //FIND a single category by name
    }else if($_SERVER['HTTP_ACTION']=='getCategory'){
        $catID=$_SERVER['HTTP_ID'];
        $cat = R::findOne('category', 'ID = ?',[$catID]);
        if(!empty($cat)|| !is_null($cat)){
            http_response_code(200);
            sendResponse($cat); 
        }else{
            sendError();
        }
        
    }
    //POST METHODS
}else if($_SERVER['REQUEST_METHOD']=='POST'){
    //add a new category and Check User session
    if($_SERVER['HTTP_ACTION']=='addCategory' && checkSession($_SERVER['HTTP_TOKEN'])){
       $req = json_decode(file_get_contents('php://input'));
       $newCategory = R::dispense('category');
       $newCategory->name = $req->name;
       $newID = R::store($newCategory);
       sendResponse(array('status'=>'ok','id'=>$newID));
    }else{
        sendError();
    }
}else if($_SERVER['REQUEST_METHOD']=='PUT'){
    //change a category
    if($_SERVER['HTTP_ACTION']=='updateCategory' && checkSession($_SERVER['HTTP_TOKEN'])){
        //get request body
        $req = json_decode(file_get_contents('php://input'));
        //add id to object
        $req->id = $_SERVER['HTTP_ID'];
        //find Object to update
        $upObj = R::findOne('category','id = ?',[$req->id]);
        //change property 
        $upObj->name = $req->name;
        //commit change 
        R::store($upObj);
        sendResponse(array('status'=>'ok'));
    }else{
        sendError();
    }
}else if($_SERVER['REQUEST_METHOD']=='DELETE'){
    //delete a category if token and action are correct
    if($_SERVER['HTTP_ACTION']=='deleteCategory' && checkSession($_SERVER['HTTP_TOKEN'])){
        $dId = $_SERVER['HTTP_ID'];
        //find object
        $delObj = R::findOne('category','id = ?',[$dId]);
        //if found delete else send Error
        if(!empty($delObj)|| !is_null($delObj)){
            R::trash($delObj);
            sendResponse(array('status'=>'ok'));
        }else{
            sendError();
        }
    }else{
        sendError();
    }
}else{
    sendError();
}



?>