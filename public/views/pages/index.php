<?php require_once('../dss-base.php') ?>

<?php if($_SESSION['isLoggedIn']): ?>
	<?php startblock('main') ?>
	   Test page
	<?php endblock() ?>
<?php else: ?>
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