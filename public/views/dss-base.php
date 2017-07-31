<!-- dss-base.php -->
<?php
//priviledge levels:
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

?>

<!DOCTYPE html>
<html>
	<head>
	    <title><?= $site['title'] ?></title>

	    <link rel="icon" type="image/png" href="<?= $site['logo'] ?>" />
	    
	    
		<script src="js/jquery.min.js"></script>
	    <script src="js/sidebar.js"></script>

	    <!-- <script src="js/search.js"></script> -->
	    <script src="js/generic.js"></script>

	    <script src="bootstrap/js/bootstrap.min.js"></script>
	    <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css" />
	    <link rel="stylesheet" type="text/css" href="css/sidebar.css" />
	    <link rel="stylesheet" type="text/css" href="css/generic.css" />
	    
	    <link rel="stylesheet" type="text/css" href="css/login.css" />
	    <!-- <link rel="stylesheet" type="text/css" href="css/search.css" /> -->
	</head>
	<body>
		<!-- TOP NAVBAR -->
		<nav class="navbar navbar-inverse navbar-fixed-top" style="margin-bottom: 0px;">
		    <div class="container-fluid">

		        <div class="navbar-header">
		            <a class="navbar-brand" href="#">DSS</a>
		        </div>
		        <ul class="nav navbar-nav">
		            <li <?= homeIsActive() ?>><a href="/">Home</a></li>
		            <li <?= aboutIsActive() ?>><a href="about">About</a></li>
		            <li <?= helpIsActive() ?>><a href="help">Help</a></li>
		        </ul>

		        <ul class="nav navbar-nav navbar-right">
		        	<?php if($_SESSION['isLoggedIn']): ?>
		                <li <?= profileIsActive() ?>><a href="profile"><span class="glyphicon glyphicon-user"></span> Profile</a></li>
		            <?php else: ?>
		                <li><a href="#" data-toggle="modal" data-target="#signup-modal"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
		            <?php endif; ?>
			      
		            <?php if($_SESSION['isLoggedIn']): ?>
		                <li><a href="?action=<?= LOG_OUT ?>">Logout</a></li>
		            <?php else: ?>
		            	<li><a href="#" data-toggle="modal" data-target="#login-modal"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
		            <?php endif; ?>
			    </ul>
		    </div>
		</nav>

		<?php if($_SESSION['isLoggedIn']): ?>
			<!-- Sidebar -->
			<div id="wrapper" class="active" style="margin-top: 50px;">
				<!-- Sidebar -->
				    <!-- Sidebar -->
				<div id="sidebar-wrapper">
					<ul id="sidebar_menu" class="sidebar-nav">
				    	<li class="sidebar-brand"><a href="#" id="menu-toggle" onClick="toggleMenu()">Menu <span id="main_icon" class="glyphicon glyphicon-menu-hamburger"></a></li>
					</ul>
					<ul class="sidebar-nav" id="sidebar">     
					  	<li <?= caseIsActive() ?>><a href="case">Cases</a></li>
		                <li <?= patientIsActive() ?>><a href="patient">Patients</a></li>
		                <li><a href="symptoms">Symptoms</a></li>
		                <li><a href="medicine">Medicine</a></li>
		                <li><a href="disease">Diseases</a></li>
		                <li><a href="nurse">Nurses</a></li>
					</ul>
				</div>
				  
				<!-- Page content -->
				<div id="page-content-wrapper">
					<!-- Keep all page content within the page-content inset div! -->
					<div class="page-content inset" style="margin-left: 10px; margin-right: 10px;">
						&nbsp;
						<div id="main">
							<div class="hidden alert alert-success" id="success_alert">
					          	<span id="title" style="font-weight:bold">Success!</span>: <span id="message">SUCCESS TEXT</span>
					        </div>

					        <div class="hidden alert alert-danger" id="fail_alert">
				              	<span id="title" style="font-weight:bold">Failed!</span>: <span id="message">ERROR TEXT</span>
				            </div>

				            <?php if($_COOKIE['privilege_level'] == 0): ?>
						   		<script>
						   			showErrorMessage('Access denied', 'In order to have access to the data available here, you have to request access from the Administrator.');
						   		</script>
						   	<?php endif; ?>
						</div>
						

						<?php startblock('main') ?>
						<?php endblock() ?>
					</div>
				</div>
		    </div>
		<?php else: ?>
			<!-- Login Modal -->
			<div class="modal fade" id="login-modal" tabindex="-1" role="dialog" aria-labelledby="Login " aria-hidden="true" style="display: none;">
                <div class="modal-dialog">
                    <div class="loginmodal-container">
                        <h1>Login to Your Account</h1><br>
                        <form id="login_form" method="post">
                        <input type="hidden" id="nonce" name="nonce" value="<?= ulNonce::Create('login') ?>">
                            <input type="text" name="usrn" placeholder="Username">
                            <input type="password" name="pssw" placeholder="Password">
                            <input type="submit" name="action" class="login loginmodal-submit" value="<?= LOG_IN ?>">
                        </form>

                        <div class="login-help">
                            <a href="#" data-toggle="modal" data-target="#signup-modal">Register</a> <!--- <a href="#">Forgot Password</a>//-->
                        </div>
                    </div>
                </div>
            </div>

	        <!-- Signup Modal -->
			<div class="modal fade" id="signup-modal" tabindex="-1" role="dialog" aria-labelledby="Signup " aria-hidden="true" style="display: none;">
                <div class="modal-dialog">
                    <div class="loginmodal-container">
                        <h1>Signup new account</h1><br>
                        <form id="signup_form" method="post">
							<input class="form-control" type="text" name="usrn" placeholder="Username" required />
							<input class="form-control" type="password" name="pssw" placeholder="Password" required />
							<input class="form-control" type="password" name="conf_pssw" placeholder="Confirm Password" required />
							<input class="form-control" type="text" name="email" placeholder="Email" required />
							<br>
							<input class="form-control" type="text" name="first_name" placeholder="First Name" required />
							<input class="form-control" type="text" name="middle_name" placeholder="Middle Name" />
							<input class="form-control" type="text" name="last_name" placeholder="Last Name" required />
							<input class="form-control" type="text" name="job" placeholder="Position" />
							<input type="submit" name="action" class="login loginmodal-submit" value="<?= SIGN_UP ?>" />
                        </form>

                        <div class="login-help">
                            
                        </div>
                    </div>
                </div>
            </div>
		<?php endif; ?>
	</body>
</html>