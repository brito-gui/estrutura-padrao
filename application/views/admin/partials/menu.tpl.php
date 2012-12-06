<ul class="nav">
	<li>
		<a class="brand" href="<?php echo $this->config->item("base_url");?>"><?php echo $this->config->item('site_title'); ?></a>
	</li>
	<li class="divider-vertical"></li>
	<?php $menu_type = (isset($menu_type)) ? $menu_type : "main" ?>
	<?php $module = (isset($module)) ? $module : "" ?>
  <?php $numOfItems = count($this->Menu_model->get_menu($menu_type,$module));?>	
	  <?php foreach ($this->Menu_model->get_menu($menu_type,$module) as $key => $item):?>
 	 <?php if ($this->session->userdata('group_id') && ($item->group_id) == $this->session->userdata('group_id') || $item->group_id == '0'):?>
        <?php if ($item->require_login && $this->session->userdata('logged_in') || !$item->require_login):?>
	        	<?php if($key != $numOfItems && $key != 0):?>	           		
	            <?php endif;?>					
	        <li
	           <?php 
	              if ($this->uri->segment(1)==$item->controller) {
	              	if ($key == 0) {
	                 	echo " class='firstCurrent'";
	              	}
	              	else {
	              		echo " class='current'";
	              	}
	              } 
	              elseif ($key == 0) {
	                 echo ' class=first'; 
	              } 
	              else {	
	              	 echo ' class=link';
	              }
	           ?>
	        >
	           <?php 
	           		if ($item->url != '') {
	           			echo "<a href='" .$item->url. "' target='_blank'>" .$item->title. "</a>";
	           	    }
	           	    else {
	           	    	echo anchor($item->controller .'/'. $item->view,$item->title);
	           	    }
	           ?>
	           
	        </li>
					<li class="divider-vertical"></li>
	     <?php endif;?>
  	 <?php endif;?>  	   
  <?php endforeach;?>
</ul>