/**
 * Created by ramon on 11/23/16.
 */
$(document).ready(function(){
    if(typeof callout_has_comment !== undefined){
        var total_height = ($("#page-content-body").height() + 100) + 'px';
        $("#page-navigation-wrapper").css('height',total_height)
    }

    //
    //alert(total_height);

    $(".status-display:contains('Deleted')").css('color','red');
    $(".status-display:contains('Active')").css('color','green');

    $('.status-display[value="Deleted"]').addClass('red');
    $('.status-display[value="Active"]').addClass('green');

    $('.sortable').DataTable();

    $(".user-data-table").DataTable({"order":[[2,'asc']]});


    /*$(".tr-clickable").on('click',function(){
        $(".tr-clickable").removeClass('active');
        $(this).addClass('active');
        $(this).children('td').last().children('input').trigger('click');

    });*/

    $(".checkbox-event").click(function(){
        //alert($('input:checked').length);

        init_description_form($('input:checked').length,$('input:checked').parent().parent('tr'));

        if($(this).is(':checked')){
            $(this).parent().parent().addClass('active');
        }else{
            $(this).parent().parent().removeClass('active');
        }
    });

    init_description_form($('input:checked').length,$('input:checked').parent().parent('tr'));

    var category_id = 0;
    var description = '';
    var submit_type = 'Add';

    function init_description_form(length, data_selector){

        category_id = 0;
        description = '';
        submit_type = 'Add';

        if(length < 1){
            $('button.btn').addClass('disabled');
        }else{
            $('button.btn').removeClass('disabled');
        }

        if(length===1){
            category_id = data_selector.attr('data-id');
            description = data_selector.attr('data-description');
            submit_type = 'Update';
        }else{
            $('button[type="submit"]').addClass('disabled');
        }

        $("#category_id").val(category_id);
        $("#description").val(description);
        $("#submit_type").attr('submit-type','submit_type');
        $("#submit_type").html(submit_type);
        $("#display-id").html('ID:'+category_id);
    }

    $("#add-description").on('click',function(){
        if($(this).hasClass('disabled') === true){
            e.preventDefault();
        }
    });

    $("#delete-record, #activate-record").on('click',function(){
        if($(this).hasClass('disabled') === false){
            var orig_html = $(this).html();
            var preloader = $("#button-preloader").html();
            var ids = [];
            var url = base_uri + '/update_status';

            $(this).html(preloader);
            $.each($('input:checked'),function(index, value){
                ids.push($(this).val());
            });

            var post = {
                category_ids:ids,
                table_name:$('#table_name').val(),
                status:((orig_html==='Delete')?'D':'A')
            }

            $.post(url,post,function(data){
                location.reload();
            },'json');
        }
    });


    $("#delete-record-comment, #activate-record-comment").on('click',function(){

        var orig_html = $(this).html();
        var preloader = $("#button-preloader").html();
        var ids = [];
        var url = base_uri + '/update_status';


        $.each($('input.comments:checked'),function(index, value){
            ids.push($(this).val());
        });

        if(ids.length > 1){
            $(this).html(preloader);
            var post = {
                category_ids:ids,
                table_name:'comments',
                status:((orig_html==='Delete')?'D':'A')
            }

            $.post(url,post,function(data){
                location.reload();
            },'json');
        }
    });


    $("#description").keyup(function(){
        var description = $(this).val();
        if(description.trim() !== ''){
            $('button[type="submit"]').removeClass('disabled');
        }else{
            $('button[type="submit"]').addClass('disabled');
        }
    });

    $(".collapsible").click(function(e){
        e.preventDefault();
        var parent = this;
        menu_state = $(this).attr('status');
        //alert(1);
        if(menu_state === '1'){
            $(parent).siblings(".child").animate({
                'height': 0,
                'padding-top': 0,
                'padding-bottom': 0
            },500,function(){
                $(parent).attr('status','0');
            });
        }else{
            $(parent).siblings(".child").animate({
                'height': '50px',
                'padding-top': '12px',
                'padding-bottom': '12px'
            },500,function(){
                $(parent).attr('status','1');
            });
        }
    });

    $("#child-" + controller_method).addClass('active-child');

    var menu_state = 1;
    $(document).ready(function(){
        $(".collapsible").click(function(e){
            e.preventDefault();
            var parent = this;
            menu_state = $(this).attr('status');
            //alert(1);
            if(menu_state === '1'){
                $(parent).siblings(".child").animate({
                    'height': 0,
                    'padding-top': 0,
                    'padding-bottom': 0
                },500,function(){
                    $(parent).attr('status','0');
                });
            }else{
                $(parent).siblings(".child").animate({
                    'height': '50px',
                    'padding-top': '12px',
                    'padding-bottom': '12px'
                },500,function(){
                    $(parent).attr('status','1');
                });
            }
        });
    });

});
