<?php

/**
 * Modelo da classe de usuários
 */
  class Users_model extends CI_Model
  {
    private $tableName="tbl_users";
    public function __construct() 
    {
      parent::__construct();
      $this->load->database();
    }
    
    public function get_users($id="")
    {
      $query=$this->db->order_by("firstname");
      $conditions=($id) ? array('id',$id) : (array());
      $query=$this->db->get_where($this->tableName,$conditions);
      return $query->result();
    }
  }
?>
