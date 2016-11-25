<div class="row" style="margin: auto; width: 800px; margin-top: 30px">
    <div class="col-md-10">
        <?php if($alert_type != ''):?>
            <?php $this->load->view('desktop/common/alert',array('alert_type'=>$alert_type,'alert_message'=>$alert_message))?>
        <?php endif;?>

        <h1>Login</h1>
        <div class="container">
            <form class="" action="<?php echo base_url('login/validate_login')?>" method="post">
                <div class="form-group row">
                    <label for="inputEmail3" class="col-sm-2 col-form-label">Username</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="email" id="inputEmail3" placeholder="Email/Username" value="<?php echo set_value('email') ?>">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="inputPassword3" class="col-sm-2 col-form-label">Password</label>
                    <div class="col-sm-10">
                        <input type="password" class="form-control" name="password" id="inputPassword3" placeholder="Password" value="<?php echo set_value('password') ?>">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="inputPassword3" class="col-sm-2 col-form-label">&nbsp;</label>
                    <div class="col-sm-10">
                        <button class="btn btn-primary" type="submit">Submit</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>







