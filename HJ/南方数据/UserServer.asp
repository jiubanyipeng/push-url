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
			alert("请输入用户名！");
			document.UserLogin.UserName.focus();
			return false;
		}
		if(document.UserLogin.Password.value == "")
		{
			alert("请输入密码！");
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
                <td height="34" class="title_left">&nbsp;&nbsp;&nbsp;<img src="Images/smallbook.jpg" width="10" height="10">&nbsp;&nbsp;会员中心</td>
              </tr>
              <tr> 
                <td height="20"> <div align="center"><a href="UserEdit.asp">修改会员资料</a></div></td>
              </tr>
              <TR> 
                <TD 
                            height=1 colspan="2" 
                            background=img/naSzarym.gif><IMG height=1 src="img/1x1_pix.gif" 
                              width=10></TD>
              </TR>
              <tr> 
                <td height="20"> <div align="center"><a href="UserEditPwd.asp">修改会员密码</a></div></td>
              </tr>
              <TR> 
                <TD 
                            height=1 colspan="2" 
                            background=img/naSzarym.gif><IMG height=1 src="img/1x1_pix.gif" 
                              width=10></TD>
              </TR>
              <tr> 
                <td height="20"> <div align="center"><a href="UserOrder.asp">产品询价查询</a></div></td>
              </tr>
              <TR> 
                <TD 
                            height=1 colspan="2" 
                            background=img/naSzarym.gif><IMG height=1 src="img/1x1_pix.gif" 
                              width=10></TD>
              </TR>
              <tr> 
                <td height="20"> <div align="center"><a href="FeedbackMember.asp">查看我的留言</a></div></td>
              </tr>
              <TR> 
                <TD 
                            height=1 colspan="2" 
                            background=img/naSzarym.gif><IMG height=1 src="img/1x1_pix.gif" 
                              width=10></TD>
              </TR>
              <tr> 
                <td height="20"> <div align="center"><a href="UserLogout.asp">退出会员中心</a></div></td>
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
                      <td class="title_right" height="32">&nbsp;&nbsp;&nbsp;<img src="Images/smallbook.jpg" width="10" height="10">&nbsp;&nbsp;会 
                        员 中 心</td>
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
                                              <td height='25' colspan="2" align='right'><div align="center">用户登录</div></td>
                                            </tr>
                                            <tr> 
                                              <td height='25' align='right'>用户名：</td>
                                              <td height='25'> <input name='UserName' type='text' id='UserName' size='10' maxlength='20'></td>
                                            </tr>
                                            <tr> 
                                              <td height='25' align='right'>密&nbsp;&nbsp;码：</td>
                                              <td height='25'> <input name='Password' type='password' id='Password' size='10' maxlength='20'></td>
                                            </tr>
                                            <tr align='center'> 
                                              <td height='25' colspan='2'> <input name='Login' type='submit' id='Login' value=' 登录 '> 
                                                <input name='Reset' type='reset' id='Reset' value=' 清除 '></td>
                                            </tr>
                                            <tr> 
                                              <td height='20' colspan='2' align='center'><a href='UserReg.asp' target='_blank'>用户注册</a>&nbsp;&nbsp;<a href='GetPassword.asp' target='_blank'>忘记密码</a></td>
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
                            <td height="19" align="right"><div align="left">您无法进入会员中心，请先登录！如果您不是我们的会员，请立即<font color="#006699"><a href="UserReg.asp"><font color="#FF0000">注册</font></a>。</font></div></td>
                          </tr>
                          <tr> 
                            <td width="15%" align="right"></td>
                            <td width="85%">我们的会员有以下功能：</td>
                          </tr>
                          <tr> 
                            <td width="15%" align="right">&nbsp;</td>
                            <td width="85%">1、修改您的会员注册资料；</td>
                          </tr>
                          <tr> 
                            <td width="15%" align="right">&nbsp;</td>
                            <td width="85%"> <p>2、查询您的询价，以及询价的处理情况；</p></td>
                          </tr>
                          <tr> 
                            <td width="15%" align="right">&nbsp;</td>
                            <td width="85%">3、专用私人留言簿，您可在此给我们留言和查看我们的回复。</td>
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
                                  亲爱的<%=Session("UserName")%>：</p>
                                <p style="word-spacing: 0; margin-top: 0; margin-bottom: 0">&nbsp; 
                                </p>
                                <p style="word-spacing: 0; margin-top: 0; margin-bottom: 0"> 
                                  　　您现在已经进入会员服务中心，这里只有注册会员才能访问。您可在这里修改您的注册信息、给我们留言、查看我们对您留言的答复，也可以查询您的询价及询价处理情况。</p></TD>
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
