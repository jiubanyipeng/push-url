<!--#include file="Inc/SysProduct.asp" -->
<!--#include file="inc/Skin_css.asp"-->
<!-- #include file="Head.asp" -->
<%
set rs=server.createobject("adodb.recordset")
sql="select * from HrDemand order by id desc"
rs.open sql,conn,1,1

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

call list

'��ʾ���ӵ��ӳ���
Sub list()%>
<table width="760" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="5" valign="top" bgcolor="#FFFFFF"></td>
  </tr>
  <tr> 
    <td height="72" valign="top" bgcolor="#FFFFFF"><table width="746" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr> 
          <td class="tdbg_left"  width="190" height="179" valign="top" > <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="34" class="title_left">&nbsp;&nbsp;&nbsp;<img src="Images/smallbook.jpg" width="10" height="10">&nbsp;&nbsp;�û���½ 
                </td>
              </tr>
              <tr> 
                <td height="5"></td>
              </tr>
              <tr> 
                <td height="10"><table width="92%" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td> 
                        <% call ShowUserLogin() %>
                      </td>
                    </tr>
                  </table></td>
              </tr>
              <tr> 
                <td height="5"></td>
              </tr>
            </table>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
              <tr> 
                <td height="34" class="title_left">&nbsp;&nbsp;&nbsp;<img src="Images/smallbook.jpg" width="10" height="10">&nbsp;&nbsp;�˲���Ƹ</td>
              </tr>
              <tr> 
                <td height="20"> <div align="center"><a href="HrDemand.asp">�� 
                    �� �� Ƹ</a></div></td>
              </tr>
              <TR> 
                <TD 
                            height=1 colspan="2" 
                            background=img/naSzarym.gif><IMG height=1 src="img/1x1_pix.gif" 
                              width=10></TD>
              </TR>
              <tr> 
                <td height="20"> <div align="center"><a href="HrPolicy.asp">�� 
                    �� �� ��</a></div></td>
              </tr>
              <TR> 
                <TD 
                            height=1 colspan="2" 
                            background=img/naSzarym.gif><IMG height=1 src="img/1x1_pix.gif" 
                              width=10></TD>
              </TR>
            </table></td>
          <td width="6"></td>
          <td  valign="top"><table Class=border width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
              <tr> 
                <td height="206" valign="top"> <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td class="title_right" height="32">&nbsp;&nbsp;&nbsp;<img src="Images/smallbook.jpg" width="10" height="10">&nbsp;&nbsp;�� 
                        �� �� Ƹ</td>
                    </tr>
                  </table>
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <%
if not rs.eof then
i=0
do while not rs.eof
%>
                    <TR> 
                      <TD 
                  height=1><br> 
                        <table width="95%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#FFFFFF" >
                          <tr bgcolor="#DFDFDF"> 
                            <td width="82" height="22" align="center" bgcolor="#eeeeee" >ְλ���ƣ�</td>
                            <td colspan="2" bgcolor="#eeeeee" >&nbsp;<%=rs("HrName")%> </td>
                            <td width="181" bgcolor="#eeeeee" >&nbsp;<a href="HrDemandAccept.asp?Quarters=<%=rs("HrName")%>"><font color="#FF0000">ӦƸ�˸�λ</font></a> 
                            </td>
                          </tr>
                          <tr bgcolor="#DFDFDF"> 
                            <td width="82" height="22" align="center" bgcolor="#eeeeee" >�����ص㣺</td>
                            <td colspan="3" valign="top" bgcolor="#eeeeee" >&nbsp;<%=rs("HrAddress")%> </td>
                          </tr>
                          <tr bgcolor="#DFDFDF"> 
                            <td width="82" height="22" align="center" bgcolor="#eeeeee" >���ʴ�����</td>
                            <td width="204" bgcolor="#eeeeee">&nbsp;<%=rs("HrSalary")%></td>
                            <td width="78" align="center" bgcolor="#eeeeee" >�������ڣ�</td>
                            <td bgcolor="#eeeeee" >&nbsp;<%=rs("HrDate")%> </td>
                          </tr>
                          <tr bgcolor="#DFDFDF"> 
                            <td height="26" align="center" bgcolor="#eeeeee" >����������</td>
                            <td align="center" bgcolor="#eeeeee"><div align="left">&nbsp;<%=rs("HrRequireNum")%> ��</div></td>
                            <td align="center" bgcolor="#eeeeee">��Ч���ޣ�</td>
                            <td align="center" bgcolor="#eeeeee"><div align="left">&nbsp;<%=rs("HrValidDate")%></div></td>
                          </tr>
                          <tr bgcolor="#DFDFDF"> 
                            <td width="82" height="26" align="center" bgcolor="#eeeeee" ><font color=#000066>����Ҫ��</font></td>
                            <td colspan="3" align="center" bgcolor="#eeeeee"><table width="100%"  border="0" cellpadding="5" cellspacing="0" >
                                <tr> 
                                  <td class="News-05"><%=rs("HrDetail")%></td>
                                </tr>
                              </table></td>
                          </tr>
                          <tr bgcolor="#F7F7F7"> 
                            <td height="10" colspan="4"><img src="Images/Hrbackup.gif" width="96" height="10"></td>
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
                  </table></td>
              </tr>
              <TR> 
                <TD 
                  height=25 bgcolor="#D8D8D8"><div align="right"> 
                    <%
Response.write "ȫ��"
Response.write "��" & Cstr(Rs.RecordCount) & "����Ƹ��Ϣ&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
Response.write "��" & Cstr(CurrentPage) &  "/" & Cstr(rs.pagecount) & "&nbsp;"
If currentpage > 1 Then
response.write "<a href='HrDemand.asp?&page="+cstr(1)+"'>&nbsp;��ҳ&nbsp;</a>"
Response.write "<a href='HrDemand.asp?page="+Cstr(currentpage-1)+"'>&nbsp;��һҳ&nbsp;</a>"
Else
Response.write "&nbsp;��һҳ&nbsp;"
End if
If currentpage < Rs.PageCount Then
Response.write "<a href='HrDemand.asp?page="+Cstr(currentPage+1)+"'>&nbsp;��һҳ&nbsp;</a>"
Response.write "<a href='HrDemand.asp?page="+Cstr(Rs.PageCount)+"'>&nbsp;βҳ&nbsp;</a>"
Else
Response.write ""
Response.write "&nbsp;��һҳ&nbsp;"
End if
Response.write "ת����"
response.write"<select name='sel_page' onChange='javascript:location=this.options[this.selectedIndex].value;'>"
    for i = 1 to Rs.PageCount
       if i = currentpage then 
          response.write"<option value='HrDemand.asp?page="&i&"&id="&id&"' selected>"&i&"</option>"
       else
          response.write"<option value='HrDemand.asp?page="&i&"&id="&id&"'>"&i&"</option>"
       end if
    next
response.write"</select>ҳ"
rs.close
%>
                  </div></TD>
              </TR>
            </table></td>
        </tr>
      </table></td>
  </tr>
</table>
<%
End sub
%>
<%
rs.close
set rs=nothing
%>
<!-- #include file="Inc/Foot.asp" -->
</BODY></HTML>
