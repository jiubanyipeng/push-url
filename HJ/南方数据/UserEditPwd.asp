<!--#include file="inc/conn.asp"-->
<!--#include file="inc/Skin_css.asp"-->
<!--#include file="inc/config.asp"-->
<!--#include file="inc/md5.asp"-->
<!--#include file="inc/function.asp"-->
<%
dim Action,UserName,FoundErr,ErrMsg
dim rsUser,sqlUser
Action=trim(request("Action"))
UserName=trim(request("UserName"))
if Action="" and session("UserName")="" then
	response.redirect "UserServer.asp"
end if
if Action="Modify" and UserName<>"" then
	Set rsUser=Server.CreateObject("Adodb.RecordSet")
	sqlUser="select * from [User] where UserName='" & UserName & "'"
	rsUser.Open sqlUser,conn,1,3
	if rsUser.bof and rsUser.eof then
		FoundErr=True
		ErrMsg=ErrMsg & "<br><li>�Ҳ���ָ�����û���</li>"
	else
		dim OldPassword,Password,PwdConfirm
		OldPassword=trim(request("OldPassword"))
		Password=trim(request("Password"))
		PwdConfirm=trim(request("PwdConfirm"))
		if OldPassword="" then
			FoundErr=True
			ErrMsg=ErrMsg & "<br><li>����������룡</li>"
		else
			if Instr(OldPassword,"=")>0 or Instr(OldPassword,"%")>0 or Instr(OldPassword,chr(32))>0 or Instr(OldPassword,"?")>0 or Instr(OldPassword,"&")>0 or Instr(OldPassword,";")>0 or Instr(OldPassword,",")>0 or Instr(OldPassword,"'")>0 or Instr(OldPassword,",")>0 or Instr(OldPassword,chr(34))>0 or Instr(OldPassword,chr(9))>0 or Instr(OldPassword,"��")>0 or Instr(OldPassword,"$")>0 then
				errmsg=errmsg+"<br><li>�������к��зǷ��ַ�</li>"
				founderr=true
			else
				if md5(OldPassword)<>rsUser("Password") then
					FoundErr=True
					ErrMsg=ErrMsg & "<br><li>������ľ����벻�ԣ�û��Ȩ���޸ģ�</li>"
				end if
			end if
		end if
		if strLength(Password)>12 or strLength(Password)<6 then
			founderr=true
			errmsg=errmsg & "<br><li>������������(���ܴ���12С��6)��</li>"
		else
			if Instr(Password,"=")>0 or Instr(Password,"%")>0 or Instr(Password,chr(32))>0 or Instr(Password,"?")>0 or Instr(Password,"&")>0 or Instr(Password,";")>0 or Instr(Password,",")>0 or Instr(Password,"'")>0 or Instr(Password,",")>0 or Instr(Password,chr(34))>0 or Instr(Password,chr(9))>0 or Instr(Password,"��")>0 or Instr(Password,"$")>0 then
				errmsg=errmsg+"<br><li>�������к��зǷ��ַ�</li>"
				founderr=true
			end if
		end if
		if PwdConfirm="" then
			FoundErr=True
			ErrMsg=ErrMsg & "<br><li>������ȷ�����룡</li>"
		else
			if PwdConfirm<>Password then
				FoundErr=True
				ErrMsg=ErrMsg & "<br><li>ȷ�������������벻һ�£�</li>"
			end if
		end if
		if FoundErr<>true then
			rsUser("Password")=md5(Password)
			rsUser.update
		end if
	end if
	rsUser.close
	set rsUser=nothing
	if FoundErr=True then
		call WriteErrMsg()
	else
	    response.write"<SCRIPT language=JavaScript>alert('�ɹ��޸����룡');"
        response.write"javascript:history.go(-1)</SCRIPT>"
	end if
else
%>
<!-- #include file="Head.asp" -->
<table width="760" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="5" valign="top" bgcolor="#FFFFFF"></td>
  </tr>
  <tr> 
    <td height="72" valign="top" bgcolor="#FFFFFF"><table width="746" border="0" align="center" cellpadding="0" cellspacing="0">
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
          <td  valign="top"><table Class=border width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
              <tr> 
                <td height="206" valign="top"> <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td class="title_right" height="32">&nbsp;&nbsp;&nbsp;<img src="Images/smallbook.jpg" width="10" height="10">&nbsp;&nbsp;�� 
                        Ա �� ��</td>
                    </tr>
                  </table>
				  <FORM name="Form1" action="UserEditPwd.asp" method="post">
                  <table width=400 border=0 align="center" cellpadding=2 cellspacing=2 class='border'>
                    <TR align=center class='title'> 
                      <TD height=20 colSpan=2><font color="#FF6600" class=font14><b>�޸��û�����</b></font></TD>
                    </TR>
                    <TR> 
                        <TD width="120" align="right">�� �� ����</TD>
                      <TD><%=session("UserName")%> <input name="UserName" type="hidden" value="<%=session("UserName")%>"></TD>
                    </TR>
                    <TR> 
                        <TD width="120" align="right">�� �� �룺</TD>
                      <TD> <INPUT   type=password maxLength=16 size=30 name=OldPassword> 
                      </TD>
                    </TR>
                    <TR> 
                        <TD width="120" align="right">�� �� �룺</TD>
                      <TD> <INPUT   type=password maxLength=16 size=30 name=Password> 
                      </TD>
                    </TR>
                    <TR> 
                        <TD width="120" align="right">ȷ�����룺</TD>
                      <TD><INPUT name=PwdConfirm   type=password id="PwdConfirm" size=30 maxLength=16> 
                      </TD>
                    </TR>
                    <TR align="center"> 
                      <TD height="40" colspan="2"><input name="Action" type="hidden" id="Action" value="Modify"> 
                        <input name=Submit   type=submit id="Submit" value=" �� �� "> 
                      </TD>
                    </TR>
                  </TABLE>
				  </form>
				  </td>
              </tr>
            </table></td>
        </tr>
      </table></td>
  </tr>
</table>
<!-- #include file="Inc/Foot.asp" -->
</BODY></HTML>
<%
end if
call CloseConn()
%>