<?php
require_once('../db.php');
require_once('../data/disease.php');

$symptoms = array();
if(isset($_GET['symptoms'])){
	$symptoms = $_GET['symptoms'];
}
$json = getDiseaseBySymptoms($symptoms);

/* Output header */
header('Content-type: application/json');
echo json_encode($json);