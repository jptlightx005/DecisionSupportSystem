<?php require_once('../dss-base.php') ?>

<style type="text/css">
	p{
		text-indent: 50px;
	}
</style>

<?php if($_SESSION['isLoggedIn']): ?>
	<?php startblock('main') ?>
	
		<h1><?= $site['title']; ?></h1>
		<h3><?= $site['subtitle']; ?></h3>

		<p>This system is used by Pototan Municipal Health Center to help Doctors manage patient's data and generate reports for each disease.</p>
	<?php endblock() ?>

<?php else: ?>
	<style type="text/css">
		.jumbotron{
			background-color: rgba(255, 255, 255, 0.5);
		}
		.container{
			background-color: rgba(255, 255, 255, 0.7);
			border-radius: 20px;
			padding: 20px;
		}
	</style>
	<div class="jumbotron text-center">
	    <h1><?= $site['title']; ?></h1>
	    <h3><?= $site['subtitle']; ?></h3> 
	</div>
	<div class="container">

		<p>This system is used by Pototan Municipal Health Center to help Doctors manage patient's data and generate reports for each disease.</p>
	</div>
<?php endif; ?>