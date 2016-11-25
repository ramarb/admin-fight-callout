<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Callouts extends MY_Controller_Admin {


    public function __construct() {

        parent::__construct();

        $this->load->model('Callouts_model','callouts');

        $this->controller = 'callouts';
        $this->js_variables['controller'] = 'callouts';
        $this->js_variables['controller_method'] = $this->uri->segment(3);
        $this->data['controller'] = 'callouts';
    }

    public function index(){
        $callouts = array();

        try{
            $callouts = $this->callouts->read();
        }catch(Exception $e){

            $this->set_alert_message('danger',$e->getMessage());
        }
        $this->js_variables['controller_method'] = 'callouts';
        $this->render('callouts_list',array('callouts'=>$callouts));
    }

    public function detail($id = ''){
        $result = array();

        try{
            $result = $this->callouts->read_callout_by_id($id);
        }catch (Exception $e){

            $this->set_alert_message('danger','ha;a');
        }
        $this->js_variables['controller_method'] = 'callouts';
        $this->render('callouts_view',array('callout'=>$result));
    }

    public function report(){
        $reports = array();
        try{
            $reports = $this->callouts->read_categories();
        }catch(Exception $e){
            $this->set_alert_message('danger',$e->getMessage());
        }
        
        $this->render('callouts_report',array('reports'=>$reports));
    }

    public function categories(){
        try{
            $result = $this->callouts->read_sports_categories();
        }catch(Exception $e){
            $this->set_alert_message('danger',$e->getMessage());
        }

        $this->render('categories_list',array('categories'=>$result));
    }

    public function roles(){
        try{
            $result = $this->callouts->read_roles();
        }catch(Exception $e){
            $this->set_alert_message('danger',$e->getMessage());
        }

        $this->render('roles_list',array('roles'=>$result));
    }

    public function users(){
        try{
            $result = $this->callouts->read_users();
        }catch(Exception $e){
            $this->set_alert_message('danger',$e->getMessage());
        }

        $this->render('users_list',array('users'=>$result));
    }

    public function admin_users(){
        try{
            $result = $this->callouts->read_users(true);
        }catch(Exception $e){
            $this->set_alert_message('danger',$e->getMessage());
        }

        $this->render('admin_users_list',array('users'=>$result));
    }

    public function create_admin_user(){
        $roles = $this->callouts->read_roles(true);
        $this->render('admin_user_create',array('roles'=>$roles));
    }

    public function validate_create_admin_form(){
        $config = array(
            array('field' => 'first_name', 'label' => 'First Name', 'rules' => 'required'),
            array('field' => 'role_id', 'label' => 'Role', 'rules' => 'required'),
            array('field' => 'email', 'label' => 'Email', 'rules' => 'required|valid_email|is_unique[users.email]'),
            array('field' => 'username', 'label' => 'Username', 'rules' => 'required|is_unique[users.username]'),
            array('field' => 'password', 'label' => 'Password', 'rules' => 'required'),
        );

        $this->form_validation->set_rules($config);

        if($this->form_validation->run() === true){
            try{
                $this->callouts->create_user($this->input->post());
                $this->set_alert_message('success',SAVE_SUCCESS_MESSAGE,true);
                redirect('admin/callouts/create_admin_user');
            }catch(Exception $e){
                $this->set_alert_message('danger',$e->getMessage());
            }
        }else{
            $this->set_alert_message('danger',validation_errors());
        }

        $this->create_admin_user();
    }

    public function edit_admin($user_id){
        try{
            $roles = $this->callouts->read_roles(true);
            $user = $this->callouts->read_user_by_id($user_id)->row();
            //p($user,1);
            $this->render('admin_user_edit',array('roles'=>$roles,'data_user'=>$user));
        }catch(Exception $e){
            die('Internal Server error!');
        }
    }

    public function validate_edit_admin_form(){
        $config = array(
            array('field' => 'first_name', 'label' => 'First Name', 'rules' => 'required'),
            array('field' => 'role_id', 'label' => 'Role', 'rules' => 'required'),
            array('field' => 'email', 'label' => 'Email', 'rules' => 'required|valid_email'),
            array('field' => 'username', 'label' => 'Username', 'rules' => 'required'),
        );

        $this->form_validation->set_rules($config);

        if($this->form_validation->run() === true){
            try{
                $this->callouts->update_user($this->input->post());
                $this->set_alert_message('success',SAVE_SUCCESS_MESSAGE,true);
                redirect('admin/callouts/edit_admin/' . $this->input->post('user_id'));
            }catch(Exception $e){
                $this->set_alert_message('danger',$e->getMessage());
            }
        }else{
            $this->set_alert_message('danger',validation_errors());
        }

        $this->edit_admin($this->input->post('user_id'));
    }

    public function update_status(){

        $table = $this->input->post('table_name');
        $ids = $this->input->post('category_ids');
        $status = $this->input->post('status');
        $return = array('success' => 1);
        try{
            $this->callouts->status_update($table,$status,$ids);
            $this->set_alert_message('success',"Update successful...",true);
        }catch(Exception $e){
            $this->set_alert_message('danger',$e->getMessage(),true);
            $return['success'] = 0;
        }

        echo json_encode($return);
    }

    public function save_category_description(){
        $id = $this->input->post('category_id');
        $table = $this->input->post('table');
        $description = $this->input->post('description');

        try{
            if((int)$id > 0){
                $this->callouts->description_update($table,$description,$id);
            }else{
                $this->callouts->description_add($table,$description);
            }
            $this->set_alert_message('success',SAVE_SUCCESS_MESSAGE,true);
        }catch (Exception $e){
            $this->set_alert_message('danger',$e->getMessage(),true);
        }

        redirect($this->_role.'/'.$this->controller.'/categories');
    }

    public function save_role_description(){
        $id = $this->input->post('category_id');
        $table = $this->input->post('table');
        $description = $this->input->post('description');

        try{
            if((int)$id > 0){
                $this->callouts->description_update($table,$description,$id);
            }else{
                $this->callouts->description_add($table,$description);
            }
            $this->set_alert_message('success',SAVE_SUCCESS_MESSAGE,true);
        }catch (Exception $e){
            $this->set_alert_message('danger',$e->getMessage(),true);
        }

        redirect($this->_role.'/'.$this->controller.'/roles');
    }

    public function change_password(){
        $this->render('change_password');
    }

    public function validate_changes_password_form(){

        $this->form_validation->set_rules('confirm_password', 'Password Confirmation', 'required|matches[new_password]');
        $this->form_validation->set_rules('new_password', 'New Password');
        $this->form_validation->set_rules('old_password', 'Old Password');
        if($this->form_validation->run() === false){
            $this->set_alert_message('danger',validation_errors());
        }else{
            $old_password = $this->input->post('old_password');
            $new_password = $this->input->post('new_password');

            $result = $this->callouts->change_password($this->user->id,$old_password,$new_password);
            if($result === true){
                $this->set_alert_message('success',SAVE_SUCCESS_MESSAGE,true);
                redirect('admin/callouts/change_password');
            }else{
                $this->set_alert_message('danger','Incorrect old password');
            }
        }

        $this->change_password();

    }



}
