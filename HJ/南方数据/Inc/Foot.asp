<TABLE width="760" border=0 align="center" cellPadding=0 cellSpacing=0 bgcolor="#FFFFFF">
  <TBODY>
    <TR> 
      <TD background=img/naBialym.gif><IMG height=1 
            src="img/1x1_pix.gif" width=10></TD>
    </TR>
    <TR> 
      <TD vAlign=top> <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
          <TBODY>
            <TR> 
              <TD colspan="2"><IMG height=5 src="img/1x1_pix.gif" width=10></TD>
            </TR>
            <TR> 
              <TD width="16%" height=20 bgColor=#f2f2f2> <DIV align=center>相关链接</DIV></TD>
              <TD width="84%" bgColor=#f2f2f2><%
set rs_links=server.createobject("adodb.recordset")
sqltext4="select top 10 * from links order by id desc"
rs_links.open sqltext4,conn,1,1 	

i=0							
do while not rs_links.eof%>
  <a href="<%=rs_links("link")%>" title="<%=rs_links("note")%>"target="_blank"><%=rs_links("name")%></a>                            
   <%rs_links.movenext
   i=i+1
   if i=10 then exit do
loop
rs_links.close %>

</TD>
            </TR>
            
          </TBODY>
        </TABLE></TD>
    </TR>
    <TR> 
      <TD background=img/naBialym.gif><IMG height=1 
            src="img/1x1_pix.gif" width=10></TD>
    </TR>
    <TR> 
      <TD> 
        <DIV align=center> 
          <p>版权所有 2001-2004 <a href="http://www.southidc.net" target="_blank">南方数据</a> 
            <a href="http://www.0791idc.com">www.0791idc.com</a><br>
            总公司地址:江西省南昌市省府大院西二路监察大楼 邮编:330046 <br>
            销售热线:0791-6274752,8059439 技术支持:0791-6274752,13065161861<br>
            销售在线服务: MSN:<a href="mailto:jxhwq@hotmail.com">jxhwq@hotmail.com</a> 
            QQ:635495 QQ:65427071 代理服务: mail:<a href="mailto:hdz2008@163.com">hdz2008@163.com</a> 
            QQ:635495<br>
            在线技术支持：MSN:<a href="mailto:jxhwq@hotmail.com">jxhwq@hotmail.com</a> 
            QQ:635495&nbsp; </p>
        </DIV></TD>
    </TR>
  </TBODY>
</TABLE>