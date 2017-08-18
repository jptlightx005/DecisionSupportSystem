<?php require_once('../../dss-base.php') ?>

<?php
    define('UPDATE_PATIENT', 'update_patient');
    define('UPDATE_PICTURE', 'update_picture');
    define('DELETE_PICTURE', 'delete_picture');
    define('ADD_EHR', 'add_ehr');
    define('DELETE_EHR', 'delete_ehr');
    define('DELETE_PATIENT', 'delete_patient');
?>

<?php if($_SESSION['isLoggedIn']): ?>
	<?php
        if(isset($action)){
            if($action == UPDATE_PATIENT){
                $result = updatePatient($_POST);
            }else if($action == UPDATE_PICTURE){
                $result = changePicture($_POST, $_FILES);
            }else if($action == ADD_EHR){
                $result = addEHR($_POST, $_FILES);
            }else if($action == DELETE_PICTURE){
                $result = removePicture($_POST['patient_id']);
            }else if($action == DELETE_EHR){
            	$result = removeEHR($_POST['ehr_id']);
            }

            if(isset($result)){
            	if($result['response'] == 1){
            		showMessage('Success!', $result['message']);
            	}else if($result['response'] == 0){
            		showMessage('Failed!', $result['message'], 1);
            	}
            }
        }

		if($search_text != ""){
	    	redirectToURL("", "/patient?search_text=$search_text", 0);
	    	exit();
	    }

        if(!isset($_GET['id'])){
	    	exit();
	    }

        $patient = getPatientInfo($_GET['id']);
        $result = getPatientPicture($patient['picture_id']);;
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
        
    ?>
	<?php startblock('main') ?>
	   	<?php if($_COOKIE['privilege_level'] != 0): ?>
	   		<div class="row">
		   		<a href="patient" class="btn btn-default btn-md">
	                <span class="glyphicon glyphicon-arrow-left"></span> Back
	            </a>
	            <?php
                  $relative = "/patient-print?id={$patient['ID']}";
                  $onclick = "return printPopupWindow('$relative');";
                ?>
	            <button onclick="<?= $onclick; ?>" class="btn btn-default btn-md">
	                <span class="glyphicon glyphicon-print"></span> Print
	            </button>

	            <button type="button" class="btn btn-default btn-md" data-toggle="modal" data-target="#addPatientModal">
	                <span class="glyphicon glyphicon-pencil"></span> Edit
	            </button>
	            <?php if($_COOKIE['privilege_level'] != 1): ?>
	   			<form method="post" style="display:inline;" action="patient">
	                <input type='hidden' name="admin_uid" value="<?php echo $_COOKIE['adminID']; ?>" />
	                <input type='hidden' name="patient_id" value="<?= $patient['ID']; ?>" />
	                <button title="Remove Patient" id="delete" type="submit" class="btn btn-default btn-md" name="action" value="<?= DELETE_PATIENT ?>" onclick="return confirm('Are you sure you want to delete this record?');">
	                    <span class="glyphicon glyphicon-remove"></span> Remove
	                </button>
	            </form>
	            <?php endif; ?>
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
                                <form action="patient-page?id=<?= $patient['ID']; ?>" method="post" enctype="multipart/form-data">
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
                        <?php if($hasPhoto): ?>
	                        <div class="row" style="margin-top:10px">
	                            <div class="col-xs-4"></div>
	                            <div class="col-xs-4">
	                                
				                    <form action="patient-page?id=<?= $patient['ID']; ?>" method="post" enctype="multipart/form-data">
										<input type='hidden' name="usrn" value="<?= $_COOKIE['usrn']; ?>" />
										<input type='hidden' name="adminID" value="<?= $_COOKIE['adminID']; ?>" />
					                    <input type='hidden' name="patient_id" value="<?= $patient['ID']; ?>" />

					                    <button type="submit" name="action" value="<?= DELETE_PICTURE ?>" class="btn btn-danger btn-md form-control">
					                    	Remove Picture
					                    </button>
									</form>
			                    	
	                            </div>
	                            <div class="col-xs-4"></div>
	                        </div>
						<?php endif; ?>
                        <!-- PATIENT INFO -->
                        <br>
                        <div class="col-md-6">
							<dl class="row">						
								<dt class="col-sm-5">Patient ID:</dt>
								<dd class="col-sm-7"><?= returnSpaceIfBlank($patient["PatientID"]) ?></dd>

								<dt class="col-sm-5">Last Name:</dt>
								<dd class="col-sm-7"><?= returnSpaceIfBlank($patient['last_name']); ?></dd>

								<dt class="col-sm-5">First Name:</dt>
								<dd class="col-sm-7"><?= returnSpaceIfBlank($patient['first_name']); ?></dd>
								
								<dt class="col-sm-5">Middle Name:</dt>
								<dd class="col-sm-7"><?= returnSpaceIfBlank($patient['middle_name']); ?></dd>

								<dt class="col-sm-5">Gender:</dt>
								<dd class="col-sm-7"><?= returnSpaceIfBlank($patient['gender']); ?></dd>
								
								<dt class="col-sm-5">&nbsp;</dt>
								<dd class="col-sm-7">&nbsp;</dd>

								<dt class="col-sm-5">Civil Status:</dt>
								<dd class="col-sm-7"><?php echo returnSpaceIfBlank($patient['status']); ?></dd>

								<dt class="col-sm-5">Nationality:</dt>
								<dd class="col-sm-7"><?php echo returnSpaceIfBlank($patient['nationality']); ?></dd>

								<dt class="col-sm-5">Address:</dt>
								<dd class="col-sm-7"><?php echo returnSpaceIfBlank($patient['address']); ?></dd>

								<dt class="col-sm-5">Telephone/Cellphone No:</dt>
								<dd class="col-sm-7"><?php echo returnSpaceIfBlank($patient['telephone']); ?></dd>

								<dt class="col-sm-5">&nbsp;</dt>
								<dd class="col-sm-7">&nbsp;</dd>

								<dt class="col-sm-5">Guardian:</dt>
								<dd class="col-sm-7"><?= returnSpaceIfBlank($patient['mother']); ?></dd>
								
								<dt class="col-sm-5">Address:</dt>
								<dd class="col-sm-7"><?= returnSpaceIfBlank($patient['mom_address']); ?></dd>
								
								<dt class="col-sm-5">Telephone/Cellphone No:</dt>
								<dd class="col-sm-7"><?= returnSpaceIfBlank($patient['mom_telephone']); ?></dd>
							</dl>
						</div>
						<div class="col-md-6">
							<dl class="row">						
								<dt class="col-sm-5">Ward/Room/Bed/Service:</dt>
								<dd class="col-sm-7"><?= returnSpaceIfBlank($patient["ward"]) ?></dd>

								<dt class="col-sm-5">Date of Birth:</dt>
								<dd class="col-sm-7"><?= returnFullDateStringWithDate($patient["date_of_birth"]); ?></dd>

								<dt class="col-sm-5">Age:</dt>
								<dd class="col-sm-7"><?= returnSpaceIfBlank($patient['age']); ?></dd>

								<dt class="col-sm-5">Place of Birth:</dt>
								<dd class="col-sm-7"><?= returnSpaceIfBlank($patient['place_of_birth']); ?></dd>
								
								<dt class="col-sm-5">Religion:</dt>
								<dd class="col-sm-7"><?= returnSpaceIfBlank($patient['religion']); ?></dd>

								<dt class="col-sm-5">&nbsp;</dt>
								<dd class="col-sm-7">&nbsp;</dd>
								
								<dt class="col-sm-5">Occupation:</dt>
								<dd class="col-sm-7"><?= returnSpaceIfBlank($patient['occupation']); ?></dd>
								
								<dt class="col-sm-5">Employer:</dt>
								<dd class="col-sm-7"><?= returnSpaceIfBlank($patient['employer']); ?></dd>
								
								<dt class="col-sm-5">Address:</dt>
								<dd class="col-sm-7"><?= returnSpaceIfBlank($patient['emp_address']); ?></dd>
								
								<dt class="col-sm-5">Telephone/Cellphone No:</dt>
								<dd class="col-sm-7"><?= returnSpaceIfBlank($patient['emp_telephone']); ?></dd>

								<dt class="col-sm-5">&nbsp;</dt>
								<dd class="col-sm-7">&nbsp;</dd>

								<dt class="col-sm-5">Spouse:</dt>
								<dd class="col-sm-7"><?= returnSpaceIfBlank($patient['spouse']); ?></dd>
								
								<dt class="col-sm-5">Address:</dt>
								<dd class="col-sm-7"><?= returnSpaceIfBlank($patient['sp_address']); ?></dd>
								
								<dt class="col-sm-5">Telephone/Cellphone No:</dt>
								<dd class="col-sm-7"><?= returnSpaceIfBlank($patient['sp_telephone']); ?></dd>
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
							<dt class="col-sm-5">Height:</dt>
							<dd class="col-sm-7"><?= returnSpaceIfBlank($patient['height']); ?></dd>
							
							<dt class="col-sm-5">Weight:</dt>
							<dd class="col-sm-7"><?= returnSpaceIfBlank($patient['weight']); ?></dd>
							
							<dt class="col-sm-5">Blood Pressure:</dt>
							<dd class="col-sm-7"><?= returnSpaceIfBlank($patient['blood_pressure']); ?></dd>
							
							<dt class="col-sm-5">Body Temperature:</dt>
							<dd class="col-sm-7"><?= returnSpaceIfBlank($patient['body_temperature']); ?></dd>
						</dl>
					</div>
					<div class="row">
					&nbsp;
					</div>

					<div class="row">
						<b>Electronic Health Records:</b>
					</div>
					<br>
					<div class="row">
						<form  method="post" action="patient-page?id=<?= $patient['ID']; ?>" enctype="multipart/form-data">
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
							<a class="imgmodaled" href="#" data-image-id="" data-toggle="modal" data-title="Electronic Health Record" data-caption="<?= $ehr_img["ID"]; ?>" data-image="<?= $ehr_img["url"]; ?>" data-target="#image-gallery">
							<img class="center-cropped img-rounded" style="margin:5px 0;" src="<?= $ehr_img["url"];
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
					<form action="patient-page?id=<?= $patient['ID']; ?>" method="post" enctype="multipart/form-data">
						<input type='hidden' name="adminID" value="<?php echo $_COOKIE['adminID']; ?>" />
	                    <input type='hidden' name="patient_id" value="<?php echo $patient['ID']; ?>" />
	                    <input type='hidden' name="ehr_id" value="0" />

	                    <button id="remove_picture_button" type="submit" name="action" value="<?= DELETE_PICTURE ?>" class="btn btn-danger btn-md form-control">
	                    	Remove Picture
	                    </button>
	                    <button id="remove_ehr_button" type="submit" name="action" value="<?= DELETE_EHR ?>" class="btn btn-danger btn-md form-control">
	                    	Remove EHR
	                    </button>
					</form>
				</div>
			</div>
		</div>
	</div>

 	<div id="addPatientModal" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <form class="modal-content" method="post" enctype="multipart/form-data">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Add Patient</h4>
                </div>
				<input type='hidden' name="admin_ulid" value="<?= $_COOKIE['adminID']; ?>" />
                <input type='hidden' name="patient_id" value="<?= $patient['ID']; ?>" />
                <div class="modal-body">
                    <label>First Name:</label>
				    <input class="form-control" type="text" name="first_name" value="<?= $patient['first_name']; ?>" required />
                    <label>Middle Name:</label>
				    <input class="form-control" type="text" name="middle_name" value="<?= $patient['middle_name']; ?>" required />
				    <label>Last Name:</label>
				    <input class="form-control" type="text" name="last_name" value="<?= $patient['last_name']; ?>" required />
				    <label>Ward/Room/Bed/Service:</label>
				    <input class="form-control" type="text" name="ward" value="<?= $patient['ward']; ?>" />
                    <label>Address:</label>
                    <input class="form-control" type="text" name="address" value="<?= $patient['address']; ?>" required/>
					<label>Telephone/Cellphone No:</label>
                    <input class="form-control" type="text" name="telephone" value="<?= $patient['telephone']; ?>" />
                    <label>Gender:</label><br/>
                    <select class="form-control" name="gender" required>
                        <option disabled selected value>Select Gender</option>
                        <?php 
                            $gender = $patient['gender'];
                        ?>
                        <option value='Male' <?php if($gender == 'Male') echo 'selected'; ?>>Male</option>
                        <option value='Female' <?php if($gender == 'Female') echo 'selected'; ?>>Female</option>
                    </select>

					<label>Civil Status:</label>
                    <select class="form-control" name="status" required>
                        <?php  $stat = $patient['status']; ?>
                        <option disabled selected value>Select Status</option>
                        <option value='Single' <?php if($stat == 'Single') echo 'selected'; ?>>Single</option>
                        <option value='Married' <?php if($stat == 'Married') echo 'selected'; ?>>Married</option>
                        <option value='Divorced' <?php if($stat == 'Divorced') echo 'selected'; ?>>Divorced</option>
                        <option value='Separated' <?php if($stat == 'Separated') echo 'selected'; ?>>Separated</option>
                        <option value='Widowed' <?php if($stat == 'Widowed') echo 'selected'; ?>>Widowed</option>
                    </select>

                    <label>Date of Birth:</label>
                    <input class="form-control" type='date' name='date_of_birth' value="<?php echo $patient['date_of_birth']; ?>" required />
					<label>Age:</label>
                    <input class="form-control" type="number" name="age" value="<?= $patient['age']; ?>" required/>
					<label>Birthplace:</label>
                    <input class="form-control" type="text" name="place_of_birth" value="<?= $patient['place_of_birth']; ?>" required/>
					<label>Nationality:</label>
                    <input class="form-control" type="text" name="nationality" value="<?= $patient['nationality']; ?>" required/>
					<label>Religion:</label>
                    <input class="form-control" type="text" name="religion" value="<?= $patient['religion']; ?>" required/>
					<label>Occupation:</label>
                    <input class="form-control" type="text" name="occupation" value="<?= $patient['occupation']; ?>" required/>
                    <br/>

					<label>Employer (Type of Business):</label>
                    <input class="form-control" type="text" name="employer" value="<?= $patient['employer']; ?>" />
					<label>Address:</label>
                    <input class="form-control" type="text" name="emp_address" value="<?= $patient['emp_address']; ?>" />
					<label>Telephone/Cellphone No:</label>
                    <input class="form-control" type="text" name="emp_telephone" value="<?= $patient['emp_telephone']; ?>" />
                    <br/>
					
					<label>Guardian's Name:</label>
                    <input class="form-control" type="text" name="mother" value="<?= $patient['mother']; ?>" required/>
					<label>Address:</label>
                    <input class="form-control" type="text" name="mom_address" value="<?= $patient['mom_address']; ?>" required/>
					<label>Telephone/Cellphone No:</label>
                    <input class="form-control" type="text" name="mom_telephone" value="<?= $patient['mom_telephone']; ?>" required/>
                    <br/>
					
					<label>Spouse Name:</label>
                    <input class="form-control" type="text" name="spouse" value="<?= $patient['spouse']; ?>" />
					<label>Address:</label>
                    <input class="form-control" type="text" name="sp_address" value="<?= $patient['sp_address']; ?>" />
					<label>Telephone/Cellphone No:</label>
                    <input class="form-control" type="text" name="sp_telephone" value="<?= $patient['sp_telephone']; ?>" />
                    <br/>

                    <label>Height:</label>
                    <input class="form-control" type="text" name="height" value="<?php echo $patient['height']; ?>" required />
                    <label>Weight:</label>
                    <input class="form-control" type="text" name="weight" value="<?php echo $patient['weight']; ?>" required />
                    <label>Blood Pressure:</label>
                    <input class="form-control" type="text" name="blood_pressure" value="<?php echo $patient['blood_pressure']; ?>" required />
                    <label>Body Temperature:</label>
                    <input class="form-control" type="text" name="body_temperature" value="<?php echo $patient['body_temperature']; ?>" required />

                </div>
                <div class="modal-footer">
                    <button type="submit" name="action" value="<?= UPDATE_PATIENT ?>" class="btn btn-default">Submit</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </form>

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