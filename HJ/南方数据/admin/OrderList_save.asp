<%@ language="VBScript"%>
<!--#include file="admin.asp"-->
<!--#include file="conn.asp"-->
<%
djfc="�Ѿ�����"
set rs=server.createobject("adodb.recordset")
sqltext="select Flag from OrderList where Form_Id=" & request("Form_Id")
rs.open sqltext,conn,1,1
if rs("Flag")="�Ѿ�����" then
rs.close
Response.Redirect "OrderList_Save.asp?msg=�˶��������Ѿ������˷�������"
Else
set rs=server.createobject("adodb.recordset")
sqltext="update OrderList set Flag='"&djfc&"' where Form_Id=" & request("Form_Id")
rs.open sqltext,conn,3,3
response.redirect "OrderMessageBox.asp?msg=��������������ϣ��밴�ͻ���ϸ��ַ������"
end if
%>