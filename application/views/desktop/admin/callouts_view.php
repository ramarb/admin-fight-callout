

<div class="container">
    <?php if(isset($callout->result_id->num_rows) && $callout->result_id->num_rows == 1):?>
        <?php $status = array('A' => 'Active','D' => 'Deleted')?>
        <?php $callout = $callout->row()?>

        <span class="d-block bg-primary callout-view-header rounded">
                <?php echo $callout->fighter_a . ' VS ' . $callout->fighter_b?>
            <div class="float-md-right">
                <a href="<?php echo base_url("{$_role}/{$controller}/")?>" class="btn btn-sm btn-info">Back</a>
            </div>
        </span>
    <div class="spacer"></div>

    <form action="<?php echo base_url("{$_role}/{$controller}/validate_update_callout_form")?>" method="post" data-toggle="validator" role="form">
        <input type="hidden" name="callout_id" value="<?php echo set_value('title',$callout->id)?>" class="form-control" id="callout_id" placeholder="" >
        <div class="form-group row">
            <label for="inputEmail3" class="col-sm-3 col-form-label">Title:</label>
            <div class="col-sm-5">
                <input type="text" name="title" value="<?php echo set_value('title',$callout->title)?>" class="form-control" id="title" placeholder="" >
            </div>
        </div>
        <div class="form-group row">
            <label for="inputEmail3" class="col-sm-3 col-form-label">Description:</label>
            <div class="col-sm-5">
                <input type="text" name="callout_description" value="<?php echo set_value('description',$callout->description)?>" class="form-control" id="callout_description" placeholder="" >
            </div>
        </div>
        <div class="form-group row">
            <label for="inputEmail3" class="col-sm-3 col-form-label">Fighter A:</label>
            <div class="col-sm-5">
                <input type="text" name="fighter_a" value="<?php echo set_value('fighter_a',$callout->fighter_a)?>" class="form-control" id="fighter_a" placeholder="" >
            </div>
        </div>
        <div class="form-group row">
            <label for="inputEmail3" class="col-sm-3 col-form-label">Fighter B:</label>
            <div class="col-sm-5">
                <input type="text" name="fighter_b" value="<?php echo set_value('fighter_b',$callout->fighter_b)?>" class="form-control" id="fighter_b" placeholder="" >
            </div>
        </div>
        <div class="form-group row">
            <label for="inputEmail3" class="col-sm-3 col-form-label">Venue</label>
            <div class="col-sm-5">
                <input type="text" name="details_venue" value="<?php echo set_value('details_venue',$callout->details_venue)?>" class="form-control" id="details_venue" placeholder="" >
            </div>
        </div>
        <div class="form-group row">
            <?php
            if(trim($callout_category_id) > 0){
                $callout->category_id = $callout_category_id;
            }
            ?>
            <label for="inputEmail3" class="col-sm-3 col-form-label">Category</label>
            <div class="col-sm-5">
                <?php if($categories->result_id->num_rows > 0):?>
                    <select class="form-control" id="callout_category_id" name="callout_category_id">
                    <?php foreach($categories->result() as $index => $values):?>
                        <option <?php echo(($values->id === $callout->category_id)?'selected="selected"':'')?> value="<?php echo $values->id?>"><?php echo $values->description?></option>
                    <?php endforeach;?>
                    </select>
                <?php endif;?>

            </div>
        </div>
        <div class="form-group row">
            <label for="inputEmail3" class="col-sm-3 col-form-label">Match Type:</label>
            <div class="col-sm-5">
                <input type="text" name="match_type" value="<?php echo set_value('match_type',$callout->match_type)?>" class="form-control" id="match_type" placeholder="" >
            </div>
        </div>
        <div class="form-group row">
            <label for="inputEmail3" class="col-sm-3 col-form-label">Broadcast URL:</label>
            <div class="col-sm-5">
                <input type="text" name="broadcast_url" value="<?php echo set_value('broadcast_url',$callout->broadcast_url)?>" class="form-control" id="broadcast_url" placeholder="" >
            </div>
        </div>
        <div class="form-group row">
            <label for="inputEmail3" class="col-sm-3 col-form-label">Schedule:</label>
            <div class="col-sm-5">
                <input type="date" name="details_date" value="<?php echo set_value('details_date',$callout->details_date)?>" class="form-control" id="details_date" placeholder="" >
            </div>
        </div>
        <div class="form-group row">
            <label for="inputEmail3" class="col-sm-3 col-form-label">Time:</label>
            <div class="col-sm-5">
                <input type="time" name="details_time" value="<?php echo set_value('details_time',$callout->details_time)?>" class="form-control" id="details_time" placeholder="" >
            </div>
        </div>
        <div class="form-group row">
            <label for="inputEmail3" class="col-sm-3 col-form-label">Created By:</label>
            <div class="col-sm-5">
                <input type="text" name="full_name" value="<?php echo set_value('full_name',$callout->full_name)?>" class="form-control" id="full_name" placeholder="" disabled>
            </div>
        </div>
        <div class="form-group row">
            <label for="inputEmail3" class="col-sm-3 col-form-label">Total Votes:</label>
            <div class="col-sm-5">
                <input type="text" name="total_votes" value="<?php echo set_value('total_votes',$callout->total_votes)?>" class="form-control" id="total_votes" placeholder="" disabled>
            </div>
        </div>
        <div class="form-group row">
            <label for="inputEmail3" class="col-sm-3 col-form-label">Total View:</label>
            <div class="col-sm-5">
                <input type="text" name="total_views" value="<?php echo set_value('total_views',$callout->total_views)?>" class="form-control" id="total_views" placeholder="" disabled>
            </div>
        </div>
        <div class="form-group row">
            <label for="inputEmail3" class="col-sm-3 col-form-label">Status</label>
            <div class="col-sm-5">
                <input type="text" name="status" value="<?php echo set_value('',$status[$callout->status])?>" class="form-control status-display" id="status" placeholder="" disabled>
            </div>
        </div>

        <div class="form-group row">
            <label for="inputEmail3" class="col-sm-3 col-form-label">Log:</label>
            <div class="col-sm-7">
                <input type="text" name="status" value="<?php echo $callout->editors_detail?>" class="form-control status-display" id="status" placeholder="" disabled>
            </div>

        </div>

        <div class="form-group row">
            <div class="offset-sm-3 col-sm-5">

                <input class="checkbox-event" type="checkbox" checked="checked" value="<?php echo $callout->id?>" style="display: none">
                <button type="submit" class="btn btn-primary">Save</button>
                <?php if($callout->status === 'A'):?>
                    <button type="button" id="delete-record" class="btn btn-danger">Delete</button>
                <?php else:?>
                    <button type="button" id="activate-record" class="btn btn-success">Activate</button>
                <?php endif;?>
                <input type="hidden" class="" id="table_name" placeholder="" name="table" value="callouts">
            </div>
        </div>
    </form>
    <?php endif;?>
</div>
<?php if(isset($comments->result_id) && $comments->result_id->num_rows > 0):?>
    <h2>Comments</h2>
    <table class="table table-bordered sortable" id="callout-list">
        <thead>
        <tr>
            <th>User</th>
            <th>Comment</th>
            <th>Date Created</th>
            <th>Date Updated</th>
            <th>Status</th>
            <th>&nbsp;</th>
        </tr>
        </thead>
        <tbody>
            <?php foreach($comments->result() as $index => $values):?>
                <tr>
                    <td><?php echo $values->full_name?></td>
                    <td><?php echo $values->details?></td>
                    <td><?php echo $values->created_at?></td>
                    <td><?php echo $values->updated_at?></td>
                    <td class="status-display"><?php echo $status[$values->status]?></td>
                    <td style="text-align: center;">
                        <input class="checkbox-event comments" data-table="comments" type="checkbox" value="<?php echo $values->id?>">
                    </td>
                </tr>
            <?php endforeach; ?>
        </tbody>
    </table>
    <div class="float-md-right">
        <button id="delete-record-comment" class="btn btn-danger" data-table="comments">Delete</button>
        <button id="activate-record-comment" class="btn btn-success" data-table="comments">Activate</button>
    </div>
<?php endif;?>

