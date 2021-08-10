<table width="1000" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td background="images/top_02.jpg"><img border="0" src="images/logo.jpg" width="1000" height="170" /></td>
  </tr>
</table>
<table width="1000" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><div id="menu">
      <ul>
<%
Set rsMenu=Server.CreateObject("Adodb.Recordset")
rsMenu.open "select top 10 * from SClass where tid=0 and IsMenu=1 order by pid asc",conn,1,3
do while not rsMenu.eof
%>
        <li>
		<%if rsMenu("yn")=2 then
		response.write"<a href=""Sort.asp?id="&rsMenu("id")&""">"&rsMenu("cname")&"</a>"
		elseif rsMenu("yn")=1 then
		response.write"<a href=""About.asp?id="&rsMenu("id")&""">"&rsMenu("cname")&"</a>"
		else
		response.write"<a href="""&rsMenu("content")&""">"&rsMenu("cname")&"</a>"
		end if%></li>
<%
rsMenu.movenext
loop
rsMenu.close
set rsMenu=nothing
%>
      </ul>
    </div> 
	</td>
  </tr>
</table>
<table width="1000" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#DDECCD">
  <tr align="center" height="25">
    <td><SCRIPT language=javascript src="images/date.js" type=text/javascript></SCRIPT></td>
    <td width="400"><font color=#339900>欢迎访问校无忧学校网站系统!技术支持：www.xiao5u.com</font></td>
	<form id="form1" name="form1" method="post" action="search.asp">
    <td width="350" valign="bottom">
	站内搜索：<input name="keyword" type="text" id="keyword" /> 
    <input name="image" type="image" src="images/search.jpg" align="middle" />
	</td>
	</form>
  </tr>
</table>