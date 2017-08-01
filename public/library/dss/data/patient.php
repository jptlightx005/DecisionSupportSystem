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

function getPatientName($id){
	global $conn;
	$query = "SELECT ID, first_name, middle_name, last_name FROM dss_patients WHERE ID = $id";
	return selectFirstQuery($query);
}

function getPatientPicture($id){
	global $conn;
	return selectQuery("SELECT * FROM dss_uploads WHERE ID = $id AND type = 'patient_picture' AND is_removed = 0");
}

function getPatientEHR($id){
	global $conn;
	return selectQuery("SELECT * FROM dss_uploads WHERE PatientID = $id AND type = 'patient_ehr' AND is_removed = 0 ORDER BY date_uploaded DESC");
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

function changePicture($post, $file){
	global $conn;

	$file_name = "assets/placeholder.gif";
	$patient_id = $post['patient_id'];
	$patient = getPatientInfo($patient_id);
	
	$full_name = $patient["first_name"] . " " . $patient["last_name"];

	if($file["patient_picture"]["error"] != UPLOAD_ERR_NO_FILE){
		$current_picture = $patient['picture_id'];
		executeQuery("UPDATE `dss_uploads` SET is_removed = 1 WHERE ID = $current_picture AND PatientID = $patient_id");

		$subfile_name = replace_accents(friendly_url($full_name));
		$file_name = "{$post["patient_id"]}-$subfile_name.jpg";
		saveFile($file["patient_picture"], $file_name);
		$file_name = "uploads/$file_name";

		$query = "INSERT INTO `dss_uploads` (PatientID, url, type, date_uploaded) VALUES ($patient_id, '$file_name', 'patient_picture', CURRENT_TIMESTAMP)";
		$file_id = executeQueryGetInsertID($query);
		$query = "UPDATE `dss_patients` SET picture_id = $file_id WHERE ID = $patient_id";
		executeQuery($query);
	}

	return response(1, "Successfully Changed Picture!");
}

function addEHR($post, $file){
	global $conn;

	$ehr_file = $file["ehr_img"];
	$patient_id = $post['patient_id'];

	$patient_name = getPatientName($patient_id);
	
	$file_error = $ehr_file["error"];
	if($file_error != UPLOAD_ERR_NO_FILE){
		
		$full_name = $patient_name["first_name"] . " " . $patient_name["last_name"];
		$subfile_name = replace_accents(friendly_url($full_name));
		$query = "INSERT INTO dss_uploads (`PatientID`) VALUES ($patient_id)";
		$ehrid = executeQueryGetInsertID($query);
		$file_name = "$patient_id-$ehrid-$subfile_name-ehr.jpg";
		saveFile($ehr_file, $file_name);
		$file_name = "uploads/$file_name";

		$query = "UPDATE `dss_uploads` SET url = '$file_name', type = 'patient_ehr', date_uploaded = CURRENT_TIMESTAMP WHERE ID = $ehrid AND `PatientID` = $patient_id";
		executeQuery($query);
	}
	return response(1, "Successfully Uploaded EHR!");
}

function removePicture($id){
	global $conn;

	$picture_id = selectFirstQuery("SELECT picture_id FROM dss_patients WHERE ID = $id")['picture_id'];
	executeQuery("UPDATE dss_uploads SET is_removed = 1 WHERE ID = $picture_id AND PatientID = $id");

	executeQuery("UPDATE `dss_patients` SET picture_id = 0 WHERE ID = $id");
	return response(1, "Successfully removed picture!");
}

function removeEHR($id){
	global $conn;

	executeQuery("UPDATE dss_uploads SET is_removed = 1 WHERE ID = $id");
	return response(1, "Successfully removed EHR!");
}
?>