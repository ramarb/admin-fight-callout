<?php
/**
 * Created by PhpStorm.
 * User: ramon
 * Date: 11/23/16
 * Time: 11:07 AM
 */?>

<?php $status = array('A' => 'Active','D' => 'Deleted')?>
<table class="table table-bordered user-data-table">
    <thead>
    <tr>
        <th>Name</th>
        <th>Username</th>
        <th>Role</th>
        <th>Sign-up Date</th>
        <th>Status</th>
        <th>&nbsp;</th>
    </tr>
    </thead>
    <tbody>
        <?php if(isset($users->result_id) && $users->result_id->num_rows > 0):?>
            <?php foreach($users->result() as  $index => $values): ?>
                <tr>
                    <td><?php echo $values->full_name?></td>
                    <td><?php echo $values->username?></td>
                    <td><?php echo $values->role?></td>
                    <td><?php echo $values->created_at?></td>
                    <td class="status-display"><?php echo $status[$values->status]?></td>
                    <td align="center">
                        <input type="checkbox" class="checkbox-event" value="<?php echo $values->id?>" />
                    </td>
                </tr>
            <?php endforeach;?>
        <?php endif;?>
    </tbody>
</table>

<div class="float-md-right">
    <button id="delete-record" class="btn btn-danger">Delete</button>
    <button id="activate-record" class="btn btn-success">Activate</button>
    <input type="hidden" class="" id="table_name" placeholder="" name="table" value="users">
</div>