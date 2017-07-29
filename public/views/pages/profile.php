<?php require_once('../dss-base.php') ?>

<?php if($_SESSION['isLoggedIn']): ?>
	<?php
		$obj = getProfileByID($_COOKIE['adminID']);
		if($obj['response'] == 0){
			exit();
		}else{
			$profile = $obj['content'];
		}
	?>
	<?php startblock('main') ?>
		<h3>User Info
			<button type="button" class="btn btn-default btn-md" data-toggle="modal" data-target="#addPatientModal">
				<span class="glyphicon glyphicon-pencil"></span> Edit
			</button>
		</h3>

		<div class="col-md-6">
			<dl class="row">
				<dt class="col-sm-4">First Name:</dt>
				<dd class="col-sm-8"><?php echo $profile['first_name']; ?>&nbsp;</dd>
				
				<dt class="col-sm-4">Middle Name:</dt>
				<dd class="col-sm-8"><?php echo $profile['middle_name']; ?>&nbsp;</dd>
												
				<dt class="col-sm-4">Last Name:</dt>
				<dd class="col-sm-8"><?php echo $profile['last_name']; ?>&nbsp;</dd>

				<dt class="col-sm-4">Gender:</dt>
				<dd class="col-sm-8"><?php echo $profile['gender']; ?>&nbsp;</dd>

				<dt class="col-sm-4">Date of Birth:</dt>
				<dd class="col-sm-8"><?php
					$newDate = date("F j, Y", strtotime($profile["date_of_birth"]));
					echo $newDate; 
				?>&nbsp;</dd>
				
													
				<dt class="col-sm-4">Job:</dt>
				<dd class="col-sm-8"><?php echo $profile['job']; ?>&nbsp;</dd>
				
				<dt class="col-sm-4">Address:</dt>
				<dd class="col-sm-8"><?php echo $profile['address']; ?>&nbsp;</dd>
				
				<dt class="col-sm-4">Contact No:</dt>
				<dd class="col-sm-8"><?php echo $profile['contact_no']; ?>&nbsp;</dd>

			</dl>
		</div>
	<?php endblock() ?>
<?php endif; ?>