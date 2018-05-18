var token = "asdf";
var baseurl = "http://localhost/php";
//$(function(){
var allCategory= function(callback){
    $.ajax({
        type: 'GET',
        url: baseurl+"/category",
        dataType : "json",
        headers: {
            
        }
        }).done(function(data) { 
            callback(data);
    });
};

var  categoryByID=function(id, callback){
    $.ajax({
        type: 'GET',
        url: baseurl+"/category/"+id,
        headers: {
            
        }
        }).done(function(data) { 
            callback(data);
    });
};

var addCategory= function(token, name, callback){
    $.ajax({
        type: 'POST',
        url: baseurl+"/category",
        data: JSON.stringify({"name": name}),
        headers: {
            "token" : token,
            "content-type": "application/json"
        }
        }).done(function(data) { 
            callback(data);
    });
};

var editCategory = function(token, name, id, callback){
    $.ajax({
        type: 'PUT',
        url: baseurl+"/category/"+id,
        data: JSON.stringify({"name": name}),
        headers: {
            "token" : token,
            "content-type": "application/json"
        }
        }).done(function(data) { 
            callback(data);
    });
};

var deleteCategory = function(token,id,callback){
    $.ajax({
        type: 'DELETE',
        url: baseurl+"/category/"+id,
        headers: {
            "token": token
        }
        }).done(function(data) { 
            callback(data);
    });
};

//EO CATEGORY

var getUserByID= function(id, callback){
    $.ajax({
        type: 'GET',
        url: baseurl+"/user/"+id,
        headers: {
            
        }
        }).done(function(data) { 
            callback(data);
    });
};

var getUserByName= function(name, callback){
    $.ajax({
        type: 'GET',
        url: baseurl+"/user/name/"+name,
        headers: {
            
        }
        }).done(function(data) { 
            callback(data);
    });
}

var addUser= function(uname,pwd,description, callback){
    $.ajax({
        type: 'POST',
        url: baseurl+"/user",
        data: JSON.stringify({
            "uname": uname,
            "pwd": pwd,
            "description": description
        }),
        headers: {
            "content-type": "application/json"
        }
        }).done(function(data) { 
            callback(data);
    });
};

var editUser = function(token,id,oldpwd,newpwd,description, callback){
    $.ajax({
        type: 'PUT',
        url: baseurl+"/user/"+id,
        data: JSON.stringify({
            "pwd": newpwd,
            "description": description
        }),
        headers: {
            "token": token,
            "pwd": oldpwd,
            "content-type": "application/json"
        }
        }).done(function(data) { 
            callback(data);
    });
};

var deleteUser = function(token,id,pwd,callback){
    $.ajax({
        type: 'DELETE',
        url: baseurl+"/user/"+id,
        headers: {
            "token": token,
            "pwd": pwd,
            "content-type": "application/json"
        }
        }).done(function(data) { 
            callback(data);
    });
};

var getFullQuizzes = function(callback){
    $.ajax({
        type: 'GET',
        url: baseurl+"/quizFull",
        headers: {
        }
        }).done(function(data) { 
            callback(data);
    });
}

//});