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
		'title' => 'Decision Support System',
		'subtitle' => 'Patient Diagnosis and Prescription',
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
					$email = returnMysqlEscapedString($_POST['email']);
					$first_name = returnMysqlEscapedString($_POST['first_name']);
					$last_name = returnMysqlEscapedString($_POST['last_name']);
					$job = returnMysqlEscapedString($_POST['job']);
					$query = "INSERT INTO dss_accounts(UL_ID, email, first_name, last_name, job) VALUES ($ulid, '$email', '$first_name', '$last_name', '$job')";
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

		redirectToURL($msg, $url);
		exit();
	}else if($action == LOG_IN){
		if (isset($_POST['nonce']) && ulNonce::Verify('login', $_POST['nonce'])){
			$_SESSION['appRememberMeRequested'] = true;
			$ulogin->Authenticate($_POST['usrn'],  $_POST['pssw']);
			if ($ulogin->IsAuthSuccess()){
				// Since we have specified callback functions to uLogin,
				// we don't have to do anything here.
				$ulid = getULIDforUsrn($_POST['usrn']);
				if(isset($ulid)){
					$ulid = $ulid['id'];
					$profile = selectFirstQuery("SELECT * FROM dss_accounts WHERE UL_ID = $ulid");

					if(isset($profile)){
						$msg = "Logged in successfully";
						setcookie('adminID', $ulid, time() + 86400 * 5, "/");
						setcookie('usrn', $_POST["usrn"], time() + 86400 * 5, "/");
			            setcookie('first_name', $profile["first_name"], time() + 86400 * 5, "/");
			            setcookie('middle_name', $profile["middle_name"], time() + 86400 * 5, "/");
			            setcookie('last_name', $profile["last_name"], time() + 86400 * 5, "/");
			            setcookie('privilege_level', $profile["privilege_level"], time() + 86400 * 5, "/");
			            setcookie('job', $profile["job"], time() + 86400 * 5, "/");
					}else{
						$msg = "Logged in successfully, no Profile";
						setcookie('adminID', $ulid, time() + 86400 * 5, "/");
						setcookie('usrn', $_POST["usrn"], time() + 86400 * 5, "/");
					}
				}else{
					$msg = "Logging in failed, no ULID";
				}
				
			}else{
				$msg = "Invalid username or password";
			}
		}else{
			$msg = 'invalid nonce';
		}
		$url = $_SERVER['REQUEST_URI'];

		redirectToURL($msg, $url);
		exit();
	}else if($action == LOG_OUT){
		resetCookies();
		$msg = "Logged out successfully";
		$url = $site['root'];

		redirectToURL($msg, $url);
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