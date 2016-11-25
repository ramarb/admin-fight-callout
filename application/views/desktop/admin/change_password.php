<h2>Change Password</h2>
<div class="container">
    <form action="<?php echo base_url("{$_role}/{$controller}/validate_changes_password_form")?>" method="post" data-toggle="validator" role="form">
        <div class="form-group row">
            <label for="inputEmail3" class="col-sm-3 col-form-label">Current Password</label>
            <div class="col-sm-5">
                <input type="password" name="old_password" value="<?php echo set_value('old_password')?>" class="form-control" id="inputPassword1" placeholder="" required>
            </div>
        </div>
        <div class="form-group row">
            <label for="inputEmail3" class="col-sm-3 col-form-label">New Password</label>
            <div class="col-sm-5">
                <input type="password" name="new_password" value="<?php echo set_value('new_password')?>" class="form-control" id="inputPassword2" placeholder="" required>
            </div>
        </div>
        <div class="form-group row">
            <label for="inputPassword3" class="col-sm-3 col-form-label">Confirm Password</label>
            <div class="col-sm-5">
                <input type="password" name="confirm_password" value="<?php echo set_value('confirm_password')?>" class="form-control" id="inputPassword3" placeholder="" data-match="#inputPassword2" data-match-error="Whoops, these don't match" required>
            </div>
        </div>

        <div class="form-group row">
            <div class="offset-sm-3 col-sm-5">
                <button type="submit" class="btn btn-primary">Save</button>
            </div>
        </div>
    </form>
</div>