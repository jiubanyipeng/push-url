<!--#include file="admin.asp"-->
<!--#include file="conn.asp"-->
<%if Request.QueryString("no")="eshop" then

dim SQL, Rs, contentID,CurrentPage
CurrentPage = request("Page")
contentID=request("ID")

set rs=server.createobject("adodb.recordset")
sqltext="delete from job where Id="& contentID
rs.open sqltext,conn,3,3
set rs=nothing
conn.close
response.redirect "Manage_Job.asp"
end if

%>
<%

set rs=server.createobject("adodb.recordset")
sqltext="select * from job order by id desc"
rs.open sqltext,conn,1,1

dim MaxPerPage
MaxPerPage=10

dim text,checkpage
text="0123456789"
Rs.PageSize=MaxPerPage
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

If Rs.recordcount > MaxPerPage then
call showpages
end if

'显示帖子的子程序
Sub list()%>
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
                      <td width="84%" height="20"><font color="#FFFF00">人才管理</font></td>
                    </tr>
                  </table>
                  <table width="90%" border="0" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td width="34%" height="20" align="right"><img src="../Img/Left_1_1.gif" width="29" height="16"></td>
                      <td width="66%" valign="bottom"><a href="Manage_Job.asp"><font color="#FFFF00">招聘管理</font></a></td>
                    </tr>
                  </table>
                  <table width="90%" border="0" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td width="34%" height="20" align="right"><img src="../Img/Left_1_1.gif" width="29" height="16"></td>
                      <td width="66%" valign="bottom"><a href="Manage_JobAdd.asp"><font color="#FFFF00">发布招聘</font></a></td>
                    </tr>
                  </table>
                  <table width="90%" border="0" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td width="34%" height="20" align="right"><img src="../Img/Left_1_1.gif" width="29" height="16"></td>
                      <td width="66%" valign="bottom"><a href="Manage_JobBook.asp"><font color="#FFFF00">应聘管理</font></a></td>
                    </tr>
                  </table>
                  <table width="90%" border="0" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td width="34%" height="20" align="right"><img src="../Img/Left_1_1.gif" width="29" height="16"></td>
                      <td width="66%" valign="bottom"><a href="Manage_Jobs.asp"><font color="#FFFF00">人才策略</font></a></td>
                    </tr>
                  </table></td>
              </tr>
            </table></td>
        </tr>
      </table></td>
    <td align="center" valign="top">
	<br>
      <strong><br>
      </strong> <br>
      <br>
      <table width="550" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td height="25"> <div align="center"><strong>招 聘 管 理<br>
              <br>
              </strong></div></td>
        </tr>
        <tr> 
            <td><div align="center"> 
              <table width="100%" border="0" cellspacing="2" cellpadding="3">
                <tr bgcolor="#C0C0C0"> 
                  <td width="8%" height="25" bgcolor="#C0C0C0"> <div align="center">ID</div></td>
                  <td width="35%"> <div align="center">招聘对象</div></td>
                  <td width="11%" bgcolor="#C0C0C0"><div align="center">招聘人数</div></td>
                  <td width="11%" bgcolor="#C0C0C0"><div align="center">发布时间</div></td>
                  <td width="11%" bgcolor="#C0C0C0"><div align="center">有效期限</div></td>
                  <td width="10%"> <div align="center">操作</div></td>
                  <td width="14%"> <div align="center">操作</div></td>
                </tr>
                <%
if not rs.eof then
i=0
do while not rs.eof
%>
                <tr bgcolor="#E3E3E3"> 
                  <td height="22"> <div align="center"><%=rs("id")%></div></td>
                  <td>&nbsp;&nbsp;<%=rs("Duix")%></td>
                  <td bgcolor="#E3E3E3"><div align="center"><%=rs("Rens")%>人</div></td>
                  <td bgcolor="#E3E3E3"><div align="center"><%=rs("Time")%></div></td>
                  <td bgcolor="#E3E3E3"><div align="center"><%=rs("Qix")%>天</div></td>
                  <td bgcolor="#E3E3E3"> <div align="center"><a href="Manage_editJob.asp?id=<%=rs("id")%>">修改</a></div></td>
                  <td> <div align="center"><a href="Manage_Job.asp?id=<%=rs("id")%>&amp;no=eshop">删除</a></div></td>
                </tr>
                <% 
i=i+1 
if i >= MaxPerpage then exit do 
rs.movenext 
loop 
end if 
%>
                <tr bgcolor="#C0C0C0"> 
                  <td height="25" colspan="7">&nbsp;&nbsp; 
                    <%
Response.write "<strong><font color='#000000'>-> 全部-</font>"
Response.write "共</font>" & "<font color=#FF0000>" & Cstr(Rs.RecordCount) & "</font>" & "<font color='#000000'>条招聘信息</font></strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
Response.write "<strong><font color='#000000'>第</font>" & "<font color=#FF0000>" & Cstr(CurrentPage) &  "</font>" & "<font color='#000000'>/" & Cstr(rs.pagecount) & "</font></strong>&nbsp;"
If currentpage > 1 Then
response.write "<strong><a href='Manage_job.asp?&page="+cstr(1)+"'><font color='#000000'>首页</font></a><font color='#ffffff'> </font></strong>"
Response.write "<strong><a href='Manage_job.asp?page="+Cstr(currentpage-1)+"'><font color='#000000'>上一页</font></a><font color='#ffffff'> </font></strong>"
Else
Response.write "<strong><font color='#000000'>上一页 </font></strong>"
End if
If currentpage < Rs.PageCount Then
Response.write "<strong><a href='Manage_job.asp?page="+Cstr(currentPage+1)+"'><font color='#000000'>下一页</font></a><font color='#ffffff'> </font>"
Response.write "<a href='Manage_job.asp?page="+Cstr(Rs.PageCount)+"'><font color='#000000'>尾页</font></a></strong>&nbsp;&nbsp;"
Else
Response.write ""
Response.write "<strong><font color='#000000'>下一页</font></strong>&nbsp;&nbsp;"
End if
'response.write "</td><td align='right'>"
'response.write "<font color='#000000' >转到：</font><input type='text' name='page' size=4 maxlength=4 class=smallInput value="&Currentpage&">&nbsp;"
'response.write "<input class=buttonface type='submit'  value='Go'  name='cndok'>&nbsp;&nbsp;"
%>
                  </td>
                </tr>
              </table>
			  <%
End sub
rs.close

%>
            </div></td>
        </tr>
      </table>
      <br>
      <br>
    </td>
  </tr>
</table>
<!-- #include file="Inc/Foot.asp" -->