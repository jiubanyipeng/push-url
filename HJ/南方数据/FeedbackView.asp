<!--#include file="Inc/SysProduct.asp" -->
<!--#include file="inc/Skin_css.asp"-->
<!-- #include file="Head.asp" -->
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
                <td height="34" class="title_left">&nbsp;&nbsp;&nbsp;<img src="Images/smallbook.jpg" width="10" height="10">&nbsp;&nbsp;���Է���</td>
              </tr>
              <tr> 
                <td height="20"> <div align="center"><a href="FeedbackView.asp">�� 
                    �� �� ��</a></div></td>
              </tr>
              <TR> 
                <TD 
                            height=1 colspan="2" 
                            background=img/naSzarym.gif><IMG height=1 src="img/1x1_pix.gif" 
                              width=10></TD>
              </TR>
              <tr> 
                <td height="20"> <div align="center"><a href="Feedback.asp">�� 
                    Ҫ �� ��</a></div></td>
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
                      <td class="
title_right" height="32">&nbsp;&nbsp;&nbsp;<img src="Images/smallbook.jpg" width="10" height="10">&nbsp;&nbsp;�� 
                        �� �� ��</td>
                    </tr>
                  </table>
                  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                    <TR> 
                      <TD> <table width="100%" height="19" border="0" align="center" cellpadding="0" cellspacing="0">
                  <tr> 
                            <td width="29%" height="18" bgcolor="#eeeeee">����������&gt;&gt; 
                              ����ר��</td>
                        <td width="71%" bgcolor="#eeeeee">&nbsp; </td>
                  </tr>
                  <tr> 
                    <td height="1" colspan="2" bgcolor="#999999"></td>
                  </tr>
                </table>
                        <%
set rs=server.createobject("adodb.recordset")
sql="select * from Feedback where Publish<>'1' order by id desc"
rs.open sql,conn,1,1

dim MaxPerPageFeedback
MaxPerPageFeedback=5

'ȡ��ҳ��,���ж�����������Ƿ��������͵����ݣ��粻�ǽ��Ե�һҳ��ʾ
dim text,checkpage
text="0123456789"
Rs.PageSize=MaxPerPageFeedback
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
<%
If rs.eof and rs.bof then
  response.write "<br>&nbsp;&nbsp;&nbsp;&nbsp;û������"
  exit Sub
End if
%> <br> 
                     
<%
i=0
do while not rs.eof
%> 			 
	<table width="100%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#FFFFFF" >
                          <tr bgcolor="#DFDFDF"> 
    <td width="17%" height="22" align="right" bgcolor="#DFDFDF" > 
      �����⣺ </td>
    <td colspan="5" bgcolor="#DFDFDF">&nbsp;<%if rs("username")="����Ա"then%>
                              [����Ա����] 
                              <%end if%>
                      <%=rs("title")%></a></td>
  </tr>
  <tr bgcolor="#DFDFDF"> 
                            <td height="22" align="right" bgcolor="#EFEFEF" > �������ݣ� </td>
                            <td colspan="5" align="center" bgcolor="#EFEFEF" >
<table width="97%"  border="0" cellpadding="0" cellspacing="0">
        <tr> 
          <td height="4">&nbsp;</td>
        </tr>
        <tr> 
          <td height="40" ><%=rs("Content")%>           
          </td>
        </tr>
        <tr> 
          <td height="4"></td>
        </tr>
      </table></td>
  </tr>
                          <tr bgcolor="#EFEFEF"> 
                            <td height="22" align="right" > �����ߣ� </td>
                            <td width="22%" ><%=rs("Receiver")%>
    </td>
                            <td width="12%" align="right" >����ʱ�䣺</td>
                            <td width="17%" ><%=rs("Time")%></td>
                            <td width="12%" align="right" >�ظ�ʱ�䣺</td>
                            <td width="20%" ><%=rs("Retime")%>
     
    </td>
  </tr>
  <tr bgcolor="#DFDFDF"> 
                            <td height="22" align="right" bgcolor="#EFEFEF" > ����Ա�ظ��� </td>
                            <td colspan="5" align="center" bgcolor="#EFEFEF" >
<table width="97%"  border="0" cellpadding="0" cellspacing="0" >
        <tr> 
          <td height="4"></td>
        </tr>
        <tr> 
          <td height="40" ><%if rs("ReFeedback")=""then%>
                              ["δ�ظ�"] 
							   <%else%>
							   <%=rs("ReFeedback")%>
                              <%end if%>
           
          </td>
        </tr>
        <tr> 
          <td height="4"></td>
        </tr>
      </table></td>
  </tr>
  <tr valign="top" bgcolor="#F7F7F7"> 
                            <td height="12" colspan="6" ><img src="Images/Hrbackup.gif" width="96" height="10"></td>
  </tr>
</table>
<%
i=i+1
if i >= MaxPerPageFeedback then exit do
rs.movenext
loop
%>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td> <div align="right">
                                <%
Response.write "ȫ��"
Response.write "��" & Cstr(Rs.RecordCount) & "������&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
Response.write "��" & Cstr(CurrentPage) &  "/" & Cstr(rs.pagecount) & "&nbsp;"
If currentpage > 1 Then
response.write "<a href='FeedbackView.asp?&page="+cstr(1)+"'>&nbsp;��ҳ&nbsp;</a>"
Response.write "<a href='FeedbackView.asp?page="+Cstr(currentpage-1)+"'>&nbsp;��һҳ&nbsp;</a>"
Else
Response.write "&nbsp;��һҳ&nbsp;"
End if
If currentpage < Rs.PageCount Then
Response.write "<a href='FeedbackView.asp?page="+Cstr(currentPage+1)+"'>&nbsp;��һҳ&nbsp;</a>"
Response.write "<a href='FeedbackView.asp?page="+Cstr(Rs.PageCount)+"'>&nbsp;βҳ&nbsp;</a>"
Else
Response.write ""
Response.write "&nbsp;��һҳ&nbsp;"
End if
Response.write "ת����"
response.write"<select name='sel_page' onChange='javascript:location=this.options[this.selectedIndex].value;'>"
    for i = 1 to Rs.PageCount
       if i = currentpage then 
          response.write"<option value='FeedbackView.asp?page="&i&"&id="&id&"' selected>"&i&"</option>"
       else
          response.write"<option value='FeedbackView.asp?page="&i&"&id="&id&"'>"&i&"</option>"
       end if
    next
response.write"</select>ҳ"
%>
                              </div></td>
                          </tr>
                        </table>
<%end sub%>
                 </TD>
            </TR>
                  </table></td>
              </tr>
            </table></td>
        </tr>
      </table></td>
  </tr>
</table>
<%
rs.close
set rs=nothing
%>    
<!-- #include file="Inc/Foot.asp" -->
</BODY></HTML>