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
response.redirect "Manage_AddBook.asp"
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
                <td align="center" valign="top"><br> <table width="90%" border="0" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td width="16%"><img src="../Img/Left_1.gif" width="28" height="11"></td>
                      <td width="84%" height="20"><font color="#FFFF00">留言管理</font></td>
                    </tr>
                  </table>
                  <table width="90%" border="0" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td width="34%" height="20" align="right"><img src="../Img/Left_1_1.gif" width="29" height="16"></td>
                      <td width="66%" valign="bottom"><a href="Manage_Book.asp"><font color="#FFFF00">留言管理</font></a></td>
                    </tr>
                  </table>
                  
                  <table width="90%" border="0" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td width="34%" height="20" align="right"><img src="../Img/Left_1_1.gif" width="29" height="16"></td>
                      <td width="66%" valign="bottom"><a href="Manage_AddBook.asp"><font color="#FFFF00">管理员公告</font></a></td>
                    </tr>
                  </table></td>
              </tr>
            </table></td>
        </tr>
      </table></td>
    <td align="center" valign="top">
	<br>
      <strong><br>
      </strong> <br>
      <br>
      <table width="550" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td height="25"> <div align="center"><strong>发布管理员公告<br>
              <br>
              </strong></div></td>
        </tr>
        <tr> 
            <form method="POST" action="Manage_AddBook.asp?no=eshop">
<input type=hidden readonly name="Name"   value="管理员">
			<td><div align="center"> 
                <table width="80%" border="0" cellspacing="2" cellpadding="3">
                  <tr bgcolor="#C0C0C0"> 
                    <td width="8%" height="25" bgcolor="#C0C0C0"> <div align="center">标&nbsp;&nbsp;题</div></td>
                    <td width="62%" bgcolor="#C0C0C0"><input type="text" name="title" size="45"></td>
                  </tr>
                  <tr bgcolor="#E3E3E3"> 
                    <td height="22" bgcolor="#E3E3E3"> <div align="center">内&nbsp;&nbsp;容</div></td>
                    <td bgcolor="#E3E3E3"><textarea rows="8" name="Content" cols="45"></textarea></td>
                  </tr>
                  <tr bgcolor="#C0C0C0"> 
                    <td height="25" colspan="2"> 
                      <div align="center">是否支持html <input type="checkbox" name="html" value="on"> <input type="submit" value="提交公告" name="B1"> <input type="reset" value="全部重写" name="B2"></div></td>
                  </tr>
                </table>
              </div></td></form>
        </tr>
      </table>
      <br>
      <br>
    </td>
  </tr>
</table>
<!-- #include file="Inc/Foot.asp" -->