<?php require_once('../../dss-base.php') ?>

<?php
    define('UPDATE_PATIENT', 'update_patient');
    define('UPDATE_PICTURE', 'update_picture');
    define('ADD_EHR', 'add_ehr');
?>

<?php if($_SESSION['isLoggedIn']): ?>
	<?php
        if(isset($action)){
            if($action == UPDATE_PATIENT){
                // addNewPatient($_POST, $_FILES);
            }else if($action == UPDATE_PICTURE){
                changePicture($_POST, $_FILES);
            }else if($action == ADD_EHR){
                addEHR($_POST, $_FILES);
            }
        }

        if(!isset($_GET['id'])){
	    	exit();
	    }

        $patient = getPatientInfo($_GET['id']);
        $result = getPatientLatestPicture($_GET['id']);
        if($result == 0){
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
        
    ?>
	<?php startblock('main') ?>
	   	<?php if($_COOKIE['privilege_level'] != 0): ?>
	   		<div class="row">
		   		<a href="patient" class="btn btn-default btn-md">
	                <span class="glyphicon glyphicon-arrow-left"></span> Back
	            </a>
	            <button class="btn btn-default btn-md">
	                <span class="glyphicon glyphicon-print"></span> Print
	            </button>

	            <button type="button" class="btn btn-default btn-md" data-toggle="modal" data-target="#addPatientModal">
	                <span class="glyphicon glyphicon-pencil"></span> Edit
	            </button>
	   			<form method="post" style="display:inline;" action="patient">
	                <input type='hidden' name="adminID" value="<?php echo $_COOKIE['adminID']; ?>" />
	                <input type='hidden' name="patient_id" value="<?= $patient['ID']; ?>" />
	                <button title="Remove Patient" id="delete" type="submit" class="btn btn-default btn-md" name="action" value="delete_patient" onclick="return confirm('Are you sure you want to delete this record?');">
	                    <span name="action" value="delete" class="glyphicon glyphicon-remove"></span> Remove
	                </button>
	            </form>
	   		</div>
	   		<br>
	   		<div class="row" id="patient_record">
	   			<div class="panel panel-info">
					<div class="panel-heading"><h3>Patient Record</h3></div>
					<div class="panel-body">
						<div class="row">
							<center><b>Patient's Picture</b></center>
							<?php if($hasPhoto): ?>
								<a class="imgmodaled" href="#" data-image-id="" data-toggle="modal" data-title="<?= $patient['first_name']; ?>" data-caption="Patient Image" data-image="<?= $patientPicture ?>" data-target="#image-gallery"> 
							<?php endif; ?>
								<img class="center-cropped center-block img-rounded" src="<?= $patientPicture ?>" /> 
							<?php if($hasPhoto): ?>
								</a> 
							<?php endif; ?>
						</div>
						<!-- ADD/CHANGE PICTURE -->
						<div class="row" style="margin-top:10px;">
                            <div class="col-xs-4"></div>
                            <div class="col-xs-4">
                                <form action="patient-page?id=<?= $patient['ID']; ?>#patient_record" method="post" enctype="multipart/form-data">
									<input type='hidden' name="adminID" value="<?= $_COOKIE['adminID']; ?>" />
				                    <input type='hidden' name="patient_id" value="<?= $patient['ID']; ?>" />
			                    	<input type='hidden' name="action" value="<?= UPDATE_PICTURE ?>" />

									<label class="btn btn-primary btn-file center-block btn-md">
			                            <?= $hasPhoto ? 'Change' : 'Add' ?> Picture <input type="file" style="display: none;" name="patient_picture" onchange="this.form.submit();" accept="image/*">
			                        </label>
								</form>
                            </div>
                            <div class="col-xs-4"></div>
                        </div>

                        <!-- REMOVE PICTURE -->
                        <div class="row" style="margin-top:10px">
                            <div class="col-xs-4"></div>
                            <div class="col-xs-4">
                                <?php if($hasPhoto): ?>
			                    <form action="patient-page?id=<?= $patient['PatientID']; ?>#patient_record" method="post" enctype="multipart/form-data">
									<input type='hidden' name="usrn" value="<?php echo $_COOKIE['usrn']; ?>" />
									<input type='hidden' name="token" value="<?php echo $_COOKIE['token']; ?>" />
									<input type='hidden' name="adminID" value="<?php echo $_COOKIE['adminID']; ?>" />
				                    <input type='hidden' name="patient_id" value="<?php echo $patient['PatientID']; ?>" />

				                    <button type="submit" name="action" value="remove_picture" class="btn btn-danger btn-md form-control">
				                    	Remove Picture
				                    </button>
								</form>
		                    	<?php endif; ?>
                            </div>
                            <div class="col-xs-4"></div>
                        </div>

                        <!-- PATIENT INFO -->
                        <br>
                        <div class="col-md-6">
							<dl class="row">						
								<dt class="col-sm-4">Patient ID:</dt>
								<dd class="col-sm-8"><?= returnSpaceIfBlank($patient["PatientID"]) ?></dd>

								<dt class="col-sm-4">Last Name:</dt>
								<dd class="col-sm-8"><?= returnSpaceIfBlank($patient['last_name']); ?></dd>

								<dt class="col-sm-4">First Name:</dt>
								<dd class="col-sm-8"><?= returnSpaceIfBlank($patient['first_name']); ?></dd>
								
								<dt class="col-sm-4">Middle Name:</dt>
								<dd class="col-sm-8"><?= returnSpaceIfBlank($patient['middle_name']); ?></dd>

								<dt class="col-sm-4">Gender:</dt>
								<dd class="col-sm-8"><?= returnSpaceIfBlank($patient['gender']); ?></dd>
								
								<dt class="col-sm-4">&nbsp;</dt>
								<dd class="col-sm-8">&nbsp;</dd>

								<dt class="col-sm-4">Civil Status:</dt>
								<dd class="col-sm-8"><?php echo returnSpaceIfBlank($patient['status']); ?></dd>

								<dt class="col-sm-4">Nationality:</dt>
								<dd class="col-sm-8"><?php echo returnSpaceIfBlank($patient['nationality']); ?></dd>

								<dt class="col-sm-4">Address:</dt>
								<dd class="col-sm-8"><?php echo returnSpaceIfBlank($patient['address']); ?></dd>

								<dt class="col-sm-4">Telephone No.:</dt>
								<dd class="col-sm-8"><?php echo returnSpaceIfBlank($patient['telephone']); ?></dd>

								<dt class="col-sm-4">&nbsp;</dt>
								<dd class="col-sm-8">&nbsp;</dd>

								<dt class="col-sm-4">Mother:</dt>
								<dd class="col-sm-8"><?= returnSpaceIfBlank($patient['mother']); ?></dd>
								
								<dt class="col-sm-4">Address:</dt>
								<dd class="col-sm-8"><?= returnSpaceIfBlank($patient['mom_address']); ?></dd>
								
								<dt class="col-sm-4">Telephone No.:</dt>
								<dd class="col-sm-8"><?= returnSpaceIfBlank($patient['mom_telephone']); ?></dd>
							</dl>
						</div>
						<div class="col-md-6">
							<dl class="row">						
								<dt class="col-sm-4">Ward/Room/Bed/Service:</dt>
								<dd class="col-sm-8"><?= returnSpaceIfBlank($patient["ward"]) ?></dd>

								<dt class="col-sm-4">Date of Birth:</dt>
								<dd class="col-sm-8"><?= returnFullDateStringWithDate($patient["date_of_birth"]); ?></dd>

								<dt class="col-sm-4">Age:</dt>
								<dd class="col-sm-8"><?= returnSpaceIfBlank($patient['age']); ?></dd>

								<dt class="col-sm-4">Place of Birth:</dt>
								<dd class="col-sm-8"><?= returnSpaceIfBlank($patient['place_of_birth']); ?></dd>
								
								<dt class="col-sm-4">Religion:</dt>
								<dd class="col-sm-8"><?= returnSpaceIfBlank($patient['religion']); ?></dd>

								<dt class="col-sm-4">&nbsp;</dt>
								<dd class="col-sm-8">&nbsp;</dd>
								
								<dt class="col-sm-4">Occupation:</dt>
								<dd class="col-sm-8"><?= returnSpaceIfBlank($patient['occupation']); ?></dd>
								
								<dt class="col-sm-4">Employer:</dt>
								<dd class="col-sm-8"><?= returnSpaceIfBlank($patient['employer']); ?></dd>
								
								<dt class="col-sm-4">Address:</dt>
								<dd class="col-sm-8"><?= returnSpaceIfBlank($patient['emp_address']); ?></dd>
								
								<dt class="col-sm-4">Telephone No.:</dt>
								<dd class="col-sm-8"><?= returnSpaceIfBlank($patient['emp_telephone']); ?></dd>

								<dt class="col-sm-4">&nbsp;</dt>
								<dd class="col-sm-8">&nbsp;</dd>

								<dt class="col-sm-4">Spouse:</dt>
								<dd class="col-sm-8"><?= returnSpaceIfBlank($patient['spouse']); ?></dd>
								
								<dt class="col-sm-4">Address:</dt>
								<dd class="col-sm-8"><?= returnSpaceIfBlank($patient['sp_address']); ?></dd>
								
								<dt class="col-sm-4">Telephone No.:</dt>
								<dd class="col-sm-8"><?= returnSpaceIfBlank($patient['sp_telephone']); ?></dd>
							</dl>
						</div>
					</div>
				</div>
	   		</div>

	   		<div class="panel panel-info">
				<div class="panel-heading" id="patient_ehr"><h3>Patient EHR</h3></div>
				<div class="panel-body">
					<div class="col-md-12">
										
						<dl class="row">							
							<dt class="col-sm-4">Height:</dt>
							<dd class="col-sm-8"><?= returnSpaceIfBlank($patient['height']); ?></dd>
							
							<dt class="col-sm-4">Weight:</dt>
							<dd class="col-sm-8"><?= returnSpaceIfBlank($patient['weight']); ?></dd>
							
							<dt class="col-sm-4">Blood Pressure:</dt>
							<dd class="col-sm-8"><?= returnSpaceIfBlank($patient['blood_pressure']); ?></dd>
							
							<dt class="col-sm-4">Body Temperature:</dt>
							<dd class="col-sm-8"><?= returnSpaceIfBlank($patient['body_temperature']); ?></dd>
						</dl>
					</div>
					<div class="row">
					&nbsp;
					</div>

					<div class="row">
					<b>Electronic Health Records:</b>
					</div>
					<div class="row">
						<form  method="post" action="patient-page?id=<?= $patient['ID']; ?>#patient_ehr" enctype="multipart/form-data">
							<input type='hidden' name="adminID" value="<?php echo $_COOKIE['adminID']; ?>" />
		                    <input type='hidden' name="patient_id" value="<?= $patient['ID']; ?>" />
	                    	<input type='hidden' name="action" value="<?= ADD_EHR ?>" />
							<div class="col-xs-4">
								<label class="btn btn-primary btn-file center-block btn-md">
		                            Add EHR Documents <input type="file" style="display: none;" name="ehr_img" onchange="this.form.submit();" accept="image/*">
		                        </label>
							</div>
						</form>
					</div>
					<br>
					<?php if(count($patientEHR) > 0): ?>
						<div class="row" id="ehr_images">
						<?php foreach ($patientEHR as $ehr_img): ?>
							<a class="imgmodaled" href="#" data-image-id="" data-toggle="modal" data-title="Electronic Health Record" data-caption="<?php echo $ehr_img["ID"]; ?>" data-image="<?= $ehr_img["url"]; ?>" data-target="#image-gallery">
							<img class="center-cropped img-rounded" src="<?= $ehr_img["url"];
							?>" /> 
							</a> 
						<?php endforeach; ?>
						</div>
					<?php endif; ?>
					
				</div>
			</div>
	   	<?php endif; ?>
	<?php endblock() ?>

	<div class="modal fade" id="image-gallery" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
					<h4 class="modal-title" id="image-gallery-title"></h4>
				</div>
				<div class="modal-body">
					<img id="image-gallery-image" class="img-responsive center-block" src="">
				</div>
				<div class="modal-footer">
					<div class="col-md-8 text-justify" id="image-gallery-caption">
						
					</div>
					<form action="patient-info?patient_id=<?= $patient_info['PatientID']; ?>#patient_record" method="post" enctype="multipart/form-data">
						<input type='hidden' name="usrn" value="<?php echo $_COOKIE['usrn']; ?>" />
						<input type='hidden' name="token" value="<?php echo $_COOKIE['token']; ?>" />
						<input type='hidden' name="adminID" value="<?php echo $_COOKIE['adminID']; ?>" />
	                    <input type='hidden' name="patient_id" value="<?php echo $patient_info['PatientID']; ?>" />
	                    <input type='hidden' name="ehr_id" value="0" />

	                    <button id="remove_picture_button" type="submit" name="action" value="remove_picture" class="btn btn-danger btn-md form-control">
	                    	Remove Picture
	                    </button>
	                    <button id="remove_ehr_button" type="submit" name="action" value="remove_ehr" class="btn btn-danger btn-md form-control">
	                    	Remove EHR
	                    </button>
					</form>
				</div>
			</div>
		</div>
	</div>

	<footer>
		<script>
			$(document).ready(function(){

			loadGallery(true, 'a.imgmodaled');

			//This function disables buttons when needed
			function disableButtons(counter_max, counter_current){
				$('#show-previous-image, #show-next-image').show();
				if(counter_max == counter_current){
					$('#show-next-image').hide();
				} else if (counter_current == 1){
					$('#show-previous-image').hide();
				}
			}

			/**
			 *
			 * @param setIDs        Sets IDs when DOM is loaded. If using a PHP counter, set to false.
			 * @param setClickAttr  Sets the attribute for the click handler.
			 */

			function loadGallery(setIDs, setClickAttr){
				var current_image,
					selector,
					counter = 0;

				$('#show-next-image, #show-previous-image').click(function(){
					if($(this).attr('id') == 'show-previous-image'){
						current_image--;
					} else {
						current_image++;
					}

					selector = $('[data-image-id="' + current_image + '"]');
					updateGallery(selector);
				});

				function updateGallery(selector) {
					var $sel = selector;
					current_image = $sel.data('image-id');
					// $('#image-gallery-caption').text($sel.data('caption'));
					$('#image-gallery-title').text($sel.data('title'));
					$('#image-gallery-image').attr('src', $sel.data('image'));
					disableButtons(counter, $sel.data('image-id'));
					if($sel.data('caption') == "Patient Image"){
						$('#remove_ehr_button').hide();
						$('#remove_picture_button').show();
					}else{
						$('#remove_ehr_button').show();
						$('#remove_picture_button').hide();
						$('input[name=ehr_id]').val($sel.data('caption'));
					}
				}

				if(setIDs == true){
					$('[data-image-id]').each(function(){
						counter++;
						$(this).attr('data-image-id',counter);
					});
				}
				$(setClickAttr).on('click',function(){
					updateGallery($(this));
				});
			}
		});
		</script>
	</footer>
<?php endif; ?>