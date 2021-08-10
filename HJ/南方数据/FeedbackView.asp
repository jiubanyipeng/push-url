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
                <td height="34" class="title_left">&nbsp;&nbsp;&nbsp;<img src="Images/smallbook.jpg" width="10" height="10">&nbsp;&nbsp;用户登陆 
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
                <td height="34" class="title_left">&nbsp;&nbsp;&nbsp;<img src="Images/smallbook.jpg" width="10" height="10">&nbsp;&nbsp;留言反馈</td>
              </tr>
              <tr> 
                <td height="20"> <div align="center"><a href="FeedbackView.asp">客 
                    户 留 言</a></div></td>
              </tr>
              <TR> 
                <TD 
                            height=1 colspan="2" 
                            background=img/naSzarym.gif><IMG height=1 src="img/1x1_pix.gif" 
                              width=10></TD>
              </TR>
              <tr> 
                <td height="20"> <div align="center"><a href="Feedback.asp">我 
                    要 留 言</a></div></td>
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
title_right" height="32">&nbsp;&nbsp;&nbsp;<img src="Images/smallbook.jpg" width="10" height="10">&nbsp;&nbsp;留 
                        言 中 心</td>
                    </tr>
                  </table>
                  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                    <TR> 
                      <TD> <table width="100%" height="19" border="0" align="center" cellpadding="0" cellspacing="0">
                  <tr> 
                            <td width="29%" height="18" bgcolor="#eeeeee">　留言中心&gt;&gt; 
                              留言专区</td>
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

'取得页数,并判断留言输入的是否数字类型的数据，如不是将以第一页显示
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

'显示帖子的子程序
Sub list()%> 
<%
If rs.eof and rs.bof then
  response.write "<br>&nbsp;&nbsp;&nbsp;&nbsp;没有留言"
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
      主　题： </td>
    <td colspan="5" bgcolor="#DFDFDF">&nbsp;<%if rs("username")="管理员"then%>
                              [管理员公告] 
                              <%end if%>
                      <%=rs("title")%></a></td>
  </tr>
  <tr bgcolor="#DFDFDF"> 
                            <td height="22" align="right" bgcolor="#EFEFEF" > 反馈内容： </td>
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
                            <td height="22" align="right" > 留言者： </td>
                            <td width="22%" ><%=rs("Receiver")%>
    </td>
                            <td width="12%" align="right" >留言时间：</td>
                            <td width="17%" ><%=rs("Time")%></td>
                            <td width="12%" align="right" >回复时间：</td>
                            <td width="20%" ><%=rs("Retime")%>
     
    </td>
  </tr>
  <tr bgcolor="#DFDFDF"> 
                            <td height="22" align="right" bgcolor="#EFEFEF" > 管理员回复： </td>
                            <td colspan="5" align="center" bgcolor="#EFEFEF" >
<table width="97%"  border="0" cellpadding="0" cellspacing="0" >
        <tr> 
          <td height="4"></td>
        </tr>
        <tr> 
          <td height="40" ><%if rs("ReFeedback")=""then%>
                              ["未回复"] 
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
Response.write "全部"
Response.write "共" & Cstr(Rs.RecordCount) & "条留言&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
Response.write "第" & Cstr(CurrentPage) &  "/" & Cstr(rs.pagecount) & "&nbsp;"
If currentpage > 1 Then
response.write "<a href='FeedbackView.asp?&page="+cstr(1)+"'>&nbsp;首页&nbsp;</a>"
Response.write "<a href='FeedbackView.asp?page="+Cstr(currentpage-1)+"'>&nbsp;上一页&nbsp;</a>"
Else
Response.write "&nbsp;上一页&nbsp;"
End if
If currentpage < Rs.PageCount Then
Response.write "<a href='FeedbackView.asp?page="+Cstr(currentPage+1)+"'>&nbsp;下一页&nbsp;</a>"
Response.write "<a href='FeedbackView.asp?page="+Cstr(Rs.PageCount)+"'>&nbsp;尾页&nbsp;</a>"
Else
Response.write ""
Response.write "&nbsp;下一页&nbsp;"
End if
Response.write "转到第"
response.write"<select name='sel_page' onChange='javascript:location=this.options[this.selectedIndex].value;'>"
    for i = 1 to Rs.PageCount
       if i = currentpage then 
          response.write"<option value='FeedbackView.asp?page="&i&"&id="&id&"' selected>"&i&"</option>"
       else
          response.write"<option value='FeedbackView.asp?page="&i&"&id="&id&"'>"&i&"</option>"
       end if
    next
response.write"</select>页"
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