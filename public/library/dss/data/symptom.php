<?php
require_once(DSS_LIBRARY . 'db.php');

function getSymptomList($search){
	global $conn;
	$query = "SELECT ID, name, description FROM dss_symptoms WHERE is_removed = 0";
	if($search != ""){
		$query .= " AND (name LIKE '%$search%'";
		$query .= " OR description LIKE '%$search%')";
	}
	$query .= " ORDER BY name ASC";
	return selectQuery($query);
}

function getSymptomInfo($id){
	global $conn;
	return selectFirstFromQuery('dss_symptoms', 'ID', $id);
}

function addNewSymptom($post){
	global $conn;
	$field_names = "(";
	$field_values = "(";
	foreach($post as $key => $value){
		if($key != "action"){
				$newValue = addslashes(trim($value));
				$field_names .= "`$key`, ";
				$field_values .= "'$newValue', ";
			}
	}

	$field_names = substr($field_names, 0, strlen($field_names) - 2) . ")";
	$field_values = substr($field_values, 0, strlen($field_values) - 2) . ")";
	
	$query = "INSERT INTO `dss_symptoms` $field_names VALUES $field_values;";
	
	$stmt = $conn->prepare($query);
	if($stmt->execute()){
		return response(1, "Successfully added symptom!");
	}else{
		return response(0, "Operation failed!");
	}
}

function updateSymptom($post){
	global $conn;
	$setFieldValue = "";
	foreach($post as $key => $value){
		if($key != "action" &&
			$key != "symptom_id"){
				$newValue = addslashes($value);
				$setFieldValue .= "`$key` = '$newValue', ";
			}
	}
	$setFieldValue = substr($setFieldValue, 0, strlen($setFieldValue) - 2);

	$query = "UPDATE `dss_symptoms` SET $setFieldValue WHERE `ID` = '{$post['symptom_id']}'";
	
	$stmt = $conn->prepare($query);
	if($stmt->execute()){
		return response(1, "Successfully updated symptom!");
	}else{
		return response(0, "Operation failed!");
	}
}

function removeSymptom($id){
	global $conn;

	executeQuery("UPDATE dss_symptoms SET is_removed = 1 WHERE ID = $id");
	return response(1, "Successfully removed Symptom!");
}
?>