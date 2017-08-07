<?php
require_once('db.php');

function getDiseaseList($search){
	global $conn;
	$query = "SELECT ID, name, diagnosis, treatment FROM dss_diseases WHERE is_removed = 0";
	if($search != ""){
		$query .= " AND (name LIKE '%$search%' OR diagnosis LIKE '%$search%' OR treatment LIKE '%$search%')";
	}
	return selectQuery($query);
}

function addNewDisease($post){
	global $conn;
	$field_names = "(";
	$field_values = "(";
	foreach($post as $key => $value){
		if($key != "action" &&
			$key != "symptom" &&
			$key != "medicine"){
				$newValue = addslashes($value);
				$field_names .= "`$key`, ";
				$field_values .= "'$newValue', ";
			}
	}

	$field_names = substr($field_names, 0, strlen($field_names) - 2) . ")";
	$field_values = substr($field_values, 0, strlen($field_values) - 2) . ")";
	
	$query = "INSERT INTO `dss_diseases` $field_names VALUES $field_values;";
	
	$disease_id = executeQueryGetInsertID($query);
	if($disease_id != 0){
		//IMPORTS SYMPTOMS FROM SYMPTOM DATABASE AND SAVES
		$symptomIDs = "";
		if(!empty($_POST["symptom"])){
			foreach($_POST["symptom"] as $symptomID)
				$symptomIDs .= "ID = $symptomID OR ";

			$symptomIDs = substr($symptomIDs, 0, strlen($symptomIDs) - 4);
		}
		
		$getSymptomsQuery = "SELECT * FROM dss_symptoms WHERE $symptomIDs";
		$selectedSymptoms = selectQuery($getSymptomsQuery);
		$symptomValues = "";
		foreach($selectedSymptoms as $dict){
			$symptomValues .= "({$dict['ID']}, '{$dict['name']}', $disease_id), ";
		}
		$symptomValues = substr($symptomValues, 0, strlen($symptomValues) - 2);
		$symptomQuery = "INSERT INTO dss_symptoms_used (SymptomID, symptom, DiseaseID) VALUES $symptomValues";
		if(!executeQuery($symptomQuery))
			return response(0, $symptomQuery);

		//IMPORTS MEDICINE FROM MEDICINE DATABASE AND SAVES
		$medicineIDs = "";
		if(!empty($_POST["medicine"])){	
			foreach($_POST["medicine"] as $medicineID)
				$medicineIDs .= "ID = $medicineID OR ";
		}
		$medicineIDs = substr($medicineIDs, 0, strlen($medicineIDs) - 4);
		$getMedicineQuery = "SELECT * FROM dss_medicine WHERE $medicineIDs";
		$selectedMedicine = selectQuery($getMedicineQuery);
		$medicineValues = "";
		foreach($selectedMedicine as $dict){
			$medicineValues .= "({$dict['ID']}, '{$dict['name']}', $disease_id), ";
		}
		$medicineValues = substr($medicineValues, 0, strlen($medicineValues) - 2);
		$medicineQuery = "INSERT INTO dss_medicine_used (MedicineID, medicine, DiseaseID) VALUES $medicineValues";
		if(!executeQuery($medicineQuery))
			return response(0, $medicineQuery);

		return response(1, "Successfully added disease!");
	}else{
		return response(0, "Operation failed!");
	}
}