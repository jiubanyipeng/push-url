<!--#include file="inc/conn.asp"-->
<!--#include file="inc/Skin_css.asp"-->
<!--#include file="inc/config.asp"-->
<!--#include file="inc/function.asp"-->
<%
dim Action,UserName,FoundErr,ErrMsg
dim rsUser,sqlUser
Action=trim(request("Action"))
UserName=trim(request("UserName"))
if UserName="" then
	UserName=session("UserName")
end if
if  UserName="" then
	if Action="" then
		response.redirect "UserServer.asp"
	else
		FoundErr=True
		ErrMsg=ErrMsg & "<br><li>�������㣡</li>"
	end if
end if
if FoundErr=true then
	call WriteErrMsg()
else
	Set rsUser=Server.CreateObject("Adodb.RecordSet")
	sqlUser="select * from [User] where UserName='" & UserName & "'"
	rsUser.Open sqlUser,conn,1,3
	if rsUser.bof and rsUser.eof then
		FoundErr=True
		ErrMsg=ErrMsg & "<br><li>�Ҳ���ָ�����û���</li>"
		call writeErrMsg()
	else
		if Action="Modify" then
			dim Sex,Email,Homepage
			Sex=trim(Request("Sex"))
			Email=trim(request("Email"))
			Homepage=trim(request("Homepage"))
			CompanyName=trim(request("CompanyName"))
			Add=trim(request("Add"))
			Receiver=trim(request("Receiver"))
			Postcode=trim(request("Postcode"))
			Phone=trim(request("Phone"))
			Mobile=trim(request("Mobile"))
			Fax=trim(request("Fax"))
			if Sex="" then
				founderr=true
				errmsg=errmsg & "<br><li>�Ա���Ϊ��</li>"
			else
				sex=cint(sex)
				if Sex<>0 and Sex<>1 then
					Sex=1
				end if
			end if
			if Email="" then
				founderr=true
				errmsg=errmsg & "<br><li>Email����Ϊ��</li>"
			else
				if IsValidEmail(Email)=false then
					errmsg=errmsg & "<br><li>����Email�д���</li>"
			   		founderr=true
				end if
			end if
			if CompanyName="" then
				founderr=true
				errmsg=errmsg & "<br><li>��˾���Ʋ���Ϊ��</li>"
			end if
			if Add="" then
				founderr=true
				errmsg=errmsg & "<br><li>�ջ���ַ����Ϊ��</li>"
			end if
			if Receiver="" then
				founderr=true
				errmsg=errmsg & "<br><li>�ջ��˲���Ϊ��</li>"
			end if
			if Phone="" then
				founderr=true
				errmsg=errmsg & "<br><li>��ϵ�绰����Ϊ��</li>"
			end if
			if FoundErr<>true then
				rsUser("Sex")=Sex
				rsUser("Email")=Email
				rsUser("HomePage")=HomePage
				rsUser("CompanyName")=CompanyName
				rsUser("Add")=Add
				rsUser("Receiver")=Receiver
				rsUser("Postcode")=Postcode
				rsUser("Phone")=Phone
				rsUser("Mobile")=Mobile
				rsUser("Fax")=Fax
				rsUser("LastLoginTime")=Now()
				rsUser.update
				response.write"<SCRIPT language=JavaScript>alert('��Ա�����޸ĳɹ���');"
                response.write"javascript:history.go(-1)</SCRIPT>"				
			else
				call WriteErrMsg()
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
          <td valign="top"><table Class=border width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
              <tr> 
                <td height="206" valign="top"> <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td class="title_right" height="32">&nbsp;&nbsp;&nbsp;<img src="Images/smallbook.jpg" width="10" height="10">&nbsp;&nbsp;�� 
                        Ա �� ��</td>
                    </tr>
                  </table>
				  				  
				  <FORM name="Form1" action="UserEdit.asp" method="post">		  
                    <table width=500 border=0 align="center" cellpadding=2 cellspacing=2 class='border'>
                      <TR align=center class='title'> 
                        <TD height=20 colSpan=2><font color="#FF6600" class=font14><b>�޸�ע���û���Ϣ</b></font></TD>
                      </TR>
                      <TR> 
                        <TD width="120" align="right">�� �� ����</TD>
                        <TD> <INPUT name=UserName value="<%=rsUser("UserName")%>" size=30   maxLength=14></TD>
                      </TR>
                      <TR> 
                        <TD width="120" align="right">�Ա�</TD>
                        <TD> <INPUT type=radio value="1" name=sex <%if rsUser("Sex")=1 then response.write "CHECKED"%>>
                          �� &nbsp;&nbsp; <INPUT type=radio value="0" name=sex <%if rsUser("Sex")=0 then response.write "CHECKED"%>>
                          Ů</TD>
                      </TR>
                      <TR> 
                        <TD width="120" align="right">Email��ַ��</TD>
                        <TD> <INPUT name=Email value="<%=rsUser("Email")%>" size=30   maxLength=50> 
                        </TD>
                      </TR>
                      <TR> 
                        <TD width="120" align="right">��ҳ��</TD>
                        <TD> <INPUT   maxLength=100 size=30 name=homepage value="<%=rsUser("HomePage")%>"></TD>
                      </TR>
                      <TR> 
                        <TD width="120" align="right">��˾���ƣ�</TD>
                        <TD> <INPUT name=CompanyName value="<%=rsUser("CompanyName")%>" size=30 maxLength=20></TD>
                      </TR>
                      <TR> 
                        <TD width="120" align="right">�ջ���ַ��</TD>
                        <TD> <INPUT name=Add value="<%=rsUser("Add")%>" size=30 maxLength=50></TD>
                      </TR>
                      <TR> 
                        <TD align="right">�ջ��ˣ�</TD>
                        <TD><INPUT name=Receiver value="<%=rsUser("Receiver")%>" size=30 maxLength=50></TD>
                      </TR>
                      <TR> 
                        <TD align="right">�������룺</TD>
                        <TD><INPUT name=Postcode value="<%=rsUser("Postcode")%>" size=30 maxLength=50></TD>
                      </TR>
                      <TR> 
                        <TD align="right">��ϵ�绰��<br></TD>
                        <TD><INPUT name=Phone value="<%=rsUser("Phone")%>" size=30 maxLength=50></TD>
                      </TR>
                      <TR>
                        <TD align="right">�ֻ���</TD>
                        <TD><INPUT name=Mobile value="<%=rsUser("Mobile")%>" size=30 maxLength=50></TD>
                      </TR>
                      <TR> 
                        <TD align="right">�� �棺</TD>
                        <TD><INPUT name=Fax value="<%=rsUser("Fax")%>" size=30 maxLength=50></TD>
                      </TR>
                      <TR align="center" > 
                        <TD height="40" colspan="2"><input name="Action" type="hidden" id="Action" value="Modify"> 
                          <input name=Submit   type=submit id="Submit" value="�����޸Ľ��"> 
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
	end if
	rsUser.close
	set rsUser=nothing
end if
call CloseConn()
%>