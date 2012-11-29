<?php
/**
 *  Menu model class
 */
class Menu_model extends CI_Model
{
	private $tableName='pages';
	public function __construct()
	{
		parent::__construct();
		$this->load->database();
	}
	
	public function get_menu($type="main",$module="")
	{
		$query=$this->db->order_by('order','asc');
		$query=$this->db->get_where($this->tableName,array('menu'=>$type,'module'=>$module));
		return $query->result();
	}
}
?>