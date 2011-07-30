<h2>{'ldap.common.ldap'|devblocks_translate}</h2>
{if !$extensions.ldap}
<b>The LDAP extension is not installed.</b>
{else}
<form action="javascript:;" method="post" id="frmSetupLdap" onsubmit="return false;">
	<input type="hidden" name="c" value="config">
	<input type="hidden" name="a" value="handleSectionAction">
	<input type="hidden" name="section" value="ldap">
	<input type="hidden" name="action" value="saveJson">
	
	<fieldset style="float:left;width:40%;">
		<legend>Worker authentication</legend>

		<b>Host:*</b><br>
		<input type="text" name="priv_auth_host" value="{$params.priv_auth_host}" size="64"><br>
		<i>example: ldap.example.com</i><br>
		<br>
		
		<b>Port:*</b><br>
		<input type="text" name="priv_auth_port" value="{$params.priv_auth_port}" size="5"><br>
		<i>example: 389</i><br>
		<br>
		
		<b>LDAP User for non-anonymous search:*</b><br>
		<input type="text" name="priv_auth_username" value="{$params.priv_auth_username}" size="64"><br>
		<i>example: cn=admin,OU=users,DC=example,DC=com</i><br>
		<br>
		
		<b>LDAP Password for non-anonymous search:*</b><br>
		<input type="password" name="priv_auth_password" value="{$params.priv_auth_password}" size="64"><br>
		<br>

		<b>Search context:*</b><br>
		<input type="text" name="priv_auth_context_search" value="{$params.priv_auth_context_search}" size="64"><br>
		<i>example: OU=staff,DC=example,DC=com</i><br>
		<br>
		
		<b>Auth login field:*</b><br>
		<input type="text" name="priv_auth_field_auth" value="{$params.priv_auth_field_auth}" size="64"><br>
		<i>example: sAMAccountName, CN, or mail</i><br>
		<br>
        
		<b>Email field:*</b><br>
		<input type="text" name="priv_auth_field_email" value="{$params.priv_auth_field_email}" size="64"><br>
		<i>example: mail</i><br>
		<br>
		
		<b>First name (given name) field:</b> (optional)<br>
		<input type="text" name="priv_auth_field_firstname" value="{$params.priv_auth_field_firstname}" size="64"><br>
		<i>example: givenName</i><br>
		<br>
		
		<b>Last name (surname) field:</b> (optional)<br>
		<input type="text" name="priv_auth_field_lastname" value="{$params.priv_auth_field_lastname}" size="64"><br>
		<i>example: sn</i><br>
		<br>
		
	</fieldset>
	
	<fieldset style="float:left;width:40%;">
		<legend>Customer authentication</legend>

		<b>Host:*</b><br>
		<input type="text" name="pub_auth_host" value="{$params.pub_auth_host}" size="64"><br>
		<i>example: ldap.example.com</i><br>
		<br>
		
		<b>Port:*</b><br>
		<input type="text" name="pub_auth_port" value="{$params.pub_auth_port}" size="5"><br>
		<i>example: 389</i><br>
		<br>
		
		<b>LDAP User for non-anonymous search:*</b><br>
		<input type="text" name="pub_auth_username" value="{$params.pub_auth_username}" size="64"><br>
		<i>example: cn=admin,OU=users,DC=example,DC=com</i><br>
		<br>
		
		<b>LDAP Password for non-anonymous search:*</b><br>
		<input type="password" name="pub_auth_password" value="{$params.pub_auth_password}" size="64"><br>
		<br>

		<b>Search context:*</b><br>
		<input type="text" name="pub_auth_context_search" value="{$params.pub_auth_context_search}" size="64"><br>
		<i>example: OU=customers,DC=example,DC=com</i><br>
		<br>
		
		<b>Auth login field:*</b><br>
		<input type="text" name="pub_auth_field_auth" value="{$params.pub_auth_field_auth}" size="64"><br>
		<i>example: sAMAccountName, CN, or mail</i><br>
		<br>
        
		<b>Email field:*</b><br>
		<input type="text" name="pub_auth_field_email" value="{$params.pub_auth_field_email}" size="64"><br>
		<i>example: mail</i><br>
		<br>
		
		<b>First name (given name) field:</b> (optional)<br>
		<input type="text" name="pub_auth_field_firstname" value="{$params.pub_auth_field_firstname}" size="64"><br>
		<i>example: givenName</i><br>
		<br>
		
		<b>Last name (surname) field:</b> (optional)<br>
		<input type="text" name="pub_auth_field_lastname" value="{$params.pub_auth_field_lastname}" size="64"><br>
		<i>example: sn</i><br>
		<br>
	</fieldset>
	
	<br clear="all">
	
	<div class="status"></div>
	<button type="button" class="submit"><span class="cerb-sprite2 sprite-tick-circle-frame"></span> {'common.save_changes'|devblocks_translate|capitalize}</button>	
</form>

<script type="text/javascript">
$('#frmSetupLdap BUTTON.submit')
	.click(function(e) {
		genericAjaxPost('frmSetupLdap','',null,function(json) {
			$o = $.parseJSON(json);
			if(false == $o || false == $o.status) {
				Devblocks.showError('#frmSetupLdap div.status',$o.error);
			} else {
				Devblocks.showSuccess('#frmSetupLdap div.status',$o.message);
			}
		});
	})
;
</script>
{/if}