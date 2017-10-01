<!-- dss-base.php -->
<?php require_once('dss.php') ?>

<!DOCTYPE html>
<html>
	<head>
	    <title><?= $site['title'] ?></title>
	    <!-- <link rel="icon" type="image/png" href="<?= $site['logo'] ?>" /> -->
	    
	    <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css" />
	    <link rel="stylesheet" type="text/css" href="css/sidebar.css" />
	    <link rel="stylesheet" type="text/css" href="css/generic.css" />
	    <link rel="stylesheet" type="text/css" href="css/login.css" />
	    <link rel="stylesheet" type="text/css" href="css/search.css" />

		<script src="js/jquery.min.js"></script>
	    <script src="bootstrap/js/bootstrap.min.js"></script>

	    <script src="js/sidebar.js"></script>
		<script src="js/generic.js"></script>
	    <script src="js/waiting.js"></script>
	</head>
	<body>
		<!-- TOP NAVBAR -->
		<nav class="navbar navbar-inverse navbar-fixed-top" style="margin-bottom: 0px;">
		    <div class="container-fluid">

		        <div class="navbar-header">
		            <a class="navbar-brand" href="#">PRMS</a>
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
		                <li <?= medicineIsActive() ?>><a href="medicine">Medicine</a></li>
		                <li <?= diseaseIsActive() ?>><a href="disease">Diseases</a></li>
						<?php if(isset($_COOKIE['privilege_level'] )): ?>
							<?php if($_COOKIE['privilege_level'] != 0 && $_COOKIE['privilege_level'] != 1): ?>
							<li <?= nurseIsActive() ?>><a href="nurse">Nurses</a></li>
							<?php endif; ?>
						<?php endif; ?>
					</ul>
				</div>
				  
				<!-- Page content -->
				<div id="page-content-wrapper">
					<!-- Keep all page content within the page-content inset div! -->
					<div class="page-content inset" style="margin-left: 10px; margin-right: 10px;">
						&nbsp;
						<div id="main">
						<?php if(!allowedPageForAll() && ($privilege_level != 0)): ?>
							<div class="row" style="margin-bottom: 10px;">
				                <div class="col-sm-6 col-sm-offset-3">
				                    <div id="imaginary_container"> 
				                        <form class="input-group stylish-input-group">
				                            <input type="text" class="form-control" name="search_text" value="<?= $search_text; ?>" required>
				                            <span class="input-group-addon">
				                                <button type="submit">
				                                    <span class="glyphicon glyphicon-search"></span>
				                                </button>  
				                            </span>
				                        </form>
				                    </div>
				                </div>
				            </div>
				            <?php endif; ?>
				            <div class="row">
					            <div class="hidden alert alert-success" id="success_alert">
						          	<span id="title" style="font-weight:bold">Success!</span>: <span id="message">SUCCESS TEXT</span>
						        </div>

						        <div class="hidden alert alert-danger" id="fail_alert">
					              	<span id="title" style="font-weight:bold">Failed!</span>: <span id="message">ERROR TEXT</span>
					            </div>

					            <?php if($privilege_level == 0): ?>
					            	<?php if(!allowedPageForAll()): ?>
					            		<script>
								   			showErrorMessage('Access denied', 'In order to have access to the data available here, you have to request access from the Administrator.');
								   		</script>
							   		<?php exit(); ?>
					            	<?php endif; ?>
							   	<?php endif; ?>
				            </div>
							
						</div>
						

						<?php startblock('main') ?>
						<?php endblock() ?>

						<?php startblock('modals') ?>
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
                        	<input type="hidden" id="currentpage" name="currentpage" value="<?= $_SERVER['REQUEST_URI'] ?>">
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

            <div id="signup-modal" class="modal fade" role="dialog">
		        <div class="modal-dialog">

		            <!-- Modal content-->
		            <form class="modal-content" method="post">
		                <div class="modal-header">
		                    <button type="button" class="close" data-dismiss="modal">&times;</button>
		                    <h4 class="modal-title">Sign Up</h4>
		                </div>
		                <div class="modal-body">
							<label>Username</label>
		                	<input class="form-control" type="text" name="usrn" placeholder="Username" required />
		                	<label>Password</label>
							<input class="form-control" type="password" name="pssw" placeholder="Password" required />
							<label>Confirm Password</label>
							<input class="form-control" type="password" name="conf_pssw" placeholder="Confirm Password" required />
							<br>
							<label>First Name:</label>
						    <input class="form-control" type="text" name="first_name" placeholder="First Name" required />
		                    <label>Middle Name:</label>
						    <input class="form-control" type="text" name="middle_name" placeholder="Middle Name" required />
							<label>Last Name:</label>
						    <input class="form-control" type="text" name="last_name" placeholder="Last Name" required />

		                    <label>Gender:</label><br/>
		                    <select class="form-control" name="gender" required>
		                        <option disabled selected value>Select Gender</option>
		                        <option value='Male'>Male</option>
		                        <option value='Female'>Female</option>
		                    </select>

		                    <label>Email:</label>
						    <input class="form-control" type="email" name="email" placeholder="Email" required />

							<label>Date of Birth:</label>
		                    <input class="form-control" type='date' name='date_of_birth' placeholder="Date of Birth" required />

		                    <label>Job:</label>
		                    <input class="form-control" type="text" name="job" placeholder="Job" required />
							<label>Address:</label>
		                    <input class="form-control" type="text" name="address" placeholder="Address" />
		                    <label>Contact No:</label>
		                    <input class="form-control" type="text" name="contact_no" placeholder="Contact No" />

		                </div>
		                <div class="modal-footer">
		                    <button type="submit" name="action" value="<?= SIGN_UP ?>" class="btn btn-default">Submit</button>
		                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		                </div>
		            </form>

		        </div>
		    </div>
		<?php endif; ?>
	</body>
</html>

<script>
	$(document).ready(function() {
		$('#login_form').submit(function(e) {
			waitingDialog.show();
		    e.preventDefault();
		    $.ajax({
				type: "POST",
				url: '/api/login',
				data: $(this).serialize(),
				success: function(data){
					console.log(data);
					if(!alert(data.message)){
						if(data.status){
							window.location.href = data.url;
						}else{
							$('#nonce').val(data.nonce);
						}
						waitingDialog.hide();
		    		}
				}
		   	});
		});
	});

	$(".clear-form-button").click(function(){
	    document.getElementById('case_form').reset();
	});
</script>