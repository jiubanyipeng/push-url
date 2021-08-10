<!--#include file="Inc/syscode.asp"-->
<!-- #include file="Inc/Head.asp" -->
<TABLE width="760" border=0 align="center" cellPadding=0 cellSpacing=0 bgcolor="#FFFFFF">
  <TBODY>
    <TR> 
      <TD width=196 vAlign=top bgcolor="#FFFFFF"> 
        <table width="92%" height="100%" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
          <tr> 
            <td height="206" valign="top">
<TABLE width="100%" border=0 cellPadding=0 cellSpacing=0 background="Img/index_01b.gif">
                <TBODY>
                  <TR> 
                    <TD height=5 bgcolor="#FFFFFF"></TD>
                  </TR>
                  <TR> 
                    <TD height="33" background="Img/index_01.gif">
<div align="center">会员登陆 
                      </div></TD>
                  </TR>
                  <TR> 
                    <TD height="5"> </TD>
                  </TR>
                  <TR> 
                    <TD vAlign=top><table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
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
              </TABLE>
              <TABLE width="100%" border=0 cellPadding=0 cellSpacing=0 background="Img/index_01b.gif">
                <TBODY>
                  <TR> 
                    <TD height=15 bgcolor="#FFFFFF"></TD>
                  </TR>
                  <TR> 
                    <TD height="34" background="Img/index_01.gif"> <div align="center">企业简介 
                      </div></TD>
                  </TR>
                  <TR> 
                    <TD height="22"> <div align="center"><a href="About.asp">企 
                        业 简 介</a></div></TD>
                  </TR>
                  <TR> 
                    <TD 
                            height=1 colspan="2" 
                            background=img/naSzarym.gif><IMG height=1 src="img/1x1_pix.gif" 
                              width=10></TD>
                  </TR>
                  <TR> 
                    <TD height="22"><div align="center"><a href="Culture.asp">企 
                            业 文 化</a></div></TD>
                  </TR>
                  <TR> 
                    <TD 
                            height=1 colspan="2" 
                            background=img/naSzarym.gif><IMG height=1 src="img/1x1_pix.gif" 
                              width=10></TD>
                  </TR>
                  <TR> 
                    <TD height="22"><div align="center"><a href="Organize.asp">组 
                        织 机 构</a></div></TD>
                  </TR>
                  <TR> 
                    <TD 
                            height=1 colspan="2" 
                            background=img/naSzarym.gif><IMG height=1 src="img/1x1_pix.gif" 
                              width=10></TD>
                  </TR>
                  <TR> 
                    <TD height="22"><div align="center"><a href="Principle.asp">成 
                            长 历 程</a></div></TD>
                  </TR>
                  <TR> 
                    <TD 
                            height=1 colspan="2" 
                            background=img/naSzarym.gif><IMG height=1 src="img/1x1_pix.gif" 
                              width=10></TD>
                  </TR>
                  <TR> 
                    <TD height="22"><div align="center"><a href="Contact.asp">联 
                        系 我 们</a></div></TD>
                  </TR>
                  <TR> 
                    <TD 
                            height=1 colspan="2" 
                            background=img/naSzarym.gif><IMG height=1 src="img/1x1_pix.gif" 
                              width=10></TD>
                  </TR>
                </TBODY>
              </TABLE> </td>
          </tr>
        </table>
      </TD>
      <TD width=1 background=img/kropki_pion_naBialym.gif><IMG 
            height=2 src="img/1x1_pix.gif" width=1></TD>
      <TD vAlign=top> <TABLE width="90%" border=0 align="right" cellPadding=0 cellSpacing=0>
          <TBODY>
            <TR> 
              <TD><IMG height=1 
                  src="img/1x1_pix.gif" width=1></TD>
            </TR>
            <TR> 
              <TD> <TABLE cellSpacing=0 cellPadding=0 width="555" border=0>
                  <TBODY>
                    <TR> 
                      <TD height="25"><img src="Img/bgtop_5.gif" width="557" height="37"></TD>
                    </TR>
                  </TBODY>
                </TABLE></TD>
            </TR>
            <TR> 
              <TD background=img/naBialym.gif><IMG height=1 src="img/1x1_pix.gif" 
              width=10></TD>
            </TR>
            <TR> 
              <TD> 
                <%
flag="尚未处理"
set rs=server.createobject("adodb.recordset")
sqltext="select * from culture Order BY id desc"
rs.open sqltext,conn,1,1
dim PerPage
PerPage=10
'假如没有数据时
If rs.eof and rs.bof then
call showpages
response.write "<p align='center'><font color='#ff0000'>还没任何文章</font></p>"
response.end
End if
'取得页数,并判断用户输入的是否数字类型的数据，如不是将以第一页显示
text="0123456789"
Rs.PageSize=PerPage
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

If Rs.recordcount > PerPage then
call showpages
end if

'显示帖子的子程序
Sub list()%> 
                <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                  <tr> 
                        <td width="18%" bgcolor="#eeeeee">&nbsp;&nbsp;首页》企业文化</td>
                    <td width="82%" bgcolor="#eeeeee"> <%
Response.write "<strong><font color='#000000'>-> 全部-</font>"
Response.write "共</font>" & "<font color=#FF0000>" & Cstr(Rs.RecordCount) & "</font>" & "<font color='#000000'>条文章</font></strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
Response.write "<strong><font color='#000000'>第</font>" & "<font color=#FF0000>" & Cstr(CurrentPage) &  "</font>" & "<font color='#000000'>/" & Cstr(rs.pagecount) & "</font></strong>&nbsp;"
If currentpage > 1 Then
response.write "<strong><a href='culturenews.asp?&page="+cstr(1)+"'><font color='#000000'>首页</font></a><font color='#ffffff'> </font></strong>"
Response.write "<strong><a href='culturenews.asp?page="+Cstr(currentpage-1)+"'><font color='#000000'>上一页</font></a><font color='#ffffff'> </font></strong>"
Else
Response.write "<strong><font color='#000000'>上一页 </font></strong>"
End if
If currentpage < Rs.PageCount Then
Response.write "<strong><a href='culturenews.asp?page="+Cstr(currentPage+1)+"'><font color='#000000'>下一页</font></a><font color='#ffffff'> </font>"
Response.write "<a href='culturenews.asp?page="+Cstr(Rs.PageCount)+"'><font color='#000000'>尾页</font></a></strong>&nbsp;&nbsp;"
Else
Response.write ""
Response.write "<strong><font color='#000000'>下一页</font></strong>&nbsp;&nbsp;"
End if
'response.write "</td><td align='right'>"
'response.write "<font color='#000000' >转到：</font><input type='text' name='page' size=4 maxlength=4 class=smallInput value="&Currentpage&">&nbsp;"
'response.write "<input class=buttonface type='submit'  value='Go'  name='cndok'>&nbsp;&nbsp;"
%> </td>
                  </tr>
                  <tr> 
                    <td colspan="2" bgcolor="#999999"></td>
                  </tr>
                </table>
                <table width="100%" border="0" align="center" cellpadding="0" cellspacing="3" bgcolor="#FBFEFF">
                  <tr> 
                    <td height="8"></td>
                  </tr>
                  <%
if not rs.eof then
i=1
do while not rs.eof
%>
                  <tr> 
                    <td>&nbsp;&nbsp;<img src="Img/dot.gif" width="7" height="11">&nbsp;<a href="culturenewsInfo.asp?id=<%=rs("id")%>"><%=rs("title")%></a>&nbsp;&nbsp;<font color="#0066CC" face="Arial"><%=rs("time")%></font>&nbsp; <%if rs("time")=date() then%> <strong><font color="#FF0000" face="Arial">New</font></strong> 
                      <%end if%> </td>
                  </tr>
                  <%
i=i+1
if i > Perpage then exit do
rs.movenext
loop
end if
%>
                  <tr> 
                    <td height="8"></td>
                  </tr>
                </table>
                <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                  <tr> 
                        <td width="18%" bgcolor="#eeeeee">&nbsp;&nbsp;首页》企业文化</td>
                    <td width="82%" bgcolor="#eeeeee"> <%
Response.write "<strong><font color='#000000'>-> 全部-</font>"
Response.write "共</font>" & "<font color=#FF0000>" & Cstr(Rs.RecordCount) & "</font>" & "<font color='#000000'>条文章</font></strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
Response.write "<strong><font color='#000000'>第</font>" & "<font color=#FF0000>" & Cstr(CurrentPage) &  "</font>" & "<font color='#000000'>/" & Cstr(rs.pagecount) & "</font></strong>&nbsp;"
If currentpage > 1 Then
response.write "<strong><a href='culturenews.asp?&page="+cstr(1)+"'><font color='#000000'>首页</font></a><font color='#ffffff'> </font></strong>"
Response.write "<strong><a href='culturenews.asp?page="+Cstr(currentpage-1)+"'><font color='#000000'>上一页</font></a><font color='#ffffff'> </font></strong>"
Else
Response.write "<strong><font color='#000000'>上一页 </font></strong>"
End if
If currentpage < Rs.PageCount Then
Response.write "<strong><a href='culturenews.asp?page="+Cstr(currentPage+1)+"'><font color='#000000'>下一页</font></a><font color='#ffffff'> </font>"
Response.write "<a href='culturenews.asp?page="+Cstr(Rs.PageCount)+"'><font color='#000000'>尾页</font></a></strong>&nbsp;&nbsp;"
Else
Response.write ""
Response.write "<strong><font color='#000000'>下一页</font></strong>&nbsp;&nbsp;"
End if
'response.write "</td><td align='right'>"
'response.write "<font color='#000000' >转到：</font><input type='text' name='page' size=4 maxlength=4 class=smallInput value="&Currentpage&">&nbsp;"
'response.write "<input class=buttonface type='submit'  value='Go'  name='cndok'>&nbsp;&nbsp;"
%> </td>
                  </tr>
                  <tr> 
                    <td colspan="2" bgcolor="#999999"></td>
                  </tr>
                </table>
                <%
End sub
rs.close

%> </TD>
            </TR>
            <TR> 
              <TD background=img/naBialym.gif><IMG height=1 src="img/1x1_pix.gif" 
              width=10></TD>
            </TR>
            
          </TBODY>
        </TABLE></TD>
    </TR>
  </TBODY>
</TABLE>
<!-- #include file="Inc/Foot.asp" -->
</BODY></HTML>
