<!-- dss-base.php -->
<?php require_once('dss.php') ?>

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
		                <li <?= symptomIsActive() ?>><a href="symptoms">Symptoms</a></li>
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

				            <?php if($privilege_level == 0): ?>
						   		<script>
						   			showErrorMessage('Access denied', 'In order to have access to the data available here, you have to request access from the Administrator.');
						   		</script>
						   		<?php exit(); ?>
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