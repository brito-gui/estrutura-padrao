<?php echo validation_errors() ;?>
<?php echo form_open() ;?>
<label>Email</label>
<input type="text" name="usuario" value="<?=set_value("usuario")?>"/><br>
<label>Senha</label>
<input type="password" name="senha" value="<?=set_value("senha")?>"/>
<?php echo form_submit("","Entrar"); ?>
</form>
