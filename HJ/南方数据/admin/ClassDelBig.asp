<%@language=vbscript codepage=936 %>
<!--#include file="Admin.asp"-->
<!--#include file="Conn.asp"-->
<%
dim BigClassName,sql
BigClassName=trim(Request("BigClassName"))
if BigClassName<>"" then
	sql="delete from BigClass where BigClassName='" & BigClassName & "'"
	conn.Execute sql
	sql="delete from SmallClass where BigClassName='" & BigClassName & "'"
	conn.Execute sql
end if
call CloseConn()      
response.redirect "ClassManage.asp"
%>


