<?php
require_once('db.php');

function getProfileByID($adminID){
	$result = selectFirstFromQuery('dss_accounts', 'UL_ID', $adminID);
	
	if(isset($result)){
		return response(1, "Profile successfully loaded", $result);
	}else{
		return response(0, "Admin ID Not Found!");
	}
}
?>