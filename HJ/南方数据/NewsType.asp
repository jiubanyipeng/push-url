javastr=""
javastr=javastr+"<table width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">"
<!--#include file="Inc/conn.asp"-->

<%
function cutstr(tempstr,tempwid)
if len(tempstr)>tempwid then
cutstr=left(tempstr,tempwid)&"..."
else
cutstr=tempstr
end if
end function%>

<%
ClassType=request("ClassType")
BigClass=request("BigClass")
SmallClass=request("SmallClass")
n=request("n")
L=request("L")
if n="" then
n=100
end if
if l="" then
l=100
end if
%>
<%
if BigClass<>"" and SmallClass<>"" then
sql="select  * from News where BigClassName='"& BigClass &"' and  SmallClassName='"& SmallClass &"' order by AddDate desc"
set rs=conn.execute(sql)
do while not rs.eof 
%>
javastr=javastr+"<tr> <td width='6%'>&nbsp;<img src='Img/arrow_6.gif' width='11' height='11'></td><td width='65%' height=\"24\" style=\"BORDER-bottom: #999999 1px dotted\">"
javastr=javastr+"<span style=\"font-size:9pt;line-height:15pt\"><% if rs("FirstImageName")<>"" then response.write "<img src='images/news.gif' border=0 alt='图片新闻'>" end if %><a href=\"shownews.asp?id=<%=rs("id")%>\" title=\"<%=rs("title")%>\" target=\"_blank\"><%=rs("title")%></a></span> "
javastr=javastr+"<td style=\"BORDER-bottom: #999999 1px dotted\"><font color=\"#999999\" >[<%=FormatDateTime(rs("AddDate"),2)%>]</font> <font color=\"#999999\" >(点击<font color=\"#FF0000\" ><%=rs("hits")%></font>)"
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
ElseIf SmallClass<> "" then
sql="select  * from News where SmallClassName='"& SmallClass &"' order by AddDate desc"
set rs=conn.execute(sql) 
do while not rs.eof 
%>
javastr=javastr+"<tr> <td width='6%'>&nbsp;<img src='Img/arrow_6.gif' width='11' height='11'></td><td width='65%' height=\"24\" style=\"BORDER-bottom: #999999 1px dotted\">"
javastr=javastr+"<span style=\&quot;font-size:9pt;line-height:15pt\"><% if rs("FirstImageName")<>"" then response.write "<img src='images/news.gif' border=0 alt='图片新闻'>" end if %><a href=\"shownews.asp?id=<%=rs("id")%>\" title=\"<%=rs("title")%>\" target=\"_blank\"><%=rs("title")%></a></span> "
javastr=javastr+"<td style=\"BORDER-bottom: #999999 1px dotted\"><font color=\"#999999\" >[<%=FormatDateTime(rs("AddDate"),2)%>]</font> <font color=\"#999999\" >(点击<font color=\"#FF0000\" ><%=rs("hits")%></font>)"
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
ElseIf  BigClass<>"" then
sql="select  * from News where BigClassName='"& BigClass &"' order by AddDate desc"
set rs=conn.execute(sql) 
do while not rs.eof 
%>
javastr=javastr+"<tr> <td width='6%'>&nbsp;<img src='Img/arrow_6.gif' width='11' height='11'></td><td width='65%' height=\"24\" style=\"BORDER-bottom: #999999 1px dotted\">"
javastr=javastr+"<span style=\&quot;font-size:9pt;line-height:15pt\"><% if rs("FirstImageName")<>"" then response.write "<img src='images/news.gif' border=0 alt='图片新闻'>" end if %><a href=\"shownews.asp?id=<%=rs("id")%>\" title=\"<%=rs("title")%>\" target=\"_blank\"><%=rs("title")%></a></span> "
javastr=javastr+"<td style=\"BORDER-bottom: #999999 1px dotted\"><font color=\"#999999\" >[<%=FormatDateTime(rs("AddDate"),2)%>]</font> <font color=\"#999999\" >(点击<font color=\"#FF0000\" ><%=rs("hits")%></font>)"
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
if BigClass= "" and SmallClass= "" then
sql="select * from News order by AddDate desc"
set rs=conn.execute(sql)
do while not rs.eof 
%>
javastr=javastr+"<tr> <td width='6%'>&nbsp;<img src='Img/arrow_6.gif' width='11' height='11'></td><td width='65%' height=\"24\" style=\"BORDER-bottom: #999999 1px dotted\">"
javastr=javastr+"<span style=\&quot;font-size:9pt;line-height:15pt\"><% if rs("FirstImageName")<>"" then response.write "<img src='images/news.gif' border=0 alt='图片新闻'>" end if %><a href=\"shownews.asp?id=<%=rs("id")%>\" title=\"<%=rs("title")%>\" target=\"_blank\"><%=rs("title")%></a></span> "
javastr=javastr+"<td style=\"BORDER-bottom: #999999 1px dotted\"><font color=\"#999999\" >[<%=FormatDateTime(rs("AddDate"),2)%>]</font> <font color=\"#999999\" >(点击<font color=\"#FF0000\" ><%=rs("hits")%></font>)"
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
