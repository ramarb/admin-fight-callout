<table class="table table-bordered sortable">
    <thead>
    <tr>
        <th>Category</th>
        <th>Callouts</th>
    </tr>
    </thead>
    <tbody>
        <?php if(isset($reports->result_id) && $reports->result_id->num_rows > 0):?>
            <?php foreach($reports->result() as $index => $value):?>
                <tr>
                    <td><?php echo $value->description?></td>
                    <td><?php echo $value->callout_count?></td>
                </tr>
            <?php endforeach;?>
        <?php endif;?>
    </tbody>
</table>
