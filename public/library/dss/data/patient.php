<?php
require_once('db.php');

function getPatientList(){
	global $conn;
	$query = "SELECT ID, PatientID, first_name, middle_name, last_name, gender, address, last_visit FROM dss_patients WHERE is_removed = 0";
	return selectQuery($query);
}

function getPatientInfo($id){
	global $conn;
	return selectFirstFromQuery('dss_patients', 'ID', $id);
}

function getPatientLatestPicture($id){
	global $conn;
	return selectQuery("SELECT * FROM dss_uploads WHERE PatientID = $id AND type = 'patient_picture' ORDER BY date_uploaded DESC LIMIT 1");
}

function getPatientEHR($id){
	global $conn;
	return selectQuery("SELECT * FROM dss_uploads WHERE PatientID = $id AND type = 'patient_ehr' ORDER BY date_uploaded DESC");
}

function addNewPatient($post, $files){
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

    $field_names .= "`last_visit`)";
    $field_values .= "CURRENT_TIMESTAMP)";
	
	$query = "INSERT INTO `dss_patients` $field_names VALUES $field_values;";

	$patient_id = executeQueryGetInsertID($query);

	if($files["patient_picture"]["error"] != UPLOAD_ERR_NO_FILE){
		$full_name = $post["first_name"] . " " . $post["last_name"];
		$subfile_name = replace_accents(friendly_url($full_name));
		$file_name = "$patient_id-$subfile_name.jpg";
		saveFile($files["patient_picture"], $file_name);
		$file_name = "uploads/$file_name";

		$query = "INSERT INTO `dss_uploads` (PatientID, url, type, date_uploaded) VALUES ($patient_id, '$file_name', 'patient_picture', CURRENT_TIMESTAMP)";
		$file_id = executeQueryGetInsertID($query);
		$query = "UPDATE `dss_patients` SET picture_id = $file_id";
		executeQuery($query);
	}	

	$file_name = "assets/placeholder.gif";
	if(isset($files["ehr_img"])){
		$ehr_files = reArrayFiles($files["ehr_img"]);
		for ($i = 0; $i < count($ehr_files); $i++) {
			$file_error = $ehr_files[$i]["error"];
			if($file_error != UPLOAD_ERR_NO_FILE){
				$ehr_file = $ehr_files[$i];
				$full_name = $post["first_name"] . " " . $post["last_name"];
				$subfile_name = replace_accents(friendly_url($full_name));
				$query = "INSERT INTO dss_uploads (`PatientID`) VALUES ($patient_id)";
				$ehrid = executeQueryGetInsertID($query);
				$file_name = "$patient_id-$ehrid-$subfile_name-ehr.jpg";
				saveFile($ehr_file, $file_name);
				$file_name = "uploads/$file_name";

				$query = "UPDATE `dss_uploads` SET url = '$file_name', type = 'patient_ehr', date_uploaded = CURRENT_TIMESTAMP WHERE ID = $ehrid AND `PatientID` = $patient_id";
				executeQuery($query);
			}
		}
	}
	
	return response(1, "Successfully added patient!");
}
?>