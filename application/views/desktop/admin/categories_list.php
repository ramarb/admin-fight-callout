<?php $status = array('A' => 'Active','D' => 'Deleted')?>
<table class="table table-bordered sortable">
    <thead>
    <tr>
        <th>Category ID</th>
        <th>Description</th>
        <th>Status</th>
        <th>&nbsp;</th>
    </tr>
    </thead>
    <tbody>
    <?php if(isset($categories->result_id) && $categories->result_id->num_rows > 0):?>
        <?php foreach($categories->result() as  $index => $values): ?>
            <tr class="tr-clickable" data-id="<?php echo $values->id?>" data-description="<?php echo $values->description?>" data-status="<?php echo $values->status?>" id="category-<?php echo $values->id?>">
                <td><?php echo $values->id?></td>
                <td><?php echo $values->description?></td>
                <td class="status-display"><?php echo $status[$values->status]?></td>
                <td align="center">
                    <input type="checkbox" class="checkbox-event" value="<?php echo $values->id?>" />
                </td>
            </tr>
        <?php endforeach;?>
    <?php endif;?>
    </tbody>
</table>

<div class="float-lg-left">
    <form class="form-inline" action="<?php echo base_url($_role.'/callouts/save_category_description')?>" method="post">
        <div class="form-group">
            <label class="sr-only" for="exampleInputAmount">Amount (in dollars)</label>
            <div class="input-group">
                <div id="display-id" class="input-group-addon">ID:</div>
                <input type="hidden" class="" id="category_id" placeholder="" name="category_id" value="">
                <input type="hidden" class="" id="table_name" placeholder="" name="table" value="categories">
                <input type="text" class="form-control" id="description" placeholder="" name="description">
                <div class="input-group-addon" id="submit_type" submit-type="Add" >Add</div>
            </div>
        </div>
        <button type="submit" id="add-description" class="btn btn-primary">Submit</button>
    </form>
</div>

<div class="float-md-right">
    <button id="delete-record" class="btn btn-danger">Delete</button>
    <button id="activate-record" class="btn btn-success">Activate</button>
</div>