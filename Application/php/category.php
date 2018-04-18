<?php
header('Content-Type: application/json');

if($_SERVER['REQUEST_METHOD']=='GET'){
    if($_SERVER['HTTP_ACTION']=='getAllCategories'){
        
    }else if($_SERVER['HTTP_ACTION']=='getCategory'){

    }
}else if($_SERVER['REQUEST_METHOD']=='POST'){
    if($_SERVER['HTTP_ACTION']=='addCategory'){
        
    }
}else if($_SERVER['REQUEST_METHOD']=='PUT'){
    if($_SERVER['HTTP_ACTION']=='updateCategory'){
        
    }
}else if($_SERVER['REQUEST_METHOD']=='DELETE'){
    if($_SERVER['HTTP_ACTION']=='deleteCategory'){
        
    }
}else{

}

function sendResponse($dat){
    echo json_encode($dat);
}

?>