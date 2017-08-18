<?php
require_once('db.php');

function getMedicineList($search){
	global $conn;
	$query = "SELECT ID, name, generic_name, overview FROM dss_medicine WHERE is_removed = 0";
	if($search != ""){
		$query .= " AND (name LIKE '%$search%' OR generic_name LIKE '%$search%' ";
		$query .= " OR overview LIKE '%$search%')";
	}
	return selectQuery($query);
}

function getMedicineInfo($id){
	global $conn;
	return selectFirstFromQuery('dss_medicine', 'ID', $id);
}

function getMedicineListForCase($id){
	global $conn;

	$medQuery = "SELECT * FROM dss_medicine_used JOIN dss_medicine ON dss_medicine_used.MedicineID = dss_medicine.ID WHERE CaseID = $id";
	
	return selectQuery($medQuery);
}

function addNewMedicine($post){
	global $conn;
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
	
	$query = "INSERT INTO `dss_medicine` $field_names VALUES $field_values;";
	
	$stmt = $conn->prepare($query);
	if($stmt->execute()){
		return response(1, "Successfully added medicine!");
	}else{
		return response(0, "Operation failed!");
	}
}

function updateMedicine($post){
	global $conn;
	$setFieldValue = "";
	foreach($post as $key => $value){
		if($key != "action" &&
			$key != "medicine_id"){
				$newValue = addslashes($value);
				$setFieldValue .= "`$key` = '$newValue', ";
			}
	}
	$setFieldValue = substr($setFieldValue, 0, strlen($setFieldValue) - 2);

	$query = "UPDATE `dss_medicine` SET $setFieldValue WHERE `ID` = '{$post['medicine_id']}'";
	
	$stmt = $conn->prepare($query);
	if($stmt->execute()){
		return response(1, "Successfully updated medicine!");
	}else{
		return response(0, "Operation failed!");
	}
}

function removeMedicine($id){
	global $conn;

	executeQuery("UPDATE dss_medicine SET is_removed = 1 WHERE ID = $id");
	return response(1, "Successfully removed medicine!");
}