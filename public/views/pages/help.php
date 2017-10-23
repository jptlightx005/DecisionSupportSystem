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

		<p>The Doctor can start organizing data by providing symptom and medicine data for the Disease.</p>

		<ol>
			<li>Start Adding Symptoms details in the <a href="symptoms">Symptoms Page</a></li>
			<li>Add medicine details in the <a href="medicine">Medicine Page</a></li>
			<li>Add disease by specifying the name of Disease, its symptoms, medicine to intake, diagnosis and how to take the medicine in <a href="disease">Disease Page</a></li>
			<li>Add patient information in <a href="patient">Patient Page</a></li>
			<li>Add cases in <a href="case">Case Page</a></li>
		</ol>

		<p>The Doctor can also share the information to the registered Nurses.</p>
		<ol>
			<li>Have the nurse signed up in the system through the <a href="/?action=logout">Sign-up Page</a> (You need to be logged out)</li>
			<li>Assign the new account as Nurse in <a href="nurse">Nurse Page</a></li>
		</ol>

	<?php endblock() ?>
<?php endif; ?>