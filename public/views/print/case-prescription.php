<?php
	include_once('../dss.php');
	$case = getCaseInfo($_GET['id']);
	$patient = getPatientInfo($case['PatientID']);
	$medicine_list = getMedicineListForCase($_GET['id']);
	$presc_list = getPrescriptionListForCase($_GET['id']);
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
			    text-indent: 0px;
			    padding: 0px 20px;
			    font-size: 16px;
			    text-align: justify;
			}

		</style>
		<script src="bootstrap/js/bootstrap.min.js"></script>
	    <script type="text/javascript" src="js/general.js"></script>
	    <script src="js/sidebar.js"></script>
	    <script src="js/search.js"></script>
	    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
	</head>
	<body>
		<header>
			<div id="heading">
				<center>Republic of the Philippines</center>
				<center>Province of Iloilo</center>
				<center>POTOTAN MUNICIPAL HEALTH CENTER</center>
				<center>Pototan, Iloilo</center>
			</div>
			<div style="float">
				
			</div>
		</header>
		<div class="container" id="patient_record">
			<div class="row">
				<span>
					<span class="label">NAME:</span>
					<span class="detail" style="width:250px;"><?=  "{$patient["last_name"]},&nbsp;&nbsp; {$patient["first_name"]} &nbsp;&nbsp;&nbsp; {$patient["middle_name"]}" ?></span>
				</span>
			</div>

			<div class="row">

				<span>
					<span class="label">ADDRESS:</span>
					<span class="detail" style="width:225;text-align: center"><?=  $patient["address"] ?></span>
				</span>
			</div>
			<div class="row">
				<span>
					<span class="label">AGE:</span>
					<span class="detail" style="width:18px;text-align: center"><?= $patient["age"] ?></span>
				</span>

				<span>
					<span class="label">SEX:</span>
					<span class="detail" style="width:50px;text-align: center"><?=  $patient["gender"] ?></span>
				</span>

				<span>
					<span class="label">DATE:</span>
					<span class="detail" style="width:200px;text-align: center"><?= date("F j, Y") ?></span>
				</span>
				</span>
			</div>

			<h3>Prescription:</h3>
			<img src="assets/rx_symbol.png" style="width:30px;" />
			<div style="margin-left:50px">
				<?php
					$meds = "";
					foreach ($presc_list as $medicine){
						$mname = $medicine['name'];
						$mamount = $medicine['amount'];
						$intake = $medicine['intake'];
						echo "<span class='med_name'>$mname &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; #$mamount </span>";
						echo  "<p><span style='font-size:15px;'>Sig.</span>&nbsp;&nbsp;&nbsp;&nbsp;$intake</p><br>";
					}
				?>
			</div>
				
			<style>
				.med_name{
					font-size: 20px;
				}
			</style>
			<!-- <p><?= $case['treatment'] ?></p> -->
			<br><br>
			<div class="row" align="center">
			<strong>DR. RODINA P. MONDRAGON</strong> <br>
			P.T.R. No. 4792270 <br>
			Lic. No. 0065414
			</div>
		</div>
	</body>
</html>