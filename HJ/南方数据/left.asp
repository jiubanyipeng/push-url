<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td><table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr> 
          <td height="33" align="center" background="Img/index_01.gif" style="border-bottom: 1 solid #000000"><font color="#000000">��������</font></td>
        </tr>
        <tr> 
          <td align="center"><table width="100%" border="0" cellpadding="0" cellspacing="0">
              <form name="form1" method="get" action="search.asp"> 
			 <tr>
                  <td height="30" align="center" bgcolor="#efefef"> 
                    <input type="text" name="key" size="19" class="input">
                </td>
              </tr>
              <tr> 
                  <td height="30" align="center" bgcolor="#efefef"> 
                    <select name="otype" class="input">
                    <option value="title" selected class="input">���ű���</option>
                    <option value="msg" class="input">��������</option>
                  </select>
                    ��
                    <input type="submit" name="Submit" value="����" class="input"></td>
              </tr></form>
            </table>
            
          </td>
        </tr>
      </table></td>
  </tr>
  <tr> 
    <td><table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr background="Img/index_01.gif"> 
          <td height="34" colspan="2" align="center" style="border-top: 1 solid #000000;border-bottom: 1 solid #000000"><font color="#000000">�������� 
            NEW10</font></td>
        </tr>
        <%
t=0
Set rs=Server.CreateObject("ADODB.RecordSet") 
sql="SELECT * from NEWS order by id desc" 
rs.Open sql,conn,1,1
if not Rs.eof then
do while not rs.eof
t=t+1
%>
        <tr onmouseover="this.bgColor='#ffffff';"onmouseout="this.bgColor='#efefef';"> 
          <td width="18%" height="22" align="center" bgcolor="#efefef" style="border-right: 1 solid #000000;border-bottom: 1 solid #000000"><%= t %></td>
          <td width="82%" bgcolor="#efefef" style="border-bottom: 1 solid #000000">��<a href="shownews.asp?id=<%=rs("id")%>" title="<%=rs("title")%>" target="_blank"><%=left(rs("title"),10)%></a></td>
        </tr>
        <% 
if t>=10 then exit do 
rs.movenext 
loop 
else 
response.write "<tr><td align=center colspan=2 bgcolor=#E8E8F4>������¼</td></tr>" 
end if 
rs.close 
%>
      </table></td>
  </tr>
  <tr>
    <td><table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr> 
          <td width="82%" align="center" background="Img/index_01.gif" style="border-bottom: 1 solid #000000"><font color="#000000">�������� 
            TOP10</font></td>
          <td width="18%" height="33" align="center" bgcolor="#86C2FF" style="border-bottom: 1 solid #000000">���</td>
        </tr>
        <tr> 
          <td height="22" colspan="2" align="center">
		  <table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
              <%
t=0
Set rs=Server.CreateObject("ADODB.RecordSet") 
sql="SELECT * from NEWS order by hits desc" 
rs.Open sql,conn,1,1
if not Rs.eof then
do while not rs.eof
t=t+1
%>
              <tr onmouseover="this.bgColor='#ffffff';"onmouseout="this.bgColor='#efefef';"bgColor=#efefef> 
                <td width="82%" style="border-bottom: 1 solid #000000">��<a href="shownews.asp?id=<%=rs("id")%>" title="<%=rs("title")%>" target="_blank"><%=left(rs("title"),10)%></a></td>
                <td width="18%" height="22" align="center" style="border-bottom: 1 solid #000000;border-left: 1 solid #000000"><font color="#FF0000"><%=rs("hits")%></font></td>
              </tr>
              <% 
if t>=10 then exit do 
rs.movenext 
loop 
else 
response.write "<tr><td align=center colspan=2 bgcolor=#E8E8F4>������¼</td></tr>" 
end if 
rs.close 
%>
            </table></td>
        </tr>
      </table></td>
  </tr>
</table>
