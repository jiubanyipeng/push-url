<!--#include file="admin.asp"-->
<!--#include file="conn.asp"-->
<!--#include file="inc/articlechar.inc"-->

<%if Request.QueryString("no")="eshop" then
id=request("id")

if request.form("html")="on" then
rebook=request.form("rebook")
else
rebook=htmlencode2(request.form("rebook"))
end if

Set rs = Server.CreateObject("ADODB.Recordset")
sql="select * from book where id="&id
rs.open sql,conn,1,3

rs("rebook")=rebook
rs.update
rs.close
response.redirect "Manage_Book.asp"
end if

id=request.querystring("id")
Set rs = Server.CreateObject("ADODB.Recordset")
rs.Open "Select * From book where id="&id, conn,3,3
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
    <form method="post" action="Manage_Rebook.asp?no=eshop"><input type=hidden name=id value=<%=id%>><td align="center" valign="top">
	
	<br>
      <strong><br>
      </strong> <br>
      <br>
      <table width="550" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td height="25"> <div align="center"><strong>回复留言<br>
              <br>
              </strong></div></td>
        </tr>
        <tr> 
			<td><div align="center"> 
              <table width="100%" border="0" cellspacing="2" cellpadding="3">
                <tr bgcolor="#C0C0C0"> 
                  <td height="25" colspan="2" bgcolor="#C0C0C0"> <div align="center"></div>
                    &nbsp;&nbsp;你正准备回复<b><%=rs("name")%></b>的留言，他的留言是：</td>
                </tr>
                <tr bgcolor="#E3E3E3"> 
                  <td width="18%" height="22"> <div align="center">主 题</div></td>
                  <td width="82%" bgcolor="#E3E3E3">&nbsp;&nbsp;<%=rs("title")%></td>
                </tr>
                <tr bgcolor="#C0C0C0"> 
                  <td height="25" bgcolor="#C0C0C0"><div align="center">内 容</div></td>
                  <td height="25">&nbsp;&nbsp;<%=rs("content")%></td>
                </tr>
              </table>
              </div></td>
        </tr>
      </table>
      <br>
      <br>
        <table width="500" border="0" cellspacing="0" cellpadding="5">
          <tr> 
          <td><div align="center">输入回复内容</div></td>
        </tr>
        <tr>
          
		  <td><div align="center">
                <textarea name="rebook" cols="60" rows="10"><%=rs("rebook")%></textarea>
              </div></td>
        </tr>
        <tr>
          <td><div align="center">是否支持Html 
                <input type="checkbox" name="html" value="on">
                <input type="submit" value="确定">
                <input type="reset" value="从来">
              </div></td>
        </tr>
      </table>

</td></form>
  </tr>
</table>
<!-- #include file="Inc/Foot.asp" -->