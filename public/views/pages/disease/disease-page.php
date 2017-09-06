<?php require_once('../../dss-base.php') ?>

<?php
    define('UPDATE_DISEASE', 'update_disease');
    define('DELETE_DISEASE', 'delete_disease');
?>

<?php if($_SESSION['isLoggedIn']): ?>
	<?php
        if(isset($action)){
            if($action == UPDATE_DISEASE){
                $result = updateDisease($_POST);
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
	    	redirectToURL("", "/disease?search_text=$search_text", 0);
	    	exit();
	    }

        if(!isset($_GET['id'])){
	    	exit();
	    }

        $disease = getDiseaseInfo($_GET['id']);
    ?>
    <?php startblock('main') ?>
    	<?php if($_COOKIE['privilege_level'] != 0): ?>
	   		<div class="main">
	            <div class="row">
	                <a href="disease" class="btn btn-default btn-md">
	                    <span class="glyphicon glyphicon-arrow-left"></span> Back
	                </a>
	                <?php
	                  $relative = "/disease-print?id={$disease['ID']}";
	                  $onclick = "return printPopupWindow('$relative');";
	                ?>
	                <button onclick="<?php echo $onclick; ?>" class="btn btn-default btn-md">
	                    <span class="glyphicon glyphicon-print"></span> Print Disease
	                </button>
	                <?php if($_COOKIE['privilege_level'] != 1): ?>
					<form method="post" style="display:inline;" action="disease">
		                <input type='hidden' name="admin_uid" value="<?php echo $_COOKIE['adminID']; ?>" />
		                <input type='hidden' name="disease_id" value="<?= $disease['ID']; ?>" />
		                <button title="Remove Disease" id="delete" type="submit" class="btn btn-default btn-md" name="action" value="<?= DELETE_DISEASE ?>" onclick="return confirm('Are you sure you want to delete this record?');">
		                    <span class="glyphicon glyphicon-remove"></span> Remove
		                </button>
		            </form>
		            <?php endif; ?>
	            </div>
	            <br>
	           <div class="row">
					<div class="panel panel-info">
						<div class="panel-heading"><h3>Disease Details</h3></div>
						<div class="panel-body">
							<div class="col-md-6">
								<dl class="row">
	                                <dt class="col-sm-5">Disease ID:</dt>
	                                <dd class="col-sm-7"><?php echo $disease["ID"] ?></dd>

									<dt class="col-sm-5">Disease Name:</dt>
	                                <dd class="col-sm-7"><?php echo $disease["name"] ?></dd>
									
	                                <dt class="col-sm-5">Symptoms:</dt>
	                                <dd class="col-sm-7"><?php
	    $symptoms = "";
	    foreach($disease["symptoms"] as $symptom){
	        $symptoms .= "<a href='symptom-page?id={$symptom["ID"]}'>{$symptom["name"]}</a>, ";
	    }
	    echo returnSpaceIfBlank(substr($symptoms, 0, strlen($symptoms) - 2));
	                                    ?></dd>

	                                <dt class="col-sm-5">Diagnosis</dt>
	                                <dd class="col-sm-7"><?php echo $disease["diagnosis"]; ?></dd>

	                                <dt class="col-sm-5">Prescribed Medicine:</dt>
	                                <dd class="col-sm-7"><?php
	    $medicines = "";
	    foreach($disease["prescription"] as $medicine){
	        $medicines .= "<a href='medicine-page?id={$medicine["ID"]}'>{$medicine["name"]}</a>, ";
	    }
	    echo returnSpaceIfBlank(substr($medicines, 0, strlen($medicines) - 2));
	                                    ?></dd>

	                                <dt class="col-sm-5">Medication:</dt>
	                                <dd class="col-sm-7"><?php echo $disease["treatment"]; ?></dd>
								</dl>
							</div>
							
							<div class="col-md-6">

							</div>


						</div>
						<div class="panel-footer">Disease Details</div>
					</div>
	            </div>
			</div>
	   	<?php endif; ?>
    <?php endblock() ?>
<?php endif; ?>