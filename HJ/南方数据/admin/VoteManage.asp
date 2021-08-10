<%@language=vbscript codepage=936 %>
<!--#include file="Admin.asp"-->
<!--#include file="Conn.asp"-->
<%
dim sql,rs,Action,ID
Action=Trim(Request("Action"))
ID=Trim(Request("VoteID"))
if Action="Set" and ID<>"" then
	conn.execute "Update Vote set IsSelected=False where IsSelected=True"
	conn.execute "Update Vote set IsSelected=True Where ID=" & ID
	response.Write "<script language='JavaScript' type='text/JavaScript'>alert('设置成功！');</script>"
end if
sql="select * from Vote order by id desc"
set rs=server.createobject("adodb.recordset")
rs.open sql,conn,1,1
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
                  </table>
                  
                </td>
              </tr>
            </table></td>
        </tr>
      </table></td>
    <td width="862" align="center" valign="top">
	<br>
      <br>
      <b> </b><br>
      <p align="center"><strong>调 查 管 理<br>
        <br>
<form method="POST" action="VoteManage.asp">
        <p align="center"><strong>管理选项：</strong><a href="VoteAdd.asp">添加新调查</a></p>

        <table width="500" border="0" align="center" cellpadding="0" cellspacing="2" Class="border">
          <tr bgcolor="#C0C0C0" class="title"> 
            <td width="37" height="25" align="center">选择</td>
            <td width="37" align="center">ID</td>
            <td width="328" align="center">主题</td>
            <td width="88" align="center">操作</td>
    </tr>
<%
if not (rs.bof and rs.eof) then
	do while not rs.eof
%>
          <tr bgcolor="#E3E3E3" class="tdbg"> 
            <td width="37" height="22" align="center"> 
              <input type="radio" value=<%=rs("ID")%><%if rs("IsSelected")=true then%> checked<%end if%> name="VoteID"></td>
            <td width="37" height="22" align="center"><%=rs("ID")%></td>
            <td height="22">&nbsp;<%=rs("Title")%></td>
            <td width="88" height="22" align="center"><a href="VoteModify.asp?ID=<%=rs("ID")%>">修改</a> 
              <a href="VoteDel.asp?ID=<%=rs("ID")%>">删除</a></td>
    </tr>
    <%
rs.movenext
loop
%>
    <tr class="tdbg"> 
      <td colspan=4 align=center><input name="Action" type="hidden" id="Action" value="Set"> 
        <input type="submit" value="将选定的调查设为最新调查" name="submit">
      </td>
    </tr>
<% end if%>
  </table>
</form>        </strong></p>
      </td>
  </tr>
</table>
<!-- #include file="Inc/Foot.asp" -->
<%
rs.close
set rs=nothing
conn.close
set conn=nothing
%>