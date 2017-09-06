<?php
require_once(DSS_LIBRARY . '/db.php');

function getProfileByID($adminID){
	return selectFirstFromQuery('dss_accounts', 'UL_ID', $adminID);
}

function getNurseList($search){
	global $conn;
	$query = "SELECT ID, UL_ID, first_name, middle_name, last_name, job FROM dss_accounts WHERE privilege_level = 1";
	if($search != ""){
		$query .= " AND (first_name LIKE '%$search%' OR middle_name LIKE '%$search%' OR last_name LIKE '%$search%')";
	}
	return selectQuery($query);
}

function getAccountList(){
	global $conn;
	
	$query = "SELECT ID, UL_ID, first_name, middle_name, last_name, job FROM dss_accounts WHERE privilege_level = 0";
	return selectQuery($query);
}

function updateProfile($post){
	global $conn;
	$ulid = $post['UL_ID'];
	$query = "SELECT ID FROM dss_accounts WHERE UL_ID = $ulid";
	$account = selectFirstQuery($query);
	if(isset($account)){
		//update profile here
		$setFieldValue = "";
		foreach($post as $key => $value){
			if($key != "action"){
					$newValue = addslashes($value);
					$setFieldValue .= "`$key` = '$newValue', ";
				}
		}
		$setFieldValue = substr($setFieldValue, 0, strlen($setFieldValue) - 2);

		$accountid = $account['ID'];
		$query = "UPDATE `dss_accounts` SET $setFieldValue WHERE `ID` = '$accountid'";

		executeQuery($query);
		return response(1, "Succesfully Updated Profile");
	}else{
		//add new profile here
		$field_names = "(";
		$field_values = "(";
		foreach($post as $key => $value){
			if($key != "action"){
				$newValue = addslashes($value);
				$field_names .= "`$key`, ";
				$field_values .= "'$newValue', ";
			}
		}

		$field_names = substr($field_names, 0, strlen($field_names) - 2) . ")";
		$field_values = substr($field_values, 0, strlen($field_values) - 2) . ")";

		$query = "INSERT INTO `dss_accounts` $field_names VALUES $field_values;";
		executeQuery($query);
		return response(1, "Succesfully Added Profile");
	}
}

function setAsNurse($ulid){
	global $conn;

	executeQuery("UPDATE dss_accounts SET privilege_level = 1 WHERE UL_ID = $ulid");
	return response(1, "Successfully Added Nurse!");
}