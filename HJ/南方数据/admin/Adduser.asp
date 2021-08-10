<!--#include file="Admin.asp"-->
<!--#include file="Conn.asp"-->
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
      <br>
      <br>
      <br>
      <br>
      <br>
      <form name="adduser" method="post" action="adduser.asp">
        <table border="0" cellspacing="2" cellpadding="0" width="300">
          <tr> 
            <td height="25" bgcolor="#C0C0C0"><b><font color="#000000">&nbsp;手动添加邮件地址</font></b></td>
          </tr>
          <tr> 
            <td bgcolor="#E3E3E3" align="center" height="95"> 
              <table border="0" cellspacing="0" cellpadding="4">
                <tr> 
                  <td align="right"><font color="#000000">Email地址</font></td>
                  <td valign="top"> 
                    <input type="text" name="email" maxlength="50" class="bk">
                  </td>
                </tr>
                <tr> 
                  <td align="center" colspan="2" height="35"><font color=#000000>不用填写其他资料</font></td>
                </tr>
              </table>
            </td>
          </tr>
          <tr> 
            <td height="25" align="center" bgcolor="#C0C0C0"> 
              <input type="submit" name="Submit" value="添加" class="Tips_bo">
              <input type="hidden" name="action" value="adduser">
            </td>
          </tr>
        </table>
      </form><br>
    </td>
  </tr>
</table>
<!-- #include file="Inc/Foot.asp" -->
<%
if request("action")<>"adduser" then
response.end
else
email=request("email")
mailnow=now()
conn.execute "insert into email (dateandtime,email) values ('"&mailnow&"','"&email&"')"
response.write"<SCRIPT language=JavaScript>alert('帐号添加成功，你可以继续添加！');"
response.write "</SCRIPT>"
end if
%>
