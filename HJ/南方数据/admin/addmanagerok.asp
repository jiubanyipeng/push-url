<%@ language="VBScript"%>
<%response.Expires = 0%>
<!--#include file="Conn.asp"-->
<!--#include file="inc/md5.asp"-->
<%
password=replace(trim(Request("pwd1")),"'","")
password=md5(password)
set rs=server.createobject("adodb.recordset")
sqltext="select * from Manage_User where UserName='" & request.form("uid") & "' and PassWord='" & password & "'"
rs.open sqltext,conn,1,1

'�������ݿ⣬���˹���Ա�Ƿ��Ѿ�����
if rs.recordcount >= 1 then
if rs("UserName")=request.form("uid") then
Response.Redirect "Loginsb.asp?msg=�˹���Ա�ʺ��Ѿ����ڣ���ѡ����������!"
response.end
rs.close
end if
end if


set rs=server.createobject("adodb.recordset")
sqltext="select * from Manage_User"
rs.open sqltext,conn,3,3

'���һ������Ա�ʺŵ����ݿ�
rs.addnew
rs("UserName")=request.form("uid")
rs("PassWord")=password
rs.update
Response.Redirect "Manage_Admin.asp"

%>