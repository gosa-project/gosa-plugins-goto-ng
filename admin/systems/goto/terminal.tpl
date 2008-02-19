<h2><img class="center" alt="" align="middle" src="images/rightarrow.png"> {t}Properties{/t}</h2>
<table summary="" style="width:100%;">
 <tr>
  <td style="width:50%; vertical-align:top;">
   <table summary="">
    <tr>
     {if $cn eq 'default'}
     <td colspan=2>{t}Terminal template{/t}</td>
     {else}
     <td><LABEL for="cn">{t}Terminal name{/t}</LABEL>{$must}</td>
     <td>
{render acl=$cnACL}
      <input name="cn" id="cn" size=18 maxlength=60 value="{$cn}">
{/render}
     </td>
     {/if}
    </tr>
    <tr>
     <td><LABEL for="description">{t}Description{/t}</LABEL></td>
     <td>
{render acl=$descriptionACL}
      <input name="description" id="description" size=18 maxlength=60 value="{$description}">
{/render}
     </td>
    </tr>
    <tr>
     <td><LABEL for="base">{t}Base{/t}</LABEL>{$must}</td>
     <td>

{render acl=$baseACL}
      <select id="base" size="1" name="base" title="{t}Choose subtree to place group in{/t}">
       {html_options options=$bases selected=$base_select}
      </select>
{/render}
{render acl=$baseACL disable_picture='images/folder_gray.png'}
        <input type="image" name="chooseBase" src="images/folder.png" class="center" title="{t}Select a base{/t}">
{/render}
     </td>
    </tr>
   </table>
{if $member_of_ogroup}
   <br>
   <br>
   <br>
   <input type='submit' name='inheritAll' value='{t}Inherit all{/t}'>
{/if}
  </td>
  <td style="vertical-align:top;border-left:1px solid #A0A0A0;" >
   <table summary="">
    <tr>
     <td><LABEL for="gotoMode">{t}Mode{/t}</LABEL></td>
     <td>
{render acl=$gotoModeACL}
      <select id="gotoMode" name="gotoMode" title="{t}Select terminal mode{/t}">
       {html_options options=$modes selected=$gotoMode_select}
      </select>
{/render}
     </td>
    </tr>
    <tr>
     <td><LABEL for="gotoSyslogServer">{t}Syslog server{/t}</LABEL></td>
     <td>
{render acl=$gotoSyslogServerACL}
      <select name="gotoSyslogServer" id="gotoSyslogServer" title="{t}Choose server to use for logging{/t}">
       {html_options options=$syslogservers selected=$gotoSyslogServer_select}
      </select>
{/render}
     </td>
    </tr>
	</table>
  </td>
 </tr>
</table>
<p class="seperator" style="margin:0px; padding:0px;">&nbsp;</p>
<table style="width:100%;">
 <tr>
  <td style="width:50%;vertical-align:top;">
   <table summary="">
    <tr>
     <td><LABEL for="gotoTerminalPath">{t}Root server{/t}</LABEL></td>
     <td>
{render acl=$gotoTerminalPathACL}
      <select name="gotoTerminalPath" id="gotoTerminalPath" title="{t}Select NFS root filesystem to use{/t}">
       {html_options options=$nfsservers selected=$gotoTerminalPath_select}
      </select>
{/render}
     </td>
    </tr>
    <tr>
     <td><LABEL for="gotoSwapServer">{t}Swap server{/t}</LABEL></td>
     <td>
{render acl=$gotoSwapServerACL}
      <select name="gotoSwapServer" id="gotoSwapServer" title="{t}Choose NFS filesystem to place swap files on{/t}">
       {html_options options=$nfsservers selected=$gotoSwapServer_select}
      </select>
{/render}
     </td>
    </tr>
   </table>
  </td>
  <td style="border-left:1px solid #A0A0A0;">
	<table width="100%">
    <tr>
	 <td colspan="2">
{if $member_of_ogroup}
{render acl=$gotoNtpServerACL}
		<input type="checkbox" value="1" name="inheritTimeServer"
			{if $inheritTimeServer } checked {/if} 
			onClick="javascript:
					changeState('gotoNtpServerSelected');
					changeState('gotoNtpServers');
					changeState('addNtpServer');
					changeState('delNtpServer');">{t}Inherit time server attributes{/t}
{/render}
{else}
	<input disabled type='checkbox' name='option_disabled'>{t}Inherit time server attributes{/t}
{/if}
	 </td>
	</tr>
	<tr>
     <td colspan="2" style='padding-left:14px;padding-top:5px;'><LABEL for="gotoNtpServerSelected">{t}NTP server{/t}</LABEL><br>
{render acl=$gotoNtpServerACL}
      <select name="gotoNtpServerSelected[]" id="gotoNtpServerSelected" multiple size=5 style="width:100%;"
			title="{t}Choose server to use for synchronizing time{/t}" {if $inheritTimeServer} disabled {/if}>
       {html_options options=$gotoNtpServer_select}
      </select>
{/render}
	 <br>
{render acl=$gotoNtpServerACL}
      <select name="gotoNtpServers" id="gotoNtpServers" {if $inheritTimeServer} disabled {/if} >
       {html_options values=$ntpservers output=$ntpservers }
      </select>
{/render}
{render acl=$gotoNtpServerACL}
		<input type="submit" name="addNtpServer" value="{t}Add{/t}"		id="addNtpServer"
		 {if $inheritTimeServer} disabled {/if}>
{/render}
{render acl=$gotoNtpServerACL}
		<input type="submit" name="delNtpServer" value="{t}Delete{/t}"	id="delNtpServer" 
		 {if $inheritTimeServer} disabled {/if}>
{/render}
     </td>
    </tr>
   </table>

  </td>
 </tr>
</table>

{if $cn neq 'default'}
<p class="plugbottom" style="margin-bottom:0px; padding:0px;">&nbsp;</p>

{$netconfig}
{/if}

{if $fai_activated}
<p class="plugbottom" style="margin-bottom:0px; padding:0px;">&nbsp;</p>
<h2><img class="center" alt="" align="middle" src="images/rocket.png"> {t}Action{/t}</h2>
<table summary="">
 <tr>
  <td>
{render acl=$gotoNtpServerACL}
   <select size="1" name="saction" title="{t}Select action to execute for this terminal{/t}">
    <option disabled>&nbsp;</option>
    {html_options options=$actions}
   </select>
{/render}
  </td>
  <td>
{render acl=$gotoNtpServerACL}
   <input type=submit name="action" value="{t}Execute{/t}">
{/render}
  </td>
 </tr>
</table>
{/if}

<input type="hidden" name="termgeneric_posted" value="1">
<!-- Place cursor -->
<script language="JavaScript" type="text/javascript">
  <!-- // First input field on page
	focus_field('cn');
  -->
</script>
