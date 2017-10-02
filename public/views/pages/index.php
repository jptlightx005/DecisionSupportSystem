<?php require_once('../dss-base.php') ?>

<?php if($_SESSION['isLoggedIn']): ?>
	<style type="text/css">
		body {
		    background-image: url("assets/55398920.jpg-vector-medical-health-care.jpg");
		    background-color: #cccccc;
		}
		#text-box{
			background-color: rgba(255, 255, 255, 0.7);
			padding: 5px;
			text-align: center;
			border-radius: 20px;
		}
	</style>
	<?php if(!isset($_COOKIE['job'])) exit(); ?>
	<?php startblock('main') ?>
		<div id="text-box">
			<h1>Welcome, <?= $_COOKIE['job']. " " . returnAdminFullName(); ?>!</h1>
	   		<p>Please select an operation from the left panel.
		</div>
	<?php endblock() ?>
<?php else: ?>
	<style type="text/css">
		body {
		    background-image: url("assets/76150599-abstract-health-care-medical.jpg");
		    background-color: #cccccc;
		}
		.jumbotron{
			background-color: rgba(255, 255, 255, 0.5);
		}
		.container{
			background-color: rgba(255, 255, 255, 0.7);
			border-radius: 20px;
			padding: 20px;
		}
	</style>
	<!-- Login -->
	<div class="jumbotron text-center">
	    <h1><?= $site['title']; ?></h1>
	    <h3><?= $site['subtitle']; ?></h3> 
	</div>

	<div class="container">
	    <div class="row">
	        <div class="col-sm-12">
	            <center>
	                <h3>Log in to use the system</h3>
	                <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#login-modal">Log-in</button>
	            </center>

	           

	        </div>
	    </div>
	</div>
<?php endif; ?>