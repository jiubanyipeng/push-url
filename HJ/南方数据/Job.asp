<!--#include file="Inc/syscode.asp"-->
<%'if Request.QueryString("no")="eshop" then

'dim SQL, Rs, contentID,CurrentPage
'CurrentPage = request("Page")
'contentID=request("ID")

'set rs=server.createobject("adodb.recordset")
'sqltext="delete from job where Id="& contentID
'rs.open sqltext,conn,3,3
'set rs=nothing
'conn.close
'response.redirect "Manage_Job.asp"
'end if

%>
<%
set rs=server.createobject("adodb.recordset")
sqltext="select * from job order by id desc"
rs.open sqltext,conn,1,1

dim MaPerPage
MaPerPage=4

dim text,checkpage
text="0123456789"
Rs.PageSize=MaPerPage
for i=1 to len(request("page"))
checkpage=instr(1,text,mid(request("page"),i,1))
if checkpage=0 then
exit for
end if
next

If checkpage<>0 then
If NOT IsEmpty(request("page")) Then
CurrentPage=Cint(request("page"))
If CurrentPage < 1 Then CurrentPage = 1
If CurrentPage > Rs.PageCount Then CurrentPage = Rs.PageCount
Else
CurrentPage= 1
End If
If not Rs.eof Then Rs.AbsolutePage = CurrentPage end if
Else
CurrentPage=1
End if

call showpages
call list

If Rs.recordcount > MaPerPage then
call showpages
end if

'��ʾ���ӵ��ӳ���
Sub list()%>
<!-- #include file="Inc/Head.asp" -->
<TABLE width="760" border=0 align="center" cellPadding=0 cellSpacing=0 bgcolor="#FFFFFF">
  <TBODY>
    <TR> 
      <TD width=196 vAlign=top> 
        <table width="92%" height="100%" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
          <tr> 
            <td valign="top">
<TABLE width="100%" border=0 cellPadding=0 cellSpacing=0 background="Img/index_01b.gif">
                <TBODY>
				<TR> 
                    <TD height=5 bgcolor="#FFFFFF"></TD>
                  </TR>
                  <TR> 
                    <TD height=15 bgcolor="#FFFFFF"><TABLE width="100%" border=0 cellPadding=0 cellSpacing=0 background="Img/index_01b.gif">
                        <TBODY>
                          <TR> 
                            <TD height="35" background="Img/index_01.gif" bgcolor="#FFFFFF"> 
                              <div align="center">��Ա��½</div></TD>
                          </TR>
                          <TR> 
                            <TD height="5"> </TD>
                          </TR>
                          <TR> 
                            <TD vAlign=top><table width="94%" border="0" align="center" cellpadding="0" cellspacing="0">
                                <tr> 
                                  <td> 
                                    <% call ShowUserLogin() %>
                                  </td>
                                </tr>
                              </table></TD>
                          </TR>
                          <TR> 
                            <TD height="5"> </TD>
                          </TR>
                          <TR> 
                            <TD 
                            height=1 colspan="2" 
                            background=img/naSzarym.gif><IMG height=1 src="img/1x1_pix.gif" 
                              width=10></TD>
                          </TR>
                        </TBODY>
                      </TABLE></TD>
                  </TR>
                  <TR> 
                    <TD height="33" background="Img/index_01.gif">
<div align="center">�˲���Ƹ 
                      </div></TD>
                  </TR>
                  <TR> 
                    <TD height="22"> <div align="center"><a href="Job.asp">�� �� 
                        �� Ƹ</a></div></TD>
                  </TR>
                  <TR> 
                    <TD 
                            height=1 colspan="2" 
                            background=img/naSzarym.gif><IMG height=1 src="img/1x1_pix.gif" 
                              width=10></TD>
                  </TR>
                  <TR> 
                    <TD height="22"><div align="center"><a href="Jobs.asp">�� �� 
                        �� ��</a></div></TD>
                  </TR>
                  <TR> 
                    <TD 
                            height=1 colspan="2" 
                            background=img/naSzarym.gif><IMG height=1 src="img/1x1_pix.gif" 
                              width=10></TD>
                  </TR>
                </TBODY>
              </TABLE>
              
            </td>
          </tr>
        </table>
      </TD>
      <TD width=1 background=img/kropki_pion_naBialym.gif><IMG 
            height=2 src="img/1x1_pix.gif" width=1></TD>
      <TD vAlign=top> 
        <TABLE width="90%" border=0 align="right" cellPadding=0 cellSpacing=0>
          <TBODY>
		  <TR> 
              <TD height=5></TD>
            </TR>
            <TR> 
              <TD> <TABLE cellSpacing=0 cellPadding=0 width="555" border=0>
                  <TBODY>
                    <TR> 
                      <TD height="25"><img src="Img/bgtop_12.gif" width="557" height="37"></TD>
                    </TR>
                  </TBODY>
                </TABLE></TD>
            </TR>
            <TR> 
              <TD background=img/naBialym.gif 
                  height=1><IMG height=1 src="img/1x1_pix.gif" 
              width=10></TD>
            </TR>
            <%
if not rs.eof then
i=0
do while not rs.eof
%>
            <TR> 
              <TD 
                  height=1><br> 
                <table width="90%" border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="#000000">
                  <tr> 
                    <td width="24%" bgcolor="76AADE"> 
                      <div align="center">��Ƹ����</div></td>
                    <td width="76%" bgcolor="#F8FCF8"><%=rs("Duix")%></td>
                  </tr>
                  <tr> 
                    <td bgcolor="76AADE"> 
                      <div align="center">��Ƹ����</div></td>
                    <td bgcolor="#F8FCF8"><%=rs("Rens")%></td>
                  </tr>
                  <tr> 
                    <td bgcolor="76AADE"> 
                      <div align="center">�����ص�</div></td>
                    <td bgcolor="#F8FCF8"><%=rs("did")%></td>
                  </tr>
                  <tr> 
                    <td bgcolor="76AADE"> 
                      <div align="center">���ʴ���</div></td>
                    <td bgcolor="#F8FCF8"><%=rs("daiy")%></td>
                  </tr>
                  <tr> 
                    <td bgcolor="76AADE"> 
                      <div align="center">����ʱ��</div></td>
                    <td bgcolor="#F8FCF8"><%=rs("time")%></td>
                  </tr>
                  <tr> 
                    <td bgcolor="76AADE"> 
                      <div align="center">��Ч����</div></td>
                    <td bgcolor="#F8FCF8"><%=rs("Qix")%></td>
                  </tr>
                  <tr> 
                    <td height="22" bgcolor="76AADE"> 
                      <div align="center">��ƸҪ��</div></td>
                    <td bgcolor="#F8FCF8"><%=rs("yaoq")%></td>
                  </tr>
                  <tr bgcolor="#FFFFFF"> 
                    <td height="22" colspan="2"><div align="right"><a href="AcceptJob.asp?job=<%=rs("Duix")%>">ӦƸ�˸�λ</a> 
                      </div></td>
                  </tr>
                </table></TD>
            </TR>
            <% 
i=i+1 
if i >= MaPerpage then exit do 
rs.movenext 
loop 
end if 
%>
            <TR> 
              <TD height=15></TD>
            </TR>
            <TR> 
              <TD background=img/naBialym.gif 
                  height=1><IMG height=1 src="img/1x1_pix.gif" 
              width=10></TD>
            </TR>
            <TR> 
              <TD 
                  height=25 bgcolor="#D8D8D8"> &nbsp; <%
Response.write "<strong><font color='#000000'>-> ȫ��-</font>"
Response.write "��</font>" & "<font color=#FF0000>" & Cstr(Rs.RecordCount) & "</font>" & "<font color='#000000'>����Ƹ��Ϣ</font></strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
Response.write "<strong><font color='#000000'>��</font>" & "<font color=#FF0000>" & Cstr(CurrentPage) &  "</font>" & "<font color='#000000'>/" & Cstr(rs.pagecount) & "</font></strong>&nbsp;"
If currentpage > 1 Then
response.write "<strong><a href='Job.asp?&page="+cstr(1)+"'><font color='#000000'>��ҳ</font></a><font color='#ffffff'> </font></strong>"
Response.write "<strong><a href='Job.asp?page="+Cstr(currentpage-1)+"'><font color='#000000'>��һҳ</font></a><font color='#ffffff'> </font></strong>"
Else
Response.write "<strong><font color='#000000'>��һҳ </font></strong>"
End if
If currentpage < Rs.PageCount Then
Response.write "<strong><a href='Job.asp?page="+Cstr(currentPage+1)+"'><font color='#000000'>��һҳ</font></a><font color='#ffffff'> </font>"
Response.write "<a href='Job.asp?page="+Cstr(Rs.PageCount)+"'><font color='#000000'>βҳ</font></a></strong>&nbsp;&nbsp;"
Else
Response.write ""
Response.write "<strong><font color='#000000'>��һҳ</font></strong>&nbsp;&nbsp;"
End if
'response.write "</td><td align='right'>"
'response.write "<font color='#000000' >ת����</font><input type='text' name='page' size=4 maxlength=4 class=smallInput value="&Currentpage&">&nbsp;"
'response.write "<input class=buttonface type='submit'  value='Go'  name='cndok'>&nbsp;&nbsp;"
%> <%
End sub
'rs.close

%> </TD>
            </TR>
          </TBODY>
        </TABLE>
      </TD>
    </TR>
  </TBODY>
</TABLE>
<!-- #include file="Inc/Foot.asp" -->
</BODY></HTML>
