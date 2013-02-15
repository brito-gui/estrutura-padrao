<?php
class Login extends MY_Controller {

  public function index($page='index')
  {
    $this->session->sess_destroy();    
    $this->load->helper(array('form','url'));
    $this->load->library(array('form_validation','simplelogin'));

    $this->form_validation->set_rules('usuario', 'Usuário', 'required|alpha_dash');
    $this->form_validation->set_rules('senha', 'Senha', 'required|callback_validate_login');

    if ($this->form_validation->run() === FALSE)
    {
      $this->data["title"]="Login";
      $this->render('blank');
    }
    else
    {
      redirect($this->config->item('base_url').'admin/painel');
    }
  }

  public function validate_login()
  {
    /* @var simplelogin Simplelogin*/
    if( ! $this->simplelogin->login($this->db->escape_str($this->input->post('usuario')), $this->input->post('senha')))
    {
      $this->form_validation->set_message('validate_login', 'Usuário ou senha inválidos');
      return FALSE;
    }
    else
    {
      return TRUE;
    }
  }	
}
