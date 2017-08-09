<?php require_once('../../dss-base.php') ?>

<?php
    define('ADD_DISEASE', 'add_disease');
    define('DELETE_DISEASE', 'delete_disease');
?>

<?php if($_SESSION['isLoggedIn']): ?>
	<?php
        if(isset($action)){
            if($action == ADD_DISEASE){
                $result = addNewDisease($_POST);
            }else if($action == DELETE_DISEASE){
                $result = removeDisease($_POST['disease_id']);
            }

            if(isset($result)){
                if($result['response'] == 1){
                    showMessage('Success!', $result['message']);
                }else if($result['response'] == 0){
                    showMessage('Failed!', $result['message'], 1);
                }
            }
        }

        $disease = getDiseaseList($search_text);

        $symptom_list = getSymptomList("");
        $medicine_list = getMedicineList("");
    ?>
	<?php startblock('main') ?>
	   <?php if($_COOKIE['privilege_level'] != 0): ?>
            <?php if($_COOKIE['privilege_level'] != 1): ?>
		   	<button type="button" class="btn btn-primary btn-md" data-toggle="modal" data-target="#addDiseaseModal">
                 <span class="glyphicon glyphicon-plus"></span> Add Disease
            </button>
            <?php endif; ?>
            <a href="disease" class="btn btn-primary btn-md">
                 <span class="glyphicon glyphicon-refresh"></span> Refresh
            </a>

            <table class="table">
            	<thead>
                    <tr>
                        <th class="col-md-2">Disease Name</th>
                        <th class="col-md-6">Diagnosis</th>
                        <th class="col-md-4">Medication</th>
                    </tr>
                </thead>
            <?php if(count($disease) == 0): ?>
                <tr>
                    <td colspan="6" style="text-align:center;font-weight:bold;font-size:25px;padding:25px;">No results</td>
                </tr>
            <?php else: ?>
                <?php foreach($disease as $dict): ?>
                    <tr>
                        <td><a href="disease-page?id=<?= $dict['ID'] ?>"><?= $dict['name'] ?></a></td>
                        <td><?= $dict['diagnosis'] ?></td>
                        <td><?= $dict['treatment'] ?></td>
                    </tr>
                <?php endforeach; ?>
            <?php endif; ?>
                
            </table>
	   <?php endif; ?>
	<?php endblock() ?>

	<div id="addDiseaseModal" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <form class="modal-content" method="post" name="case_form" onSubmit="return validateForm()">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Add Disease</h4>
                </div>
                    <input type='hidden' name="admin_ulid" value="<?php echo $_COOKIE['adminID']; ?>" />
                <div class="modal-body">
					<label>Disease Name:</label>
					<input class="form-control" type="text" name="name" required/>

					<label>Symptoms:</label>
                    <div class="row">
                        <div class="col-lg-12">
                        	<div class="button-group">
                                <button type="button" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown"><span class="dropdown-text">Select Symptoms</span>&nbsp;&nbsp;&nbsp;&nbsp;<span class="caret"></span></button>
                                <ul class="dropdown-menu" id="symptom-ul">
                                    <?php foreach($symptom_list as $dict): ?>
                                    <li class="dropdown-li">
                                        <a class="small" style="cursor:hand;" tabIndex="-1">
                                            <input class="checkbox-input" type="checkbox" name="symptom[]" value="<?= $dict["ID"] ?>" />&nbsp;<label><?= $dict["name"] ?></label>
                                        </a>
                                        
                                    </li>
                                   	<?php endforeach; ?>
                                </ul>
                                <a href="symptoms" class="btn btn-primary btn-md">Add Symptom</a>
                            </div>
                        </div>
                    </div>

                    <label for="diagnosis">Diagnosis:</label>
                    <textarea class="form-control" rows="5" id="diagnosis" name="diagnosis" required></textarea>
                    
                    <label>Prescription:</label>
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="button-group">
                                <button type="button" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown"><span class="dropdown-text">Select Medicine</span>&nbsp;&nbsp;&nbsp;&nbsp;<span class="caret"></span></button>
                                <ul class="dropdown-menu" id="medicine-ul">
                                    <?php foreach($medicine_list as $dict): ?>
                                    <li class="dropdown-li">
                                        <a class="small" style="cursor:hand;" tabIndex="-1">
                                            <input class="checkbox-input" type="checkbox" name="medicine[]" value="<?= $dict["ID"] ?>" />&nbsp;<label><?= $dict["name"] ?></label>
                                        </a>
                                        
                                    </li>
                                   	<?php endforeach; ?>
                                </ul>
                                <a href="medicine" class="btn btn-primary btn-md">Add Medicine</a>
                            </div>
                        </div>
                    </div>
                    <label for="medication">Medication:</label>
                    <textarea class="form-control" rows="5" id="medication" name="treatment" required></textarea>
                </div>
                <div class="modal-footer">
                    <button type="submit" name="action" value="<?= ADD_DISEASE ?>" class="btn btn-default">Submit</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </form>

        </div>
    </div>

    <script type="text/javascript">
       //Checkbox functionalities
	    $('li.dropdown-li').click(
	        function() {
	            var cb = $(this).find(":checkbox")[0];

	            if (!$(cb).attr("checked")) {
	                $(cb).attr("checked", "checked");
	            } else {
	                $(cb).removeAttr("checked");
	            }
	            $(cb).trigger('change');
	        }
	    );

	    $(".checkbox-input").change(function () {
	        var checked_boxes = $(this).closest('.button-group').find('.checkbox-input:checked');
	        var text = checked_boxes.map(function() {
	            return $(this).next("label").text().split(' ').join(',');
	        }).get();

	        $(this).closest('.button-group').find('.dropdown-text').text(text);
	     });

	    $(".dropdown-li").click(function(e){
	        e.stopPropagation();
	    });
    </script>
<?php endif; ?>