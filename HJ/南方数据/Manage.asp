<!--#include file="inc/conn.asp"-->
<!--#include file="inc/md5.asp"-->
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
		response.redirect "Server.asp"
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
			dim Sex,Email,Homepage,QQ,MSN
			Sex=trim(Request("Sex"))
			Email=trim(request("Email"))
			Homepage=trim(request("Homepage"))
			Comane=trim(request("Comane"))
			Add=trim(request("Add"))
			Somane=trim(request("Somane"))
			Zip=trim(request("Zip"))
			Phone=trim(request("Phone"))
			Fox=trim(request("Fox"))
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
			if Comane="" then
				founderr=true
				errmsg=errmsg & "<br><li>��˾���Ʋ���Ϊ��</li>"
			end if
			if Add="" then
				founderr=true
				errmsg=errmsg & "<br><li>�ջ���ַ����Ϊ��</li>"
			end if
			if Somane="" then
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
				rsUser("Comane")=Comane
				rsUser("Add")=Add
				rsUser("Somane")=Somane
				rsUser("Zip")=Zip
				rsUser("Phone")=Phone
				rsUser("Fox")=Fox
				rsUser.update
				response.write"<SCRIPT language=JavaScript>alert('��Ա�����޸ĳɹ���');"
                response.write"javascript:history.go(-1)</SCRIPT>"
				'call WriteSuccessMsg("��Ա�����޸ĳɹ���")
			else
				call WriteErrMsg()
			end if
		else

%>
<!-- #include file="Inc/Head.asp" -->
<TABLE width="760" border=0 align="center" cellPadding=0 cellSpacing=0 bgcolor="#FFFFFF">
  <TBODY>
    <TR> 
          <TD width=196 vAlign=top bgcolor="#FFFFFF"> <table width="92%" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
              <tr> 
                <td valign="top"> <TABLE width="100%" border=0 cellPadding=0 cellSpacing=0 background="Img/index_01b.gif">
                    <TBODY>
                      <TR> 
                        <TD height=5 bgcolor="#FFFFFF"></TD>
                      </TR>
                      <TR> 
                        <TD height="33" background="Img/index_01.gif"> <div align="center">��Ա���� 
                          </div></TD>
                      </TR>
                      <TR> 
                        <TD height="22"> <div align="center"><a href="Manage.asp">�޸Ļ�Ա����</a></div></TD>
                      </TR>
                      <TR> 
                        <TD 
                            height=1 colspan="2" 
                            background=img/naSzarym.gif><IMG height=1 src="img/1x1_pix.gif" 
                              width=10></TD>
                      </TR>
                      <TR> 
                        <TD height="22"><div align="center"><a href="E_shop.asp">���ﶩ����ѯ</a></div></TD>
                      </TR>
                      <TR> 
                        <TD 
                            height=1 colspan="2" 
                            background=img/naSzarym.gif><IMG height=1 src="img/1x1_pix.gif" 
                              width=10></TD>
                      </TR>
                      <TR> 
                        <TD height="22"><div align="center"><a href="E_shop.asp">���ﶩ����ѯ</a></div></TD>
                      </TR>
                      <TR> 
                        <TD height="22"><div align="center"><a href="NetBook.asp">վ����������</a></div></TD>
                      </TR>
                      <TR> 
                        <TD 
                            height=1 colspan="2" 
                            background=img/naSzarym.gif><IMG height=1 src="img/1x1_pix.gif" 
                              width=10></TD>
                      </TR>
                      <TR> 
                        <TD height="22"><div align="center"><a href="UserLogout.asp">�˳���Ա����</a></div></TD>
                      </TR>
                      <TR> 
                        <TD 
                            height=1 colspan="2" 
                            background=img/naSzarym.gif><IMG height=1 src="img/1x1_pix.gif" 
                              width=10></TD>
                      </TR>
                    </TBODY>
                  </TABLE></td>
              </tr>
            </table></TD>
      <TD width=1 background=img/kropki_pion_naBialym.gif><IMG 
            height=2 src="img/1x1_pix.gif" width=1></TD>
      <TD vAlign=top><TABLE width="90%" border=0 align="right" cellPadding=0 cellSpacing=0>
          <TBODY>
            <TR> 
              <TD background=img/naBialym.gif 
                  height=1><IMG height=1 src="img/1x1_pix.gif" 
              width=10></TD>
            </TR>
            <TR> 
              <TD height=5><IMG height=1 
                  src="img/1x1_pix.gif" width=1></TD>
            </TR>
            <TR> 
              <TD> <TABLE cellSpacing=0 cellPadding=0 width="555" border=0>
                  <TBODY>
                    <TR> 
                      <TD height="25"><img src="Img/bgtop_18.gif" width="557" height="37"></TD>
                    </TR>
                  </TBODY>
                </TABLE></TD>
            </TR>
            <TR> 
              <TD background=img/naBialym.gif 
                  height=1><IMG height=1 src="img/1x1_pix.gif" 
              width=10></TD>
            </TR>
            <TR> 
              <FORM name="Form1" action="Manage.asp" method="post">
                <TD><table width=500 border=0 align="center" cellpadding=2 cellspacing=2 class='border'>
                    <TR align=center class='title'> 
                      <TD height=20 colSpan=2><font color="#FF6600" size="5" class=en><b>�޸�ע���û���Ϣ</b></font></TD>
                    </TR>
                    <TR class="tdbg" > 
                      <TD width="120" align="right"><b>�� �� ����</b></TD>
                      <TD> <INPUT name=UserName value="<%=rsUser("UserName")%>" size=30   maxLength=14></TD>
                    </TR>
                    <TR class="tdbg" > 
                      <TD width="120" align="right"><strong>�Ա�</strong></TD>
                      <TD> <INPUT type=radio value="1" name=sex <%if rsUser("Sex")=1 then response.write "CHECKED"%>>
                        �� &nbsp;&nbsp; <INPUT type=radio value="0" name=sex <%if rsUser("Sex")=0 then response.write "CHECKED"%>>
                        Ů</TD>
                    </TR>
                    <TR class="tdbg" > 
                      <TD width="120" align="right"><strong>Email��ַ��</strong></TD>
                      <TD> <INPUT name=Email value="<%=rsUser("Email")%>" size=30   maxLength=50> 
                      </TD>
                    </TR>
                    <TR class="tdbg" > 
                      <TD width="120" align="right"><strong>��ҳ��</strong></TD>
                      <TD> <INPUT   maxLength=100 size=30 name=homepage value="<%=rsUser("HomePage")%>"></TD>
                    </TR>
                    <TR class="tdbg" > 
                      <TD width="120" align="right"><strong>��˾���ƣ�</strong></TD>
                      <TD> <INPUT name=Comane value="<%=rsUser("Comane")%>" size=30 maxLength=20></TD>
                    </TR>
                    <TR class="tdbg" > 
                      <TD width="120" align="right"><strong>�ջ���ַ��</strong></TD>
                      <TD> <INPUT name=Add value="<%=rsUser("Add")%>" size=30 maxLength=50></TD>
                    </TR>
                    <TR class="tdbg" > 
                      <TD align="right"><strong>�ջ��ˣ�</strong></TD>
                      <TD><INPUT name=Somane value="<%=rsUser("Somane")%>" size=30 maxLength=50></TD>
                    </TR>
                    <TR class="tdbg" > 
                      <TD align="right"><strong>�������룺</strong></TD>
                      <TD><INPUT name=Zip value="<%=rsUser("Zip")%>" size=30 maxLength=50></TD>
                    </TR>
                    <TR class="tdbg" > 
                      <TD align="right"><strong>��ϵ�绰��</strong><br></TD>
                      <TD><INPUT name=Phone value="<%=rsUser("Phone")%>" size=30 maxLength=50></TD>
                    </TR>
                    <TR class="tdbg" > 
                      <TD align="right"><strong>�� �棺</strong></TD>
                      <TD><INPUT name=Fox value="<%=rsUser("Fox")%>" size=30 maxLength=50></TD>
                    </TR>
                    <TR align="center" class="tdbg" > 
                      <TD height="40" colspan="2"><input name="Action" type="hidden" id="Action" value="Modify"> 
                        <input name=Submit   type=submit id="Submit" value="�����޸Ľ��"> 
                    </TR>
                  </TABLE></TD>
              </form>
            </TR>
            <TR> 
              <TD background=img/naBialym.gif 
                  height=1><IMG height=1 src="img/1x1_pix.gif" 
              width=10></TD>
            </TR>
            <TR> 
              <TD 
                  height=15>&nbsp; </TD>
            </TR>
          </TBODY>
        </TABLE> </TD>
    </TR>
  </TBODY>
</TABLE>
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