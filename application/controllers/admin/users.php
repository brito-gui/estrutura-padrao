<?php
class Users extends MY_Controller
{
  public function index()
  {
    $this->load->model('users_model');
    $this->data['users']=$this->users_model->get_users();
    $this->render();
  }
}