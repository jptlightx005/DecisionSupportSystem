<?php require_once('../../dss-base.php') ?>
<?php
    define('ADD_MEDICINE', 'add_medicine');
    define('DELETE_MEDICINE', 'delete_medicine');
?>
<?php if($_SESSION['isLoggedIn']): ?>
	<?php
        if(isset($action)){
            if($action == ADD_MEDICINE){
                $result = addNewMedicine($_POST);
            }else if($action == DELETE_MEDICINE){
                $result = removeMedicine($_POST['medicine_id']);
            }

            if(isset($result)){
                if($result['response'] == 1){
                    showMessage('Success!', $result['message']);
                }else if($result['response'] == 0){
                    showMessage('Failed!', $result['message'], 1);
                }
            }
        }

        $medicine = getMedicineList($search_text);
    ?>
    <?php startblock('main') ?>
	   <?php if($_COOKIE['privilege_level'] != 0): ?>
            <?php if($_COOKIE['privilege_level'] != 1): ?>
		   	<button type="button" class="btn btn-primary btn-md" data-toggle="modal" data-target="#addMedicineModal">
                 <span class="glyphicon glyphicon-plus"></span> Add Medicine
            </button>
            <?php endif; ?>
            <a href="medicine" class="btn btn-primary btn-md">
                 <span class="glyphicon glyphicon-refresh"></span> Refresh
            </a>

            <table class="table">
            	<thead>
                    <tr>
                        <th>Medicine</th>
                        <th>Generic Name</th>
                        <th>Overview</th>
                    </tr>
                </thead>
            <?php if(count($medicine) == 0): ?>
                <tr>
                    <td colspan="6" style="text-align:center;font-weight:bold;font-size:25px;padding:25px;">No results</td>
                </tr>
            <?php else: ?>
                <?php foreach($medicine as $dict): ?>
                    <tr>
                        <td><a href="medicine-page?id=<?= $dict['ID'] ?>"><?= $dict['name'] ?></a></td>
                        <td><?= $dict['generic_name'] ?></td>
                        <td><?= $dict['overview'] ?></td>
                    </tr>
                <?php endforeach; ?>
            <?php endif; ?>
                
            </table>
	   <?php endif; ?>
	<?php endblock() ?>

	<div id="addMedicineModal" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <form class="modal-content" method="post" enctype="multipart/form-data">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Add Medicine</h4>
                </div>
				<input type='hidden' name="admin_ulid" value="<?php echo $_COOKIE['adminID']; ?>" />
                <div class="modal-body">
					<label>Medicine Name:</label>
				    <input class="form-control" class="form-control" type="text" name="name" required />
					<label>Generic Name:</label>
					<input class="form-control" type="text" name="generic_name" required />
					<label>Brand Name:</label>
					<input class="form-control" type="text" name="brand_name" required />
					<label>Overview:</label>
					<textarea class="form-control" name="overview" rows="5" required></textarea>
					<label>Side Effects:</label>
					<textarea class="form-control" name="side_effects" rows="5" required></textarea>
					<label>Recommended Dosage:</label>
					<textarea class="form-control" name="dosage" rows="5" required></textarea>
					<label>Warning:</label>
					<textarea class="form-control" name="warning" rows="5" required></textarea>
                </div>
                <div class="modal-footer">
                    <button type="submit" name="action" value="<?= ADD_MEDICINE ?>" class="btn btn-default">Submit</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </form>

        </div>
    </div>
<?php endif; ?>