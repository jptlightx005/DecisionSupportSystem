<?php require_once('../../dss-base.php') ?>

<?php
    define('SET_AS_NURSE', 'set_as_nurse');
?>

<?php if($_SESSION['isLoggedIn']): ?>
	 <?php if($_COOKIE['privilege_level'] != 2 && $_COOKIE['privilege_level'] != 3): ?>
		<script>
   			showErrorMessage('Access denied', 'Only administrators can access this page.');
   		</script>
		<?php exit() ?>
	<?php endif; ?>

	<?php
        if(isset($action)){
            if($action == SET_AS_NURSE){
                $result = setAsNurse($_POST);
            }

            if(isset($result)){
                if($result['response'] == 1){
                    showMessage('Success!', $result['message']);
                }else if($result['response'] == 0){
                    showMessage('Failed!', $result['message'], 1);
                }
            }
        }

        $nurses = getNurseList($search_text);
        $accounts = getAccountList();
    ?>

	<?php startblock('main') ?>
		<?php printArray($accounts) ?>
	    <?php if($_COOKIE['privilege_level'] == 2 || $_COOKIE['privilege_level'] == 3): ?>
	    	<button type="button" class="btn btn-primary btn-md" data-toggle="modal" data-target="#addNurseModal">
                 <span class="glyphicon glyphicon-plus"></span> Add Nurse
            </button>
            <a href="nurse" class="btn btn-primary btn-md">
                 <span class="glyphicon glyphicon-refresh"></span> Refresh
            </a>

            <table class="table">
            	<thead>
                    <tr>
                        <th>Admin ID</th>
						<th>Admin Name</th>
						<th>Job</th>
                    </tr>
                </thead>
            <?php if(count($nurses) == 0): ?>
                <tr>
                    <td colspan="6" style="text-align:center;font-weight:bold;font-size:25px;padding:25px;">No results</td>
                </tr>
            <?php else: ?>
                <?php foreach($nurses as $dict): ?>
                    <tr>
                    	<td><?= $dict['UL_ID'] ?></td>
                        <td><a href="case-page?id=<?= $dict['ID'] ?>"><?= $dict['disease'] ?></a></td>
                        <td><a href="patient-page?id=<?= $dict['PatientID'] ?>"><?= returnFullNameFromObject($dict) ?></a></td>
                        <td><?= $dict['diagnosis'] ?></td>
                        <td><?= $dict['treatment'] ?></td>
                    </tr>
                <?php endforeach; ?>
            <?php endif; ?>
                
            </table>
	    <?php endif; ?>
	<?php endblock() ?>
<?php endif; ?>