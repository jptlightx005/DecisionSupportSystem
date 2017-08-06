<?php require_once('../../dss-base.php') ?>

<?php
    define('UPDATE_SYMPTOM', 'update_symptom');
    define('DELETE_SYMPTOM', 'delete_symptom');
?>

<?php if($_SESSION['isLoggedIn']): ?>
	<?php 
		if(isset($action)){
            if($action == UPDATE_SYMPTOM){
                $result = updateSymptom($_POST);
            }
        }
		if($search_text != ""){
	    	redirectToURL("", "/patient?search_text=$search_text", 0);
	    	exit();
	    }

        if(!isset($_GET['id'])){
	    	exit();
	    }

	    $symptom = getSymptomInfo($_GET['id']);
	?>
	<?php startblock('main') ?>
	   	<?php if($_COOKIE['privilege_level'] != 0): ?>
	   		<div class="main">
	            <div class="row">
	                <a href="symptoms" class="btn btn-default btn-md">
	                    <span class="glyphicon glyphicon-arrow-left"></span> Back
	                </a>
	                <?php
	                  $relative = "/symptom=print?id={$symptom['ID']}";
	                  $onclick = "return printPopupWindow('$relative');";
	                ?>
	                <button onclick="<?php echo $onclick; ?>" class="btn btn-default btn-md">
	                    <span class="glyphicon glyphicon-print"></span> Print Symptom
	                </button>
					<button type="button" class="btn btn-default btn-md" data-toggle="modal" data-target="#editSymptomModal">
	                    <span class="glyphicon glyphicon-pencil"></span> Edit
	                </button>
					<form method="post" style="display:inline;" action="symptoms">
		                <input type='hidden' name="admin_uid" value="<?php echo $_COOKIE['adminID']; ?>" />
		                <input type='hidden' name="symptom_id" value="<?= $symptom['ID']; ?>" />
		                <button title="Remove Symptom" id="delete" type="submit" class="btn btn-default btn-md" name="action" value="<?= DELETE_SYMPTOM ?>" onclick="return confirm('Are you sure you want to delete this record?');">
		                    <span class="glyphicon glyphicon-remove"></span> Remove
		                </button>
		            </form>
	            </div>
	            <br>
	            <div class="row" id="patient_record">
		   			<div class="panel panel-info">
						<div class="panel-heading"><h3>Symptom Record</h3></div>
						<div class="panel-body">
							<div class="col-md-6">
								<dl class="row">
									<dt class="col-sm-5">Symptom Name:</dt>
	                                <dd class="col-sm-7"><?php echo $symptom['name']; ?></dd>

									<dt class="col-sm-5">Description:</dt>
	                                <dd class="col-sm-7"><?php echo $symptom['description']; ?></dd>
								</dl>
							</div>
						</div>
					</div>
				</div>
			</div>
	   	<?php endif; ?>
	<?php endblock() ?>

	<div id="editSymptomModal" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <form class="modal-content" method="post">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Edit Symptom</h4>
                </div>
                <input type='hidden' name="symptom_id" value="<?= $symptom['ID']; ?>" />
				<input type='hidden' name="admin_ulid" value="<?= $_COOKIE['adminID']; ?>" />
                <div class="modal-body">
					<label>Symptom Name:</label>
				    <input class="form-control" type="text" name="name" value="<?= $symptom['name']; ?>" required />
                    <label>Description:</label>
				    <textarea class="form-control" rows="5" name="description" required><?= $symptom['description']; ?></textarea>
                </div>
                <div class="modal-footer">
                    <button type="submit" name="action" value="<?= UPDATE_SYMPTOM ?>" class="btn btn-default">Submit</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </form>

        </div>
    </div>
<?php endif; ?>