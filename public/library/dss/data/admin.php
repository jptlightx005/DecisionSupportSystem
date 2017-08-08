<?php
require_once('db.php');

function getProfileByID($adminID){
	$result = selectFirstFromQuery('dss_accounts', 'UL_ID', $adminID);
	
	if(isset($result)){
		return response(1, "Profile successfully loaded", $result);
	}else{
		return response(0, "Admin ID Not Found!");
	}
}

function getNurseList($search){
	global $conn;
	$query = "SELECT ID, UL_ID, first_name, middle_name, last_name, job FROM dss_accounts WHERE privilege_level = 1";
	if($search != ""){
		$query .= " AND ((first_name LIKE '%$search%' OR middle_name LIKE '%$search%' OR last_name LIKE '%$search%') OR disease LIKE '%$search%' OR diagnosis LIKE '%$search%' OR treatment LIKE '%$search%')";
	}
	return selectQuery($query);
}

function getAccountList(){
	global $conn;
	
	$query = "SELECT ID, UL_ID, first_name, middle_name, last_name, job FROM dss_accounts WHERE privilege_level = 0";
	return selectQuery($query);
}