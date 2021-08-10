<%@ LANGUAGE="VBScript" %>
<!--#include file="admin.asp"-->
<!--#include file="conn.asp"-->
<!--#include file="Inc/articlechar.inc"-->
<%
if Request.QueryString("no")="eshop" then
If request.form("title")="" Then
Response.Write("<script language=""JavaScript"">alert(""错误：您没输入标题，请返回检查！！"");history.go(-1);</script>")
response.end
end if


If request.form("content")="" Then
Response.Write("<script language=""JavaScript"">alert(""错误：您没输入留言内容，请返回检查！！"");history.go(-1);</script>")
response.end
end if

Set rs = Server.CreateObject("ADODB.Recordset")
sql="select * from book"
rs.open sql,conn,1,3


rs.addnew
if request.form("html")="on" then
rs("content")=request.form("content")
else
rs("content")=htmlencode2(request.form("content"))
end if
rs("name")=request.form("name")
rs("title")=request.form("title")
rs("time")=date()
rs.update
rs.close
response.redirect "Manage_Book.asp"
end if

%>
<!-- #include file="Inc/Head.asp" -->
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
  <tr> 
    <td width="150" align="center" valign="top"> <table width="150" height="100%" border="0" cellpadding="0" cellspacing="0" class="HeaderTdStyle">
        <tr> 
          <td align="center" valign="top"><table width="100%" height="24" border="0" cellpadding="0" cellspacing="0">
              <tr> 
                <td align="center">功能菜单</td>
              </tr>
            </table>
            <table width="100%" height="90%" border="0" cellpadding="0" cellspacing="0" class="MenuBg">
              <tr> 
                <td align="center" valign="top"><br>
                </td>
              </tr>
            </table></td>
        </tr>
      </table></td>
    <td align="center" valign="top">
	<br>      
      <br>
      <br>
      <table width="600" border="0" align="center" cellpadding="0" cellspacing="0" bordercolor="#111111" style="border-collapse: collapse">
        <tr> 
          <td width="9"> <img border="0" src="../../0791idc/Images/top_1.gif" width="59" height="20"></td>
          <td width="731" background="../../0791idc/Images/top_2.gif">　</td>
          <td width="10"> <img border="0" src="../../0791idc/Images/top_3.gif" width="36" height="20"></td>
        </tr>
      </table>
      <table width="600" height="69" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#111111" bordercolorlight="#57801A" bordercolordark="#57801A" style="border-collapse: collapse">
        <tr> 
          <td width="100%" background="../../0791idc/Images/bg1.gif" height="26"> 
            <p align="center">对不起，你访问的网页试用版没有提供，要想更好的服务，请联系我们！</td>
        </tr>
        <tr> 
          <td width="100%" height="41" valign="top"> 　　<br>
            　　只要在<font color="#FF0000"><strong>南方数据(<a href="http://www.0791idc.com">http://www.0791idc.com</a>)</strong></font>购买空间的客户可免费获得正式版(包括所有的功能),同时还能免费享受一年的升级服务，我们有一支技术和设计一流的开发团队，过不了多久有会就新的版本推出。 
            <br>
            　　南方数据为广大个人和企业提供专业精美的网站代码，所提供的代码功能强大，同时为您定制需要的功能，现在正在提供的商业代码有：房产系统，企业商务网；地方信息港；网络办公系统，专业下载系统，专业影视系统，专业音乐下载系统，新闻系统，网络营销mlm系统，网上购物系统等......<br> 
            <br>
            　　完整演示前台：<a href="http://china.0791idc.com">http://china.0791idc.com</a> 
            <br> <br>
            　　完整演示后台：<a href="http://china.0791idc.com/admin">http://china.0791idc.com/admin</a><br> 
            <br>
            　　用户名：admin 　密码：admin<br> <p> 　　访问我们的网站：<a href="http://www.0791idc.com">http://www.0791idc.com</a></p>
            <p>　　论坛：<a href="http://bbs.0791idc.com">http://bbs.0791idc.com</a> 
            </p>
            <p>　　联系方式:QQ:65427071 Email:hdz2008@@163.com Tel:0791-6274752 <br>
              <br>
              　　南方数据为广大网友最低100元制作精美主页,专业的程序提供,现在活动中...... 
            <p>　　期待志同道合的网页设计人员加入我们，最好精通一门语言。 
            <p><br>
          </td>
        </tr>
      </table>
      <table width="600" border="0" align="center" cellpadding="0" cellspacing="0" bordercolor="#111111" style="border-collapse: collapse">
        <tr> 
          <td width="4"> <img border="0" src="../../0791idc/Images/end_1.gif" width="7" height="17"></td>
          <td width="740" background="../../0791idc/Images/end_2.gif">　</td>
          <td width="6"> <img border="0" src="../../0791idc/Images/end_3.gif" width="7" height="17"></td>
        </tr>
      </table> </td>
  </tr>
</table>
<!-- #include file="Inc/Foot.asp" -->