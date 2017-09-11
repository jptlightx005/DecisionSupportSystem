<?php
	include_once('../dss.php');
	$patients = getPatientListFromDate($_GET['from_date'], $_GET['to_date']);
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
		<div class="row">
		<br/>
		</div>
		<header>
			<div id="heading">
				<center>Republic of the Philippines</center>
				<center>Province of Iloilo</center>
				<center>ILOILO PROVINCIAL HOSPITAL</center>
				<center>Pototan, Iloilo</center>
			</div>
			<div style="float">
				
			</div>
		</header>
		<br/>
		<div class="container" id="patient_record">
			<center>PATIENT LIST</center>
			<table class="table">
            	<thead>
                    <tr>
                        <th>Patient ID</th>
                        <th>Patient Name</th>
                        <th>Gender</th>
                        <th>Address</th>
                        <th>Last Visit</th>
                        <!-- <th>Options</th> -->
                    </tr>
                </thead>
 			<?php foreach($patients as $dict): ?>
                <tr>
                    <td><?= $dict['PatientID'] ?></td>
                    <td><a href="patient-page?id=<?= $dict['ID'] ?>"><?= returnFullNameFromObject($dict) ?></a></td>
                    <td><?= $dict['gender'] ?></td>
                    <td><?= $dict['address'] ?></td>
                    <td><?= returnFullDateTimeStringWithDate($dict['last_visit']) ?></td>
                </tr>
            <?php endforeach; ?>
            </table>
		</div>
	</body>
</html>