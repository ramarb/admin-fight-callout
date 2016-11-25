<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Account extends MY_Controller_Admin {


    public function __construct() {
        parent::__construct();

        $this->load->model('Users_model','users');
        $this->load->model('Files_model','file');

    }

    public function index(){
        $this->render('dashboard',array());
    }

}
