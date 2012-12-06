<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd"> 
<html>
<head>
	<title><?php echo $this->config->item('site_title'); if(isset($title))echo " ".$this->config->item('site_title_delimiter')." ".$title;?></title>	
		<link type='text/css' href="<?php echo base_url();?>twitter-bootstrap/css/bootstrap.min.css" rel='Stylesheet' />    
		<script src="<?php echo base_url();?>twitter-bootstrap/js/bootstrap.min.js"></script>
    <script type='text/javascript'>
        <?php if (isset($js)){echo $js;}?>          
				
    </script>
    <?php 
    	if(isset($head) && is_array($head)) {
    		foreach ($head as $headObject) {
    			echo $headObject; 
    		}  		
    	}
    ?>
</head>
<body <?php if(isset($onload)){echo "onload=$onload";}?>>	
	<div class="container">	
		<div id="header">
			<div id="logo"></div>
		</div>
		<?php   $data['menu_type']='main'; ?>
		<?php   $data['module']='admin'; ?>
		<div class="navbar navbar-fixed-top navbar-inverse">
			<div class="navbar-inner navbar-inverse">
				<div class="container">
					<?php $this->load->view('partials/menu.tpl.php',$data);?>
				</div>
			</div>
		</div>
		<?php /*<div id="breadcrumb"><?php $this->load->view('partials/breadcrumb.tpl.php');?></div>*/?>
		<div id="content" style="margin-top:55px">
			<?php echo $content;?>			
		</div>		
		<div id="footer">
			<div id="bottomMenu"><?php $this->load->view('partials/bottom_menu.tpl.php');?></div>
			<div id="copywright"><?php $this->load->view('partials/copywright.tpl.php');?></div>
		</div>		
	</div>
</body>
</html>