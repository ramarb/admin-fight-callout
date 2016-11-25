<h2>
    Create Admin User
    &nbsp;&nbsp;&nbsp;<a class="btn btn-sm btn-primary" href="<?php echo base_url("{$_role}/{$controller}/admin_users")?>">Back</a>
</h2>
<div class="container">
    <form action="<?php echo base_url("{$_role}/{$controller}/validate_create_admin_form")?>" method="post" data-toggle="validator" role="form">

        <div class="form-group row">
            <label for="inputEmail3" class="col-sm-3 col-form-label">First Name</label>
            <div class="col-sm-5">
                <input type="text" name="first_name" value="<?php echo set_value('first_name')?>" class="form-control" id="first_name" placeholder="" required>
            </div>
        </div>

        <div class="form-group row">
            <label for="inputEmail3" class="col-sm-3 col-form-label">Last Name</label>
            <div class="col-sm-5">
                <input type="text" name="last_name" value="<?php echo set_value('last_name')?>" class="form-control" id="last_name" placeholder="" required>
            </div>
        </div>

        <div class="form-group row">
            <label for="inputEmail3" class="col-sm-3 col-form-label">Role</label>
            <div class="col-sm-5">
                <select class="form-control" name="role_id" id="role_id" required>
                    <option value=""></option>
                    <?php if(isset($roles->result_id->num_rows) && $roles->result_id->num_rows > 0):?>
                        <?php foreach($roles->result() as $index => $value):?>
                            <option value="<?php echo $value->id?>"><?php echo $value->description?></option>
                        <?php endforeach;?>
                    <?php endif;?>
                </select>
            </div>
        </div>
        <div class="form-group row">
            <label for="inputEmail3" class="col-sm-3 col-form-label">Email</label>
            <div class="col-sm-5">
                <input type="email" name="email" value="<?php echo set_value('email')?>" class="form-control" id="email" placeholder="" required>
            </div>
        </div>

        <div class="form-group row">
            <label for="inputEmail3" class="col-sm-3 col-form-label">Username</label>
            <div class="col-sm-5">
                <input type="" name="username" value="<?php echo set_value('username')?>" class="form-control" id="username" placeholder="" required>
            </div>
        </div>

        <div class="form-group row">
            <label for="inputEmail3" class="col-sm-3 col-form-label">Password</label>
            <div class="col-sm-5">
                <input type="password" name="password" value="<?php echo set_value('password')?>" class="form-control" id="password" placeholder="" required>
            </div>
        </div>

        <div class="form-group row">
            <div class="offset-sm-3 col-sm-5">
                <input type="checkbox" class="checkbox-event" checked="checked" style="display: none">
                <button type="submit" class="btn btn-primary">Save</button>
            </div>
        </div>
    </form>
</div>

<script type="text/javascript">
    $(document).ready(function(){
        $("#role_id").val('<?php echo set_value('role_id')?>');
    });
</script>