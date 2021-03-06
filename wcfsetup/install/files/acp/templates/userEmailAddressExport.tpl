{include file='header' pageTitle='wcf.acp.user.exportEmailAddress'}

<script type="text/javascript">
	//<![CDATA[
	$(function() {
		new WCF.ACP.Options();
	});
	//]]>
</script>

<header class="boxHeadline">
	<hgroup>
		<h1>{lang}wcf.acp.user.exportEmailAddress{/lang}</h1>
	</hgroup>
</header>

<form method="post" action="{link controller='UserEmailAddressExport'}{/link}">
	<div class="container containerPadding marginTop shadow">
		<fieldset>
			<legend>{lang}wcf.acp.user.exportEmailAddress.markedUsers{/lang}</legend>
			
			<div>
				{implode from=$users item=$user}<a href="{link controller='UserEdit' id=$user->userID}{/link}">{$user}</a>{/implode}
			</div>
		</fieldset>
		
		<fieldset>
			<legend>{lang}wcf.acp.user.exportEmailAddress.format{/lang}</legend>
			
			<dl>
				<dt><label>{lang}wcf.acp.user.exportEmailAddress.fileType{/lang}</label></dt>
				<dd>
					<label><input type="radio" name="fileType" value="csv" {if $fileType == 'csv'}checked="checked" {/if}class="jsEnablesOptions" data-disable-options="[ ]" data-enable-options="[ 'separatorDiv', 'textSeparatorDiv' ]" /> {lang}wcf.acp.user.exportEmailAddress.fileType.csv{/lang}</label>
					<label><input type="radio" class="jsEnablesOptions" name="fileType" value="xml" {if $fileType == 'xml'}checked="checked" {/if}data-disable-options="[ 'separatorDiv', 'textSeparatorDiv' ]" data-enable-options="[ ]" /> {lang}wcf.acp.user.exportEmailAddress.fileType.xml{/lang}</label>
				</dd>
			</dl>
			
			<dl id="separatorDiv">
				<dt><label for="separator">{lang}wcf.acp.user.exportEmailAddress.separator{/lang}</label></dt>
				<dd>
					<input type="text" id="separator" name="separator" value="{$separator}" class="medium" />
				</dd>
			</dl>
			
			<dl id="textSeparatorDiv"><!-- ToDo: Checkbox -->
				<dt><label for="textSeparator">{lang}wcf.acp.user.exportEmailAddress.textSeparator{/lang}</label></dt>
				<dd>
					<input type="text" id="textSeparator" name="textSeparator" value="{$textSeparator}" class="medium" />
				</dd>
			</dl>
		</fieldset>
		
	</div>
	
	<div class="formSubmit">
		<input type="submit" value="{lang}wcf.global.button.submit{/lang}" accesskey="s" />
 	</div>
</form>

{include file='footer'}
