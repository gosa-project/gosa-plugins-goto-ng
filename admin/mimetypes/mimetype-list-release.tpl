<input type='image' src='images/empty.png' name='no_action_posted' value='do_nothing' alt='' style='width:2px;height:2px;'>

<table summary="" style="width:100%;height:100%; vertical-align:top; text-align:left;" cellpadding=2>
  <tr>
    <td style="vertical-align:top; width:100%;">
      <div class="contentboxh">
        <p class="contentboxh">&nbsp;{$HEADLINE}&nbsp;{$SIZELIMIT}</p>
      </div>
      
      <div class="contentboxb">
       <div style='background:white;padding:3px;'>
        <table><tr>
          <td>{$RELOAD}&nbsp;</td><td>{$SEPARATOR}&nbsp;</td>
          <td><img src='images/rocket.png' alt='' class='center'></td>
          <td> {$ACTIONS}</td>
        </tr></table>
       </div>
      </div>
      
      <div style='height:4px;'>
      </div>
      {$LIST}
    </td>
    <td style='vertical-align:top;min-width:250px'>
      {$FILTER}
    </td>
  </tr>
</table>

<input type="hidden" name="ignore">
