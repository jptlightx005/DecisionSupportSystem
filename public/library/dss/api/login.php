<?php
require_once('../db.php');
require_once('../global.php');

$loginsuccess = false;
$user_info = array();
$newnonce = "";
$ulogin = new uLogin('appLogin', 'appLoginFail');
if (isset($_POST['nonce']) && ulNonce::Verify('login', $_POST['nonce'])) {
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

	            $user_info = array('adminID' => $ulid,
	            					'usrn' => $_POST["usrn"],
	            					'first_name' => $profile["first_name"],
	            					'middle_name' => $profile["middle_name"],
	            					'last_name' => $profile["last_name"],
	            					'privilege_level' => $profile["privilege_level"],
	            					'job' => $profile["job"]
	            					);
			}else{
				$msg = "Logged in successfully, no Profile";
				setcookie('adminID', $ulid, time() + 86400 * 5, "/");
				setcookie('usrn', $_POST["usrn"], time() + 86400 * 5, "/");
				$user_info = array('adminID' => $ulid,
	            					'usrn' => $_POST["usrn"],
	            					'first_name' => "",
	            					'middle_name' => "",
	            					'last_name' => "",
	            					'privilege_level' => "",
	            					'job' => ""
	            					);
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
// $url = $_SERVER['REQUEST_URI'];

// redirectToURL($msg, $url);
// if($loginsuccess){
// 	// echo "<script>if(!alert('$msg')){window.location.href = '$url';}</script>";
// 	return $profile;
// 	// exit();
// }else{
// 	echo "<script>alert('$msg')</script>";
// }

if(!$loginsuccess){
	$newnonce = ulNonce::Create('login');
}
$json = array("status" => $loginsuccess,
				"message" => $msg,
				"url" => $_POST['currentpage'],
				"nonce" => $newnonce);

/* Output header */
header('Content-type: application/json');
echo json_encode($json);