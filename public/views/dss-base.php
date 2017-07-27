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
		// New account
		if (!$ulogin->CreateUser( $_POST['usrn'],  $_POST['pssw']) ){
			$msg = 'account creation failure';
		}else{
			$msg = 'Account registered successfully';
		}
	}else if($action == LOG_IN){
		if (isset($_POST['nonce']) && ulNonce::Verify('login', $_POST['nonce'])){
			$_SESSION['appRememberMeRequested'] = true;
			$ulogin->Authenticate($_POST['usrn'],  $_POST['pssw']);
			if ($ulogin->IsAuthSuccess()){
				// Since we have specified callback functions to uLogin,
				// we don't have to do anything here.
				$msg = "Logged in successfully";
				setcookie('usrn', $_POST["usrn"], time() + 86400 * 5, "/");
			}
		}else{
			$msg = 'invalid nonce';
		}
	}else if($action == LOG_OUT){
		resetCookies();
		$msg = "Logged out successfully";
	}

	redirectToURL($msg, $site['root']);
	exit();
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

	    <script src="js/search.js"></script>
	    <script src="js/general.js"></script>

	    <script src="bootstrap/js/bootstrap.min.js"></script>
	    <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css" />
	    <link rel="stylesheet" type="text/css" href="css/sidebar.css" />
	    
	    <link rel="stylesheet" type="text/css" href="css/login.css" />
	    <!-- <link rel="stylesheet" type="text/css" href="css/search.css" /> -->
	</head>
	<body>
		<!-- TOP NAVBAR -->
		<nav class="navbar navbar-inverse navbar-static-top" style="margin-bottom: 0px;">
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
		                <li><a href="profile"><span class="glyphicon glyphicon-user"></span> Profile</a></li>
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
			<div id="wrapper" class="active">
				<!-- Sidebar -->
				    <!-- Sidebar -->
				<div id="sidebar-wrapper">
					<ul id="sidebar_menu" class="sidebar-nav">
				    	<li class="sidebar-brand"><a href="#" id="menu-toggle" onClick="toggleMenu()">Menu <span id="main_icon" class="glyphicon glyphicon-menu-hamburger"></a></li>
					</ul>
					<ul class="sidebar-nav" id="sidebar">     
					  	<li><a href="<?=  $site['root'] ?>">Cases</a></li>
		                <li><a href="patient">Patients</a></li>
		                <li><a href="symptoms">Symptoms</a></li>
		                <li><a href="medicine">Medicine</a></li>
		                <li><a href="disease">Diseases</a></li>
		                <li><a href="nurse">Nurses</a></li>
					</ul>
				</div>
				  
				<!-- Page content -->
				<div id="page-content-wrapper">
					<!-- Keep all page content within the page-content inset div! -->
					<div class="page-content inset">
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
							<input class="form-control" type="text" name="job" placeholder="Position" required />
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