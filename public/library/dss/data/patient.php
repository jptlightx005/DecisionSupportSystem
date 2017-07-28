<?php
require_once('db.php');

function getPatientList(){
	global $conn;
	$query = "SELECT * FROM tbl_patients WHERE is_removed = 0";
	return selectFromQuery('dss_patients', 'is_removed', 0);
}

?>