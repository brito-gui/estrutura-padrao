<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd"> 
<html>
<head>
	<title><?php echo $this->config->item('site_title'); if(isset($title))echo " ".$this->config->item('site_title_delimiter')." ".$title;?></title>	
		<link type='text/css' href="<?php echo base_url();?>assets/css/main.css" rel='Stylesheet' />
		<link type='text/css' href="<?php echo base_url();?>assets/twitter-bootstrap/css/bootstrap.min.css" rel='Stylesheet' />    
		<script src="<?php echo base_url();?>assets/twitter-bootstrap/js/bootstrap.min.js"></script>
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
		<div id="content" style="margin-top:55px">
			<?php echo $content;?>			
		</div>		
	</div>
</body>
</html>