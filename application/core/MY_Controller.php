<?php if (!defined('BASEPATH')) exit('No direct script access allowed');
/**
* Name:  MY_Controller
* 
* @Author:  Ben Edmunds 
* Created:  7.21.2009 
* @Author:  Guilherme Brito
* Created 2012
* 
* Description:  Class to extend the CodeIgniter Controller Class.  All controllers should extend this class.
* 
 */
class MY_Controller extends CI_Controller 
{ 
    protected $data = Array();
    protected $module_name;
    protected $controller_name;    
    protected $action_name;
    protected $page_title;
    public $CI;
   
    public function __construct() 
    {      
      parent::__construct();       
      $this->CI =& get_instance();
      $this->CI->load->library("session");
      $this->CI->load->model("menu_model");
      //set the current controller and action name
      $this->module_name     = (trim($this->router->fetch_directory()!="")) ? rtrim($this->router->fetch_directory(),'/'):'';
      $this->controller_name = $this->router->fetch_class();
      $this->action_name     = $this->router->fetch_method();      
      //verify if the loaded page needs logged_in user
      if(($this->CI->menu_model->is_login_required($this->module_name,$this->controller_name)) && (!$this->session->userdata("logged_in")))
      {
        //if the user is logged of, take him out of this area
        redirect($this->config->item('base_url').'admin/logout');
        return false;
      }
      $this->data['content'] = '';
      $this->data['css']     = '';
    }
 
    protected function render($template='main') 
    {
      $view_path = $this->module_name. '/' . $this->controller_name . '/' . $this->action_name . '.php'; //set the path off the view
      if (file_exists(APPPATH . 'views/' . $view_path))
      {
        $this->data['content'] .= $this->load->view($view_path, $this->data, true);  //load the view
      } 		
      $this->load->view($this->module_name. '/' . "layouts/$template.tpl.php", $this->data);  //load the template
    }
    
    protected function add_title() 
    {
      $this->load->model('page_model');
      //the default page title will be whats set in the controller
      //but if there is an entry in the db override the controller's title with the title from the db
      $page_title = $this->page_model->get_title($this->controller_name,$this->action_name);
      if ($page_title) {
	      $this->data['title'] = $page_title;
      }
    }    
}