



<?php if(isset($callout->result_id->num_rows) && $callout->result_id->num_rows == 1):?>
    <?php $status = array('A' => 'Active','D' => 'Deleted')?>
    <?php $callout = $callout->row()?>

    <span class="d-block bg-primary callout-view-header rounded">
                <?php echo $callout->title; ?>
        <div class="float-md-right">
            <a href="<?php echo base_url("{$_role}/{$controller}/")?>" class="btn btn-sm btn-info">Back</a>
        </div>
    </span>
    <div class="spacer"></div>

    <div class="col-xs-9 callout-detail rounded">
        <div class="row">
            <div class="col-md-4">Title:</div>
            <div class="col-md-4"><?php echo $callout->title?>&nbsp;</div>
        </div>
        <div class="row ">
            <div class="col-md-4">Description:</div>
            <div class="col-md-4"><?php echo $callout->description?></div>
        </div>
        <div class="row">
            <div class="col-md-4">Venue:</div>
            <div class="col-md-4"><?php echo $callout->details_venue?></div>
        </div>
        <div class="row">
            <div class="col-md-4">Category</div>
            <div class="col-md-4"><?php echo $callout->category?></div>
        </div>
        <div class="row">
            <div class="col-md-4">Match Type:</div>
            <div class="col-md-4"><?php echo $callout->match_type?></div>
        </div>
        <div class="row">
            <div class="col-md-4">Created by:</div>
            <div class="col-md-4"><?php echo $callout->full_name?></div>
        </div>
        <div class="row">
            <div class="col-md-4">Broadcast URL:</div>
            <div class="col-md-4"><?php echo $callout->broadcast_url?></div>
        </div>
        <div class="row">
            <div class="col-md-4">Status:</div>
            <div class="col-md-4 status-display"><?php echo $status[$callout->status]?></div>
        </div>
        <div class="row">
            <div class="col-md-4">Total Votes:</div>
            <div class="col-md-4"><?php echo $callout->total_votes?></div>
        </div>
        <div class="row">
            <div class="col-md-4">Total View:</div>
            <div class="col-md-4"><?php echo $callout->total_views?></div>
        </div>
        <div class="row">
            <div class="col-md-4">Schedule:</div>
            <div class="col-md-4"><?php echo date('m/d/Y',strtotime($callout->details_date)).' @ ' .$callout->details_time?></div>
        </div>

    </div>


    <div class="row">
        <div class="col-md-5" style="margin-left: margin-left: 6px;">
            <div class="spacer"></div>
            <div class="float-md-left" style="margin-left: 20px;">
                <input class="checkbox-event" type="checkbox" checked="checked" value="<?php echo $callout->id?>" style="display: none">
                <?php if($callout->status === 'A'):?>
                    <button id="delete-record" class="btn btn-danger">Delete</button>
                <?php else:?>
                    <button id="activate-record" class="btn btn-success">Activate</button>
                <?php endif;?>
                <input type="hidden" class="" id="table_name" placeholder="" name="table" value="callouts">
            </div>
        </div>

    </div>

<?php endif;?>
