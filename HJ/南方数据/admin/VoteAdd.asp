<%@language=vbscript codepage=936 %>
<!--#include file="Admin.asp"-->
<!--#include file="Conn.asp"-->
<%
dim Title,VoteTime,Action,IsSelected
dim rs,sql
Title=trim(request.form("Title"))
VoteTime=trim(request.form("VoteTime"))
if VoteTime="" then VoteTime=now()
Action=trim(request("Action"))
IsSelected=trim(request("IsSelected"))

dim i
if Title<>"" then
	sql="select top 1 * from Vote"
	Set rs= Server.CreateObject("ADODB.Recordset")
	rs.open sql,conn,1,3
	rs.addnew
	rs("Title")=Title
	for i=1 to 8
		if trim(request("select"&i))<>"" then
			rs("select"&i)=trim(request("select"&i))
			if request("answer"&i)="" then
				rs("answer"&i)=0
			else
				rs("answer"&i)=clng(request("answer"&i))
			end if
		end if
	next
	rs("VoteTime")=VoteTime
	rs("VoteType")=request("VoteType")
	if IsSelected="" then IsSelected=false
	if IsSelected="True" then conn.execute "Update Vote set IsSelected=False where IsSelected=True"
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
                <td align="center">���ܲ˵�</td>
              </tr>
            </table>
            <table width="100%" height="90%" border="0" cellpadding="0" cellspacing="0" class="MenuBg">
              <tr> 
                <td align="center" valign="top"><br> <table width="90%" border="0" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td width="16%"><img src="../Img/Left_1.gif" width="28" height="11"></td>
                      <td width="84%" height="20"><font color="#FFFF00">�������</font></td>
                    </tr>
                  </table>
                  <table width="90%" border="0" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td width="34%" height="20" align="right"><img src="../Img/Left_1_1.gif" width="29" height="16"></td>
                      <td width="66%" valign="bottom"><a href="VoteManage.asp"><font color="#FFFF00">��������</font></a></td>
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
      <strong>�� �� �� ��</strong><br>
        <br>
<form method="POST" action="VoteAdd.asp">
        <table width="500" border="0" align="center" cellpadding="0" cellspacing="2" Class="border">
          <tr class="tdbg"> 
            <td width="81" height="22" align="right" bgcolor="#C0C0C0">���⣺</td>
            <td colspan="3" bgcolor="#E3E3E3">
<input name="Title" type="text" size="45" maxlength="50"></td>
    </tr>
    <%
	for i=1 to 8%>
    <tr class="tdbg"> 
            <td height="22" align="right" bgcolor="#C0C0C0">ѡ��<%=i%>��</td>
            <td width="281" bgcolor="#E3E3E3">
<input type="text" name="select<%=i%>" size="36"> 
      </td>
            <td width="41" align="right" bgcolor="#E3E3E3">Ʊ����</td>
            <td width="87" bgcolor="#E3E3E3">
<input type="text" name="answer<%=i%>" size="5"></td>
    </tr>
    <%next%>
    <tr class="tdbg"> 
            <td height="22" align="right" bgcolor="#C0C0C0">�������ͣ�</td>
            <td colspan="3" bgcolor="#E3E3E3">
<select name="VoteType" id="VoteType">
          <option value="Single" selected>��ѡ</option>
          <option value="Multi">��ѡ</option>
        </select></td>
    </tr>
    <tr class="tdbg">
            <td height="22" align="right" bgcolor="#C0C0C0">&nbsp;</td>
            <td colspan="3" bgcolor="#E3E3E3">
<input name="IsSelected" type="checkbox" id="IsSelected" value="True" checked>
        ��Ϊ���µ���</td>
    </tr>
    <tr class="tdbg"> 
            <td height="25" colspan=4 align=center> 
              <input name="Submit" type="submit" id="Submit" value=" �� �� "> 
        &nbsp; <input  name="Reset2" type="reset" id="Reset2" value=" �� �� "> </td>
    </tr>
  </table>
</form>       </strong></p>
      </td>
  </tr>
</table>
<!-- #include file="Inc/Foot.asp" -->