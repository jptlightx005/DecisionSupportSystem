<?php
require_once(DSS_LIBRARY . '/db.php');

function getProfileByID($adminID){
	return selectFirstFromQuery('dss_accounts', 'UL_ID', $adminID);
}

function getUsernameByID($adminID){
	return selectFirstFromQuery('ul_logins', 'id', $adminID)['username'];
}

function getNurseList($search){
	global $conn;
	$query = "SELECT ID, UL_ID, first_name, middle_name, last_name, job FROM dss_accounts WHERE privilege_level = 1";
	if($search != ""){
		$query .= " AND (first_name LIKE '%$search%' OR middle_name LIKE '%$search%' OR last_name LIKE '%$search%')";
	}
	return selectQuery($query);
}

function getAccountList(){
	global $conn;
	
	$query = "SELECT ID, UL_ID, first_name, middle_name, last_name, job FROM dss_accounts WHERE privilege_level = 0";
	return selectQuery($query);
}

function updateProfile($post){
	global $conn;
	$ulid = $post['UL_ID'];
	$query = "SELECT ID FROM dss_accounts WHERE UL_ID = $ulid";
	$account = selectFirstQuery($query);
	if(isset($account)){
		//update profile here
		$setFieldValue = "";
		foreach($post as $key => $value){
			if($key != "action"){
					$newValue = addslashes($value);
					$setFieldValue .= "`$key` = '$newValue', ";
				}
		}
		$setFieldValue = substr($setFieldValue, 0, strlen($setFieldValue) - 2);

		$accountid = $account['ID'];
		$query = "UPDATE `dss_accounts` SET $setFieldValue WHERE `ID` = '$accountid'";

		executeQuery($query);
		return response(1, "Succesfully Updated Profile");
	}else{
		//add new profile here
		$field_names = "(";
		$field_values = "(";
		foreach($post as $key => $value){
			if($key != "action"){
				$newValue = addslashes($value);
				$field_names .= "`$key`, ";
				$field_values .= "'$newValue', ";
			}
		}

		$field_names = substr($field_names, 0, strlen($field_names) - 2) . ")";
		$field_values = substr($field_values, 0, strlen($field_values) - 2) . ")";

		$query = "INSERT INTO `dss_accounts` $field_names VALUES $field_values;";
		executeQuery($query);
		return response(1, "Succesfully Added Profile");
	}
}

function updateUsername($post){
	$ulogin = new uLogin('appLogin', 'appLoginFail');
	$loginsuccess = false;
	if (isset($post['nonce']) && ulNonce::Verify('login', $post['nonce'])){
		$_SESSION['appRememberMeRequested'] = true;
		$ulogin->Authenticate($post['old_usrn'],  $post['pssw']);
		if ($ulogin->IsAuthSuccess()){
			// Since we have specified callback functions to uLogin,
			// we don't have to do anything here.
			$ulid = getULIDforUsrn($post['old_usrn']);
			if(isset($ulid)){
				$ulid = $ulid['id'];
				$newusrn = $post['new_usrn'];
				executeQuery("UPDATE ul_logins SET username = '$newusrn' WHERE id = $ulid");

				$profile = selectFirstQuery("SELECT * FROM dss_accounts WHERE UL_ID = $ulid");

				if(isset($profile)){
					// $msg = "Logged in successfully!";
					setcookie('adminID', $ulid, time() + 86400 * 5, "/");
					setcookie('usrn', $newusrn, time() + 86400 * 5, "/");
		            setcookie('first_name', $profile["first_name"], time() + 86400 * 5, "/");
		            setcookie('middle_name', $profile["middle_name"], time() + 86400 * 5, "/");
		            setcookie('last_name', $profile["last_name"], time() + 86400 * 5, "/");
		            setcookie('privilege_level', $profile["privilege_level"], time() + 86400 * 5, "/");
		            setcookie('job', $profile["job"], time() + 86400 * 5, "/");
				}else{
					// $msg = "Logged in successfully, no Profile";
					setcookie('adminID', $ulid, time() + 86400 * 5, "/");
					setcookie('usrn', $newusrn, time() + 86400 * 5, "/");
				}

				$loginsuccess = true;
				return response(1, "Succesfully Updated Username");
			}else{
				$msg = "Logging in failed, no ULID";
			}
		}else{
			$msg = "Invalid username or password";
		}
	}else{
		$msg = 'invalid nonce';
	}
	return response(0, $msg);
}

function updatePassword($post){
	$ulogin = new uLogin('appLogin', 'appLoginFail');
	$loginsuccess = false;
	if (isset($post['nonce']) && ulNonce::Verify('login', $post['nonce'])){
		$_SESSION['appRememberMeRequested'] = true;
		$ulogin->Authenticate($post['usrn'],  $post['old_pssw']);
		if ($ulogin->IsAuthSuccess()){
			// Since we have specified callback functions to uLogin,
			// we don't have to do anything here.
			$ulid = getULIDforUsrn($post['usrn']);
			if(isset($ulid)){
				$ulid = $ulid['id'];
				if($post['new_pssw'] == $post['conf_pssw']){
					$ulogin->SetPassword($ulid, $post['new_pssw']);
					return response(1, "Succesfully Updated Password");
				}else{
					$msg = "New Password and Confirm Password is not the same!";
				}

				$loginsuccess = true;
			}else{
				$msg = "Logging in failed, no ULID";
			}
		}else{
			$msg = "Invalid username or password";
		}
	}else{
		$msg = 'invalid nonce';
	}
	return response(0, $msg);
}
function setAsNurse($ulid){
	global $conn;

	executeQuery("UPDATE dss_accounts SET privilege_level = 1 WHERE UL_ID = $ulid");
	return response(1, "Successfully Added Nurse!");
}