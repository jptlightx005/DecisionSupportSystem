<?php require_once('../../dss-base.php') ?>

<?php if($_SESSION['isLoggedIn']): ?>
	<?php startblock('main') ?>
	   	<?php if($_COOKIE['privilege_level'] == 0): ?>
	   		<script>
	   			showErrorMessage('Access denied', 'In order to have access to the data available here, you have to request access from the Administrator.');
	   		</script>
	   	<?php endif; ?>
	<?php endblock() ?>
<?php endif; ?>