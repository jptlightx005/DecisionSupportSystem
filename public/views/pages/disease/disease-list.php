<?php require_once('../../dss-base.php') ?>

<?php
    define('ADD_DISEASE', 'add_disease');
    define('DELETE_DISEASE', 'delete_disease');
?>

<?php if($_SESSION['isLoggedIn']): ?>
	<?php startblock('main') ?>
	   
	<?php endblock() ?>
<?php endif; ?>