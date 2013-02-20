<?php
Class Painel extends MY_Controller
{
  public function index()
  {
//    if(!$this->session->userdata('logged_in'))
//    {
//      redirect($this->config->item('base_url').'admin');
//      return false;
//    }
    $this->data['title']='Área restrita';
    $this->render();
  }
}
?>
