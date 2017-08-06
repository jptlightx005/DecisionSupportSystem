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