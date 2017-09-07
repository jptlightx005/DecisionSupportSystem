<?php
require_once(DSS_LIBRARY . 'db.php');

function getCaseList($search){
	global $conn;
	$query = "SELECT dss_cases.ID, CaseID, dss_cases.PatientID, dss_cases.DiseaseID, dss_patients.first_name, dss_patients.middle_name, dss_patients.last_name, disease, diagnosis, treatment FROM dss_cases INNER JOIN dss_patients ON dss_cases.PatientID = dss_patients.ID WHERE dss_cases.is_removed = 0";
	if($search != ""){
		$query .= " AND ((first_name LIKE '%$search%' OR middle_name LIKE '%$search%' OR last_name LIKE '%$search%') OR disease LIKE '%$search%' OR diagnosis LIKE '%$search%' OR treatment LIKE '%$search%')";
	}
	return selectQuery($query);
}

function getCaseListByPatientID($id){
	global $conn;
	$query = "SELECT * FROM dss_cases WHERE PatientID = $id AND is_removed = 0";

	$cases = selectQuery($query);
	foreach($cases as $key => $field){
		$case = $cases[$key];
		
		$medQuery = "SELECT * FROM dss_medicine_used JOIN dss_medicine ON dss_medicine_used.MedicineID = dss_medicine.ID WHERE CaseID = {$case['ID']}";
		$medicineList = selectQuery($medQuery);
		$cases[$key]["prescription"] = $medicineList;
	}

	return $cases;
}

function getCaseInfo($id){
	global $conn;
	$query = "SELECT dss_cases.*,  dss_patients.first_name, dss_patients.middle_name, dss_patients.last_name FROM dss_cases INNER JOIN dss_patients ON dss_cases.PatientID = dss_patients.ID WHERE dss_cases.ID = $id";
	$case = selectFirstQuery($query);
	
	if(isset($case)){
		
		$sympQuery = "SELECT * FROM dss_symptoms_used JOIN dss_symptoms ON dss_symptoms_used.SymptomID = dss_symptoms.ID WHERE CaseID = $id";
		$symptomsList = selectQuery($sympQuery);

		$medQuery = "SELECT * FROM dss_medicine_used JOIN dss_medicine ON dss_medicine_used.MedicineID = dss_medicine.ID WHERE CaseID = $id";
		$medicineList = selectQuery($medQuery);

		$case["symptoms"] = $symptomsList;
		$case["prescription"] = $medicineList;
		
		return $case;
	}else{
		return response(0, "Case ID Not Found!");
	}
}

function addNewCase($post){
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
	
	$query = "INSERT INTO `dss_cases` $field_names VALUES $field_values;";

	$case_id = executeQueryGetInsertID($query);
	$case_uid = createUniqueIDUsingID($case_id);
	
	$query = "UPDATE `dss_cases` SET CaseID = 'C$case_uid' WHERE ID = $case_id";
	executeQuery($query);

	$query = "UPDATE `dss_patients` SET last_visit = CURRENT_TIMESTAMP WHERE ID = " . $post['PatientID'];
	executeQuery($query);

	if($case_id != 0){
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
				$symptomValues .= "({$dict['ID']}, '{$dict['name']}', $case_id), ";
			}
			$symptomValues = substr($symptomValues, 0, strlen($symptomValues) - 2);
			$symptomQuery = "INSERT INTO dss_symptoms_used (SymptomID, symptom, CaseID) VALUES $symptomValues";
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
				$medicineValues .= "({$dict['ID']}, '{$dict['name']}', $case_id), ";
			}
			$medicineValues = substr($medicineValues, 0, strlen($medicineValues) - 2);
			$medicineQuery = "INSERT INTO dss_medicine_used (MedicineID, medicine, CaseID) VALUES $medicineValues";
			if(!executeQuery($medicineQuery))
				return response(0, $medicineQuery);
		}

		return response(1, "Successfully added case!");
	}else{
		response(0, "Failed to add case");
	}
}

function removeCase($id){
	global $conn;

	executeQuery("UPDATE dss_cases SET is_removed = 1 WHERE ID = $id");
	return response(1, "Successfully removed Case!");
}



function getCaseByAge($fromdate, $todate){
	$query = "SELECT disease, age FROM dss_cases INNER JOIN dss_patients ON dss_cases.PatientID = dss_patients.ID WHERE dss_cases.is_removed = 0 AND case_date >= '$fromdate' AND case_date <= '$todate'";
	$cases = selectQuery($query);
	
	$caseDisease = array();
	foreach ($cases as $case) {
		$disease_name = strtolower($case['disease']);
		$caseDisease[$disease_name][] = $case;
	}
	
	foreach ($caseDisease as $key => $value) {

		$ageBrackets = array();
		$casesFiltered = array_filter($caseDisease[$key], "belowEighteen");
		$ageBrackets["below18"] = count($casesFiltered);

		$casesFiltered = array_filter($caseDisease[$key], "eighteenToThirty");
		$ageBrackets["18to30"] = count($casesFiltered);

		$casesFiltered = array_filter($caseDisease[$key], "thirtyOneToFifty");
		$ageBrackets["31to50"] = count($casesFiltered);

		$casesFiltered = array_filter($caseDisease[$key], "fiftyOneToSixtyFive");
		$ageBrackets["51to65"] = count($casesFiltered);

		$casesFiltered = array_filter($caseDisease[$key], "aboveSixtyFive");
		$ageBrackets["above65"] = count($casesFiltered);
		
		unset($caseDisease[$key]);
		$caseDisease[ucfirst($key)] = $ageBrackets;

	}
	return $caseDisease;
}

function getCaseByBrgy($fromdate, $todate){
	$query = "SELECT disease, brgy FROM dss_cases INNER JOIN dss_patients ON dss_cases.PatientID = dss_patients.ID WHERE dss_cases.is_removed = 0 AND CAST(case_date AS DATE) >= '$fromdate' AND CAST(case_date AS DATE) <= '$todate'";

	$cases = selectQuery($query);

	$brgyList = array();

	foreach($cases as $case){
		$brgy_name = strtolower($case['brgy']);
		$brgyList[$brgy_name][] = $case;
	}

	return $brgyList;
}

function belowEighteen($case){
    return  $case['age'] < 18;
}

function eighteenToThirty($case){
    return  $case['age'] >= 18 && $case['age'] <= 30;
}

function thirtyOneToFifty($case){
    return  $case['age'] >= 31 && $case['age'] <= 50;
}

function fiftyOneToSixtyFive($case){
    return  $case['age'] >= 51 && $case['age'] <= 65;
}

function aboveSixtyFive($case){
    return  $case['age'] > 65;
}