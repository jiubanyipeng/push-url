<!--#include file="Conn.asp"-->
<%
sql="delete * from download where id="&request.QueryString("id")
conn.Execute sql
response.write "<script language='javascript'>" & chr(13)
		response.write "alert('�ɹ�ɾ����');" & Chr(13)		
		response.write "</script>" & Chr(13)
		response.redirect "Down_Manage.asp"
Response.End
%>
