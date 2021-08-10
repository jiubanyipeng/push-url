<%@ LANGUAGE="VBScript" %>
<!--#include file="admin.asp"-->
<!--#include file="conn.asp"-->
<%
dim SQL, Rs, contentID,CurrentPage
CurrentPage = request("Page")
contentID=request("ID")

set rs=server.createobject("adodb.recordset")
sqltext="delete from OrderList where Form_Id="& contentID
rs.open sqltext,conn,3,3
set rs=nothing

set rs=server.createobject("adodb.recordset")
sqltext="delete from ShopList where Form_Id="& contentID
rs.open sqltext,conn,3,3
set rs=nothing
conn.close

response.redirect "Manage_Eshop.asp?page="&CurrentPage
%>