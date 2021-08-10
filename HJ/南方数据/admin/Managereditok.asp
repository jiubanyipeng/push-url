<%@ language="VBScript"%>
<%response.Expires = 0%>

<!--#include file="conn.asp"-->
<!--#include file="inc/md5.asp"-->
<%
set rs=server.createobject("adodb.recordset")
sqltext="select * from Manage_User where Id=" & request.querystring("uid")
rs.open sqltext,conn,3,3

'更新管理员密码到数据库
rs("UserName")=request.form("uid")
rs("PassWord")=md5(request.form("pwd1"))
rs.update
rs.close
conn.close
response.redirect "Manage_Admin.asp"
%>