<!--#include file="inc/config.asp"-->
<!--#include file="inc/conn.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//Dtd XHTML 1.0 Transitional//EN" "http://www.w3.org/tr/xhtml1/Dtd/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>У԰���_<%=SiteName%>_У���ǿƼ�_Www.Xiao5u.Com</title>
<meta name="keywords" content="<%=keywords%>"/>
<meta name="description" content="<%=description%>"/>
<link href="images/Xiao5u.css" rel="stylesheet" type="text/css">
</head>
<body>
<table width="1000" border="0" bgcolor="#FFFFFF" align="center">
  <tr>
    <td>
<!--#include file="inc/top.asp"-->
<table width="1000" border="0" align="center" cellpadding="0" cellspacing="0" id="bor">
  <tr>
    <td valign="top"><table width="1000" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td width="132" height="33" align="center" background="images/center_01.jpg" class=whitetitle>У԰���</td>
        <td width="868" align="right" background="images/center_02.jpg"><img src="images/home.gif" width="16" height="16" align="absmiddle" />����ǰ��λ�ã�<a href="index.asp">��ҳ</a> &gt;&gt; У԰���</td>
        <td><img src="images/center_03.jpg" width="9" height="33" /></td>
      </tr>
    </table>
      <table width="1000" border="0" align="center" cellpadding="0" cellspacing="0" background="images/center_04.jpg">
        <tr>
          <td><table width="98%" border="0" cellspacing="0" cellpadding="5" align=center>
		  <tr>
	<%
	Set rsSchool=Server.CreateObject("Adodb.Recordset")
	rsSchool.open "select * from School order by id desc",conn,1,1
if rsSchool.eof and rsSchool.bof then
  response.Write("��ʱû��У԰���")
else 
rsSchool.PageSize=8
if page=0 then page=1 
pages=rsSchool.pagecount
if page > pages then page=pages
rsSchool.AbsolutePage=page  
for j=1 to rsSchool.PageSize 
	%>
		<td align="center"><a href="SchoolView.asp?id=<%=rsSchool("id")%>"  target="_blank"><img src="<%=rsSchool("pic")%>" alt="<%=rsSchool("title")%>" width="200" height="150" border="0" /></a><br>
          <br><a href="SchoolView.asp?id=<%=rsSchool("id")%>" class="style01"  target="_blank"><%=left(rsSchool("title"),16)%></a></td>
<%
if (j mod 4)=0 Then       
  response.write "</tr><tr>"
end if
rsSchool.movenext
if rsSchool.eof then exit for
next
%>
          </tr>
          <tr><td height="20" align="center" colspan="4">
<%if Page<2 then      
    response.write "��ҳ ��һҳ&nbsp;"
  else
    response.write "<a href=School.asp?page=1>��ҳ</a>&nbsp;"
    response.write "<a href=School.asp?page=" & Page-1 & ">��һҳ</a>&nbsp;"
  end if
   response.write "&nbsp;�� <font color=red>"&Page&"</font> ҳ "
  if rsSchool.pagecount-page<1 then
    response.write "��һҳ ĩҳ "
  else
    response.write "<a href=School.asp?page=" & (page+1) & ">"
    response.write "��һҳ</a> <a href=School.asp?page="&rsSchool.pagecount&">ĩҳ </a>"
  end if
    response.write "&nbsp;�� <font color=red>"&rsSchool.pagecount&"</font> ҳ <b><font color=red>"&rsSchool.recordcount&"</font></b>��"    
%>
</td></tr>
<% 
end if
rsSchool.close
set rsSchool=nothing
%>
        </table>
        </td>
        </tr>
        <tr>
          <td><img src="images/center_05.jpg" width="1000" height="6" /></td>
        </tr>
      </table></td>
  </tr>
</table>
<!--#include file="inc/bottom.asp"-->
	</td>
  </tr>
</table>
</body>
</html>