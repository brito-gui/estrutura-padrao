<?php
class Chamados_model extends CI_Model
{
	public function __construct()
	{
		parent::__construct();
		$this->load->database();
	}
  public function get_chamados($slug = FALSE)
  {
    if ($slug === FALSE)
    {
      $query = $this->db->get('chamados');
      return $query->result_array();
    }

    $query = $this->db->get_where('chamados', array('slug' => $slug));
    return $query->row_array();
  }
  public function set_chamados()
  {
    $this->load->helper('url');

    $slug = url_title($this->input->post('titulo'), 'dash', TRUE);

    $data = array(
      'titulo' => $this->input->post('titulo'),
      'slug' => $slug,
      'descricao' => $this->input->post('descricao')
    );

    return $this->db->insert('chamados', $data);
  }
}