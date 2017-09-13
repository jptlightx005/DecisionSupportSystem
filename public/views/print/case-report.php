<?php
	include_once('../dss.php');

	if($_REQUEST['filter'] == 'age'){
		$case_list = getCaseByAge($_REQUEST['from_date'], $_REQUEST['to_date']);
	}else if($_REQUEST['filter'] == 'brgy'){
		$case_list = getCaseByBrgy($_REQUEST['from_date'], $_REQUEST['to_date']);
	}
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
				<center>POTOTAN MUNICIPAL HEALTH CENTER</center>
				<center>Pototan, Iloilo</center>
			</div>
			<div style="float">
				
			</div>
		</header>
		<br/>
		<div class="container" id="patient_record">
			

			<center>CASES SUMMARY</center>

			<?php if($_REQUEST['filter'] == 'age'): ?>
				<table class="table">
					<thead>
						<tr>
							<th>DISEASE</th>
							<th>BELOW 18</th>
							<th>18 TO 30</th>
							<th>31 TO 50</th>
							<th>51 TO 65</th>
							<th>ABOVE 65</th>
						</tr>
					</thead>
					<tbody>
						<?php foreach($case_list as $key => $value): ?>
							<td><?= $key ?></td>
							<td><?= $value["below18"] ?></td>
							<td><?= $value["18to30"] ?></td>
							<td><?= $value["31to50"] ?></td>
							<td><?= $value["51to65"] ?></td>
							<td><?= $value["above65"] ?></td>
						</tr>
						<?php endforeach; ?>
					</tbody>
				</table>
			<?php elseif($_REQUEST['filter'] == 'brgy'): ?>
				<table class="table">
					<thead>
						<tr>
							<th>BRGY</th>
							<th>NO. OF PATIENTS</th>
						</tr>
					</thead>
					<tbody>
						<?php foreach($case_list as $key => $value): ?>
							<td><?= $key ?></td>
							<td><?= count($value) ?></td>
						</tr>
						<?php endforeach; ?>
					</tbody>
				</table>
			<?php endif; ?>
		</div>
	</body>
</html>