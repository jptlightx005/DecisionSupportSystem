<?php
//privilege levels:
// 3 - master account level
// 2 - doctor account level
// 1 - authorized nurse level
// 0 - no access

define('LIB_DIR', $_SERVER['DOCUMENT_ROOT'] . '/library/');
define('SIGN_UP', 'Sign up');
define('LOG_IN', 'Login');
define('LOG_OUT', 'logout');

require_once(LIB_DIR . 'dss/global.php');
require_once(LIB_DIR . 'dss/db.php');
require_once(LIB_DIR . 'phpti-0.9/ti.php');

require_once(LIB_DIR . 'dss/data/admin.php');
require_once(LIB_DIR . 'dss/data/patient.php');
require_once(LIB_DIR . 'dss/data/symptom.php');
require_once(LIB_DIR . 'dss/data/medicine.php');
require_once(LIB_DIR . 'dss/data/disease.php');
require_once(LIB_DIR . 'dss/data/case.php');

if (session_status() == PHP_SESSION_NONE) {
    session_start();
}

$site = array(
		'title' => 'Patient Record Management System',
		'subtitle' => 'with Electronic Prescription',
		'logo' => "assets/logo.png",
		'icon' => "assets/logo.ico",
		'root' => '/',
		'current_page' => $_SERVER['PHP_SELF']
	);

$action = isset($_REQUEST['action']) ? $_REQUEST['action'] : null;
$search_text = isset($_REQUEST['search_text']) ? $_REQUEST['search_text'] : null;
if(isset($action)){
	$ulogin = new uLogin('appLogin', 'appLoginFail');
	if($action == SIGN_UP){
		if($_POST['pssw'] == $_POST['conf_pssw']){
			// New account
			if (!$ulogin->CreateUser( $_POST['usrn'],  $_POST['pssw']) ){
				$msg = 'account creation failure';
			}else{
				$ulid = getULIDforUsrn($_POST['usrn']);
				if(isset($ulid)){
					$ulid = $ulid['id'];

					$field_names = "(`UL_ID`, ";
					$field_values = "('$ulid', ";
					foreach($_POST as $key => $value){
						if($key != "usrn" &&
						$key != "pssw" &&
						$key != "conf_pssw" &&
						$key != "action"){
							$newValue = addslashes($value);
							$field_names .= "`$key`, ";
							$field_values .= "'$newValue', ";
						}
					}

					$field_names = substr($field_names, 0, strlen($field_names) - 2) . ")";
					$field_values = substr($field_values, 0, strlen($field_values) - 2) . ")";
					
					$query = "INSERT INTO `dss_accounts` $field_names VALUES $field_values;";
					
					if(executeQuery($query)){
						$msg = 'Account registered successfully';
					}else{
						$msg = 'Account registration failed';
					}
				}else{
					$msg = 'account creation failure';
				}
				
			}
		}else{
			$msg = "Password didn't match";
		}
		$url = $_SERVER['REQUEST_URI'];

		redirectToURL("", $url, 0);
		exit();
	}else if($action == LOG_IN){
		// $loginsuccess = false;
		// if (isset($_POST['nonce']) && ulNonce::Verify('login', $_POST['nonce'])){
		// 	$_SESSION['appRememberMeRequested'] = true;
		// 	$ulogin->Authenticate($_POST['usrn'],  $_POST['pssw']);
		// 	if ($ulogin->IsAuthSuccess()){
		// 		// Since we have specified callback functions to uLogin,
		// 		// we don't have to do anything here.
		// 		$ulid = getULIDforUsrn($_POST['usrn']);
		// 		if(isset($ulid)){
		// 			$ulid = $ulid['id'];
		// 			$profile = selectFirstQuery("SELECT * FROM dss_accounts WHERE UL_ID = $ulid");

		// 			if(isset($profile)){
		// 				$msg = "Logged in successfully";
		// 				setcookie('adminID', $ulid, time() + 86400 * 5, "/");
		// 				setcookie('usrn', $_POST["usrn"], time() + 86400 * 5, "/");
		// 	            setcookie('first_name', $profile["first_name"], time() + 86400 * 5, "/");
		// 	            setcookie('middle_name', $profile["middle_name"], time() + 86400 * 5, "/");
		// 	            setcookie('last_name', $profile["last_name"], time() + 86400 * 5, "/");
		// 	            setcookie('privilege_level', $profile["privilege_level"], time() + 86400 * 5, "/");
		// 	            setcookie('job', $profile["job"], time() + 86400 * 5, "/");
		// 			}else{
		// 				$msg = "Logged in successfully, no Profile";
		// 				setcookie('adminID', $ulid, time() + 86400 * 5, "/");
		// 				setcookie('usrn', $_POST["usrn"], time() + 86400 * 5, "/");
		// 			}

		// 			$loginsuccess = true;
		// 		}else{
		// 			$msg = "Logging in failed, no ULID";
		// 		}
				
		// 	}else{
		// 		$msg = "Invalid username or password";
		// 	}
		// }else{
		// 	$msg = 'invalid nonce';
		// }
		// $url = $_SERVER['REQUEST_URI'];

		// // redirectToURL($msg, $url);
		// if($loginsuccess){
		// 	echo "<script>if(!alert('$msg')){window.location.href = '$url';}</script>";
		// 	exit();
		// }else{
		// 	echo "<script>alert('$msg')</script>";
		// }
	}else if($action == LOG_OUT){
		resetCookies();
		// $msg = "Logged out successfully";
		$url = $site['root'];

		redirectToURL("", $url, 0);
		exit();
	}
}

$_SESSION['isLoggedIn'] = isset($_COOKIE['usrn']);

$privilege_level = 0;
if($_SESSION['isLoggedIn']){
	if(isset($_COOKIE['privilege_level'])){
		$privilege_level = $_COOKIE['privilege_level'];
	}
}
?>