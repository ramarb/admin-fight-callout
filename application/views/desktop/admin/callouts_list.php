<?php $status = array('A' => 'Active','D' => 'Deleted')?>
<?php //p($callouts->result(),1)?>
<table class="table table-bordered sortable" id="callout-list">
    <thead>
    <tr>
        <th>Callout Title</th>
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
                <?php
                $value->full_name = ((trim($value->full_name) !== '')?$value->full_name:"UNKNOWN");
                $title = "{$value->full_name} CALLS-OUT {$value->fighter_a} & {$value->fighter_b} for a {$value->category} {$value->match_type}"
                ?>
                <tr>
                    <td><a href="<?php echo 'http://app.fightcallout.com/callout/'.$value->id?>" target="_blank" data-toggle="tooltip" title="View detail to app.callout.com site"><?php echo $title;?></a></td>
                    <td><?php echo $value->description?></td>
                    <td><?php echo date('m/d/Y',strtotime($value->created_at))?></td>
                    <td><?php echo $value->category?></td>
                    <td><?php echo $value->full_name?></td>
                    <td class="status-display"><?php echo $status[$value->status]?></td>
                    <td style="text-align: center;">
                        <input class="checkbox-event" type="checkbox" value="<?php echo $value->id?>">
                        <a href="<?php echo base_url("{$_role}/{$controller}/detail/{$value->id}")?>" data-toggle="tooltip" title="Edit Callout Detail">
                            <span class="glyphicon glyphicon-pencil"></span>
                        </a>
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

