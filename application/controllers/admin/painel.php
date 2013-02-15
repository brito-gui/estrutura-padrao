<?php
Class Painel extends MY_Controller
{
  public function index()
  {
    $this->data['title']='Área restrita';
    $this->render();
  }
}
?>
