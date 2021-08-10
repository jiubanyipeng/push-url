<%@ language="VBScript"%>
<%response.Expires = 0%>

<!--#include file="conn.asp"-->
<!--#include file="admin.asp"-->
<%
id=request("id")
set rs=server.createobject("adodb.recordset")
sqltext="select * from Manage_User where Id=" & id
rs.open sqltext,conn,1,1
%>
<!-- #include file="Inc/Head.asp" -->
<SCRIPT language=javascript id=clientEventHandlersJS>
<!--


function form1_onsubmit()
{
if (document.FORM1.pwd1.value!=document.FORM1.pwd2.value)
{
alert ("请确认您的密码。");
document.FORM1.pwd1.value='';
document.FORM1.pwd2.value='';
document.FORM1.pwd1.focus();
return false;
}
}


//-->
</SCRIPT>
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
  <tr> 
    <td width="150" align="center" valign="top"> <table width="150" height="100%" border="0" cellpadding="0" cellspacing="0" class="HeaderTdStyle">
        <tr> 
          <td align="center" valign="top"><table width="100%" height="24" border="0" cellpadding="0" cellspacing="0">
              <tr> 
                <td align="center">系统管理</td>
              </tr>
            </table>
            <table width="100%" height="90%" border="0" cellpadding="0" cellspacing="0" class="MenuBg">
              <tr> 
                <td align="center" valign="top"><br> <table width="90%" border="0" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td width="16%"><img src="../Img/Left_1.gif" width="28" height="11"></td>
                      <td width="84%" height="20"><font color="#FFFF00">系统管理</font></td>
                    </tr>
                  </table>
                  <table width="90%" border="0" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td width="34%" height="20" align="right"><img src="../Img/Left_1_1.gif" width="29" height="16"></td>
                      <td width="66%" valign="bottom"><a href="Manage_Admin.asp"><font color="#FFFF00">管理员管理</font></a></td>
                    </tr>
                  </table>
                  <table width="90%" border="0" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td width="34%" height="20" align="right"><img src="../Img/Left_1_1.gif" width="29" height="16"></td>
                      <td width="66%" valign="bottom"><a href="Manage_backup.asp"><font color="#FFFF00">数据库备份</font></a></td>
                    </tr>
                  </table>
                  <table width="90%" border="0" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td width="34%" height="20" align="right"><img src="../Img/Left_1_1.gif" width="29" height="16"></td>
                      <td width="66%" valign="bottom"><a href="Manage.asp"><font color="#FFFF00">系统帮助</font></a></td>
                    </tr>
                  </table>
                  <table width="90%" border="0" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td width="34%" height="20" align="right"><img src="../Img/Left_1_1.gif" width="29" height="16"></td>
                      <td width="66%" valign="bottom"><a href="UploadFileManage.asp"><font color="#FFFF00">上传文件管理</font></a></td>
                    </tr>
                  </table></td>
              </tr>
            </table></td>
        </tr>
      </table></td>
    <td align="center" valign="top">
	<br>
      <strong><br>
      </strong>
      <table width="550" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td height="25">
<div align="center"><strong>管理员密码修改</strong></div></td>
        </tr>
        <tr> 
          <FORM language=javascript name=FORM1  onsubmit="return form1_onsubmit()"
action=Managereditok.asp?uid=<%=rs("Id")%> method=post>
<INPUT
type=hidden value=<%=rs("UserName")%> name=uid>
		    <td><table width="50%" border="0" align="center" cellpadding="0" cellspacing="2">
                <tr> 
                  <td height="25" colspan="2">&nbsp;</td>
                </tr>
                <tr> 
                  <td width="29%" height="22"> <div align="right">管理员帐号：</div></td>
                  <td width="71%"><%=rs("UserName")%></td>
                </tr>
                <tr> 
                  <td height="22"> <div align="right">新密码：</div></td>
                  <td><input name="pwd1" type="text" size="16" maxlength="20"></td>
                </tr>
                <tr> 
                  <td height="22"> <div align="right">密码确认：</div></td>
                  <td><input name="pwd2" type="text" size="16" maxlength="20"></td>
                </tr>
                <tr> 
                  <td height="22" colspan="2"><div align="center"><INPUT  type=submit value='确认修改' name=Submit2></div></td>
                </tr>
              </table></td>
          </form>
        </tr>
      </table>
      <br>
      <strong> </strong></td>
  </tr>
</table>
<!-- #include file="Inc/Foot.asp" -->