<!--#include file="inc_show.asp"-->
<%
Response.Write replace(Style_Header2,"$Title",Site_Name & "-" & Lang_Me)
%>
<frameset frameborder="NO" border="0" framespacing="0" rows="*"> 
  <frameset cols="170,*" frameborder="NO" border="0" framespacing="0"> 
  <frame name="countleft" scrolling="auto" noresize src="show_left.asp?siteid=<%=siteid%>">
  <frame name="ajstatmain<%=CFG_cachename%>" src="show_main.asp?siteid=<%=siteid%>">
  </frameset>
</frameset>
<noframes>
<body>
<a href="main.asp">no frames</a>

</body>
</noframes> 
</html>