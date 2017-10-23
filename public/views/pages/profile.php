<?php require_once('../dss-base.php') ?>

<?php
    define('UPDATE_PROFILE', 'update_profile');
    define('UPDATE_USERNAME', 'update_username');
    define('UPDATE_PASSWORD', 'update_password')
?>

<?php if($_SESSION['isLoggedIn']): ?>
	<?php
        if(isset($action)){
            if($action == UPDATE_PROFILE){
                $result = updateProfile($_POST);
                $account = getProfileByID($_COOKIE['adminID']);

                setcookie('first_name', $account["first_name"], time() + 86400 * 5, "/");
	            setcookie('middle_name', $account["middle_name"], time() + 86400 * 5, "/");
	            setcookie('last_name', $account["last_name"], time() + 86400 * 5, "/");
	            setcookie('privilege_level', $account["privilege_level"], time() + 86400 * 5, "/");
	            setcookie('job', $account["job"], time() + 86400 * 5, "/");
            }else if($action == UPDATE_USERNAME){
                $result = updateUsername($_POST);
				// $url = $_SERVER['REQUEST_URI'];

				// redirectToURL($msg, $url);
				// if($loginsuccess){
				// 	echo "<script>if(!alert('$msg')){window.location.href = '$url';}</script>";
				// 	exit();
				// }else{
				// 	echo "<script>alert('$msg')</script>";
				// }
            }else if($action == UPDATE_PASSWORD){
            	$result = updatePassword($_POST);
            }

            if(isset($result)){
                if($result['response'] == 1){
                    showMessage('Success!', $result['message']);
                }else if($result['response'] == 0){
                    showMessage('Failed!', $result['message'], 1);
                }
            }
        }

        $username = getUsernameByID($_COOKIE['adminID']);
		$profile = getProfileByID($_COOKIE['adminID']);

		$nonce = ulNonce::Create('login');
	?>
	<?php startblock('main') ?>
		<div class="row">
			<h3>Credentials
				<button type="button" class="btn btn-default btn-md" data-toggle="modal" data-target="#editUsernameModal">
					<span class="glyphicon glyphicon-pencil"></span> Change Username
				</button>
				<button type="button" class="btn btn-default btn-md" data-toggle="modal" data-target="#updatePasswordModal">
					<span class="glyphicon glyphicon-pencil"></span> Change Password
				</button>
			</h3>

			<div class="col-md-6">
				<dl class="row">
					<dt class="col-sm-4">Username:</dt>
					<dd class="col-sm-8"><?= $username ?>&nbsp;</dd>
					
					<dt class="col-sm-4">Password:</dt>
					<dd class="col-sm-8">**********</dd>
				</dl>
			</div>
		</div>
		<h3>User Info
			<button type="button" class="btn btn-default btn-md" data-toggle="modal" data-target="#editProfileModal">
				<span class="glyphicon glyphicon-pencil"></span> Edit
			</button>
		</h3>

		<div class="col-md-6">
			<dl class="row">
				<dt class="col-sm-4">First Name:</dt>
				<dd class="col-sm-8"><?php echo $profile['first_name']; ?>&nbsp;</dd>
				
				<dt class="col-sm-4">Middle Name:</dt>
				<dd class="col-sm-8"><?php echo $profile['middle_name']; ?>&nbsp;</dd>
												
				<dt class="col-sm-4">Last Name:</dt>
				<dd class="col-sm-8"><?php echo $profile['last_name']; ?>&nbsp;</dd>

				<dt class="col-sm-4">Gender:</dt>
				<dd class="col-sm-8"><?php echo $profile['gender']; ?>&nbsp;</dd>

				<dt class="col-sm-4">Date of Birth:</dt>
				<dd class="col-sm-8"><?php
					if(isset($profile["date_of_birth"]))
						$newDate = date("F j, Y", strtotime($profile["date_of_birth"]));
					else
						$newDate = "";
					echo $newDate; 
				?>&nbsp;</dd>
				
				<dt class="col-sm-4">Email:</dt>
				<dd class="col-sm-8"><?php echo $profile['email']; ?>&nbsp;</dd>

				<dt class="col-sm-4">Job:</dt>
				<dd class="col-sm-8"><?php echo $profile['job']; ?>&nbsp;</dd>
				
				<dt class="col-sm-4">Address:</dt>
				<dd class="col-sm-8"><?php echo $profile['address']; ?>&nbsp;</dd>
				
				<dt class="col-sm-4">Contact No:</dt>
				<dd class="col-sm-8"><?php echo $profile['contact_no']; ?>&nbsp;</dd>

			</dl>
		</div>
	<?php endblock() ?>

 	<div id="editUsernameModal" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <form class="modal-content" method="post">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Edit Your Username</h4>
                </div>
				<input type='hidden' name="UL_ID" value="<?php echo $_COOKIE['adminID']; ?>" />
				<input type="hidden" id="nonce" name="nonce" value="<?= $nonce; ?>">
                <div class="modal-body">
					<label>Current Username:</label>
				    <input class="form-control" type="text" name="old_usrn" required />
				    <label>New Username:</label>
				    <input class="form-control" type="text" name="new_usrn" required />
                    <label>Confirm Password:</label>
				    <input class="form-control" type="password" name="pssw" />
                </div>
                <div class="modal-footer">
                    <button type="submit" name="action" value="<?= UPDATE_USERNAME ?>" class="btn btn-default">Submit</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </form>

        </div>
    </div>

	<div id="updatePasswordModal" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <form class="modal-content" method="post">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Update Your Password</h4>
                </div>
				<input type='hidden' name="UL_ID" value="<?php echo $_COOKIE['adminID']; ?>" />
				<input type="hidden" id="nonce" name="nonce" value="<?= $nonce; ?>">
				<input type="hidden" id="usrn" name="usrn" value="<?= $username ?>">
                <div class="modal-body">
					<label>Old Password:</label>
				    <input class="form-control" type="password" name="old_pssw" required />
				    <label>New Password:</label>
				    <input class="form-control" type="password" name="new_pssw" required />
                    <label>Confirm Password:</label>
				    <input class="form-control" type="password" name="conf_pssw" />
                </div>
                <div class="modal-footer">
                    <button type="submit" name="action" value="<?= UPDATE_PASSWORD ?>" class="btn btn-default">Submit</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </form>

        </div>
    </div>
	 <div id="editProfileModal" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <form class="modal-content" method="post">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Edit Your Profile</h4>
                </div>
				<input type='hidden' name="UL_ID" value="<?php echo $_COOKIE['adminID']; ?>" />
                <div class="modal-body">
					<label>First Name:</label>
				    <input class="form-control" type="text" name="first_name" value='<?= $profile['first_name']; ?>' required />
                    <label>Middle Name:</label>
				    <input class="form-control" type="text" name="middle_name" value='<?= $profile['middle_name']; ?>' />
					<label>Last Name:</label>
				    <input class="form-control" type="text" name="last_name"  value='<?= $profile['last_name']; ?>' required />

                    <label>Gender:</label><br/>
                    <select class="form-control" name="gender" required>
                        <option disabled selected value>Select Gender</option>
                        <?php 
                            $gender = $profile['gender'];
                        ?>
                        <option value='Male' <?php if($gender == 'Male') echo 'selected'; ?>>Male</option>
                        <option value='Female' <?php if($gender == 'Female') echo 'selected'; ?>>Female</option>
                    </select>

                    <label>Email:</label>
				    <input class="form-control" type="email" name="email"  value='<?php echo $profile['email']; ?>' required />

					<label>Date of Birth:</label>
                    <input class="form-control" type='date' name='date_of_birth' value="<?php echo $profile['date_of_birth']; ?>" required />

                    <label>Job:</label>
                    <input class="form-control" type="text" name="job" value="<?php echo $profile['job']; ?>" required />
					<label>Address:</label>
                    <input class="form-control" type="text" name="address" value="<?php echo $profile['address']; ?>" />
                    <label>Contact No:</label>
                    <input class="form-control" type="text" name="contact_no" value="<?php echo $profile['contact_no']; ?>" />

                </div>
                <div class="modal-footer">
                    <button type="submit" name="action" value="<?= UPDATE_PROFILE ?>" class="btn btn-default">Submit</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </form>

        </div>
    </div>
<?php endif; ?>