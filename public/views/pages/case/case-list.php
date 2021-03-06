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
            <?php if($_COOKIE['privilege_level'] != 1): ?>
    		   	<button type="button" class="btn btn-primary btn-md" data-toggle="modal" data-target="#addCaseModal">
                     <span class="glyphicon glyphicon-plus"></span> Add Case
                </button>
            <?php endif; ?>
            <a href="case" class="btn btn-primary btn-md">
                 <span class="glyphicon glyphicon-refresh"></span> Refresh
            </a>

            <button type="button" class="btn btn-primary btn-md" data-toggle="modal" data-target="#printReportsModal">
                 <span class="glyphicon glyphicon-print"></span> Print Reports
            </button>

            <table class="table">
            	<thead>
                    <tr>
                    	<th class="col-md-1">Case ID</th>
                        <th class="col-md-2">Disease Name</th>
                        <th class="col-md-3">Patient Name</th>
                        <th class="col-md-3">Diagnosis</th>
                        <th class="col-md-3">Treatment</th>
                    </tr>
                </thead>
            <?php if(count($cases) == 0): ?>
                <tr>
                    <td colspan="6" style="text-align:center;font-weight:bold;font-size:25px;padding:25px;">No results</td>
                </tr>
            <?php else: ?>
                <?php foreach($cases as $dict): ?>
                    <tr>
                    	<td><a href="case-page?id=<?= $dict['ID'] ?>"><?= $dict['CaseID'] ?></a></td>
                        <td>
                            <?php if($dict['DiseaseID'] != 0): ?>
                                <a href="disease-page?id=<?= $dict['DiseaseID'] ?>">
                            <?php endif; ?>
                                    <?= $dict['disease'] ?>
                            <?php if($dict['DiseaseID'] != 0): ?>
                                </a>
                            <?php endif; ?>
                        </td>
                        <td><a href="patient-page?id=<?= $dict['PatientID'] ?>"><?= returnFullNameFromObject($dict) ?></a></td>
                        <td><?= $dict['diagnosis'] ?></td>
                        <td><?= $dict['treatment'] ?></td>
                    </tr>
                <?php endforeach; ?>
            <?php endif; ?>
                
            </table>
	   <?php endif; ?>
	<?php endblock() ?>

    <?php startblock('modals') ?>
        <div id="addCaseModal" class="modal fade" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <form class="modal-content modal-form" method="post" name="case_form" id="case_form">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <button type="button" class="refresh-button clear-form-button">
                            <span class="glyphicon glyphicon-refresh"></span>
                        </button>
                        <h4 class="modal-title">Add Case</h4>
                    </div>
                        <input type='hidden' name="admin_ulid" value="<?php echo $_COOKIE['adminID']; ?>" />
                        <input type='hidden' name="DiseaseID" value="0" />
                    <div class="modal-body">
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
                                    <button type="button" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown"><span class="dropdown-text" title="Select Symptoms">Select Symptoms</span>&nbsp;&nbsp;&nbsp;&nbsp;<span class="caret"></span></button>
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

                        <label>Disease Name:</label>
                        <input class="form-control"  list="diseases" name="disease" autocomplete="off" required>
                          <datalist id="diseases">
                          </datalist>

                        <label for="diagnosis">Diagnosis:</label>
                        <textarea class="form-control" rows="5" id="diagnosis" name="diagnosis" required></textarea>
                        
                        <label>Prescription:</label>
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="button-group">
                                    <button type="button" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown"><span class="dropdown-text" title="Select Medicine">Select Medicine</span>&nbsp;&nbsp;&nbsp;&nbsp;<span class="caret"></span></button>
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

                        <div id="prescription" style="display:none;">
                            <label>Prescribed Medicine</label>
                            <div id="presc_med" style="margin-left: 10px;">
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn clear-form-button">Clear</button>
                        <button type="submit" id="submit_case" name="action" value="<?= ADD_CASE ?>" class="btn btn-primary">Submit</button>
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
                            <option value='brgy'>Brgy</option>
                        </select><br/>

                        <label>From:</label>
                        <input type="date" name="from_date" required="">

                        <label>To:</label>
                        <input type="date" name="to_date" required=""><br/>
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

                                var fromdate = $('input[name=from_date]').val()
                                url = url + "&from_date=" + fromdate;

                                var todate = $('input[name=to_date]').val()
                                url = url + "&to_date=" + todate;

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
    <?php endblock() ?> 

    <script type="text/javascript">
       //Checkbox functionalities
       var symptoms_loaded_from_disease = 0;
       var triggered = 0;
       var temp_div = $("<div id='temp'>");

	    $('li.dropdown-li').click(function(e) {
            e.stopPropagation();
            e.preventDefault();
            var cb = $(this).find(":checkbox");
            var ischecked = cb.prop('checked');
            cb.prop('checked', !ischecked);
            cb.change();
	    });

	    $(".checkbox-input").change(function (e) {
            e.stopPropagation();
            e.preventDefault();
	        var checked_boxes = $(this).closest('.button-group').find('.checkbox-input:checked');
	        var text = checked_boxes.map(function() {
	            return $(this).next("label").text();
	        }).get();

            var title = $(this).closest('.button-group').find('.dropdown-text').attr('title');
	        $(this).closest('.button-group').find('.dropdown-text').text(text.length > 0 ? text : title);
	     });

        $("input[name='symptom[]']").on('change', function (e, fromdisease = false) {
            e.stopPropagation();
            e.preventDefault();
            var symptoms = case_form["symptom[]"];
            var symptom_count = 0;
            var symlen = symptoms.length;

            var symurlparam = "?";
            if(symlen == undefined){
                if(symptoms.checked){
                    symurlparam += "symptoms[0]=" + symptoms.value;
                    symptom_count++;
                }
            }else{
                var j = 0;
                for (var i=0; i < symlen; i++) {
                    if(symptoms[i].checked){
                        symurlparam += "symptoms[" + j + "]=" + symptoms[i].value + "&";
                        j++;
                        symptom_count++;
                    }
                }

                symurlparam = symurlparam.substring(0, symurlparam.length - 1);
            }

            if(symurlparam.length == 1){
                symurlparam = "";
            }

            if(!fromdisease){
                $("input[name='disease']").val("")
                $.getJSON("/api/diseases" + symurlparam, { get_param: 'value' }, function(data) {
                    $('#diseases').empty();
                    for(var i = 0; i < data.length; i++){
                        
                        $('#diseases').append($('<option>', {
                            id: data[i].ID,
                            value: data[i].name
                        }));
                    }
                });
            }else{
                symptoms_loaded_from_disease--;
            }
         });

        $("input[name='medicine[]']").on('change', function (e, fromdisease = false) {
            e.stopPropagation();
            e.preventDefault();

            var medicine = $("input[name='medicine[]']:checked");
            var medlen = medicine.length;
            
            if(medlen > 0){
                $('#prescription').show();

                console.log ("clearing...");
                if($('#presc_med').length > 0){

                    $('#presc_med').contents().appendTo(temp_div)
                    // temp_div.children('div').each(function (){ //enable if debugging
                    //     console.log("id: " + $(this).get(0).id);
                    // });
                }
                $('#presc_med').empty();

                for (var i=0; i < medlen; i++) {
                    med = medicine[i];
                    
                    var id = med.value;

                    var alreadyAdded = false;
                    console.log("iterating to: " + temp_div.children.length);
                    temp_div.children('div').each(function (){
                        if(id == $(this).get(0).id){
                            console.log("already added!: " + $(this).get(0).id);
                            $('#presc_med').append($(this));
                            alreadyAdded = true;
                            return;
                        }
                    });

                    if(!alreadyAdded){
                        console.log("adding: " + id);
                        var title = med.nextSibling.nextSibling.innerHTML;
                    
                        var div = $("<div class='prescribed' id=" + id + ">");
                        div.append("<label>" + title + "</label><br>");

                        div.append($('<input>', {
                                                            class: 'form-control',
                                                            type: 'hidden',
                                                            name: "presc[" + id + "][id]",
                                                            value: id,
                                                            required: true
                                                        }));
                        div.append($('<input>', {
                                                            class: 'form-control',
                                                            type: 'number',
                                                            name: "presc[" + id + "][amount]",
                                                            placeholder: 'Amount',
                                                            required: true
                                                        }));
                        div.append($('<textarea>', {
                                                            class: 'form-control',
                                                            rows: 4,
                                                            name: "presc[" + id + "][intake]",
                                                            placeholder: 'Signetur',
                                                            required: true
                                                        }));

                        $('#presc_med').append(div);
                    }
                }
                console.log($('#presc_med'))
            }else{
                $('#prescription').hide();
            }

         });

	    $("input[name='disease']").on('input', function (e) {
            console.log("triggered input disease")
            e.preventDefault();
            e.stopPropagation();
		    var val = this.value;
		    var c_id = $("#diseases").find('option[value="' +val + '"]').attr('id');
            $("input[name='DiseaseID']").val(0);
	        $.getJSON("/api/disease?id=" + c_id, { get_param: 'value' }, function(data) {
	        	$("input[name='DiseaseID']").val(data.ID);

                console.log("checked checkboxes: " + $("input[name='symptom[]']:checked").length)

                $("input[name='symptom[]']:checked").prop('checked', false);
	        	$.each(data.symptoms, function(index, value){
                    var cb = $("input[name='symptom[]'][value='" + value.ID + "']");
	        		cb.prop('checked', true);
                    symptoms_loaded_from_disease++;
                    cb.trigger('change', [true]);
	        	});

				$("input[name='medicine[]']:checked").prop('checked', false);
	        	$.each(data.medicine, function(index, value){
                    var cb = $("input[name='medicine[]'][value='" + value.ID + "']");
	        		cb.prop('checked', true);
                    cb.trigger('change', [true]);
	        	});

                var presc_div = $('#presc_med')

                $.each(data.prescription, function(index, value){
                    //get div where input hidden = this id
                    var pdiv = presc_div.find('div#' + value.ID + '.prescribed')
                    var pamnt = pdiv.find('input[type=number]')
                    var psig = pdiv.find('textarea')

                    pamnt.val(value.amount)
                    psig.text(value.intake)
                });

	        	$("textarea[name='diagnosis']").text(data.diagnosis);
	        	$("textarea[name='treatment']").text(data.treatment);
			});
		});

         $("#submit_case").on('click', function () {
            var case_form = document.forms["case_form"];

            var symptoms = case_form["symptom[]"];
            var symptom_count = 0;
            var symlen = symptoms.length;
            if(symlen == undefined){
                if(symptoms.checked)
                    symptom_count++;
            }else{
                for (var i=0; i < symlen; i++) {
                    if(symptoms[i].checked)
                        symptom_count++;
                }
            }

            var medicine = case_form["medicine[]"];
            var prescription_count = 0;
            var medlen = medicine.length;
            if(medlen == undefined){
                if(medicine.checked)
                    prescription_count++;
            }else{
                for (var i=0; i < medlen; i++) {
                    if (medicine[i].checked)
                        prescription_count++;
                }
            }

            if (symptom_count == 0){
                alert("Please add symptoms! ");
                return false;
            }

            if (prescription_count == 0){
                alert("Please add medicine! ");
                return false;
            }
         });

         $('.clear-form-button').click(function(){
            $("input[name='symptom[]']").prop('checked', false);
            $("input[name='symptom[]']").change();
            $("input[name='medicine[]']").prop('checked', false);
            $("input[name='medicine[]']").change();

            $("textarea[name='diagnosis']").text('');
            $("textarea[name='treatment']").text('');   
         });
    </script>
<?php endif; ?>