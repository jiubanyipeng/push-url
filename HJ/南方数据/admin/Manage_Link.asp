<!--#include file="admin.asp"-->
<!--#include file="conn.asp"-->
<%
Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.ActiveConnection = Conn
Rs.Open "SELECT * FROM links Order BY id"

if Request.QueryString("no")="yes" then
id= Trim(Request("id"))
Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.ActiveConnection = Conn
Rs.Open "DELETE FROM links Where id="&id,Conn,2,3,1


Set Rs= Nothing
Set Conn = Nothing
Response.Redirect "Manage_Link.asp"
end if



if Request.QueryString("no")="eshop" then
note=request.form("note")
link=request.form("link")
name=request.form("name")

If name=""  or note="http://"Then
Response.Write("<script language=""JavaScript"">alert(""������û������վ���ƣ��뷵�ؼ�飡��"");history.go(-1);</script>")
response.end
end if

If note=""  or note="http://"Then
Response.Write("<script language=""JavaScript"">alert(""������û����ͼ�����ӣ��뷵�ؼ�飡��"");history.go(-1);</script>")
response.end
end if

If link="" or link="http://" Then
Response.Write("<script language=""JavaScript"">alert(""������û�����볬���ӣ��뷵�ؼ�飡��"");history.go(-1);</script>")
response.end
end if

Set rs = Server.CreateObject("ADODB.Recordset")
sql="select * from links "
rs.open sql,conn,1,3
rs.addnew
rs("name")=name
rs("note")=note
rs("link")=link

rs.update
Response.Redirect "Manage_Link.asp"
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
                      <td width="84%" height="20"><font color="#FFFF00">�������ӹ���</font></td>
                    </tr>
                  </table>
                  <table width="90%" border="0" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td width="34%" height="20" align="right"><img src="../Img/Left_1_1.gif" width="29" height="16"></td>
                      <td width="66%" valign="bottom"><a href="Manage_Link.asp"><font color="#FFFF00">�������ӹ���</font></a></td>
                    </tr>
                  </table>
                  
                  
                </td>
              </tr>
            </table></td>
        </tr>
      </table></td>
    <td align="center" valign="top">
	<br>
      <strong><br>
      </strong>
      <table width="550" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td height="35"> 
            <div align="center"><strong>�������ӹ���</strong></div></td>
        </tr>
        <tr> 
          <form method="post" action="Manage_Link.asp?no=eshop">
            <td> <table width="100%" border="0" align="center" cellpadding="3" cellspacing="2">
                <tr> 
                  <td width="21%" height="22" bgcolor="#C0C0C0"> <div align="center">��վ����</div></td>
                  <td width="79%" bgcolor="#E3E3E3"><input type="text" name="name" size="35" maxlength="40"></td>
                </tr>
                <tr> 
                  <td height="22" bgcolor="#C0C0C0"><div align="center">��վ˵��</div></td>
                  <td bgcolor="#E3E3E3"><input type="text" name="note" size="50" maxlength="120"></td>
                </tr>
                <tr> 
                  <td height="22" bgcolor="#C0C0C0"> <div align="center">���ӵ�ַ</div></td>
                  <td bgcolor="#E3E3E3"><input type="text" name="link" size="40" maxlength="50" value="http://"></td>
                </tr>
                <tr bgcolor="#C0C0C0"> 
                  <td height="22" colspan="2"> <div align="center"> 
                      <input type="submit" name="Submit" value="�ύ">
                      <input type="reset" name="Submit2" value="����">
                    </div></td>
                </tr>
              </table>
              <br> 
              <table width="100%" border="0" cellspacing="2" cellpadding="3">
                <tr bgcolor="#C0C0C0"> 
                  <td width="22%" height="25" bgcolor="#C0C0C0"><div align="center">��վ����</div></td>
                  <td width="46%" bgcolor="#C0C0C0"><div align="center">��վ˵��</div></td>
                  <td width="14%" bgcolor="#C0C0C0"><div align="center">����ʱ��</div></td>
                  <td width="9%" bgcolor="#C0C0C0"><div align="center">����</div></td>
                  <td width="9%" bgcolor="#C0C0C0"><div align="center">����</div></td>
                </tr>
                <% do while not Rs.eof %>
                <tr bgcolor="#E3E3E3"> 
                  <td height="22" bgcolor="#E3E3E3"><div align="center"><a href="<%=Rs("link")%>" target="_blank"><%=rs("name")%></a></div></td>
                  <td bgcolor="#E3E3E3"><div align="center"><%=Rs("note")%></div></td>
                  <td bgcolor="#E3E3E3"><div align="center"><%= FormatDateTime(rs("time"),2) %></div></td>
                  <td bgcolor="#E3E3E3"><div align="center"><a href="Manage_editlink.asp?id=<%=Rs("id")%>">�޸�</a></div></td>
                  <td bgcolor="#E3E3E3"><div align="center"><a href="Manage_Link.asp?id=<%=Rs("id")%>&amp;no=yes">ɾ��</a></div></td>
                </tr>
                <%Rs.MoveNext 
loop 
%>
              </table>
              <%  Set Rs = Nothing 
Set Conn = Nothing 
%>
            </td>
          </form>
        </tr>
        <tr>
          <td>��ҳ������ʾ10����������</td>
        </tr>
      </table>
      
    </td>
  </tr>
</table>
<!-- #include file="Inc/Foot.asp" -->