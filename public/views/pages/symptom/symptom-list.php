<?php require_once('../../dss-base.php') ?>
<?php
    define('ADD_SYMPTOM', 'add_symptom');
    define('DELETE_SYMPTOM', 'delete_symptom');
?>
<?php if($_SESSION['isLoggedIn']): ?>
	<?php
        if(isset($action)){
            if($action == ADD_SYMPTOM){
                $result = addNewSymptom($_POST);
            }else if($action == DELETE_SYMPTOM){
                $result = removeSymptom($_POST['symptom_id']);
            }

            if(isset($result)){
                if($result['response'] == 1){
                    showMessage('Success!', $result['message']);
                }else if($result['response'] == 0){
                    showMessage('Failed!', $result['message'], 1);
                }
            }
        }

        $symptoms = getSymptomList($search_text);
    ?>
	<?php startblock('main') ?>
	   <?php if($_COOKIE['privilege_level'] != 0): ?>
            <?php if($_COOKIE['privilege_level'] != 1): ?>
		   	<button type="button" class="btn btn-primary btn-md" data-toggle="modal" data-target="#addSymptomModal">
                 <span class="glyphicon glyphicon-plus"></span> Add Symptom
            </button>
            <?php endif; ?>
            <a href="symptoms" class="btn btn-primary btn-md">
                 <span class="glyphicon glyphicon-refresh"></span> Refresh
            </a>

            <table class="table">
            	<thead>
                    <tr>
                        <th>Symptom</th>
                        <th>Description</th>
                    </tr>
                </thead>
            <?php if(count($symptoms) == 0): ?>
                <tr>
                    <td colspan="6" style="text-align:center;font-weight:bold;font-size:25px;padding:25px;">No results</td>
                </tr>
            <?php else: ?>
                <?php foreach($symptoms as $dict): ?>
                    <tr>
                        <td><a href="symptom-page?id=<?= $dict['ID'] ?>"><?= $dict['name'] ?></a></td>
                        <td><?= $dict['description'] ?></td>
                    </tr>
                <?php endforeach; ?>
            <?php endif; ?>
                
            </table>
	   <?php endif; ?>
	<?php endblock() ?>

    <?php startblock('modals') ?>
        <div id="addSymptomModal" class="modal fade" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <form class="modal-content modal-form" method="post">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <button type="button" class="refresh-button clear-form-button">
                            <span class="glyphicon glyphicon-refresh"></span>
                        </button>
                        <h4 class="modal-title">Add Symptom</h4>
                    </div>
                    <input type='hidden' name="admin_ulid" value="<?php echo $_COOKIE['adminID']; ?>" />
                    <div class="modal-body">
                        <label>Symptom Name:</label>
                        <input class="form-control" type="text" name="name" required />
                        <label>Description:</label>
                        <textarea class="form-control" rows="5" name="description" required></textarea>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn clear-form-button">Clear</button>
                        <button type="submit" name="action" value="<?= ADD_SYMPTOM ?>" class="btn btn-default">Submit</button>
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </form>

            </div>
        </div>
    <?php endblock() ?>
<?php endif; ?>