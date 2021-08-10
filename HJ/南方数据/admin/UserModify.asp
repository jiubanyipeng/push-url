<%@language=vbscript codepage=936 %>
<!--#include file="Admin.asp"-->
<!--#include file="Conn.asp"-->
<!--#include file="../inc/md5.asp"-->
<!--#include file="Inc/Function.asp"-->
<%
dim UserID,Action,FoundErr,ErrMsg
dim rsUser,sqlUser
Action=trim(request("Action"))
UserID=trim(request("UserID"))
if UserID="" then
	FoundErr=True
	ErrMsg=ErrMsg & "<br><li>参数不足！</li>"
	call WriteErrMsg()
else
	Set rsUser=Server.CreateObject("Adodb.RecordSet")
	sqlUser="select * from [User] where UserID=" & Clng(UserID)
	rsUser.Open sqlUser,conn,1,3
	if rsUser.bof and rsUser.eof then
		FoundErr=True
		ErrMsg=ErrMsg & "<br><li>找不到指定的用户！</li>"
	else
		if Action="Modify" then
			dim UserName,Password,Question,Answer,Sex,Email,Homepage,LockUser,Comane,Add,Somane,Zip,Phone,Fox
			UserName=trim(request("UserName"))
			Password=trim(request("Password"))
			Question=trim(request("Question"))
			Answer=trim(request("Answer"))
			Sex=trim(Request("Sex"))
			Email=trim(request("Email"))
			Homepage=trim(request("Homepage"))
			Comane=trim(request("Comane"))
			Add=trim(request("Add"))
			Somane=trim(request("Somane"))
			Zip=trim(request("Zip"))
			Phone=trim(request("Phone"))
			Fox=trim(request("Fox"))
			LockUser=trim(request("LockUser"))
			if UserName="" or strLength(UserName)>14 or strLength(UserName)<4 then
				founderr=true
				errmsg=errmsg & "<br><li>请输入用户名(不能大于14小于4)</li>"
			else
  				if Instr(UserName,"=")>0 or Instr(UserName,"%")>0 or Instr(UserName,chr(32))>0 or Instr(UserName,"?")>0 or Instr(UserName,"&")>0 or Instr(UserName,";")>0 or Instr(UserName,",")>0 or Instr(UserName,"'")>0 or Instr(UserName,",")>0 or Instr(UserName,chr(34))>0 or Instr(UserName,chr(9))>0 or Instr(UserName,"")>0 or Instr(UserName,"$")>0 then
					errmsg=errmsg+"<br><li>用户名中含有非法字符</li>"
					founderr=true
				else
					dim sqlReg,rsReg
					sqlReg="select * from [User] where UserName='" & Username & "' and UserID<>" & UserID
					set rsReg=server.createobject("adodb.recordset")
					rsReg.open sqlReg,conn,1,1
					if not(rsReg.bof and rsReg.eof) then
						founderr=true
						errmsg=errmsg & "<br><li>用户名已经存在！请换一个用户名再试试！</li>"
					end if
					rsReg.Close
					set rsReg=nothing
				end if
			end if
			if Password<>"" then
				if strLength(Password)>12 or strLength(Password)<6 then
					founderr=true
					errmsg=errmsg & "<br><li>请输入密码(不能大于12小于6)。如不想修改，请留空！</li>"
				else
					if Instr(Password,"=")>0 or Instr(Password,"%")>0 or Instr(Password,chr(32))>0 or Instr(Password,"?")>0 or Instr(Password,"&")>0 or Instr(Password,";")>0 or Instr(Password,",")>0 or Instr(Password,"'")>0 or Instr(Password,",")>0 or Instr(Password,chr(34))>0 or Instr(Password,chr(9))>0 or Instr(Password,"")>0 or Instr(Password,"$")>0 then
						errmsg=errmsg+"<br><li>密码中含有非法字符</li>"
						founderr=true
					end if
				end if
			end if
			if Question="" then
				founderr=true
				errmsg=errmsg & "<br><li>密码提示问题不能为空</li>"
			end if
			if Sex="" then
				founderr=true
				errmsg=errmsg & "<br><li>性别不能为空</li>"
			else
				sex=cint(sex)
				if Sex<>0 and Sex<>1 then
					Sex=1
				end if
			end if
			if Email="" then
				founderr=true
				errmsg=errmsg & "<br><li>Email不能为空</li>"
			else
				if IsValidEmail(Email)=false then
					errmsg=errmsg & "<br><li>您的Email有错误</li>"
			   		founderr=true
				end if
			end if
			if LockUser="" then
				FoundErr=True
				ErrMsg=ErrMsg & "<br><li>用户状态不能为空！</li>"
			end if
			if FoundErr<>true then
				rsUser("UserName")=UserName
				if Password<>"" then
					rsUser("Password")=md5(Password)
				end if
				rsUser("Question")=Question
				if Answer<>"" then
					rsUser("Answer")=md5(Answer)
				end if
				rsUser("Sex")=Sex
				rsUser("Email")=Email
				rsUser("HomePage")=HomePage
				rsUser("Comane")=Comane
				rsUser("Add")=Add
				rsUser("Somane")=Somane
				rsUser("Zip")=Zip
				rsUser("Phone")=Phone
				rsUser("Fox")=Fox
				rsUser("LockUser")=LockUser
				rsUser.update
				rsUser.Close
				set rsUser=nothing
				call CloseConn() 
				response.redirect "UserManage.asp"
			end if
		end if
	end if
	if FoundErr=True then
		call WriteErrMsg()
	else
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
                      <td width="84%" height="20"><font color="#FFFF00">会员管理</font></td>
                    </tr>
                  </table>
                  <table width="90%" border="0" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td width="34%" height="20" align="right"><img src="../Img/Left_1_1.gif" width="29" height="16"></td>
                      <td width="66%" valign="bottom"><a href="UserManage.asp"><font color="#FFFF00">注册会员管理</font></a></td>
                    </tr>
                  </table>
                  
                </td>
              </tr>
            </table></td>
        </tr>
      </table></td>
    <td width="862" align="center" valign="top">
	<br>
      <br>
      <br>
      <br>
<FORM name="Form1" action="UserModify.asp" method="post">
        <table width=500 border=0 align="center" cellpadding=2 cellspacing=2 class='border'>
          <TR align=center class='title'> 
            <TD height=20 colSpan=2><font class=en><b>修改注册用户信息</b></font></TD>
          </TR>
          <TR class="tdbg" > 
            <TD width="120" align="right"><b>用 户 名：</b></TD>
            <TD> <INPUT name=UserName value="<%=rsUser("UserName")%>" size=30   maxLength=14></TD>
          </TR>
          <TR class="tdbg" > 
            <TD width="120" align="right"><B>密码(至少6位)：</B></TD>
            <TD> <INPUT   type=password maxLength=16 size=30 name=Password> <font color="#FF0000">如果不想修改，请留空</font> 
            </TD>
          </TR>
          <TR class="tdbg" > 
            <TD width="120" align="right"><strong>密码问题：</strong></TD>
            <TD> <INPUT name="Question"   type=text value="<%=rsUser("Question")%>" size=30> 
            </TD>
          </TR>
          <TR class="tdbg" > 
            <TD width="120" align="right"><strong>问题答案：</strong></TD>
            <TD> <INPUT   type=text size=30 name="Answer"> <font color="#FF0000">如果不想修改，请留空</font></TD>
          </TR>
          <TR class="tdbg" > 
            <TD width="120" align="right"><strong>性别：</strong></TD>
            <TD> <INPUT type=radio value="1" name=sex <%if rsUser("Sex")=1 then response.write "CHECKED"%>>
              男 &nbsp;&nbsp; <INPUT type=radio value="0" name=sex <%if rsUser("Sex")=0 then response.write "CHECKED"%>>
              女</TD>
          </TR>
          <TR class="tdbg" > 
            <TD width="120" align="right"><strong>Email地址：</strong></TD>
            <TD> <INPUT name=Email value="<%=rsUser("Email")%>" size=30   maxLength=50> 
            </TD>
          </TR>
          <TR class="tdbg" > 
            <TD width="120" align="right"><strong>主页：</strong></TD>
            <TD> <INPUT   maxLength=100 size=30 name=homepage value="<%=rsUser("HomePage")%>"></TD>
          </TR>
          <TR class="tdbg" > 
            <TD width="120" align="right"><strong>公司名称：</strong></TD>
            <TD> <INPUT name=Comane value="<%=rsUser("Comane")%>" size=30 maxLength=20></TD>
          </TR>
          <TR class="tdbg" > 
            <TD width="120" align="right"><strong>收货地址：</strong></TD>
            <TD> <INPUT name=Add value="<%=rsUser("Add")%>" size=30 maxLength=50></TD>
          </TR>
          <TR class="tdbg" > 
            <TD align="right"><strong>收货人：</strong></TD>
            <TD><INPUT name=Somane value="<%=rsUser("Somane")%>" size=30 maxLength=50></TD>
          </TR>
          <TR class="tdbg" > 
            <TD align="right"><strong>邮政编码：</strong></TD>
            <TD><INPUT name=Zip value="<%=rsUser("Zip")%>" size=30 maxLength=50></TD>
          </TR>
          <TR class="tdbg" > 
            <TD align="right"><strong>联系电话：</strong><br></TD>
            <TD><INPUT name=Phone value="<%=rsUser("Phone")%>" size=30 maxLength=50></TD>
          </TR>
          <TR class="tdbg" > 
            <TD align="right"><strong>传 真：</strong></TD>
            <TD><INPUT name=Fox value="<%=rsUser("Fox")%>" size=30 maxLength=50></TD>
          </TR>
          <TR class="tdbg" > 
            <TD width="120" align="right"><strong>用户状态：</strong></TD>
            <TD><input type="radio" name="LockUser" value="False" <%if rsUser("LockUser")=False then response.write "checked"%>>
              正常&nbsp;&nbsp; <input type="radio" name="LockUser" value="True" <%if rsUser("LockUser")=True then response.write "checked"%>>
              锁定</TD>
          </TR>
          <TR align="center" class="tdbg" > 
            <TD height="40" colspan="2"><input name="Action" type="hidden" id="Action" value="Modify"> 
              <input name=Submit   type=submit id="Submit" value="保存修改结果"> <input name="UserID" type="hidden" id="UserID" value="<%=rsUser("UserID")%>"></TD>
          </TR>
        </TABLE>
</form>    </td>
  </tr>
</table>
<!-- #include file="Inc/Foot.asp" -->
<%
	end if
	rsUser.close
	set rsUser=nothing
end if
call CloseConn()
%>