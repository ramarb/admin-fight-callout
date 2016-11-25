<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');


class Users_model extends CI_Model {

    public function __construct() {
        parent::__construct();
    }

    /**
     * @param $data
     * @return bool
     */
    public function authenticate($data){

        $return = false;

        $sql = "
			SELECT
				users.*,
				roles.description AS role_name
			FROM users
			INNER JOIN roles ON roles.id = users.role_id
			WHERE users.username = " . $this->db->escape($data['email']) . " OR users.email = " . $this->db->escape($data['email']) . " LIMIT 1";

        $result = $this->common($sql);

        $result = $result->row();

        if(isset($result->password) == true && password_verify($data['password'],$result->password)  === true){

            if($result->role_name === 'Administrator'){
                $result->role = 'admin';
            }

            $this->session->set_userdata('login',$result);
            $return = true;
        }else{
            throw new UnexpectedValueException('Account not found!');
        }

        return $return;
    }

}