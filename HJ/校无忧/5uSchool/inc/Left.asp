<table width="100%" border="0" cellpadding="0" cellspacing="0" background="images/left_02.jpg">
  <tr>
    <td height="33" background="images/left_01.jpg"><span id=lefttitle>走进校园</span></td>
  </tr>
  <tr>
    <td>
	<div>
      <ul id="plist4">
	  <%
	   Set rsAbout=Server.CreateObject("Adodb.Recordset")
	   rsAbout.open "select * from About",conn,1,3
	   do while not rsAbout.eof
	  %>
	    <li><a href="About.asp?id=<%=rsAbout("id")%>"><%=rsAbout("title")%></a></li>
	  <%
	   rsAbout.movenext
	   loop
	   rsAbout.close
       set rsAbout=nothing
       %>
       </ul>
    </div></td>
  </tr>
  <tr>
    <td><img src="images/left_03.jpg" width="233" height="6" /></td>
  </tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="5">
  <tr>
    <td align="center"><a href="contact.asp"><img src="images/about_03.jpg" alt="校无忧学校网站联系我们"  border=0 /></a></td>
  </tr>
</table>