<?php 
mysql_connect('localhost', 'root', 'root') or die(mysql_error());
mysql_select_db('db_quiz_vs') or die(mysql_error());
$result = mysql_query("SELECT * FROM category");
$row = mysql_fetch_array( $result );
echo "id: ".$row['id'];


?>