<?php
	include_once('../dss.php');

	$disease = getDiseaseInfo($_GET['id']);
?>

<html>
	<head>
		<style type="text/css" media="print">
			@page{
				size: auto;
				margin: 0mm;
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
		<!-- <header>
			<div id="heading">
				<center>Republic of the Philippines</center>
				<center>Province of Iloilo</center>
				<center>ILOILO PROVINCIAL HOSPITAL</center>
				<center>Pototan, Iloilo</center>
			</div>
			<div style="float">
				
			</div>
		</header> -->
		<br/>
		<div class="container">
			<h1><?= $disease['name'] ?></h1>
			<h3>Symptoms: <?php
			    $symptoms = "";
			    foreach($disease["symptoms"] as $symptom){
			        $symptoms .= "{$symptom["name"]}, ";
			    }
			    echo substr($symptoms, 0, strlen($symptoms) - 2);
	        ?></h3>
			<h3>Diagnosis: </h3> <p> <?php echo nl2br($disease['diagnosis'], false); ?></p>
			<h3>Prescription: <?php
	    $medicines = "";
	    foreach($disease["prescription"] as $medicine){
	        $medicines .= "{$medicine["name"]}, ";
	    }
	    echo returnSpaceIfBlank(substr($medicines, 0, strlen($medicines) - 2));
	                                    ?></h3>
			<h3>Treatment: </h3> <p> <?php echo nl2br($disease['treatment'], false); ?></p>
		</div>
	</body>
</html>