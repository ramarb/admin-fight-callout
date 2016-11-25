<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Login extends MY_Controller {

    public function __construct() {
        parent::__construct();
		
		$this->load->model('Users_model','users');

    }

	public function index(){

		$this->redirect();
        $this->render('public/login',array());
	}

    public function validate_login(){


        $config = array(
            array(
                'field'   => 'email',
                'label'   => 'Username',
                'rules'   => 'required'
            ),
            array(
                'field'   => 'password',
                'label'   => 'Password',
                'rules'   => 'required'
            ),
        );

        $this->form_validation->set_rules($config);

        $result = $this->form_validation->run();

        if($result == false){
            $this->set_alert_message('danger',validation_errors());
        }else{
            $this->authenticate_user();
        }

        $this->index();
    }
	
	public function logout(){
		$this->session->sess_destroy();
		redirect('login');
	}

    private function authenticate_user(){
		try{
			$this->users->authenticate($this->input->post());
            $this->set_alert_message('success','Login Successful...',true);

			$this->redirect();


		}catch(Exception $e){
            $this->set_alert_message('danger',$e->getMessage());
		}
    }
}
