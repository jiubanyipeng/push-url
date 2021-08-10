<%@ LANGUAGE="VBScript" %>
<!--#include file="admin.asp"-->
<!--#include file="conn.asp"-->
<%
dim SQL, Rs, contentID,CurrentPage
CurrentPage = request("Page")
contentID=request("ID")

set rs=server.createobject("adodb.recordset")
sqltext="delete from Manage_User where Id="& contentID
rs.open sqltext,conn,3,3
set rs=nothing
response.redirect "Manage_Admin.asp"
%>