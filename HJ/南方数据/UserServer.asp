<!--#include file="Inc/conn.asp" -->
<!--#include file="Inc/Function.asp" -->
<!--#include file="Inc/Config.asp" -->
<!--#include file="inc/Skin_css.asp"-->
<!-- #include file="Head.asp" -->
<!--#include file="inc/md5.asp"-->
<script language=javascript>
	function CheckForm()
	{
		if(document.UserLogin.UserName.value=="")
		{
			alert("�������û�����");
			document.UserLogin.UserName.focus();
			return false;
		}
		if(document.UserLogin.Password.value == "")
		{
			alert("���������룡");
			document.UserLogin.Password.focus();
			return false;
		}
	}
</script>
<%
Action=Trim(request("Action"))
if Action="Login" then
 dim sql
 dim rs
 dim username
 dim password
 username=replace(trim(request("username")),"'","")
 password=replace(trim(Request("password")),"'","")
 password=md5(password)
 set rs=server.createobject("adodb.recordset")
 sql="select * from [User] where LockUser=False and username='" & username & "' and password='" & password &"'"
 rs.open sql,conn,1,3
 if not(rs.bof and rs.eof) then
	if password=rs("password") then
	    rs("LoginIP")=Request.ServerVariables("REMOTE_ADDR")
		rs("LastLoginTime")=now()
		rs("logins")=rs("logins")+1
		rs.update
		session("UserName")=rs("username")		
		Response.Redirect "UserServer.asp"
	end if
 end if
 rs.close
 conn.close
 set rs=nothing
 set conn=nothing
end if
%>
<table width="760" border="0" align="center" cellpadding="0" cellspacing="0">
<tr> 
    <td height="5" valign="top" bgcolor="#FFFFFF"></td>
  </tr>
  <tr> 
    <td valign="top" bgcolor="#FFFFFF">
<table width="746" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr> 
          <td class="tdbg_left"  width="190" height="179" valign="top" > <table width="100%" border="0" cellpadding="0" cellspacing="0">
              <tr> 
                <td height="34" class="title_left">&nbsp;&nbsp;&nbsp;<img src="Images/smallbook.jpg" width="10" height="10">&nbsp;&nbsp;��Ա����</td>
              </tr>
              <tr> 
                <td height="20"> <div align="center"><a href="UserEdit.asp">�޸Ļ�Ա����</a></div></td>
              </tr>
              <TR> 
                <TD 
                            height=1 colspan="2" 
                            background=img/naSzarym.gif><IMG height=1 src="img/1x1_pix.gif" 
                              width=10></TD>
              </TR>
              <tr> 
                <td height="20"> <div align="center"><a href="UserEditPwd.asp">�޸Ļ�Ա����</a></div></td>
              </tr>
              <TR> 
                <TD 
                            height=1 colspan="2" 
                            background=img/naSzarym.gif><IMG height=1 src="img/1x1_pix.gif" 
                              width=10></TD>
              </TR>
              <tr> 
                <td height="20"> <div align="center"><a href="UserOrder.asp">��Ʒѯ�۲�ѯ</a></div></td>
              </tr>
              <TR> 
                <TD 
                            height=1 colspan="2" 
                            background=img/naSzarym.gif><IMG height=1 src="img/1x1_pix.gif" 
                              width=10></TD>
              </TR>
              <tr> 
                <td height="20"> <div align="center"><a href="FeedbackMember.asp">�鿴�ҵ�����</a></div></td>
              </tr>
              <TR> 
                <TD 
                            height=1 colspan="2" 
                            background=img/naSzarym.gif><IMG height=1 src="img/1x1_pix.gif" 
                              width=10></TD>
              </TR>
              <tr> 
                <td height="20"> <div align="center"><a href="UserLogout.asp">�˳���Ա����</a></div></td>
              </tr>
              <TR> 
                <TD 
                            height=1 colspan="2" 
                            background=img/naSzarym.gif><IMG height=1 src="img/1x1_pix.gif" 
                              width=10></TD>
              </TR>
            </table></td>
          <td width="6"></td>
          <td valign="top"><table Class=border width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
              <tr> 
                <td height="206" valign="top"> <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td class="title_right" height="32">&nbsp;&nbsp;&nbsp;<img src="Images/smallbook.jpg" width="10" height="10">&nbsp;&nbsp;�� 
                        Ա �� ��</td>
                    </tr>
                  </table>
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <TR> 
              <TD> <%If Session("UserName")="" Then%>
                         
                        <table width="100%" border="0" cellpadding="0" cellspacing="3">
                          <tr> 
                            <td colspan="2" align="right"> <p align="center" style="word-spacing: 0; margin-top: 0; margin-bottom: 0">&nbsp;</p></td>
                          </tr>
                          <tr> 
                            <td colspan="2" align="right"> <div align="center"> 
                                <table class="main" cellSpacing="0" cellPadding="2" width="100%" border="0" height="1">
                                  <tbody>
                                    <tr> 
                                      <td width="100%" height="1"><table class='border'  width='74%' border='0' align="center" cellpadding='0' cellspacing='0'>
                                          <form action='UserServer.asp?Action=Login' method='post' name='UserLogin' onSubmit='return CheckForm();'>
                                            <tr class='title'> 
                                              <td height='25' colspan="2" align='right'><div align="center">�û���¼</div></td>
                                            </tr>
                                            <tr> 
                                              <td height='25' align='right'>�û�����</td>
                                              <td height='25'> <input name='UserName' type='text' id='UserName' size='10' maxlength='20'></td>
                                            </tr>
                                            <tr> 
                                              <td height='25' align='right'>��&nbsp;&nbsp;�룺</td>
                                              <td height='25'> <input name='Password' type='password' id='Password' size='10' maxlength='20'></td>
                                            </tr>
                                            <tr align='center'> 
                                              <td height='25' colspan='2'> <input name='Login' type='submit' id='Login' value=' ��¼ '> 
                                                <input name='Reset' type='reset' id='Reset' value=' ��� '></td>
                                            </tr>
                                            <tr> 
                                              <td height='20' colspan='2' align='center'><a href='UserReg.asp' target='_blank'>�û�ע��</a>&nbsp;&nbsp;<a href='GetPassword.asp' target='_blank'>��������</a></td>
                                            </tr>
                                          </form>
                                        </table></td>
                                    </tr>
                                  </tbody>
                                </table>
                              </div></td>
                          </tr>
                          <tr> 
                            <td height="19" colspan="2" align="right">&nbsp;</td>
                          </tr>
                          <tr> 
                            <td height="19" align="right"> <p align="center" style="word-spacing: 0; margin-top: 0; margin-bottom: 0">&nbsp;</p></td>
                            <td height="19" align="right"><div align="left">���޷������Ա���ģ����ȵ�¼��������������ǵĻ�Ա��������<font color="#006699"><a href="UserReg.asp"><font color="#FF0000">ע��</font></a>��</font></div></td>
                          </tr>
                          <tr> 
                            <td width="15%" align="right"></td>
                            <td width="85%">���ǵĻ�Ա�����¹��ܣ�</td>
                          </tr>
                          <tr> 
                            <td width="15%" align="right">&nbsp;</td>
                            <td width="85%">1���޸����Ļ�Աע�����ϣ�</td>
                          </tr>
                          <tr> 
                            <td width="15%" align="right">&nbsp;</td>
                            <td width="85%"> <p>2����ѯ����ѯ�ۣ��Լ�ѯ�۵Ĵ��������</p></td>
                          </tr>
                          <tr> 
                            <td width="15%" align="right">&nbsp;</td>
                            <td width="85%">3��ר��˽�����Բ��������ڴ˸��������ԺͲ鿴���ǵĻظ���</td>
                          </tr>
                          <tr> 
                            <td align="right">&nbsp;</td>
                            <td>&nbsp; </td>
                          </tr>
                        </table>
                <%else%> 
                <TABLE width="85%" align="center" cellPadding=0 cellSpacing=0>
                          <TBODY>
                            <TR vAlign=top > 
                              <TD  width="100%"> <p style="margin-bottom: 0"> 
                                  <br>
                                  �װ���<%=Session("UserName")%>��</p>
                                <p style="word-spacing: 0; margin-top: 0; margin-bottom: 0">&nbsp; 
                                </p>
                                <p style="word-spacing: 0; margin-top: 0; margin-bottom: 0"> 
                                  �����������Ѿ������Ա�������ģ�����ֻ��ע���Ա���ܷ��ʡ������������޸�����ע����Ϣ�����������ԡ��鿴���Ƕ������ԵĴ𸴣�Ҳ���Բ�ѯ����ѯ�ۼ�ѯ�۴��������</p></TD>
                            </TR>
                          </TBODY>
                        </TABLE>
                <%end if%> </TD>
            </TR>
                  </table> </td>
              </tr>
            </table></td>
        </tr>
      </table></td>
  </tr>
</table>
<!-- #include file="Inc/Foot.asp" -->
</BODY></HTML>
