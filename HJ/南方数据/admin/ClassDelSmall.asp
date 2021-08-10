<%@language=vbscript codepage=936 %>
<!--#include file="Admin.asp"-->
<!--#include file="Conn.asp"-->
<%
dim SmallClassID,sql
SmallClassID=trim(Request("SmallClassID"))
if SmallClassID<>"" then
	sql="delete from SmallClass where SmallClassID="&Cint(SmallClassID)&""
	conn.Execute sql
end if
call CloseConn()      
response.redirect "ClassManage.asp"
%>


