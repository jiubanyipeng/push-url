<%@language=vbscript codepage=936 %>
<!--#include file="Admin.asp"-->
<!--#include file="Conn.asp"-->
<%
dim ID,Title,VoteTime,IsSelected
dim rs,sql
ID=request.QueryString("id")   ' 也可用ID=request("id")
Title=trim(request.form("Title"))
VoteTime=trim(request.form("VoteTime"))
if VoteTime="" then VoteTime=now()
IsSelected=trim(request("IsSelected"))
if IsSelected="True" then
	conn.execute "Update Vote set IsSelected=False where IsSelected=True"
end if
dim i
if ID="" then
	Response.Redirect "VoteManage.asp"
end if
sql="select * from Vote where ID="&Cint(ID)
Set rs= Server.CreateObject("ADODB.Recordset")
rs.open sql,conn,1,3
if not rs.eof then
	if Title<>"" then
		rs("Title")=Title
		for i=1 to 8
			if trim(request("select"&i))<>"" then
				rs("select"&i)=trim(request("select"&i))
				if request("answer"&i)="" then
					rs("answer"&i)=0
				else
					rs("answer"&i)=clng(request("answer"&i))
				end if
			else
				rs("select"&i)=""
				rs("answer"&i)=0
			end if
		next
		rs("VoteTime")=VoteTime
		rs("VoteType")=request("VoteType")
		if IsSelected="" then IsSelected=false
		rs("IsSelected")=IsSelected
		rs.update
		rs.close
		set rs=nothing
		call CloseConn()
		Response.Redirect "VoteManage.asp"
	end if
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
                      <td width="84%" height="20"><font color="#FFFF00">调查管理</font></td>
                    </tr>
                  </table>
                  <table width="90%" border="0" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td width="34%" height="20" align="right"><img src="../Img/Left_1_1.gif" width="29" height="16"></td>
                      <td width="66%" valign="bottom"><a href="VoteManage.asp"><font color="#FFFF00">调查设置</font></a></td>
                    </tr>
                  </table></td>
              </tr>
            </table></td>
        </tr>
      </table></td>
    <td width="862" align="center" valign="top">
	<br>
      <br>
      <b> </b><br>
      <strong><b>修 改</b> 调 查</strong><br>
        <br>
<form method="POST" action="VoteModify.asp">
  <table width="500" border="0" align="center" cellpadding="2" cellspacing="2" Class="border">
    <tr class="tdbg"> 
      <td width="15%" align="right">主题：</td>
      <td width="85%" colspan="3"><input name="Title" type="text" value="<%=rs("Title")%>" size="52"></td>
    </tr>
    <%
for i=1 to 8%>
    <tr class="tdbg"> 
      <td align="right">选项<%=i%>：</td>
      <td><input name="select<%=i%>" type="text" value="<%=rs("select"& i)%>" size="36"> 
      </td>
      <td align="right">票数：</td>
      <td width="80"><input name="answer<%=i%>" type="text" value="<%=rs("answer"&i)%>" size="5"></td>
    </tr>
    <%next%>
    <tr class="tdbg"> 
      <td align="right">调查类型：</td>
      <td colspan="3"><select name="VoteType" id="VoteType">
          <option value="Single" <% if rs("VoteType")="Single" then %> selected <% end if%>>单选</option>
          <option value="Multi" <% if rs("VoteType")="Multi" then %> selected <% end if%>>多选</option>
        </select></td>
    </tr>
    <tr class="tdbg">
      <td align="right">&nbsp;</td>
      <td colspan="3"><input name="IsSelected" type="checkbox" id="IsSelected" value="True" <% if rs("IsSelected")=true then response.write "checked"%>>
        设为最新调查</td>
    </tr>
    <tr class="tdbg"> 
      <td colspan=4 align=center><input name="ID" type="hidden" id="ID" value="<%=rs("ID")%>"> 
        <input name="Submit" type="submit" id="Submit" value="保存修改结果"> </td>
    </tr>
  </table>
</form>       </strong></p>
      </td>
  </tr>
</table>
<!-- #include file="Inc/Foot.asp" -->
<%
end if
rs.close
set rs=nothing
conn.close
set conn=nothing
%>