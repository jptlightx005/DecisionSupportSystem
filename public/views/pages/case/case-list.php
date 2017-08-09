<?php require_once('../../dss-base.php') ?>

<?php
    define('ADD_CASE', 'add_case');
    define('DELETE_CASE', 'delete_case');
?>

<?php if($_SESSION['isLoggedIn']): ?>
	<?php
        if(isset($action)){
            if($action == ADD_CASE){
                $result = addNewCase($_POST);
            }else if($action == DELETE_CASE){
                $result = removeCase($_POST['case_id']);
            }

            if(isset($result)){
                if($result['response'] == 1){
                    showMessage('Success!', $result['message']);
                }else if($result['response'] == 0){
                    showMessage('Failed!', $result['message'], 1);
                }
            }
        }

        $cases = getCaseList($search_text);

        $disease_list = getDiseaseList("");
        $patient_list = getPatientList("");
        $symptom_list = getSymptomList("");
        $medicine_list = getMedicineList("");
    ?>

	<?php startblock('main') ?>
	   <?php if($_COOKIE['privilege_level'] != 0): ?>
		   	<button type="button" class="btn btn-primary btn-md" data-toggle="modal" data-target="#addCaseModal">
                 <span class="glyphicon glyphicon-plus"></span> Add Case
            </button>
            <a href="case" class="btn btn-primary btn-md">
                 <span class="glyphicon glyphicon-refresh"></span> Refresh
            </a>

            <table class="table">
            	<thead>
                    <tr>
                    	<th class="col-md-1">Case ID</th>
                        <th class="col-md-2">Disease Name</th>
                        <th class="col-md-3">Patient Name</th>
                        <th class="col-md-3">Diagnosis</th>
                        <th class="col-md-3">Medication</th>
                    </tr>
                </thead>
            <?php if(count($cases) == 0): ?>
                <tr>
                    <td colspan="6" style="text-align:center;font-weight:bold;font-size:25px;padding:25px;">No results</td>
                </tr>
            <?php else: ?>
                <?php foreach($cases as $dict): ?>
                    <tr>
                    	<td><?= $dict['CaseID'] ?></td>
                        <td><a href="case-page?id=<?= $dict['ID'] ?>"><?= $dict['disease'] ?></a></td>
                        <td><a href="patient-page?id=<?= $dict['PatientID'] ?>"><?= returnFullNameFromObject($dict) ?></a></td>
                        <button type="button" class="btn btn-primary btn-md" data-toggle="modal" data-target="#printReportsModal">
                             <span class="glyphicon glyphicon-print"></span> Print Reports
                        </button>
                        <td><?= $dict['diagnosis'] ?></td>
                        <td><?= $dict['treatment'] ?></td>
                    </tr>
                <?php endforeach; ?>
            <?php endif; ?>
                
            </table>
	   <?php endif; ?>
	<?php endblock() ?>


	<div id="addCaseModal" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <form class="modal-content" method="post" name="case_form" onSubmit="return validateForm()">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Add Case</h4>
                </div>
                    <input type='hidden' name="admin_ulid" value="<?php echo $_COOKIE['adminID']; ?>" />
                <div class="modal-body">
                	<label>Disease Name:</label>
					<input class="form-control"  list="diseases" name="disease" required>
					  <datalist id="diseases">
					  	<?php foreach($disease_list as $dict): ?>
					  		<option id="<?= $dict['ID'] ?>" value="<?= $dict['name'] ?>">
					    <?php endforeach; ?>
					  </datalist>
                	<label>Patient Name:</label>
					<div class="row">
                        <div class="col-md-8">
                            <div style="margin-right:-25px;">
                                <select class="form-control" name="PatientID" required>
                                    <option disabled selected value>Select Patient</option>
                                    <?php foreach($patient_list as $dict): ?>
                                    	<option value="<?= $dict['ID'] ?>"><?= returnFullNameFromObject($dict) ?></option>
                                    <?php endforeach; ?>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <a href="patient" class="btn btn-primary btn-md">Add Patient</a>
                        </div>
                    </div>
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
                    <button type="submit" name="action" value="<?= ADD_CASE ?>" class="btn btn-default">Submit</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </form>

        </div>
    </div>

    <div id="printReportsModal" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Print Reports</h4>
                </div>
                    
                <div class="modal-body">
                    <label>Gender:</label><br/>
                    <select class="form-control" name="filter" required>
                        <option value='age' selected>Age</option>
                        <!-- <option value='diagnosis'>Diagnosis</option> -->
                        <!-- <option value='brgy'>Brgy</option> -->
                    </select>
                </div>

                
                <div class="modal-footer">
                    <button id="printReport" class="btn btn-default btn-md">
                        <span class="glyphicon glyphicon-print"></span> Print
                    </button>
                    <script>
                        $('#printReport').click(function(){

                            var height = screen.height - 100;
                            if(height >= 792)
                                height = 792;
                            var url = '/case-report-print?filter=';
                            var filter = $('select[name=filter]').find(":selected").val()
                            url = url + filter;

                            if(filter != "")
                                window.open(url, '', 'width=900,height='+(height));

                            return false;
                        });
                    </script>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>

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



	    $("input[name='disease']").on('input', function () {
		    var val = this.value;
		    var c_id = $("#diseases").find('option[value="' +val + '"]').attr('id');

	        $.getJSON("/api/disease?id=" + c_id, { get_param: 'value' }, function(data) {
	        	$("input[name='symptom[]']").prop('checked', false);
	        	$.each(data.symptoms, function(index, value){
	        		$("input[name='symptom[]'][value='" + value.ID + "']").prop('checked', true);
	        		$('body').append($('<div>', {
		                text: value.name
		            }));
	        	});
				$("input[name='symptom[]']").change();

				$("input[name='medicine[]']").prop('checked', false);
	        	$.each(data.prescription, function(index, value){
	        		$("input[name='medicine[]'][value='" + value.ID + "']").prop('checked', true);
	        		$('body').append($('<div>', {
		                text: value.name
		            }));
	        	});
				$("input[name='medicine[]']").change();

	        	$("textarea[name='diagnosis']").text(data.diagnosis);
	        	$("textarea[name='treatment']").text(data.treatment);
			});
		});
    </script>
<?php endif; ?>