<?php
require_once('db.php');

function getProfileByID($adminID){
	$result = selectFromQuery('dss_accounts', 'UL_ID', $adminID);
	
	if(count($result) > 0){
		return response(1, "Profile successfully loaded", $result[0]);
	}else{
		return response(0, "Admin ID Not Found!");
	}
}
?>