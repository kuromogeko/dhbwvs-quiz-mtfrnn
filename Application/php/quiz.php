<?php
/**
 * Created by PhpStorm.
 * Author: Florian Riedlinger
 * Date: 24.04.2018
 * Time: 08:51
 */

//GET Methods
if($_SERVER['REQUEST_METHOD'] == 'GET') {
    //Find all the quiz entities and return them assort by ID
    if ($_SERVER['HTTP_ACTION'] == 'list') {
        $quiz = R::findAll('Quiz', 'order by id ASC');
        if (!empty($quiz) || !is_null($quiz)) {
            http_response_code(200);
            sendResponse($quiz);
        } else {
            sendError();
        }
    } //Find a specific quiz by id
    else if ($_SERVER['HTTP_ACTION'] == 'entry') {
        $quizID = $_SERVER['HTTP_ID'];
        $quiz = R::findOne('Quiz', 'ID =?', [$quizID]);
        if (!empty($quiz) || !is_null($quiz)) {
            http_response_code(200);
            sendResponse($quiz);
        } else {
            sendError();
        }
    } //
    else if ($_SERVER['HTTP_ACTION'] = 'fullQuiz') {
        //Get Quiz ID for further use
        $quizID = $_SERVER['HTTP_ID'];

        /*TODO: Unfinished
        *$quizData = R::findAll('Quiz');
        *$questionData = R::findAll('Question');
        *$answerData = R::findAll('Answer', 'Question_id = ?', []);
        *$allQuizEntries;
        */
    }
}
//POST Methods
else if($_SERVER['REQUEST_METHOD'] = 'POST') {
    //Add a new quiz and store it in the Quiz table.
    if($_SERVER['HTTP_ACTION'] = 'addQuiz' && checkSession($_SERVER['HTTP_TOKEN'])) {
        $req = json_decode(file_get_contents('php://input'));

        $newQuiz = R::dispense('Quiz');
        $newQuiz->name = $req->name;
        $newQuiz->description = $req->description;
        $newQuiz->user_id = $req->user_id;
        $newQuiz->category = $req->category;
        $newID = R::store($newQuiz);

        http_response_code(200);
        sendResponse(array('status' => 'ok', 'id' => $newID));
    }
    else {
        sendError();
    }
}
//PUT Methods
else if($_SERVER['REQUEST_METHOD'] == 'PUT') {
    //Update quiz element
    if($_SERVER['HTTP_ACTION'] = 'updateQuiz' && checkSession($_SERVER['HTTP_TOKEN'])) {
        //Get request body
        $req = json_decode(file_get_contents('php://input'));
        //Assign ID to Quiz object
        $req->id = $_SERVER['HTTP_ID'];
        //Find Object by ID in database
        $upObj = R::findOne('Quiz', 'id = ?', [$req->id]);
        //Change properties
        $upObj->name = $req->name;
        $upObj->description = $req->description;
        $upObj->user_id = $req->user_id;
        $upObj->category = $req->category;
        //Commit change of properties to database
        R::store($upObj);
        //Send response to JS on HTML page.
        sendResponse(array('status' => 'ok'));
    }
    else {
        sendError();
    }
}
else if($_SERVER['REQUEST_METHOD'] == 'DELETE') {
    if($_SERVER['HTTP_ACTION'] == 'deleteQuiz' && checkSession($_SERVER['HTTP_TOKEN'])) {
        $dID = $_SERVER['HTTP_ID'];
        $delObj = R::findOne('Question', 'id = ?', [$dID]);
        //Find all answers for the selected Question ID, if any are present
        $answer = R::findAll('Answer', 'Question_id = ?', [$dID]);

        if((!empty($delObj) || !is_null($delObj))
            && (empty($answer) || is_null($answer))) {
            R::trash($delObj);
            http_response_code(200);
            sendResponse(array('status' => 'ok'));
        }
        else {
            sendError();
        }
    }
}

?>