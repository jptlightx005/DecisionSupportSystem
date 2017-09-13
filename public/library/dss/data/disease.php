<?php
require_once(DSS_LIBRARY . 'db.php');

function getDiseaseList($search){
	global $conn;
	$query = "SELECT ID, name, diagnosis, treatment FROM dss_diseases WHERE is_removed = 0";

	if($search != ""){
		$query .= " AND (name LIKE '%$search%' OR diagnosis LIKE '%$search%' OR treatment LIKE '%$search%')";

		$query .= " ORDER BY name ASC";
		$result = selectQuery($query);
		
		$symp_query = "SELECT ID FROM dss_symptoms WHERE is_removed = 0 AND (name LIKE '%$search%' OR description LIKE '%$search%')";

		$symptoms = selectQuery($symp_query);
		$subquery = "WHERE ";
		foreach($symptoms as $dict){
			$id = $dict['ID'];
			$subquery .= "SymptomID = $id OR ";
		}

		$diseases = array();
		if(count($symptoms) > 0){
			$subquery = substr($subquery, 0, strlen($subquery) - 4);
			$query = "SELECT * FROM dss_symptoms_used $subquery";
			
			$used_symptoms = selectQuery($query);

			$subquery = "WHERE ";

			foreach($used_symptoms as $dict){
				$id = $dict['DiseaseID'];
				if($id != 0){
					$subquery .= "ID = $id AND ";
				}
			}

			if(count($used_symptoms) > 0){
				$subquery = substr($subquery, 0, strlen($subquery) - 5);
				$query = "SELECT ID, name, diagnosis, treatment FROM dss_diseases $subquery";

				$diseases = selectQuery($query);
			}

			$result = array_unique(array_merge($result,$diseases), SORT_REGULAR);
		}
	}else{
		$query .= " ORDER BY name ASC";
		$result = selectQuery($query);
	}
	return $result;
}

function getDiseaseInfo($id){
	global $conn;
	$disease = selectFirstFromQuery('dss_diseases', 'ID', $id);

	$query = "SELECT * FROM dss_diseases WHERE ID = $id";
	$disease = selectFirstQuery($query);
	
	if(isset($disease)){
		
		$sympQuery = "SELECT * FROM dss_symptoms_used JOIN dss_symptoms ON dss_symptoms_used.SymptomID = dss_symptoms.ID WHERE DiseaseID = $id";
		$symptomsList = selectQuery($sympQuery);

		$medQuery = "SELECT * FROM dss_medicine_used JOIN dss_medicine ON dss_medicine_used.MedicineID = dss_medicine.ID WHERE DiseaseID = $id";
		$medicineList = selectQuery($medQuery);

		$disease["symptoms"] = $symptomsList;
		$disease["prescription"] = $medicineList;
		
		return $disease;
	}else{
		return response(0, "Case ID Not Found!");
	}
}

function getDiseaseBySymptoms($symptoms){
	global $conn;
	$subquery = "WHERE ";
	foreach($symptoms as $id){
		$subquery .= "SymptomID = $id OR ";
	}

	$diseases = array();
	if(count($symptoms) > 0){
		$subquery = substr($subquery, 0, strlen($subquery) - 4);
		$query = "SELECT * FROM dss_symptoms_used $subquery";

		$used_symptoms = selectQuery($query);

		$subquery = "WHERE ";

		foreach($used_symptoms as $dict){
			$id = $dict['DiseaseID'];
			if($id != 0){
				$subquery .= "ID = $id AND ";
			}
		}

		if(count($used_symptoms) > 0){
			$subquery = substr($subquery, 0, strlen($subquery) - 5);
			$query = "SELECT * FROM dss_diseases $subquery";

			$diseases = selectQuery($query);
		}
	}

	return $diseases;
}

function addNewDisease($post){
	global $conn;
	$field_names = "(";
	$field_values = "(";
	foreach($post as $key => $value){
		if($key != "action" &&
			$key != "symptom" &&
			$key != "medicine"){
				$newValue = addslashes(trim($value));
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
		if(!empty($_POST["symptom"])){
			$symptomIDs = "";
			foreach($_POST["symptom"] as $symptomID)
				$symptomIDs .= "ID = $symptomID OR ";

			$symptomIDs = substr($symptomIDs, 0, strlen($symptomIDs) - 4);

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
		}

		//IMPORTS MEDICINE FROM MEDICINE DATABASE AND SAVES
		if(!empty($_POST["medicine"])){	
			$medicineIDs = "";
			foreach($_POST["medicine"] as $medicineID)
				$medicineIDs .= "ID = $medicineID OR ";

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
		}
		

		return response(1, "Successfully added disease!");
	}else{
		return response(0, "Operation failed!");
	}
}

function removeDisease($id){
	global $conn;

	executeQuery("UPDATE dss_diseases SET is_removed = 1 WHERE ID = $id");
	return response(1, "Successfully removed Disease!");
}