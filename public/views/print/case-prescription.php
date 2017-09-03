<?php
	include_once('../dss.php');
	$case = getCaseInfo($_GET['id']);
	$medicine_list = getMedicineListForCase($_GET['id']);
?>

<html>
	<head>
		<style type="text/css" media="print">
			@page{
				size: auto;
				margin: 10mm;
			}
			html{
				background-color: #FFF;
				margin: 0px;
			}
			body{
				border: solid 1px white;
				margin: 5mm 15mm 5mm 15mm;
			}
		</style>
		<style type="text/css">

			span .label{
				color: #000;
				border: 0px;
			}
			span .detail{
				display: table-cell; border-bottom: 1px solid black;
			}

			h4 {
				text-indent: 20px;
			}
			p {
			    text-indent: 30px;
			    padding: 0px 20px;
			    text-align: justify;
			}

			#patient_picture {
				position:relative;
			}
			#patient_picture img{
				position: absolute;
				top: 10px;
				right: 10px;
			}
			.center-cropped {
			  object-fit: cover;
			  object-position: center; /* Center the image within the element */
			  height: 100px;
			  width: 85px;
			}
		</style>
		<script src="bootstrap/js/bootstrap.min.js"></script>
	    <script type="text/javascript" src="js/general.js"></script>
	    <script src="js/sidebar.js"></script>
	    <script src="js/search.js"></script>
	    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
	</head>
	<body>
		<h1><?php echo nl2br(returnFullNameFromObject($case), false); ?></h1>
		<h3>Prescription:</h3>
		<?php foreach ($medicine_list as $medicine): ?>
			<h4><?= $medicine['medicine'] ?></h4>
			<p><?= $medicine['dosage'] ?></p>
		<?php endforeach; ?>
	</body>
</html>