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
                $result = setAsNurse($_POST['UL_ID']);
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
                        <td><?= returnFullNameFromObject($dict) ?></td>
                        <td><?= $dict['job'] ?></td>
                    </tr>
                <?php endforeach; ?>
            <?php endif; ?>
                
            </table>
	    <?php endif; ?>
	<?php endblock() ?>

    <div id="addNurseModal" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <form class="modal-content" method="post" enctype="multipart/form-data">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Add Nurse</h4>
                </div>
                <input type='hidden' name="adminID" value="<?= $_COOKIE['adminID']; ?>" />
                <div class="modal-body">
                    <label>Nurse:</label>
                    <select class="form-control" name="UL_ID" required>
                        <option disabled selected value>Select Account</option>
                        <?php
                            foreach($accounts as $dict){ ?>
                            <option value="<?php echo $dict["UL_ID"]; ?>"><?= returnFullNameFromObject($dict) ?></option>
                        <?php }
                        ?>
                    </select>

                    <label>Account Information</label>
                    <dl class="row">
                        <dt class="col-sm-3">First Name:</dt>
                        <dd class="col-sm-9" id="first_name">&nbsp;</dd>

                        <dt class="col-sm-3">Last Name:</dt>
                        <dd class="col-sm-9" id="last_name">&nbsp;</dd>

                        <dt class="col-sm-3">Gender:</dt>
                        <dd class="col-sm-9" id="gender">&nbsp;</dd>
                        
                        <dt class="col-sm-3">Job:</dt>
                        <dd class="col-sm-9" id="job">&nbsp;</dd>

                        <dt class="col-sm-3">Address:</dt>
                        <dd class="col-sm-9" id="address">&nbsp;</dd>

                        <dt class="col-sm-3">Contact No:</dt>
                        <dd class="col-sm-9" id="contactno">&nbsp;</dd>                    
                    </dl>
                    
                </div>
                <div class="modal-footer">
                    <button type="submit" name="action" value="<?= SET_AS_NURSE ?>" class="btn btn-default">Set as Nurse</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </form>

        </div>
    </div>

    <script>
        $("select[name='UL_ID']").on('change', function () {
            var val = this.value;
            
            $.getJSON("/api/account?id=" + val, { get_param: 'value' }, function(data) {
                $("dd#first_name").text(data.first_name);
                $("dd#last_name").text(data.last_name);
                $("dd#gender").text(data.gender);
                $("dd#job").text(data.job);
                $("dd#address").text(data.address);
                $("dd#contactno").text(data.contact_no);
            });
        });
    </script>
<?php endif; ?>