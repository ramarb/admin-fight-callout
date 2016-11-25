<?php
/**
 * Created by PhpStorm.
 * User: ramon
 * Date: 10/19/16
 * Time: 10:46 AM
 */

defined('BASEPATH') OR exit('No direct script access allowed');

class Unit_test extends MY_Controller{

    public function __construct()
    {
        parent::__construct();

        $this->load->model('Files_model','file');
        $this->load->model('Callouts_model','callouts');
    }

    public function index(){
        echo '<h1>Unit Test Controller</h1>';
    }

    public function file_upload(){
        $data = array(
            'index' => 'file',
            'move_to' => '6/images/thumb/'
        );

        if(isset($_FILES['file'])){
            $this->load->library('file_management',$data,'file_u');

            if(count($this->file_u->get_file_uploaded()) > 0){
                $this->file_u->move();
                p($this->file_u->get_result());
            }
        }

        //$this->load->view('testing');
    }



    public function read_sports_categories(){
        try{
            $result = $this->callouts->read_sports_categories();
            p($result->result());
        }catch(Exception $e){
            die($e->getMessage());
        }
    }

    public function read_roles(){
        try{
            $result = $this->callouts->read_roles();
            p($result->result());
        }catch(Exception $e){
            die($e->getMessage());
        }
    }
    
    public function read_users(){
        try{
            $result = $this->callouts->read_users();
            p($result->result());
        }catch(Exception $e){
            die($e->getMessage());
        }
    }

    public function status_update(){
        //status_update($table,$status,$ids){
        $table = 'roles';
        $status='D';
        $ids=array(1,3,4);

        try{
            $this->callouts->status_update($table,$status,$ids);
            die('OK');
        }catch(Exception $e){
            die($e->getMessage());
        }
    }
}