<?php
	include_once('../dss.php');

	$patient = getPatientInfo($_GET['id']);
	$result = getPatientPicture($patient['picture_id']);
	if(count($result) == 0){
    	$patientPicture = "assets/placeholder.gif";
    	$hasPhoto = false;
    }else{
    	$patientPicture = $result[0]['url'];
    	if(!file_exists(IMAGES_FOLDER . $patientPicture) || returnBlankIfNull($patientPicture) == ""){
			$patientPicture = "assets/placeholder.gif";
			$hasPhoto = false;
		}else{
			$milliseconds = round(microtime(true) * 1000);
        	$patientPicture .= "?$milliseconds";
        	$hasPhoto = true;
		}
    }
    $patientEHR = getPatientEHR($_GET['id']);

    $cases = getCaseListByPatientID($_GET['id']);
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
		<div id="patient_picture">
		
		<?php if($hasPhoto): ?>
			<img class="center-cropped center-block img-rounded" src="<?= $patientPicture; ?>" /> 
		<?php endif; ?>
		</div>
		<div class="row">
		<br/>
		</div>
		<header>
			<div id="heading">
				<center>Republic of the Philippines</center>
				<center>Province of Iloilo</center>
				<center>RURAL HEALTH UNIT</center>
				<center>Pototan, Iloilo</center>
			</div>
			<div style="float">
				
			</div>
		</header>
		<br/>
		<div class="container" id="patient_record">
			<div class="row">
				<span>
					<span class="label">NAME:</span>
					<span class="detail" style="width:250px;"><?=  "{$patient["last_name"]},&nbsp;&nbsp; {$patient["first_name"]} &nbsp;&nbsp;&nbsp; {$patient["middle_name"]}" ?></span>
				</span>
				

				<span>
					<span class="label">HOSPITAL RECORD NO:</span>
					<span class="detail" style="width:100px;text-align: center"><?=  returnSpaceIfBlank($patient["PatientID"]) ?></span>
				</span>
			</div>
			<div class="row">
				<span>
					<span style="color:#FFF">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
					<span class="label">LAST NAME</span>
					<span class="label">FIRST NAME</span>
					<span class="label">MIDDLE NAME</span>
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
					<span class="label">CIVIL STATUS:</span>
					<span class="detail" style="width:55px;text-align: center"><?=  $patient["status"] ?></span>
				</span>

				<span>
					<span class="label">RELIGION:</span>
					<span class="detail" style="width:120px;text-align: center"><?=  $patient["religion"] ?></span>
				</span>

				<span>
					<span class="label">OCCUPATION:</span>
					<span class="detail"><?=  $patient["occupation"] ?></span>
				</span>
			</div>
			<div class="row">

				<span>
					<span class="label">ADDRESS:</span>
					<span class="detail" style="width:225;text-align: center"><?=  $patient["address"] ?></span>
				</span>

				<span>
					<span class="label">DATE OF BIRTH:</span>
					<span class="detail"><?=  $patient["date_of_birth"] ?></span>
				</span>
			</div>
			<div class="row">
				<span>
					<span class="label">GUARDIAN:</span>
					<span class="detail" style="width:225;text-align: center"><?= returnSpaceIfBlank($patient["mother"]) ?></span>
				</span>

				<span>
					<span class="label">RELATIONSHIP:</span>
					<span class="detail" style="width:150;text-align: center"><?= returnSpaceIfBlank($patient["g_relationship"]) ?></span>
				</span>
			</div>
			<div class="row">
				<span>
					<span class="label">CONTACT NO:</span>
					<span class="detail" style="width:100;text-align: center"><?= returnSpaceIfBlank($patient["telephone"]) ?></span>
				</span>
			</div>
			<br>
			<center>OUT PATIENT RECORD </center>
			<br>
			<table class="table" style="font-size: 14px;">
				<thead>
					<tr>
						<th>DATE/TIME</th>
						<th>DIAGNOSIS</th>
						<th>PRESCRIPTION</th>
						<th>TREATMENT</th>
						<!-- <th>REMARKS</th> -->
					</tr>
				</thead>
				<tbody>
					<?php foreach($cases as $case): ?>
						<td><?= returnFullDateTimeStringWithDate($case["case_date"]) ?></td>
						<td><?= $case["diagnosis"] ?></td>
						<td>
							<?php
								$medicines = "";
							    foreach($case["prescription"] as $medicine){
							        $medicines .= "{$medicine["name"]}, ";
							    }
							    echo returnSpaceIfBlank(substr($medicines, 0, strlen($medicines) - 2));
							?>
						</td>
						<td><?= $case["treatment"] ?></td>
<!-- 						<td><?= $case["remarks"] ?></td> -->
					</tr>
					<?php endforeach; ?>
				</tbody>
			</table>
		</div>

		<div class="row" id="ehr_images">
			<?php if(count($patientEHR) > 0): ?>
				<div class="row" id="ehr_images">
				<?php foreach ($patientEHR as $ehr_img): ?>
					<div style="page-break-after: always;"></div>
					<img class="ehr_img" src="<?= $ehr_img["url"]; ?>" /> 
				<?php endforeach; ?>
				</div>
			<?php endif; ?>
		</div>
	</body>
</html>