<!--#include file="Inc/conn.asp"-->
<%dim id
id=request.QueryString("id")%>
<html>
<head>
<title>ͼƬ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<%
set rs=server.CreateObject("adodb.recordset")
rs.open "select * from CompVisualize where id="&id,conn,1,1
%>
<%if trim(rs("CompVisualize"))<>"" then
	  response.write "<div align='center'><img src="&trim(rs("CompVisualize"))&" border=0 ></div>"
else
	  response.Write "<img src=img/nopic.jpg width=65 height=96 alt=��ʱû��ͼƬ��>"
end if%>
<div align="center"><BR>
  <%=trim(rs("Explain"))%><BR>
</div>
<%
rs.close
set rs=nothing
%>
</body>
</html>
