<%
'=================================
'
'    SOUTHIDC.NET(南方数据)
'    QQ:635495 MSN:jxhwq@hotmail.com
'    Email:hdz2008@163.com  
'    http://www.southidc.net
'    copyright(c)2004 科创网络
'
'=================================
%>
<html><head>
<meta http-equiv=Content-Type content=text/html;charset=gb2312>
<link href="Inc/southidc.css" rel="stylesheet" type="text/css">
<style type="text/css">
BODY {
	BACKGROUND:799ae1; MARGIN: 0px;
}

.sec_menu {
	BORDER-RIGHT: white 1px solid; BACKGROUND: #d6dff7; OVERFLOW: hidden; BORDER-LEFT: white 1px solid; BORDER-BOTTOM: white 1px solid
}

.menu_title SPAN {
	FONT-WEIGHT: bold; LEFT: 10px; COLOR: #215dc6; POSITION: relative; TOP: 2px 
}

.menu_title2 SPAN {
	FONT-WEIGHT: bold; LEFT: 10px; COLOR: #428eff; POSITION: relative; TOP: 2px
}
</style>
</head>

<BODY>
<table cellspacing="0" cellpadding="0" width="158" align="center">
	<tr>
		<td valign="bottom" height="42">
		<img height="38" src="image/title.gif" width="158" border="0"></td>
	</tr>
	<tr>
		
    <td class="menu_title" onmouseover="this.className='menu_title2';" onmouseout="this.className='menu_title';" background="image/title_bg_quit.gif" height="25"> 
      <span><b><a target="_top" href="../index.asp"><font color="215DC6">回到首页</font></a></b> 
      | <a target="_top" href="Loginout.asp"><font color="215DC6"><b>退出 </font></a></b></span></td>
	</tr>
	<tr>
		
    <td align="center" onmouseover="aa('up')" onmouseout="StopScroll()">&nbsp; </td>
	</tr>
</table>
<script>
var he=document.body.clientHeight-105
document.write("<div id=tt style=height:"+he+";overflow:hidden>")
</script>
<table cellspacing="0" cellpadding="0" width="158" align="center">
	<tr>
		
    <td id="imgmenu1" class="menu_title" onmouseover="this.className='menu_title2';" onclick="showsubmenu(1)" onmouseout="this.className='menu_title';" style="cursor:hand" background=image/menudown.gif height="25"> 
      <span>系统管理 </span></td>
	</tr>

	<tr>
		<td id="submenu1" style="DISPLAY: none">
		<div class="sec_menu" style="WIDTH: 158px">
			
        <table cellspacing="3" cellpadding="0" width="130" align="center">
          <tr> 
            <td><a target="main" href="Manage_Admin.asp">管理员管理</a></td>
          </tr>
          <tr> 
            <td><a target="main" href="Manage_AddAffiche.asp">网站公告</a></td>
          </tr>
          <tr> 
            <td><a target="main" href="SiteConfig.asp">网站配置</a></td>
          </tr>
          <tr> 
            <td><a target="main" href="Bs.asp"></a><a target="main" href="Manage_backup.asp">数据库备份</a></td>
          </tr>
          <tr> 
            <td><a target="main" href="Help.asp">系统帮<font color="000000">助</font></a></td>
          </tr>
          <tr> 
            <td><a target="main" href="UploadFileManage.asp">上传文件管理</a></td>
          </tr>
        </table>
		</div>
		<br>
		</td>
	</tr>

	<tr>
		
    <td id="imgmenu2" class="menu_title" onmouseover="this.className='menu_title2';" onclick="showsubmenu(2)" onmouseout="this.className='menu_title';" style="cursor:hand" background="image/menudown.gif" height="25"> 
      <span>企业信息 </span></td>
	</tr>
	<tr>
		<td id="submenu2" style="DISPLAY: none">
		<div class="sec_menu" style="WIDTH: 158px">
			
        <table cellspacing="3" cellpadding="0" width="130" align="center">
          <tr> 
            <td><a target="main" href="Manage_Main.asp">企业简介</a></td>
          </tr>
          <tr> 
            <td><a target="main" href="Manage_Main1.asp">组织机构</a></td>
          </tr>
          <tr> 
            <td><a href="Manage_culture.asp" target="main">管理企业文化</a></td>
          </tr>
          <tr> 
            <td><a href="Manage_cultureNewsAdd.asp" target="main">增加企业文化</a></td>
          </tr>
          <tr> 
            <td><a href="Manage_Main3.asp" target="main">成长历程</a></td>
          </tr>
          <tr> 
            <td><a target="main" href="Manage_Main4.asp">联系我们</a></td>
          </tr>
        </table>
		</div>
		<br>
		</td>
	</tr>

	<tr>
		
    <td id="imgmenu3" class="menu_title" onmouseover="this.className='menu_title2';" onclick="showsubmenu(3)" onmouseout="this.className='menu_title';" style="cursor:hand" background="image/menudown.gif" height="25"> 
      <span>产品管理 </span></td>
	</tr>
	<tr>
		<td id="submenu3" style="DISPLAY: none">
		<div class="sec_menu" style="WIDTH: 158px">
			<table cellspacing="3" cellpadding="0" width="130" align="center">
				<tr>
            <td><a target="main" href="ClassManage.asp"><font color="000000">产品类别设置</font></a></td>
          </tr>
				<tr>
            <td><a target="main" href="ProductManage.asp"><font color="000000">产品管理</font></a></td>
          </tr>
				<tr>
            <td><a target="main" href="ProductAdd.asp"><font color="000000">添加产品</font></a></td>
          </tr>
				<tr>
            <td><a target="main" href="ProductCheck.asp"><font color="000000">审核产品</font></a></td>
          </tr>
			</table>
		</div>
		<br>
		</td>
	</tr>

	<tr>
		
    <td id="imgmenu4" class="menu_title" onmouseover="this.className='menu_title2';" onclick="showsubmenu(4)" onmouseout="this.className='menu_title';" style="cursor:hand" background="image/menudown.gif" height="25"> 
      <span>订单管理 </span></td>
	</tr>
	<tr>
		<td id="submenu4" style="DISPLAY: none">
		<div class="sec_menu" style="WIDTH: 158px">
			
        <table cellspacing="3" cellpadding="0" width="130" align="center">
          <tr>
            <td><a target="main" href="Manage_Eshop.asp"><font color="000000">订单管理</font></a></td>
          </tr>
          <tr>
            <td><a href="Manage_pay.asp" target="main">支付管理</a></td>
          </tr>
        </table>
		</div>
		<br>
		</td>
	</tr>

	<tr>		
    <td id="imgmenu14" class="menu_title" onmouseover="this.className='menu_title2';" onclick="showsubmenu(14)" onmouseout="this.className='menu_title';" style="cursor:hand" background="image/menudown.gif" height="25"> 
      <span>下载中心 </span></td>
	</tr>
	<tr>
		<td id="submenu14" style="DISPLAY: none">
		<div class="sec_menu" style="WIDTH: 158px">
			
        <table cellspacing="3" cellpadding="0" width="130" align="center">
          <tr> 
            <td><a href="Down_admin_add.asp" target="main">添加下载程序</a></td>
          </tr>
          <tr> 
            <td><a href="Down_Manage.asp" target="main">管理下载程序</a></td>
          </tr>
          <tr> 
            <td><a href="Down_ClassManage.asp" target="main">下载程序类别</a></td>
          </tr>
        </table>
		</div>
		<br>
		</td>
	</tr>


	<tr>
		
    <td id="imgmenu5" class="menu_title" onmouseover="this.className='menu_title2';" onclick="showsubmenu(5)" onmouseout="this.className='menu_title';" style="cursor:hand" background="image/menudown.gif" height="25"> 
      <span>会员管理 </span></td>
	</tr>
	<tr>
		<td id="submenu5" style="DISPLAY: none">
		<div class="sec_menu" style="WIDTH: 158px">
			<table cellspacing="3" cellpadding="0" width="130" align="center">
				<tr>
            <td><a target="main" href="UserManage.asp"><font color="000000">注册会员管理</font></a></td>
          </tr>
			</table>
		</div>
		<br>
		</td>
	</tr>

	<tr>
		
    <td id="imgmenu6" class="menu_title" onmouseover="this.className='menu_title2';" onclick="showsubmenu(6)" onmouseout="this.className='menu_title';" style="cursor:hand" background="image/menudown.gif" height="25"> 
      <span>新闻管理 </span></td>
	</tr>
	<tr>
		<td id="submenu6" style="DISPLAY: none">
		<div class="sec_menu" style="WIDTH: 158px">
			
        <table cellspacing="3" cellpadding="0" width="130" align="center">
          <tr> 
            <td> <a href="News_add.asp" target="main">添加新闻内容</a> </td>
          </tr>
          <tr> 
            <td><a href="News_Manage.asp" target="main">管理全部新闻</a></td>
          </tr>
          <tr> 
            <td><a href="News_ClassManage.asp" target="main">管理新闻类别</a></td>
          </tr>
        </table>
		</div>
		<br>
		</td>
	</tr>
	
	<tr>
		
    <td id="imgmenu7" class="menu_title" onmouseover="this.className='menu_title2';" onclick="showsubmenu(7)" onmouseout="this.className='menu_title';" style="cursor:hand" background="image/menudown.gif" height="25"> 
      <span>留言管理 </span></td>
	</tr>
	<tr>
		<td id="submenu7" style="DISPLAY: none">
		<div class="sec_menu" style="WIDTH: 158px">
			<table cellspacing="3" cellpadding="0" width="130" align="center">
				<tr>
            <td><a target="main" href="Manage_Book.asp"><font color="000000">留言管理</font></a></td>
          </tr>
				<tr>
            <td><a target="main" href="Manage_AddBook.asp"><font color="000000">管理员公告</font></a></td>
          </tr>
			</table>
		</div>
		<br>
		</td>
	</tr>

	<tr>
		
    <td id="imgmenu8" class="menu_title" onmouseover="this.className='menu_title2';" onclick="showsubmenu(8)" onmouseout="this.className='menu_title';" style="cursor:hand" background="image/menudown.gif" height="25"> 
      <span>荣誉管理 </span></td>
	</tr>
	<tr>
		<td id="submenu8" style="DISPLAY: none">
		<div class="sec_menu" style="WIDTH: 158px">
			<table cellspacing="3" cellpadding="0" width="130" align="center">
				<tr>
            <td><a target="main" href="Manage_honor.asp"><font color="000000">企业荣誉管理</font></a></td>
          </tr>
				<tr>
            <td><a target="main" href="Manage_honor_add.asp"><font color="000000">添加公司荣誉</font></a></td>
          </tr>
				<tr>
            <td><a target="main" href="Manage_Img.asp"><font color="000000">企业形象管理</font></a></td>
          </tr>
				<tr>
            <td><a target="main" href="Manage_Img_add.asp"><font color="000000">添加公司形象</font></a></td>
          </tr>
			</table>
		</div>
		<br>
		</td>
	</tr>

	<tr>
		
    <td id="imgmenu10" class="menu_title" onmouseover="this.className='menu_title2';" onclick="showsubmenu(10)" onmouseout="this.className='menu_title';" style="cursor:hand" background="image/menudown.gif" height="25"> 
      <span>营销网络 </span></td>
	</tr>
	<tr>
		<td id="submenu10" style="DISPLAY: none">
		<div class="sec_menu" style="WIDTH: 158px">
			<table cellspacing="3" cellpadding="0" width="130" align="center">
				<tr>
            <td><a target="main" href="Manage_sale.asp"><font color="000000">国内市场</font></a></td>
          </tr>
				<tr>
            <td><a target="main" href="Manage_salea.asp"><font color="000000">国际市场</font></a></td>
          </tr>
			</table>
		</div>
		<br>
		</td>
	</tr>

	<tr>
		
    <td id="imgmenu9" class="menu_title" onmouseover="this.className='menu_title2';" onclick="showsubmenu(9)" onmouseout="this.className='menu_title';" style="cursor:hand" background="image/menudown.gif" height="25"> 
      <span>人才管理 </span></td>
	</tr>
	<tr>
		<td id="submenu9" style="DISPLAY: none">
		<div class="sec_menu" style="WIDTH: 158px">
			<table cellspacing="3" cellpadding="0" width="130" align="center">
				<tr>
            <td><a target="main" href="Manage_Job.asp"><font color="000000">招聘管理</font></a></td>
          </tr>
				<tr>
            <td><a target="main" href="Manage_JobAdd.asp"><font color="000000">发布招聘</font></a></td>
          </tr>
				<tr>
            <td><a target="main" href="Manage_JobBook.asp"><font color="000000">应聘管理</font></a></td>
          </tr>
				<tr>
            <td><a target="main" href="Manage_Jobs.asp"><font color="000000">人才策略</font></a></td>
          </tr>
			</table>
		</div>
		<br>
		</td>
	</tr>

	<tr>
		
    <td id="imgmenu11" class="menu_title" onmouseover="this.className='menu_title2';" onclick="showsubmenu(11)" onmouseout="this.className='menu_title';" style="cursor:hand" background="image/menudown.gif" height="25"> 
      <span>调查管理 </span></td>
	</tr>
	<tr>
		<td id="submenu11" style="DISPLAY: none">
		<div class="sec_menu" style="WIDTH: 158px">
			<table cellspacing="3" cellpadding="0" width="130" align="center">
				<tr>
            <td><a target="main" href="VoteManage.asp"><font color="000000">调查设置</font></a></td>
          </tr>
				<tr>
            <td><a target="main" href="VoteAdd.asp"><font color="000000">添加新调查</font></a></td>
          </tr>
			</table>
		</div>
		<br>
		</td>
	</tr>

	<tr>		
    <td id="imgmenu12" class="menu_title" onmouseover="this.className='menu_title2';" onclick="showsubmenu(12)" onmouseout="this.className='menu_title';" style="cursor:hand" background="image/menudown.gif" height="25"> 
      <span>邮件列表 </span></td>
	</tr>
	<tr>
		<td id="submenu12" style="DISPLAY: none">
		<div class="sec_menu" style="WIDTH: 158px">
			<table cellspacing="3" cellpadding="0" width="130" align="center">
				<tr>
            <td><a target="main" href="Maildefault.asp"><font color="000000">邮件列表设置</font></a></td>
          </tr>
				<tr>
            <td><a target="main" href="Sendmail.asp"><font color="000000">发送邮件</font></a></td>
          </tr>
				<tr>
            <td><a target="main" href="Viewuser.asp"><font color="000000">用户管理</font></a></td>
          </tr>
				<tr>
            <td><a target="main" href="Adduser.asp"><font color="000000">添加用户</font></a></td>
          </tr>
			</table>
		</div>
		<br>
		</td>
	</tr>

	<tr>		
    <td id="imgmenu13" class="menu_title" onmouseover="this.className='menu_title2';" onclick="showsubmenu(13)" onmouseout="this.className='menu_title';" style="cursor:hand" background="image/menudown.gif" height="25"> 
      <span>友情链接 </span></td>
	</tr>
	<tr>
		<td id="submenu13" style="DISPLAY: none">
		<div class="sec_menu" style="WIDTH: 158px">
			<table cellspacing="3" cellpadding="0" width="130" align="center">
				<tr>
            <td><a target="main" href="Manage_Link.asp"><font color="000000">友情链接管理</font></a></td>
          </tr>
			</table>
		</div>
		<br>
		</td>
	</tr>

<tr>		
    <td id="imgmenu15" class="menu_title" onmouseover="this.className='menu_title2';" onclick="showsubmenu(15)" onmouseout="this.className='menu_title';" style="cursor:hand" background="image/menudown.gif" height="25"> 
      <span>模板管理 </span></td>
	</tr>
	<tr>
		<td id="submenu15" style="DISPLAY: none">
		<div class="sec_menu" style="WIDTH: 158px"> 
        <table cellspacing="3" cellpadding="0" width="130" align="center">
          <tr> 
            <td><a href="Admin_Skin.asp" target="main">配色模板管理</a></td>
          </tr>
          <tr> 
            <td><a href="Admin_Skin.asp?Action=Add" target="main">配色模板添加</a></td>
          </tr>
          <tr>
            <td><a href="Admin_Skin.asp?Action=Export" target="main">配色模板导出</a></td>
          </tr>
          <tr> 
            <td><a href="Admin_Skin.asp?Action=Import" target="main">配色模板导入</a></td>
          </tr>
        </table>
      </div>
		<br>
		</td>
	</tr>


</table>
&nbsp;
<table cellspacing="0" cellpadding="0" width="158" align="center">
	<tr>
		
    <td class="menu_title" onmouseover="this.className='menu_title2';" onmouseout="this.className='menu_title';" background="image/title_bg_quit.gif" height="25"> 
      <span>Web Information</span> </td>
	</tr>
	<tr>
		<td>
		<div class="sec_menu" style="WIDTH: 158px">
			<div align="center">
			<table cellspacing="4" cellpadding="3">
				<tr>
					
              <td width="141" height="20" style="line-height: 150%;"> SOUTHIDC.NET 
                V5.0<br>
                Copyright：<a target="_blank" href="http://www.southidc.net/"><font color="000000"
					>southidc<font color="FF0000">.net</font></font></a><br>
                Design By： <a href="mailto:hdz2008@163.com"><font color="000000">weiqun</font></a><br>
					</td>
				</tr>
			</table>
			</div>
		</div>
		</td>
	</tr>
</table>
</div>
<table cellspacing="0" cellpadding="0" width="158" align="center">
	<tr>
		
    <td align="center" onmouseover="aa('Down')" onmouseout="StopScroll()" valign="bottom">&nbsp; 
    </td>
	</tr>
</table>
<script>

function aa(Dir)
{tt.doScroll(Dir);Timer=setTimeout('aa("'+Dir+'")',100)}//这里100为滚动速度
function StopScroll(){if(Timer!=null)clearTimeout(Timer)}

function initIt(){
divColl=document.all.tags("DIV");
for(i=0; i<divColl.length; i++) {
whichEl=divColl(i);
if(whichEl.className=="child")whichEl.style.display="none";}
}
function expands(el) {
whichEl1=eval(el+"Child");
if (whichEl1.style.display=="none"){
initIt();
whichEl1.style.display="block";
}else{whichEl1.style.display="none";}
}
var tree= 0;
function loadThreadFollow(){
if (tree==0){
document.frames["hiddenframe"].location.replace("LeftTree.asp");
tree=1
}
}

function showsubmenu(sid)
{
whichEl = eval("submenu" + sid);
imgmenu = eval("imgmenu" + sid);
if (whichEl.style.display == "none")
{
eval("submenu" + sid + ".style.display=\"\";");
imgmenu.background="image/menuup.gif";
}
else
{
eval("submenu" + sid + ".style.display=\"none\";");
imgmenu.background="image/menudown.gif";
}
}

function loadingmenu(id){
var loadmenu =eval("menu" + id);
if (loadmenu.innerText=="Loading..."){
document.frames["hiddenframe"].location.replace("LeftTree.asp?menu=menu&id="+id+"");
}
}
top.document.title="南方数据企业网站管理系统"; 
</script>
</BODY></HTML>
