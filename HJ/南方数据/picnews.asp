<!--#include file="conn.asp"-->
<html>
<head>
<title>ͼƬ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" type="text/css" href="css.css">
</head>

<body>
<%
sql="select top 1 * from NEWS where firstImageName<>'' and ok=true order by ID DESC"
set rs=conn.execute(sql)
if not Rs.eof then
%>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr> 
    <td align="center"><a href="onews.asp?id=<%=rs("id")%>" target="_blank" ><img src="uppic/<%=trim(rs("firstImageName"))%>" width="150" height="180" border="0"></a></td>
  </tr>
  <tr> 
    <td height="25" align="center"><a href="onews.asp?id=<%=rs("id")%>" target="_blank" ><%=left(rs("title"),12)%></a></td>
  </tr>
</table>
<%
else 
response.write "<tr><td align=center colspan=2 bgcolor=#E8E8F4>������¼</td></tr>" 
end if 
rs.close 
set conn=nothing
%>
</body>
</html>
