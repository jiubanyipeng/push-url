<!--#include file="inc/right.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>校无忧管理系统</title>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	background-color: #ecf4ff;
}
.dtree {
	font-family: Verdana, Geneva, Arial, Helvetica, sans-serif;
	font-size: 12px;
	color: #0000ff;
	white-space: nowrap;
}
.dtree img {
	border: 0px;
	vertical-align: middle;
}
.dtree a {
	color: #333;
	text-decoration: none;
}
.dtree a.node, .dtree a.nodeSel {
	white-space: nowrap;
	padding: 1px 2px 1px 2px;
}
.dtree a.node:hover, .dtree a.nodeSel:hover {
	color: #0000ff;
}
.dtree a.nodeSel {
	background-color: #AED0F4;
}
.dtree .clip {
	overflow: hidden;
}
-->
</style>
<link href="images/main.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="images/dtree.js"></script>
</head>
<body>
<table width="96%"  border="0" cellpadding="10" cellspacing="0" align=center >
  <tr>
   <td valign="top" >
   <div class=menu>
    <table width="100%"  border="0" cellpadding="0" cellspacing="0">
     <tr>
      <td height=25><a href="javascript: d.openAll();"><img src="images/view_detailed.gif" width="15" height="15" border="0" align="absmiddle" alt="展开列表"></a> <a href="javascript: d.closeAll();"><img src="images/view_tree.gif" width="15" height="15" border="0" align="absmiddle" alt="收缩列表"></a> | <a href="main.asp" target="mainFrame">系统首页</a> | <a href="../" target="_blank">网站首页</a></td>
     </tr>
     <tr>
      <td>
	  <script type="text/javascript">
	  <!--
	  d = new dTree('d');
	  d.config.target="mainFrame";
	  d.add(0,-1,' 网站内容管理');
      d.add(1, 0, ' 管理员管理', 'Admin.asp?action=list');
	  d.add(2, 0, ' 网站信息', 'SiteConfig.asp');
      d.add(2, 0, ' 在线留言', 'feedback.asp?action=list');
      d.add(3, 0, ' 友情链接', 'Link.asp?action=list');
	  d.add(4, 0, ' 基本管理', '');
      d.add(41, 4, ' 栏目管理', 'SClass.asp?action=list');
      d.add(42, 4, ' 文章管理', 'Article.asp?action=list');
	  d.add(5, 0, ' 学校概况', '');
      d.add(51, 5, ' 内容列表', 'About.asp?action=list');
      d.add(52, 5, ' 添加内容', 'About.asp?action=add');
	  d.add(6, 0, ' 校园风貌', '');
      d.add(61, 6, ' 校园列表', 'School.asp?action=list');
      d.add(62, 6, ' 添加校园', 'School.asp?action=add');
	  d.add(7, 0, ' 数据管理[商]', '');
	  d.add(71, 7, ' 系统占用[商]', 'Buy.asp');
	  d.add(72, 7, ' 压缩数据[商]', 'Buy.asp');	
	  d.add(73, 7, ' 备份数据[商]', 'Buy.asp');	
	  d.add(74, 7, ' 恢复数据[商]', 'Buy.asp');
	  d.add(8, 0, ' 技术支持', '');
	  d.add(81, 8, ' 网站：校无忧科技', 'http://www.xiao5u.com');
	  d.add(82, 8, ' QQ：94009759', 'tencent://message/?uin=94009759&Site=校无忧-Xiao5u.Com&Menu=yes');		
	  d.add(83, 8, ' KF@Xiao5u.Com', 'mailto:kf@Xiao5u.Com');			
	  document.write(d);
	  //-->
	  </script>
	  </td>
     </tr>
    </table>
   </div>
   </td>
  </tr>
</table>
</body>
</html>