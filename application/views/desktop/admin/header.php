<?php $this->load->view('desktop/common/top_header')?>

<div class="row content">
    <div class="col-sm-3 sidenav">
        <div class="spacer"></div>
        <div class="list-group">
            <a href="#" id="user-menu" class="list-group-item active collapsible" status="1">
                Callouts
            </a>
            <a href="<?php echo base_url($_role.'/callouts')?>" id="child-callouts" class="list-group-item list-group-item-action child">Callouts</a>
            <a href="<?php echo base_url($_role.'/callouts/report')?>" id="child-report" class="list-group-item list-group-item-action child">Reports</a>

        </div>

        <div class="list-group" status="1">
            <a href="#" class="list-group-item active collapsible" status="1">
                Data Management
            </a>
            <a href="<?php echo base_url($_role.'/callouts/categories')?>" id="child-categories" class="list-group-item list-group-item-action child">Sports Categories</a>
            <a href="<?php echo base_url($_role.'/callouts/roles')?>" id="child-roles" class="list-group-item list-group-item-action child">Roles</a>
        </div>

        <div class="list-group">
            <a href="#" class="list-group-item active collapsible" status="1">
                User Management
            </a>
            <a href="<?php echo base_url($_role.'/callouts/users')?>" id="child-users" class="list-group-item list-group-item-action child">App Users</a>
            <a href="<?php echo base_url($_role.'/callouts/admin_users')?>" id="child-users" class="list-group-item list-group-item-action child">Admin Users</a>
        </div>

        <div class="list-group">
            <a href="#" class="list-group-item active collapsible" status="1">
                Settings
            </a>
            <a href="<?php echo base_url($_role.'/callouts/change_password')?>" id="child-change_password" class="list-group-item list-group-item-action child">Change Password</a>
        </div>

    </div>

    <div class="col-sm-9">
        <?php if($alert_type != ''):?>
            <div class="spacer"></div>
            <?php $this->load->view('desktop/common/alert',array('alert_type'=>$alert_type,'alert_message'=>$alert_message))?>
        <?php endif;?>
        <div class="spacer"></div>
        <?php echo $main_content?>
    </div>
</div>
