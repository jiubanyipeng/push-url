<!--#include file="inc/conn.asp"-->
<!--#include file="inc/md5.asp"-->
<!--#include file="inc/function.asp"-->
<%
dim Action,UserName,FoundErr,ErrMsg
dim rsUser,sqlUser
Action=trim(request("Action"))
UserName=trim(request("UserName"))
if Action="" and session("UserName")="" then
	response.redirect "Server.asp"
end if
if Action="Modify" and UserName<>"" then
	Set rsUser=Server.CreateObject("Adodb.RecordSet")
	sqlUser="select * from [User] where UserName='" & UserName & "'"
	rsUser.Open sqlUser,conn,1,3
	if rsUser.bof and rsUser.eof then
		FoundErr=True
		ErrMsg=ErrMsg & "<br><li>找不到指定的用户！</li>"
	else
		dim OldPassword,Password,PwdConfirm
		OldPassword=trim(request("OldPassword"))
		Password=trim(request("Password"))
		PwdConfirm=trim(request("PwdConfirm"))
		if OldPassword="" then
			FoundErr=True
			ErrMsg=ErrMsg & "<br><li>请输入旧密码！</li>"
		else
			if Instr(OldPassword,"=")>0 or Instr(OldPassword,"%")>0 or Instr(OldPassword,chr(32))>0 or Instr(OldPassword,"?")>0 or Instr(OldPassword,"&")>0 or Instr(OldPassword,";")>0 or Instr(OldPassword,",")>0 or Instr(OldPassword,"'")>0 or Instr(OldPassword,",")>0 or Instr(OldPassword,chr(34))>0 or Instr(OldPassword,chr(9))>0 or Instr(OldPassword,"")>0 or Instr(OldPassword,"$")>0 then
				errmsg=errmsg+"<br><li>旧密码中含有非法字符</li>"
				founderr=true
			else
				if md5(OldPassword)<>rsUser("Password") then
					FoundErr=True
					ErrMsg=ErrMsg & "<br><li>你输入的旧密码不对，没有权限修改！</li>"
				end if
			end if
		end if
		if strLength(Password)>12 or strLength(Password)<6 then
			founderr=true
			errmsg=errmsg & "<br><li>请输入新密码(不能大于12小于6)。</li>"
		else
			if Instr(Password,"=")>0 or Instr(Password,"%")>0 or Instr(Password,chr(32))>0 or Instr(Password,"?")>0 or Instr(Password,"&")>0 or Instr(Password,";")>0 or Instr(Password,",")>0 or Instr(Password,"'")>0 or Instr(Password,",")>0 or Instr(Password,chr(34))>0 or Instr(Password,chr(9))>0 or Instr(Password,"")>0 or Instr(Password,"$")>0 then
				errmsg=errmsg+"<br><li>新密码中含有非法字符</li>"
				founderr=true
			end if
		end if
		if PwdConfirm="" then
			FoundErr=True
			ErrMsg=ErrMsg & "<br><li>请输入确认密码！</li>"
		else
			if PwdConfirm<>Password then
				FoundErr=True
				ErrMsg=ErrMsg & "<br><li>确认密码与新密码不一致！</li>"
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
	    response.write"<SCRIPT language=JavaScript>alert('成功修改密码！');"
        response.write"javascript:history.go(-1)</SCRIPT>"
		'call WriteSuccessMsg("成功修改密码！")
	end if
else
%>
<!-- #include file="Inc/Head.asp" -->
<TABLE width="760" border=0 align="center" cellPadding=0 cellSpacing=0 bgcolor="#FFFFFF">
  <TBODY>
    <TR> 
          <TD width=180 vAlign=top bgcolor="#FFFFFF"> <table width="92%" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
              <tr> 
                <td valign="top"> <TABLE width="100%" border=0 cellPadding=0 cellSpacing=0 background="Img/index_01b.gif">
                    <TBODY>
                      <TR> 
                        <TD height=5 bgcolor="#FFFFFF"></TD>
                      </TR>
                      <TR> 
                        <TD height="33" background="Img/index_01.gif"> <div align="center">会员中心 
                          </div></TD>
                      </TR>
                      <TR> 
                        <TD height="22"> <div align="center"><a href="Manage.asp">修改会员资料</a></div></TD>
                      </TR>
                      <TR> 
                        <TD 
                            height=1 colspan="2" 
                            background=img/naSzarym.gif><IMG height=1 src="img/1x1_pix.gif" 
                              width=10></TD>
                      </TR>
                      <TR> 
                        <TD height="22"><div align="center"><a href="E_shop.asp">购物订单查询</a></div></TD>
                      </TR>
                      <TR> 
                        <TD 
                            height=1 colspan="2" 
                            background=img/naSzarym.gif><IMG height=1 src="img/1x1_pix.gif" 
                              width=10></TD>
                      </TR>
                      <TR> 
                        <TD height="22"><div align="center"><a href="E_shop.asp">购物订单查询</a></div></TD>
                      </TR>
                      <TR> 
                        <TD height="22"><div align="center"><a href="NetBook.asp">站内留言中心</a></div></TD>
                      </TR>
                      <TR> 
                        <TD 
                            height=1 colspan="2" 
                            background=img/naSzarym.gif><IMG height=1 src="img/1x1_pix.gif" 
                              width=10></TD>
                      </TR>
                      <TR> 
                        <TD height="22"><div align="center"><a href="UserLogout.asp">退出会员中心</a></div></TD>
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
              <FORM name="Form1" action="ManagePwd.asp" method="post">
                <TD><table width=400 border=0 align="center" cellpadding=2 cellspacing=2 class='border'>
                    <TR align=center class='title'> 
                      <TD height=20 colSpan=2><font color="#FF6600" size="5" class=en><b>修改用户密码</b></font></TD>
                    </TR>
                    <TR class="tdbg" > 
                      <TD width="120" align="right"><b>用 户 名：</b></TD>
                      <TD><%=session("UserName")%> <input name="UserName" type="hidden" value="<%=session("UserName")%>"></TD>
                    </TR>
                    <TR class="tdbg" > 
                      <TD width="120" align="right"><B>旧 密 码：</B></TD>
                      <TD> <INPUT   type=password maxLength=16 size=30 name=OldPassword> 
                      </TD>
                    </TR>
                    <TR class="tdbg" > 
                      <TD width="120" align="right"><B>新 密 码：</B></TD>
                      <TD> <INPUT   type=password maxLength=16 size=30 name=Password> 
                      </TD>
                    </TR>
                    <TR class="tdbg" > 
                      <TD width="120" align="right"><strong>确认密码：</strong></TD>
                      <TD><INPUT name=PwdConfirm   type=password id="PwdConfirm" size=30 maxLength=16> 
                      </TD>
                    </TR>
                    <TR align="center" class="tdbg" > 
                      <TD height="40" colspan="2"><input name="Action" type="hidden" id="Action" value="Modify"> 
                        <input name=Submit   type=submit id="Submit" value=" 保 存 "> 
                      </TD>
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
call CloseConn()
%>