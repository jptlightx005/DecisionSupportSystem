<?php
require_once('../db.php');
require_once('../data/admin.php');

$json = getProfileByID($_GET['id']);

/* Output header */
header('Content-type: application/json');
echo json_encode($json);