javastr=""
javastr=javastr+"<table width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">"
<!--#include file="Inc/conn.asp"-->
<%
owen=request("owen")
owen1=request("owen1")
owen2=request("owen2")
n=request("n")
if n="" then
n=100
end if%>

<%
if owen1<>"" and owen2<>"" then
sql="select  * from NEWS where BigClassName='"& owen1 &"' and  SmallClassName='"& owen2 &"' order by id desc"
set rs=conn.execute(sql)
do while not rs.eof 
%>
javastr=javastr+"<tr><td height=\"24\" style=\"BORDER-bottom: #999999 1px dotted\">"
javastr=javastr+"<img src='Img/dot.gif' width='7' height='11'>&nbsp;<span style=\"font-size:9pt;line-height:15pt\"><% if rs("imagenum")<>"0" then response.write "<img src='images/news.gif' border=0 alt='ͼƬ����'>" end if %><a href=\"shownews.asp?id=<%=rs("id")%>\" title=\"<%=rs("title")%>\" target=\"_blank\"><%=left(rs("title"),12)%></a></span> <font color=\"#999999\" >[<%=rs("infotime")%>]</font> <font color=\"#999999\" >(�Ķ�<font color=\"#FF0000\" ><%=rs("hits")%></font>��)</font>"
javastr=javastr+"</td></tr>"
<%n=n-1
if n<1 then exit do
rs.movenext 
loop
%>
javastr=javastr+"</table>" 
<%
rs.close   
set rs=nothing   
%>
document.write (javastr) 

<%
ElseIf owen2<> "" then
sql="select  * from NEWS where SmallClassName='"& owen2 &"' order by id desc"
set rs=conn.execute(sql) 
do while not rs.eof 
%>
javastr=javastr+"<tr>
  <td height=\"24\" style=\"BORDER-bottom: #999999 1px dotted\">" javastr=javastr+"<img src='Img/dot.gif' width='7' height='11'>&nbsp;<span style=\&quot;font-size:9pt;line-height:15pt\">
<% if rs("imagenum")<>"0" then response.write "<img src='images/news.gif' border=0 alt='ͼƬ����'>" end if %><a href=\"shownews.asp?id=<%=rs("id")%>\" title=\"<%=rs("title")%>\" target=\"_blank\"><%=left(rs("title"),12)%></a></span> <font color=\"#999999\" >[<%=rs("infotime")%>]</font> <font color=\"#999999\" >(�Ķ�<font color=\"#FF0000\" ><%=rs("hits")%></font>��)</font>"
javastr=javastr+"</td></tr>"
<%n=n-1
if n<1 then exit do
rs.movenext 
loop
%>
javastr=javastr+"</table>" 
<%
rs.close   
set rs=nothing   
%>
document.write (javastr) 

<%
ElseIf  owen1<>"" then
sql="select  * from NEWS where BigClassName='"& owen1 &"' order by id desc"
set rs=conn.execute(sql) 
do while not rs.eof 
%>
javastr=javastr+"<tr><td height=\"24\" style=\"BORDER-bottom: #999999 1px dotted\">"
javastr=javastr+"<img src='Img/dot.gif' width='7' height='11'>&nbsp;<span style=\&quot;font-size:9pt;line-height:15pt\"><% if rs("imagenum")<>"0" then response.write "<img src='images/news.gif' border=0 alt='ͼƬ����'>" end if %><a href=\"shownews.asp?id=<%=rs("id")%>\" title=\"<%=rs("title")%>\" target=\"_blank\"><%=rs("title")%></a></span> <font color=\"#999999\" >[<%=rs("infotime")%>]</font> <font color=\"#999999\" >(�Ķ�<font color=\"#FF0000\" ><%=rs("hits")%></font>��)</font>"
javastr=javastr+"</td></tr>"
<%n=n-1
if n<1 then exit do
rs.movenext 
loop
%>
javastr=javastr+"</table>" 
<%
rs.close   
set rs=nothing   
%>
document.write (javastr) 
<% End If %>

<% 
if owen1= "" and owen2= "" then
sql="select * from NEWS order by id desc"
set rs=conn.execute(sql)
do while not rs.eof 
%>
javastr=javastr+"<tr><td height=\"24\" style=\"BORDER-bottom: #999999 1px dotted\">"
javastr=javastr+"<img src='Img/dot.gif' width='7' height='11'>&nbsp;<span style=\&quot;font-size:9pt;line-height:15pt\"><% if rs("imagenum")<>"0" then response.write "<img src='images/news.gif' border=0 alt='ͼƬ����'>" end if %><a href=\"shownews.asp?id=<%=rs("id")%>\" title=\"<%=rs("title")%>\" target=\"_blank\"><%=left(rs("title"),12)%></a></span> <font color=\"#999999\" >[<%=rs("infotime")%>]</font> <font color=\"#999999\" >(�Ķ�<font color=\"#FF0000\" ><%=rs("hits")%></font>��)</font>"
javastr=javastr+"</td></tr>"
<%n=n-1
if n<1 then exit do
rs.movenext 
loop
%>
javastr=javastr+"</table>" 
<%rs.close   
set rs=nothing   
conn.close   
set conn=nothing%>
document.write (javastr) 
<%end if%>
