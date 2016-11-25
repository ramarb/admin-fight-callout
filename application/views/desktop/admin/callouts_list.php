<?php $status = array('A' => 'Active','D' => 'Deleted')?>
<table class="table table-bordered sortable" id="callout-list">
    <thead>
    <tr>
        <th>Callout</th>
        <th>Description</th>
        <th>Date Created</th>
        <th>Category</th>
        <th>Created By</th>
        <th>Status</th>
        <th></th>
    </tr>
    </thead>
    <tbody>
        <?php if(isset($callouts->result_id) && $callouts->result_id->num_rows > 0):?>
            <?php foreach($callouts->result() as $index => $value):?>
                <tr>
                    <td><a href="<?php echo base_url("{$_role}/{$controller}/detail/{$value->id}")?>"><?php echo $value->fighter_a . ' VS ' . $value->fighter_b?></a></td>
                    <td><?php echo $value->description?></td>
                    <td><?php echo date('m/d/Y',strtotime($value->created_at))?></td>
                    <td><?php echo $value->category?></td>
                    <td><?php echo $value->full_name?></td>
                    <td class="status-display"><?php echo $status[$value->status]?></td>
                    <td style="text-align: center;">
                        <input class="checkbox-event" type="checkbox" value="<?php echo $value->id?>">
                    </td>
                </tr>
            <?php endforeach;?>
        <?php endif;?>
    </tbody>
</table>
<div class="float-md-right">
    <button id="delete-record" class="btn btn-danger">Delete</button>
    <button id="activate-record" class="btn btn-success">Activate</button>
    <input type="hidden" class="" id="table_name" placeholder="" name="table" value="callouts">
</div>

