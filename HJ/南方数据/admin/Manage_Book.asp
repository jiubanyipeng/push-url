<%@ LANGUAGE="VBScript" %>
<!--#include file="admin.asp"-->
<!--#include file="conn.asp"-->
<!--#include file="Inc/articlechar.inc"-->
<%
if Request.QueryString("no")="eshop" then
If request.form("title")="" Then
Response.Write("<script language=""JavaScript"">alert(""错误：您没输入标题，请返回检查！！"");history.go(-1);</script>")
response.end
end if


If request.form("content")="" Then
Response.Write("<script language=""JavaScript"">alert(""错误：您没输入留言内容，请返回检查！！"");history.go(-1);</script>")
response.end
end if

Set rs = Server.CreateObject("ADODB.Recordset")
sql="select * from book"
rs.open sql,conn,1,3


rs.addnew
if request.form("html")="on" then
rs("content")=request.form("content")
else
rs("content")=htmlencode2(request.form("content"))
end if
rs("name")=request.form("name")
rs("title")=request.form("title")
rs("time")=date()
rs.update
rs.close
response.redirect "Manage_Book.asp"
end if

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
                      <td width="84%" height="20"><font color="#FFFF00">留言管理</font></td>
                    </tr>
                  </table>
                  <table width="90%" border="0" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td width="34%" height="20" align="right"><img src="../Img/Left_1_1.gif" width="29" height="16"></td>
                      <td width="66%" valign="bottom"><a href="Manage_Book.asp"><font color="#FFFF00">留言管理</font></a></td>
                    </tr>
                  </table>
                  
                  <table width="90%" border="0" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td width="34%" height="20" align="right"><img src="../Img/Left_1_1.gif" width="29" height="16"></td>
                      <td width="66%" valign="bottom"><a href="Manage_AddBook.asp"><font color="#FFFF00">管理员公告</font></a></td>
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
          <td height="25"> <div align="center"><strong>留言管理<br>
              <br>
              </strong></div></td>
        </tr>
        <tr> 
			<td><div align="center"> 
			<% 
const MaxPerPage=5 '分页显示的纪录个数 
dim sql 
dim rs 
dim totalPut 
dim CurrentPage 
dim TotalPages 
dim i,j 
 
 
if not isempty(request("page")) then 
currentPage=cint(request("page")) 
else 
currentPage=1 
end if 
set rs=server.createobject("adodb.recordset") 
sql="select * from book order by id desc" 
rs.open sql,conn,1,1 
 
if rs.eof and rs.bof then 
response.write "<p align='center'>还没有任何留言!</p>" 
else 
totalPut=rs.recordcount 
totalPut=rs.recordcount 
if currentpage<1 then 
currentpage=1 
end if 
if (currentpage-1)*MaxPerPage>totalput then 
if (totalPut mod MaxPerPage)=0 then 
currentpage= totalPut \ MaxPerPage 
else 
currentpage= totalPut \ MaxPerPage + 1 
end if 
end if 
if currentPage=1 then 
showpages 
showContent 
showpages 
else 
if (currentPage-1)*MaxPerPage<totalPut then 
rs.move (currentPage-1)*MaxPerPage 
dim bookmark 
bookmark=rs.bookmark 
showpages 
showContent 
showpages 
else 
currentPage=1 
showContent 
end if 
end if 
rs.close 
end if 
set rs=nothing 
conn.close 
set conn=nothing 
sub showContent 
dim i 
i=0 
do while not (rs.eof or err) %>
                
              <table width="100%" border="0" cellspacing="2" cellpadding="3">
                <tr bgcolor="#C0C0C0"> 
                  <td width="18%" height="25" bgcolor="#C0C0C0"> <div align="center"> 
                      <%if rs("name")="管理员"then%>
                      『商城公告』 
                      <%else%>
                      用户名 
                      <%end if%>
                    </div></td>
                  <td width="82%" bgcolor="#C0C0C0">&nbsp;&nbsp;<%=rs("name")%> 
                    &nbsp; <a href="Delbook.asp?id=<%=rs("ID")%>">删除</a>&nbsp;&nbsp;&nbsp;&nbsp; 
                    <a href="Manage_Rebook.asp?id=<%=rs("id")%>"> 
                    <%if rs("name")<>"管理员" then%>
                    <%if rs("name")<>"未注册用户" then 
response.write "回复" 
end if 
%>
                    </a> 
                    <%if rs("name")="未注册用户" then 
response.write "没有注册为会员通过E-amil回复！" 
end if%>
                    <%end if%>
                  </td>
                </tr>
                <%if rs("email")<>"" then%>
                <tr bgcolor="#E3E3E3"> 
                  <td height="10"> <div align="center">公司名称</div></td>
                  <td bgcolor="#E3E3E3">&nbsp;&nbsp;<%=rs("Comane")%></td>
                </tr>
                <tr bgcolor="#E3E3E3"> 
                  <td height="10"><div align="center">联系人</div></td>
                  <td bgcolor="#E3E3E3">&nbsp;&nbsp;<%=rs("Somane")%></td>
                </tr>
                <tr bgcolor="#E3E3E3"> 
                  <td height="22"><div align="center">联系电话</div></td>
                  <td bgcolor="#E3E3E3">&nbsp;&nbsp;<%=rs("Phone")%></td>
                </tr>
                <tr bgcolor="#E3E3E3"> 
                  <td height="22"><div align="center">联系传真</div></td>
                  <td bgcolor="#E3E3E3">&nbsp;&nbsp;<%=rs("Fox")%></td>
                </tr>
                <tr bgcolor="#E3E3E3"> 
                  <td height="22"><div align="center">E-mail</div></td>
                  <td bgcolor="#E3E3E3"><a href="Sendmail.asp?email=<%=rs("email")%>"><%=rs("email")%></a></td>
                </tr>
                <%end if%>
                <tr bgcolor="#C0C0C0"> 
                  <td height="25" bgcolor="#C0C0C0"><div align="center">主 题</div></td>
                  <td height="25">&nbsp;&nbsp;<%=rs("title")%>&nbsp;&nbsp;[<%=rs("time")%>]</td>
                </tr>
                <tr bgcolor="#E3E3E3"> 
                  <td height="25"> <div align="center">内 容</div></td>
                  <td height="25">&nbsp;&nbsp;<%=rs("content")%></td>
                </tr>
                <%if rs("rebook")<>""then%>
                <tr bgcolor="#E3E3E3"> 
                  <td height="25"> <div align="center">回复内容</div></td>
                  <td height="25">&nbsp;&nbsp;<%=rs("rebook")%></td>
                </tr>
                <%end if%>
              </table>
              </div></td>
        </tr>
      </table>
      <br>
      <table width="550" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td><div align="center"><% i=i+1 
if i>=MaxPerPage then exit do 
rs.movenext 
loop 
end sub 
sub showpages() 
dim n 
if (totalPut mod MaxPerPage)=0 then 
n= totalPut \ MaxPerPage 
else 
n= totalPut \ MaxPerPage + 1 
end if 
if n=1 then 
response.write "留言簿管理界面" 
 
exit sub 
end if 
dim k 
response.write "<p align='left'>&gt;&gt; 留言分页 " 
for k=1 to n 
if k=currentPage then 
response.write "[<b>"+Cstr(k)+"</b>] " 
else 
response.write "[<b>"+"<a href='Manage_Book.asp?page="+cstr(k)+"'>"+Cstr(k)+"</a></b>] " 
end if 
next 
end sub 
%></div></td>
        </tr>
      </table> 
      <br>
      <br>
    </td>
  </tr>
</table>
<!-- #include file="Inc/Foot.asp" -->