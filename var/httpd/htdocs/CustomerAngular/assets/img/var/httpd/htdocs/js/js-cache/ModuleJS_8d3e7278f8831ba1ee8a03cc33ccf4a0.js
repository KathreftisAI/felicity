"use strict";var Core=Core||{};Core.Agent=Core.Agent||{};Core.Agent.Login=(function(TargetNS){TargetNS.Init=function(LoginFailed){if(!Core.Agent.SupportedBrowser){$('#LoginBox').hide();$('#OldBrowser').show();return;}
Core.Form.EnableForm($('#LoginBox form, #PasswordBox form'));if($('#User').val()&&$('#User').val().length){$('#Password').focus();}
else{$('#User').focus();}
$('#LostPassword, #BackToLogin').click(function(){$('#LoginBox, #PasswordBox').toggle();return false;});$('#TimeOffset').val((new Date()).getTimezoneOffset());if(LoginFailed){Core.UI.Shake($('#LoginBox'));}
if($('#LoginBox').hasClass('PreLogin')){$('#LoginBox form').submit();}};return TargetNS;}(Core.Agent.Login||{}));

