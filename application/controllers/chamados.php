<?php
class Chamados extends CI_Controller
{
	public function __construct()
	{
		parent::__construct();
    if( ! $this->session->userdata('logged_in'))
    {
      exit("Você não está logado");
    }
    if( ! $this->zacl->check_acl('user_management'))
    {
      exit("Você não tem esse acesso");
    }
    $this->load->model('chamados_model');
	}

	public function index()
	{
    $data['dir']="chamados";
    $data['page']="index";
		$data['chamados'] = $this->chamados_model->get_chamados();
    $data['title'] = 'chamados archive';

    $this->load->view('templates/template1', $data);
	}

	public function view($slug)
	{    
		$data['chamados_item'] = $this->chamados_model->get_chamados($slug);

    if (empty($data['chamados_item']))
    {
      show_404();
    }

    $data['title'] = $data['chamados_item']['titulo'];
    $data['dir']="chamados";
    $data['page']="view";
    $this->load->view('templates/template1', $data);
	}

  public function create()
  {
    $this->load->helper('form');
    $this->load->library('form_validation');    

    $this->form_validation->set_rules('titulo', 'Título', 'required');
    $this->form_validation->set_rules('descricao', 'Descrição', 'required');

    if ($this->form_validation->run() === FALSE)
    {
      $data['title'] = 'Incluir um novo chamado';
      $this->load->view('templates/header', $data);
      $this->load->view('chamados/create');
      $this->load->view('templates/footer');

    }
    else
    {
      $this->chamados_model->set_chamados();
      $this->load->view('chamados/success');
    }
  }
}