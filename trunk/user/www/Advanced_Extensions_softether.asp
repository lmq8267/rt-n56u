<!DOCTYPE html>
<html>
<head>
<title><#Web_Title#> - Softether VPN server</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="-1">

<link rel="shortcut icon" href="images/favicon.ico">
<link rel="icon" href="images/favicon.png">
<link rel="stylesheet" type="text/css" href="/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/bootstrap/css/main.css">
<link rel="stylesheet" type="text/css" href="/bootstrap/css/engage.itoggle.css">

<script type="text/javascript" src="/jquery.js"></script>
<script type="text/javascript" src="/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/bootstrap/js/engage.itoggle.min.js"></script>
<script type="text/javascript" src="/state.js"></script>
<script type="text/javascript" src="/general.js"></script>
<script type="text/javascript" src="/itoggle.js"></script>
<script type="text/javascript" src="/popup.js"></script>
<script type="text/javascript" src="/help.js"></script>
<script>
var $j = jQuery.noConflict();

$j(document).ready(function() {

	init_itoggle('softether_enable');

});

</script>
<script>

<% login_state_hook(); %>

function initial(){
	show_banner(1);
	 show_menu(8,<% nvram_get_x("", "softether_L2"); %>,<% nvram_get_x("", "softether_L3"); %>);
	show_footer();
	//change_softether_enable();
	if (!login_safe())
	textarea_scripts_enabled(0);

}

function textarea_scripts_enabled(v){
	inputCtrl(document.form['scripts.softether_script.sh'], v);
}

function applyRule(){
//	if(validForm()){
	showLoading();
	
	document.form.action_mode.value = " Apply ";
	document.form.current_page.value = "/Advanced_Extensions_softether.asp";
	document.form.next_page.value = "";
	
	document.form.submit();
//	}
}

function done_validating(action){
	refreshpage();
}


</script>
</head>

<body onload="initial();" onunLoad="return unload_body();">

<div class="wrapper">
	<div class="container-fluid" style="padding-right: 0px">
	<div class="row-fluid">
	<div class="span3"><center><div id="logo"></div></center></div>
	<div class="span9" >
	<div id="TopBanner"></div>
	</div>
	</div>
	</div>

	<div id="Loading" class="popup_bg"></div>

	<iframe name="hidden_frame" id="hidden_frame" src="" width="0" height="0" frameborder="0"></iframe>

	<form method="post" name="form" id="ruleForm" action="/start_apply.htm" target="hidden_frame">

	<input type="hidden" name="current_page" value="Advanced_Extensions_softether.asp">
	<input type="hidden" name="next_page" value="">
	<input type="hidden" name="next_host" value="">
	<input type="hidden" name="sid_list" value="LANHostConfig;General;">
	<input type="hidden" name="group_id" value="">
	<input type="hidden" name="action_mode" value="">
	<input type="hidden" name="action_script" value="">
	<input type="hidden" name="wan_ipaddr" value="<% nvram_get_x("", "wan0_ipaddr"); %>" readonly="1">
	<input type="hidden" name="wan_netmask" value="<% nvram_get_x("", "wan0_netmask"); %>" readonly="1">
	<input type="hidden" name="dhcp_start" value="<% nvram_get_x("", "dhcp_start"); %>">
	<input type="hidden" name="dhcp_end" value="<% nvram_get_x("", "dhcp_end"); %>">

	<div class="container-fluid">
	<div class="row-fluid">
	<div class="span3">
	<!--Sidebar content-->
	<!--=====Beginning of Main Menu=====-->
	<div class="well sidebar-nav side_nav" style="padding: 0px;">
	<ul id="mainMenu" class="clearfix"></ul>
	<ul class="clearfix">
	<li>
	<div id="subMenu" class="accordion"></div>
	</li>
	</ul>
	</div>
	</div>

	<div class="span9">
	<!--Body content-->
	<div class="row-fluid">
	<div class="span12">
	<div class="box well grad_colour_dark_blue">
	<h2 class="box_head round_top">Softether VPN server</h2>
	<div class="round_bottom">
	<div class="row-fluid">
	<div id="tabMenu" class="submenuBlock"></div>
	<div class="alert alert-info" style="margin: 10px;">SoftEther VPN是日本筑波大学的一个开源免费跨平台的多协议VPN的研究项目<div>开启<a href="https://www.softether.org/" target="_blank"> <i><u>SoftEther VPN</u></i></a>后，需要用<a href="http://www.softether-download.com/cn.aspx?product=softether" target="_blank"> <i><u>SoftEther VPN Server Manager</u></i></a>进行进一步设置。</div><div>默认允许 500、4500、1701 udp端口通过防火墙，需要根据实际使用的端口情况手动设置<a href="../Advanced_VirtualServer_Content.asp" target="_parent" hidefocus="true">端口转发</a>。</div><div>本插件参考 sadoneli 的 KoolShare 插件，感谢！</div><div><a href="http://koolshare.cn/thread-67572-1-2.html" target="blank">SoftEther V.P.N Server，附L2tp with ipsec设置教程</a> </div><div><a href="http://www.right.com.cn/forum/thread-149729-1-1.html" target="blank">Tomato路由器安装SoftEther VPN服务器图文教程</a> </div> <span style="color:#FF0000;" class=""></span></div>

	<table width="100%" align="center" cellpadding="4" cellspacing="0" class="table">
	<tr>
	<th colspan="2" style="background-color: #E3E3E3;">开关</th>
	</tr>
	<tr>
	<th width="30%">Softether VPN server 开关</th>
	<td>
	<div class="main_itoggle">
	<div id="softether_enable_on_of">
	<input type="checkbox" id="softether_enable_fake" <% nvram_match_x("", "softether_enable", "1", "value=1 checked"); %><% nvram_match_x("", "softether_enable", "0", "value=0"); %>  />
	</div>
	</div>
	<div style="position: absolute; margin-left: -10000px;">
	<input type="radio" value="1" name="softether_enable" id="softether_enable_1" class="input" value="1" <% nvram_match_x("", "softether_enable", "1", "checked"); %> /><#checkbox_Yes#>
	<input type="radio" value="0" name="softether_enable" id="softether_enable_0" class="input" value="0" <% nvram_match_x("", "softether_enable", "0", "checked"); %> /><#checkbox_No#>
	</div>
	</td>
	</tr>
	<tr id="softether_path_tr" >
	<th style="border: 0 none;">主程序路径:</th>
	<td style="border: 0 none;">
	<input type="text" maxlength="512"  class="input" size="60" name="softether_path" placeholder="/opt/softether/vpnserver" value="<% nvram_get_x("","softether_path"); %>" onKeyPress="return is_string(this,event);" />
	</td>
	</tr>
	<tr>
	<th colspan="2" style="background-color: #E3E3E3;" >启动前运行的脚本</th>
	</tr>
	<tr id="softether_script" colspan="3">
	<td colspan="2" style="border-top: 0 none;">
	<i class="icon-hand-right"></i> <a href="javascript:spoiler_toggle('script12')"><span>softether_script</span><div>&nbsp;<span style="color:#888;">查看以下文件修改 softether 启动前运行的脚本。</span></div></a>
	<div id="script12" style="display:none;">
	<textarea rows="24" wrap="off" spellcheck="false" maxlength="2097152" class="span12" name="scripts.softether_script.sh" style="font-family:'Courier New'; font-size:12px;"><% nvram_dump("scripts.softether_script.sh",""); %></textarea>
	</div>
	</td>
	</tr>
	
	<tr>
	<td colspan="2" style="border-top: 0 none;">
	<br />
	<center><input class="btn btn-primary" style="width: 219px" type="button" value="<#CTL_apply#>" onclick="applyRule()" /></center>
	</td>
	</tr>
	</table>
	</div>
	</div>
	</div>
	</div>
	</div>
	</div>
	</div>
	</div>

	</form>

	<div id="footer"></div>
</div>
</body>
</html>

