<?php
require_once($_SERVER['DOCUMENT_ROOT'] . '/library/ulogin/config/all.inc.php');
require_once($_SERVER['DOCUMENT_ROOT'] . '/library/ulogin/main.inc.php');
require_once($_SERVER['DOCUMENT_ROOT'] . '/library/dss/global.php');
date_default_timezone_set("Asia/Taipei");
$conn = new mysqli("localhost", "root", "", "decisionsupportsystemv2");    

if(mysqli_connect_errno()){
	printf("Connection failed: %s", mysqli_connect_error());
	exit();
}

function selectQuery($query){
	global $conn;
	$rows = [];
    
	$stmt = $conn->prepare($query);
	$stmt->execute();
	$result = $stmt->get_result();

	while($row = $result->fetch_assoc()){
		$rows[] = $row;
	}
	$stmt->close();
	return $rows;
}

function selectFirstQuery($query){
	$result = selectQuery($query);

	if(count($result) != 0)
		return $result[0];
	else
		return null;
}

function selectFromQuery($table, $field, $value){
	return selectQuery("SELECT * FROM $table WHERE `$field` = '$value'");
}

function selectFirstFromQuery($table, $field, $value){
	return selectFirstQuery("SELECT * FROM $table WHERE `$field` = '$value'");
}

function selectFromTable($table){
	return selectQuery("SELECT * FROM $table");
}
function executeQuery($query){
    global $conn;

    $stmt = $conn->prepare($query);
    return $stmt->execute();
}

function executeQueryGetInsertID($query){
    global $conn;

    $stmt = $conn->prepare($query);
    if($stmt->execute())
        return $stmt->insert_id;
    else
        return 0;
}

function getULIDforUsrn($usrn){
	return selectFirstQuery("SELECT id FROM ul_logins WHERE username = '$usrn'");
}

function returnMysqlEscapedString($str){
	global $conn;

	return returnBlankIfNull(mysqli_real_escape_string($conn, $str));
}
?>