<?php require_once('../../dss-base.php') ?>

<?php
    define('UPDATE_MEDICINE', 'update_medicine');
    define('DELETE_MEDICINE', 'delete_medicine');
?>

<?php if($_SESSION['isLoggedIn']): ?>
	<?php 
		if(isset($action)){
            if($action == UPDATE_MEDICINE){
                $result = updateMedicine($_POST);
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
	    	redirectToURL("", "/medicine?search_text=$search_text", 0);
	    	exit();
	    }

        if(!isset($_GET['id'])){
	    	exit();
	    }

	    $medicine = getMedicineInfo($_GET['id']);
	?>
	<?php startblock('main') ?>
	   	<?php if($_COOKIE['privilege_level'] != 0): ?>
	   		<div class="main">
	            <div class="row">
	                <a href="medicine" class="btn btn-default btn-md">
	                    <span class="glyphicon glyphicon-arrow-left"></span> Back
	                </a>
	                <?php
	                  $relative = "/medicine-print?id={$medicine['ID']}";
	                  $onclick = "return printPopupWindow('$relative');";
	                ?>
	                <button onclick="<?= $onclick; ?>" class="btn btn-default btn-md">
	                    <span class="glyphicon glyphicon-print"></span> Print Medicine
	                </button>
	                <?php if($_COOKIE['privilege_level'] != 1): ?>
					<button type="button" class="btn btn-default btn-md" data-toggle="modal" data-target="#editMedicineModal">
	                    <span class="glyphicon glyphicon-pencil"></span> Edit
	                </button>
					<form method="post" style="display:inline;" action="medicine">
		                <input type='hidden' name="admin_uid" value="<?= $_COOKIE['adminID']; ?>" />
		                <input type='hidden' name="medicine_id" value="<?= $medicine['ID']; ?>" />
		                <button title="Remove Medicine" id="delete" type="submit" class="btn btn-default btn-md" name="action" value="<?= DELETE_MEDICINE ?>" onclick="return confirm('Are you sure you want to delete this record?');">
		                    <span class="glyphicon glyphicon-remove"></span> Remove
		                </button>
		            </form>
		            <?php endif; ?>
	            </div>
	            <br>
	            <div class="row">
					<div class="panel panel-info">
						<div class="panel-heading"><h3>Medicine Details</h3></div>
						<div class="panel-body">
							<div class="col-md-6">
								<dl class="row">
									<dt class="col-sm-5">Medicine Name:</dt>
	                                <dd class="col-sm-7"><?= $medicine['name']; ?></dd>

									<dt class="col-sm-5">Generic Name:</dt>
	                                <dd class="col-sm-7"><?= $medicine['generic_name']; ?></dd>

									<dt class="col-sm-5">Brand Name:</dt>
	                                <dd class="col-sm-7"><?= $medicine['brand_name']; ?></dd>

									<dt class="col-sm-5">Overview:</dt>
	                                <dd class="col-sm-7"><?= $medicine['overview']; ?></dd>

									<dt class="col-sm-5">Side Effects:</dt>
	                                <dd class="col-sm-7"><?= $medicine['side_effects']; ?></dd>

									<dt class="col-sm-5">Dosage:</dt>
	                                <dd class="col-sm-7"><?= $medicine['dosage']; ?></dd>

									<dt class="col-sm-5">Professional:</dt>
	                                <dd class="col-sm-7"><?= $medicine['warning']; ?></dd>
								</dl>
							</div>
							
							<div class="col-md-6">

							</div>


						</div>
						<div class="panel-footer">Medicine Details</div>
					</div>
	            </div>
			</div>
	   	<?php endif; ?>
	<?php endblock() ?>

    <div id="editMedicineModal" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <form class="modal-content" method="post" enctype="multipart/form-data">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Edit Medicine</h4>
                </div>
				<input type='hidden' name="medicine_id" value="<?= $medicine['ID']; ?>" />
				<input type='hidden' name="admin_ulid" value="<?= $_COOKIE['adminID']; ?>" />
                <div class="modal-body">
					<label>Medicine Name:</label>
				    <input class="form-control" class="form-control" type="text" name="name" value="<?= $medicine['name']; ?>" required />
					<label>Generic Name:</label>
					<input class="form-control" type="text" name="generic_name" value="<?= $medicine['generic_name']; ?>" required />
					<label>Brand Name:</label>
					<input class="form-control" type="text" name="brand_name" value="<?= $medicine['brand_name']; ?>" required />
					<label>Overview:</label>
					<textarea class="form-control" name="overview" rows="5" required><?= $medicine['overview']; ?></textarea>
					<label>Side Effects:</label>
					<textarea class="form-control" name="side_effects" rows="5" required><?= $medicine['side_effects']; ?></textarea>
					<label>Recommended Dosage:</label>
					<textarea class="form-control" name="dosage" rows="5" required><?= $medicine['dosage']; ?></textarea>
					<label>Warning:</label>
					<textarea class="form-control" name="warning" rows="5" required><?= $medicine['warning']; ?></textarea>
                </div>
                <div class="modal-footer">
                    <button type="submit" name="action" value="update_medicine" class="btn btn-default">Submit</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </form>

        </div>
    </div>
<?php endif; ?>