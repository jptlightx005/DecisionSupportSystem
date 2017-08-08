<?php
require_once('../db.php');
require_once('../data/disease.php');

$json = getDiseaseInfo($_GET['id']);

/* Output header */
header('Content-type: application/json');
echo json_encode($json);