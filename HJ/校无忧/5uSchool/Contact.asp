<!--#include file="inc/config.asp"-->
<!--#include file="inc/conn.asp"-->
<%
set rs=Server.CreateObject("Adodb.Recordset")
rs.open "select * from About where id=6",Conn,1,2
%>
<!DOCTYPE html PUBLIC "-//W3C//Dtd XHTML 1.0 Transitional//EN" "http://www.w3.org/tr/xhtml1/Dtd/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>联系我们_<%=SiteName%>_校无忧科技_Www.Xiao5u.Com</title>
<meta name="keywords" content="<%=keywords%>"/>
<meta name="description" content="<%=description%>"/>
<link href="images/Xiao5u.css" rel="stylesheet" type="text/css">
<!--#include file=images/ini.sys -->
</head>
<body>
<table width="1000" border="0" bgcolor="#FFFFFF" align="center">
  <tr>
    <td>
<!--#include file="inc/top.asp"-->
<table width="1000" border="0" align="center" cellpadding="0" cellspacing="0" id="bor">
  <tr>
    <td width="233" valign="top"><!--#include file="inc/left.asp"--></td>
    <td valign="top"><table width="757" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td width="132" height="33" align="center" background="images/right_01.jpg" class=whitetitle><%=rs("title")%></td>
        <td width="616" align="right" background="images/right_02.jpg"><img src="images/home.gif" width="16" height="16" align="absmiddle" />您当前的位置：<a href="index.asp">首页</a> &gt;&gt; <%=rs("title")%></td>
        <td><img src="images/right_03.jpg" width="9" height="33" /></td>
      </tr>
    </table>
      <table width="757" border="0" align="center" cellpadding="0" cellspacing="0" background="images/right_04.jpg">
        <tr>
          <td><table width="96%" border="0" align="center" cellpadding="5" cellspacing="0">
            <tr>
              <td class=txt><%=rs("content")%></td>
            </tr>
          </table></td>
        </tr>
        <tr>
          <td><img src="images/right_05.jpg" width="757" height="6" /></td>
        </tr>
      </table></td>
  </tr>
</table>
<!--#include file="inc/bottom.asp"-->
	</td>
  </tr>
</table>
<%
rs.close
set rs=nothing
%>
</body>
</html>