<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Fight Callout</title>

    <link href='http://fonts.googleapis.com/css?family=Roboto:300' rel='stylesheet' type='text/css'>

    <?php echo $css_header?>

<?php if($jquery_switch):?>
    <script type="text/javascript" src="<?php echo base_url('assets/js/jquery-1.11.2.min.js')?>"> </script>
<?php endif;?>

    <?php echo $javascripts_header?>
</head>
<body>
<header class="container-fluid">
    <div class="row">
        <div class="col-sm-4">
            <div class="float-lg-left">
                <img style="height: 93px" src="<?php echo base_url('assets/images/new_logo.png')?>" class="rounded">
            </div>
        </div>
        <div class="col-sm-4">
            <div class="container" style="text-align: center">
                <h1 style="padding: 0; margin-top: 14px">Admin Site</h1>
            </div>
        </div>
        <div class="col-sm-4">
            <?php if(isset($login_username)):?>
                <div class="float-md-right welcome-user" style="margin-top: 69px;margin-bottom: 0;" >
                    <span>Howdy <?php echo $login_username?></span>,
                    <a href="<?php echo base_url('login/logout')?>"><strong>Logout</strong></a>
                </div>
            <?php endif;?>
        </div>
    </div>
</header>
<?php if($main_ng_switch){?>
    <div class="container-fluid" ng-app="jobBoard" ng-controller="jobBoardCtrl">
<?php }else{ ?>
    <div class="container-fluid">
<?php } ?>





