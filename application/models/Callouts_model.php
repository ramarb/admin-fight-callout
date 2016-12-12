<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');


class Callouts_model extends CI_Model {

    public function __construct() {
        parent::__construct();
    }

    public function read(){
        $sql = "SELECT
                  callouts.*,
                  categories.description category,
                  CONCAT(users.first_name,' ',users.last_name) AS full_name
                FROM callouts
                INNER JOIN categories ON categories.id = callouts.category_id
                INNER JOIN users ON users.id = callouts.user_id
                ";
        return $this->common($sql);
    }

    public function read_categories(){
        $sql = "SELECT
                    categories.*,
                    (SELECT COUNT(callouts.id) FROM callouts WHERE callouts.category_id = categories.id) callout_count
                FROM categories
                WHERE (SELECT COUNT(callouts.id) FROM callouts WHERE callouts.category_id = categories.id) > 0";
        return $this->common($sql);
    }

    public function read_sports_categories(){
        $sql = "SELECT * FROM categories ORDER BY id";
        return $this->common($sql);
    }

    public function read_roles($admin_only = false){
        $where = " ";

        if($admin_only === true){
            $where = " WHERE roles.description like '%admin%' ";
        }

        return $this->common("SELECT * FROM roles{$where}ORDER BY id;");
    }

    public function read_users($is_admin = false){

        $where = "WHERE roles.description NOT LIKE '%admin%'";

        if($is_admin === true){
            $where = "WHERE roles.description LIKE '%admin%'";
        }

        $sql = "SELECT users.*,
                    CONCAT(`first_name`,' ',`last_name`) AS full_name,
                    roles.description AS role
                FROM users
                INNER JOIN roles ON roles.id = users.role_id
                {$where}
                ORDER BY users.id;";

        return $this->common($sql);
    }

    /**
     * @param $table
     * @param $status
     * @param $ids
     * @return array
     */
    public function status_update($table,$status,$ids){
        check_array($ids);
        check_string($status);
        check_string($table);

        $sql = "UPDATE `{$table}` SET `updated_at` = NOW(), `status` = " . $this->db->escape($status) . " WHERE id IN(".implode(',',$ids).")";
        return $this->common($sql);
    }

    /**
     * @param $table
     * @param $description
     * @param $id
     * @return array
     */
    public function description_update($table,$description,$id){
        check_int($id);
        check_string($description);
        check_string($table);

        $result = $this->common("SELECT * FROM `{$table}` WHERE `description` = " . $this->db->escape($description) . " AND id != {$id}");

        if((int)$result->result_id->num_rows === 0){
            $sql = "UPDATE `{$table}` SET `updated_at` = NOW(), `description` = " . $this->db->escape($description) . " WHERE id = {$id}";
            return $this->common($sql);
        }else{
            throw new InvalidArgumentException('Data already exist...',500);
            return false;
        }


    }

    /**
     * @param $table
     * @param $description
     * @return array
     */
    public function description_add($table,$description){
        check_string($description);
        check_string($table);

        $result = $this->common("SELECT * FROM `{$table}` WHERE `description` = " . $this->db->escape($description) . "");

        if((int)$result->result_id->num_rows === 0){
            $sql = "INSERT INTO `{$table}`(`description`,`created_at`,`status`) VALUES(" . $this->db->escape($description) . ",NOW(),'A')";
            return $this->common($sql);
        }else{
            throw new InvalidArgumentException('Data already exist...',500);
            return false;
        }
    }

    public function read_callout_by_id($id){

        check_int($id);

        $sql = "SELECT
                  callouts.*,
                  categories.description category,
                  CONCAT(users.first_name,' ',users.last_name) AS full_name,
                  (SELECT
					CONCAT(logs.action,' By ',editor.first_name,' ', editor.last_name, ' on ', logs.created_at)
                    FROM logs
                    INNER JOIN users AS editor ON editor.id = logs.user_id
                    WHERE logs.callout_id = callouts.id

                    ORDER by logs.created_at DESC
                    LIMIT 1
				  ) as editors_detail

                FROM callouts
                INNER JOIN categories ON categories.id = callouts.category_id
                INNER JOIN users ON users.id = callouts.user_id
                WHERE callouts.id = {$id}";
        return $this->common($sql);
    }

    /**
     * @param $callout_id
     * @return array
     */
    public function read_callout_comments_by_callout_id($callout_id){
        check_int($callout_id);
        $sql = "SELECT
                  comments.*,
                  CONCAT(users.first_name,' ',users.last_name) AS full_name
                FROM comments
                INNER JOIN users ON users.id = comments.user_id
                WHERE callout_id = {$callout_id}
                ORDER BY comments.updated_at DESC";
        return $this->common($sql);
    }

    /**
     * @param $user_id
     * @param $password
     * @return bool
     */
    private function is_password_correct($user_id,$password){

        check_int($user_id);
        check_string($password);

        $return = false;

        $sql = "SELECT * FROM users WHERE id = {$user_id};";

        $result = $this->common($sql);

        if($result->result_id->num_rows === 1){
            $user = $result->row();

            if(password_verify($password,$user->password)){
                $return = true;
            }
        }

        return $return;
    }


    /**
     * @param $user_id
     * @param $old_password
     * @param $new_password
     * @return array
     */
    public function change_password($user_id,$old_password,$new_password){
        $return = $this->is_password_correct($user_id,$old_password);
        if( $return=== true){
            $sql = "UPDATE users SET `password` = " . $this->db->escape(password_hash($new_password, PASSWORD_BCRYPT)) . " WHERE id = {$user_id};";
            $this->common($sql);
        }
        return $return;
    }

    public function create_user($post){

        $insert = array(
            'first_name' => $this->db->escape($post['first_name']),
            'last_name' => $this->db->escape($post['last_name']),
            'role_id' => $this->db->escape($post['role_id']),
            'email' => $this->db->escape($post['email']),
            'username' => $this->db->escape($post['username']),
            'password' => $this->db->escape(password_hash($post['password'], PASSWORD_BCRYPT)),
            'status' => $this->db->escape('A'),
            'created_at' => 'NOW()'
        );

        $sql = "INSERT INTO users(first_name, last_name, role_id, email,username,password,status,created_at) VALUES (".implode(",",$insert).");";

        return $this->common($sql);
    }

    public function check_unique_update($username,$email,$user_id){
        $return = true;
        $sql = "SELECT * FROM users WHERE (username = ".$this->db->escape($username)." OR email = ".$this->db->escape($email).") AND id != {$user_id};";
        $result = $this->common($sql);

        if(isset($result->result_id) && $result->result_id->num_rows > 0){
            $return = false;
        }

        return $return;
    }

    public function read_user_by_id($user_id){

        check_int($user_id);

        $sql = "SELECT * FROM users WHERE id = {$user_id}";

        return $this->common($sql);

    }

    public function update_user($post){

        if($this->check_unique_update($post['username'],$post['email'],$post['user_id']) === true){
            $sql = "UPDATE users
            SET
                first_name = " . $this->db->escape($post['first_name']). ",
                last_name = " . $this->db->escape($post['last_name']). ",
                role_id = " . $this->db->escape($post['role_id']). ",
                email = " . $this->db->escape($post['email']). ",
                username = " . $this->db->escape($post['username']). ",
                ".((strlen(trim($post['password'])) > 0)?"password = " . $this->db->escape(password_hash($post['password'], PASSWORD_BCRYPT)) . ",":"")."
                updated_at = NOW()
            WHERE id = {$post['user_id']};";
            $this->common($sql);
        }else{
            throw new RuntimeException('username or email already exist',400);
        }
    }

    public function update($data){

        $sql = "UPDATE callouts
            SET
              `description` = ".$this->db->escape($data['callout_description']).",
              `fighter_a` = ".$this->db->escape($data['fighter_a']).",
              `fighter_b` = ".$this->db->escape($data['fighter_b']).",
              `details_venue` = ".$this->db->escape($data['details_venue']).",
              `category_id` = ".$this->db->escape($data['callout_category_id']).",
              `match_type` = ".$this->db->escape($data['match_type']).",
              `broadcast_url` = ".$this->db->escape($data['broadcast_url']).",
              `ticket_url` = ".$this->db->escape($data['ticket_url']).",
              `details_date` = ".$this->db->escape($data['details_date']).",
              `details_time` = ".$this->db->escape($data['details_time'])."
            WHERE id = ".(int)$data['callout_id'].";";

        return $this->common($sql);
    }

    public function log_event($user_id, $callout_id, $action){
        //p($callout_id,1);
        $sql = "INSERT INTO logs(`user_id`,`callout_id`,`action`) VALUES(".$this->db->escape($user_id).",".$this->db->escape($callout_id).",".$this->db->escape($action)." )";
        return $this->common($sql);
    }

}