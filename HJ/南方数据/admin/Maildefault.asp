<%@language=vbscript codepage=936 %>
<!--#include file="Admin.asp"-->
<!--#include file="Conn.asp"-->
<% 
set rs=server.createobject("adodb.recordset") 
sql="select * from maildefault order by id desc" 
rs.open sql,conn,1,1   
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
                      <td width="84%" height="20"><font color="#FFFF00">邮件列表管理</font></td>
                    </tr>
                  </table>
                  <table width="90%" border="0" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td width="34%" height="20" align="right"><img src="../Img/Left_1_1.gif" width="29" height="16"></td>
                      <td width="66%" valign="bottom"><a href="Maildefault.asp"><font color="#FFFF00">邮件列表设置</font></a></td>
                    </tr>
                  </table>
                  <table width="90%" border="0" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td width="34%" height="20" align="right"><img src="../Img/Left_1_1.gif" width="29" height="16"></td>
                      <td width="66%" valign="bottom"><a href="Sendmail.asp"><font color="#FFFF00">发送邮件</font></a></td>
                    </tr>
                  </table>
                  <table width="90%" border="0" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td width="34%" height="20" align="right"><img src="../Img/Left_1_1.gif" width="29" height="16"></td>
                      <td width="66%" valign="bottom"><a href="Viewuser.asp"><font color="#FFFF00">用户管理</font></a></td>
                    </tr>
                  </table>
                  <table width="90%" border="0" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td width="34%" height="20" align="right"><img src="../Img/Left_1_1.gif" width="29" height="16"></td>
                      <td width="66%" valign="bottom"><a href="Adduser.asp"><font color="#FFFF00">添加用户</font></a></td>
                    </tr>
                    <tr>
                      <td height="20" align="right">&nbsp;</td>
                      <td valign="bottom">&nbsp;</td>
                    </tr>
                  </table></td>
              </tr>
            </table></td>
        </tr>
      </table></td>
    <td width="862" align="center" valign="top">
	<br>
      <br>
      <b>邮 件</b> <strong>列 表 设 置</strong><br>
      <br>
      <br>
      <br>
      <br>
      <table width="550" border="0" cellpadding="0" cellspacing="0" align="center">
        <tr> 
          <td width="36%"> <form name="addcat" method="post" action="maildefault.asp">
              <table width="98%" border="0" align="center" cellpadding="0" cellspacing="2">
                <tr> 
                  <td height="25" bgcolor="#C0C0C0"><b><font color="#000000">&nbsp;设置邮件的默认发信人</font></b></td>
                </tr>
                <tr> 
                  <td bgcolor="#E3E3E3" align="center"> 
                    <table border="0" cellspacing="0" cellpadding="4">
                      <tr> 
                        <td><font color="#000000">发信人:</font> </td>
                      </tr>
                      <tr> 
                        <td align="right"><input name="frommail" type="text" value="<%=rs("frommail")%>" size="25" maxlength="50"></td>
                      </tr>
                    </table>
                  </td>
                </tr>
                <tr> 
                  <td height="30" align="center" bgcolor="#C0C0C0"> 
                    <input type="submit" name="Submit" value="设置" class="Tips_bo"> 
                    <input type="hidden" name="action" value="frommail">
                  </td>
                </tr>
              </table>
            </form></td>
          <td rowspan="2" width="64%"> <form name="form1" method="post" action="maildefault.asp">
              <table border="0" cellspacing="2" cellpadding="0" width="98%">
                <tr> 
                  <td height="30" bgcolor="#C0C0C0"> 
                    <p><b><font color="#000000">&nbsp;设置邮件默认发送内容</font></b></p></td>
                </tr>
                <tr> 
                  <td bgcolor="#E3E3E3" align="center"> 
                    <textarea name="mailbody" cols="46" rows="12"><%=rs("mailbody")%></textarea>
                  </td>
                </tr>
                <tr> 
                  <td bgcolor="#C0C0C0" align="center" height="30"> 
                    <input type="submit" name="Submit2" value="设置" class="Tips_bo"> 
                    <input type="hidden" name="action" value="mailbody">
                  </td>
                </tr>
              </table>
              <div align="center"></div>
            </form></td>
        </tr>
        <tr> 
          <td width="36%"> <form name="form1" method="post" action="maildefault.asp">
              <table width="98%" border="0" align="center" cellpadding="0" cellspacing="2">
                <tr> 
                  <td height="25" bgcolor="#C0C0C0"> 
                    <p><b><font color="#000000">&nbsp;设置邮件默认标题</font></b></p></td>
                </tr>
                <tr> 
                  <td align="center" bgcolor="#E3E3E3"> 
                    <table border="0" cellspacing="0" cellpadding="4">
                      <tr> 
                        <td><font color="#000000">邮件标题:</font> </td>
                      </tr>
                      <tr> 
                        <td align="right"><div align="center"> 
                            <input name="mailsubject" type="text" value="<%=rs("mailsubject")%>" size="25" maxlength="50">
                          </div></td>
                      </tr>
                    </table>
                  </td>
                </tr>
                <tr> 
                  <td height="30" align="center" bgcolor="#C0C0C0"> 
                    <input type="submit" name="Submit22" value="设置" class="Tips_bo"> 
                    <input type="hidden" name="action" value="mailsubject">
                  </td>
                </tr>
              </table>
            </form></td>
        </tr>
      </table> </td>
  </tr>
</table>
<!-- #include file="Inc/Foot.asp" -->
<%
'添加功能和修改功能

if request("action")<>"frommail" and request("action")<>"mailsubject" and request("action")<>"mailbody" then 
response.end
else

if request("action")="frommail" then
frommail=request("frommail")
conn.execute "update maildefault set frommail='"&frommail&"'"
response.write"<SCRIPT language=JavaScript>alert('发信人地址更改成功！');"
response.write "</SCRIPT>"
end if

if request("action")="mailsubject" then
mailsubject=request("mailsubject")
conn.execute "update maildefault set mailsubject='"&mailsubject&"'"
response.write"<SCRIPT language=JavaScript>alert('邮件默认标题更改成功！');"
response.write "</SCRIPT>"
end if

if request("action")="mailbody" then
mailbody=request("mailbody")
conn.execute "update maildefault set mailbody='"&mailbody&"'"
response.write"<SCRIPT language=JavaScript>alert('邮件默认内容更改成功！');"
response.write "</SCRIPT>"
end if

end if
%> 