<%@ LANGUAGE="VBScript" %>
<!--#include file="admin.asp"-->
<!--#include file="conn.asp"-->
<%


dim sql
dim rs
on error resume next

set rs=server.createobject("adodb.recordset")
sql="delete from book where ID="&request("id")
rs.open sql,conn,1,1
set rs=nothing
conn.close
set conn=nothing
response.redirect "Manage_Book.asp"
%>