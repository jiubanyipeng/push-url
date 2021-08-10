<%@language=vbscript codepage=936 %>
<!--#include file="Admin.asp"-->
<!--#include file="Conn.asp"-->
<%
dim UserID,sql,rs
UserID=trim(Request("UserID"))
if UserID<>"" then
	sql="delete from [User] where UserID=" & Clng(UserID)
	conn.Execute sql
end if
call CloseConn()      
response.redirect "UserManage.asp"
%>