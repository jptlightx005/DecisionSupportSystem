<?php require_once('../../dss-base.php') ?>

<?php
    define('UPDATE_CASE', 'update_case');
    define('DELETE_CASE', 'delete_case');
?>

<?php if($_SESSION['isLoggedIn']): ?>
	<?php
        if(isset($action)){
            if($action == UPDATE_CASE){
                $result = updateCase($_POST);
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
	    	redirectToURL("", "/case?search_text=$search_text", 0);
	    	exit();
	    }

        if(!isset($_GET['id'])){
	    	exit();
	    }

        $case = getCaseInfo($_GET['id']);
    ?>
    <?php startblock('main') ?>
    	<?php if($_COOKIE['privilege_level'] != 0): ?>
	   		<div class="main">
	            <div class="row">
	                <a href="disease" class="btn btn-default btn-md">
	                    <span class="glyphicon glyphicon-arrow-left"></span> Back
	                </a>
	                <?php
	                  $relative = "/case-print?id={$case['ID']}";
	                  $onclick = "return printPopupWindow('$relative');";
	                ?>
	                <button onclick="<?php echo $onclick; ?>" class="btn btn-default btn-md">
	                    <span class="glyphicon glyphicon-print"></span> Print Case
	                </button>
	                <?php
	                  $relative = "/prescription-print?id={$case['ID']}";
	                  $onclick = "return printPopupWindow('$relative');";
	                ?>
	                <button onclick="<?php echo $onclick; ?>" class="btn btn-default btn-md">
	                    <span class="glyphicon glyphicon-print"></span> Print Prescription
	                </button>
					<form method="post" style="display:inline;" action="case">
		                <input type='hidden' name="admin_uid" value="<?php echo $_COOKIE['adminID']; ?>" />
		                <input type='hidden' name="case_id" value="<?= $case['ID']; ?>" />
		                <button title="Remove Case" id="delete" type="submit" class="btn btn-default btn-md" name="action" value="<?= DELETE_CASE ?>" onclick="return confirm('Are you sure you want to delete this record?');">
		                    <span class="glyphicon glyphicon-remove"></span> Remove
		                </button>
		            </form>
	            </div>
	            <br>
	           <div class="row">
					<div class="panel panel-info">
						<div class="panel-heading"><h3>Case Details</h3></div>
						<div class="panel-body">
							<div class="col-md-6">
								<dl class="row">
	                                <dt class="col-sm-5">Case ID:</dt>
	                                <dd class="col-sm-7"><?= returnSpaceIfBlank($case["CaseID"]) ?></dd>

									<dt class="col-sm-5">Disease Name:</dt>
	                                <dd class="col-sm-7"><?php echo $case["disease"] ?></dd>

	                                <dt class="col-sm-5">Patient:</dt>
                                	<dd class="col-sm-7"><a href='patient-page?id=<?= $case["PatientID"] ?>'>
                                		<?=  returnFullNameFromObject($case) ?></a>
                                	</dd>
									
	                                <dt class="col-sm-5">Symptoms:</dt>
	                                <dd class="col-sm-7"><?php
	    $symptoms = "";
	    foreach($case["symptoms"] as $symptom){
	        $symptoms .= "<a href='symptom-page?id={$symptom["ID"]}'>{$symptom["name"]}</a>, ";
	    }
	    echo returnSpaceIfBlank(substr($symptoms, 0, strlen($symptoms) - 2));
	                                    ?></dd>

	                                <dt class="col-sm-5">Diagnosis</dt>
	                                <dd class="col-sm-7"><?php echo $case["diagnosis"]; ?></dd>

	                                <dt class="col-sm-5">Prescribed Medicine:</dt>
	                                <dd class="col-sm-7"><?php
	    $medicines = "";
	    foreach($case["prescription"] as $medicine){
	        $medicines .= "<a href='medicine-page?id={$medicine["ID"]}'>{$medicine["name"]}</a>, ";
	    }
	    echo returnSpaceIfBlank(substr($medicines, 0, strlen($medicines) - 2));
	                                    ?></dd>

	                                <dt class="col-sm-5">Medication:</dt>
	                                <dd class="col-sm-7"><?php echo $case["treatment"]; ?></dd>
								</dl>
							</div>
							
							<div class="col-md-6">

							</div>


						</div>
						<div class="panel-footer">Case Details</div>
					</div>
	            </div>
			</div>
	   	<?php endif; ?>
    <?php endblock() ?>
<?php endif; ?>