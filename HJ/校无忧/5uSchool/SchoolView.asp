<!--#include file="inc/config.asp"-->
<!--#include file="inc/conn.asp"-->
<%
id=Trim(request("id"))
if id="" or IsNumeric(id)=false then
  response.Redirect("School.asp")
end if
Set rs=Server.CreateObject("Adodb.Recordset")
rs.open "select * from School where id="&id,Conn,1,2
%>
<!DOCTYPE html PUBLIC "-//W3C//Dtd XHTML 1.0 Transitional//EN" "http://www.w3.org/tr/xhtml1/Dtd/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title><%=rs("title")%>_<%=SiteName%>_校无忧科技_Www.Xiao5u.Com</title>
<meta name="keywords" content="<%=keywords%>"/>
<meta name="description" content="<%=description%>"/>
<link href="images/Xiao5u.css" rel="stylesheet" type="text/css">
</head>
<body>
<table width="1000" border="0" bgcolor="#FFFFFF" align="center">
  <tr>
    <td>
<!--#include file="inc/top.asp"-->
<table width="1000" border="0" align="center" cellpadding="0" cellspacing="0" id="bor">
  <tr>
    <td valign="top"><table width="1000" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td width="132" height="33" align="center" background="images/center_01.jpg" class=whitetitle>浏览信息</td>
        <td width="868" align="right" background="images/center_02.jpg"><img src="images/home.gif" width="16" height="16" align="absmiddle" />您当前的位置：<a href="index.asp">首页</a> &gt;&gt; 浏览信息</td>
        <td><img src="images/center_03.jpg" width="9" height="33" /></td>
      </tr>
    </table>
      <table width="1000" border="0" align="center" cellpadding="0" cellspacing="0" background="images/center_04.jpg">
        <tr>
          <td><table width="98%" border="0" cellspacing="0" cellpadding="5" align=center>
          <tr>
            <td align="center" class="title"><%=rs("title")%></td>
            </tr>
          <tr>
            <td align="center" bgcolor="efefef" >发布时间：<%=rs("addtime")%></td>
          </tr>
		  <tr>
            <td align="center"><img src="<%=rs("pic")%>"></td>
          </tr>
        </table>
            <table width="98%" border="0" align="center" cellpadding="5" cellspacing="0">
              <tr>
                <td align="center">【<a href="javascript:window.close()">关闭页面</a>】【<a href="#top">页面顶部</a>】</td>
              </tr>
            </table></td>
        </tr>
        <tr>
          <td><img src="images/center_05.jpg" width="1000" height="6" /></td>
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