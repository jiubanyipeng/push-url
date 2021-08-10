<!--#include file="Inc/syscode.asp" -->
<%
function cutstr(tempstr,tempwid)
if len(tempstr)>tempwid then
cutstr=left(tempstr,tempwid)&"..."
else
cutstr=tempstr
end if
end function%>
<!-- #include file="Inc/Head.asp" -->
<script language=JavaScript>
var version = "other"
browserName = navigator.appName;   
browserVer = parseInt(navigator.appVersion);

if (browserName == "Netscape" && browserVer >= 3) version = "n3";
else if (browserName == "Netscape" && browserVer < 3) version = "n2";
else if (browserName == "Microsoft Internet Explorer" && browserVer >= 4) version = "e4";
else if (browserName == "Microsoft Internet Explorer" && browserVer < 4) version = "e3";

function marquee1()
{
	if (version == "e4")
	{
		document.write("<marquee style='BOTTOM: 0px; FONT-WEIGHT: 100px; HEIGHT:110px; TEXT-ALIGN: left; TOP: 0px' id='news' scrollamount='1' scrolldelay='10' behavior='loop' direction='up' border='0' onmouseover='this.stop()' onmouseout='this.start()'>")
	}
}

function marquee2()
{
	if (version == "e4")
	{
		document.write("</marquee>")
	}
}

function marquee3()
{
	if (version == "e4")
	{
		document.write("<marquee style='BOTTOM: 0px; FONT-WEIGHT: 100px; HEIGHT:110px; TEXT-ALIGN: left; TOP: 0px' id='news' scrollamount='2' scrolldelay='10' behavior='loop' direction='left' border='0' onmouseover='this.stop()' onmouseout='this.start()'>")
	}
}


//-->
</script>

<TABLE width="760" border=0 align="center" cellPadding=0 cellSpacing=0 bgcolor="#FFFFFF">
  <TBODY>
    <TR> 
      <TD width=180 vAlign=top>
<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#CCDDEE">
              <tr>
            <td valign="top"> <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
                <TBODY>
                  <TR> 
                    <TD> </TD>
                  </TR>
                  <TR> 
                    <TD height="27"><img src="Img/login.gif" width="191" height="37"> 
                    </TD>
                  </TR>
                  <TR> 
                    <TD vAlign=top><table width="92%" border="0" align="center" cellpadding="0" cellspacing="0">
                        <tr> 
                          <td>
                            <% call ShowUserLogin() %>
                          </td>
                        </tr>
                      </table></TD>
                  </TR>
                </TBODY>
              </TABLE>
                  <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
                    <TBODY>
                      <TR> 
                        <TD> </TD>
                      </TR>
                      <TR> 
                        <TD height="27"><img src="Img/search.gif" width="191" height="37"> 
                        </TD>
                      </TR>
                      <TR> 
                        <TD vAlign=top><table width="88%" border="0" align="center" cellpadding="0" cellspacing="0">
                            <tr> 
                              <td> 
                                <% call ShowSearch(1) %>
                              </td>
                            </tr>
                          </table></TD>
                      </TR>
                    </TBODY>
                  </TABLE>
                  <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
                <TBODY>
                  <TR> 
                    <TD> </TD>
                  </TR>
                  <TR> 
                    <TD height="27"><img src="Img/product.gif" width="191" height="37"> 
                    </TD>
                  </TR>
                  <TR> 
                    <TD vAlign=top><table width="92%" border="0" align="center" cellpadding="0" cellspacing="0">
                        <tr>
                          <td><% call ShowSmallClass_Tree() %> </td>
                        </tr>
                      </table> </TD>
                  </TR>
                </TBODY>
              </TABLE> 
              <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
                <TBODY>
                  <TR> 
                    <TD height=15></TD>
                  </TR>
                  <TR> 
                    <TD> <TABLE cellSpacing=0 cellPadding=0 width="100%" 
border=0>
                        <TBODY>
                          <TR> 
                            <TD 
                            background=img/naB.gif><IMG 
                              height=1 src="img/1x1_pix.gif" 
width=10></TD>
                          </TR>
                          <TR> 
                            <TD> <TABLE cellSpacing=0 cellPadding=0 width="100%" 
                              border=0>
                                <TBODY>
                                  <TR> 
                                    <TD bgColor=#ffffff> <div align="right"><img src="Img/research.gif" width="191" height="37"></div></TD>
                                  </TR>
                                </TBODY>
                              </TABLE></TD>
                          </TR>
                          <TR> 
                            <TD height="2" 
                            background=img/naB.gif><IMG 
                              height=1 src="img/1x1_pix.gif" 
                          width=10></TD>
                          </TR>
                        </TBODY>
                      </TABLE></TD>
                  </TR>
                  <TR> 
                    <TD height="2"> </TD>
                  </TR>
                  <TR> 
                    <TD vAlign=top><table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
                        <tr>
                          <TD>
                            <% call ShowVote() %>
                          </TD>
                        </tr>
                      </table></TD>
                  </TR>
                  <TR> 
                        <TD height="6"> </TD>
                  </TR>
                  <TR> 
                    <TD 
                            height=2 colspan="2" 
                            background=img/naSzarym.gif><IMG height=1 src="img/1x1_pix.gif" 
                              width=10></TD>
                  </TR>
                </TBODY>
              </TABLE>
              
            </td>
          </tr>
        </table> </TD>
      <TD width=1 background=img/kropki_pion_naBialym.gif><IMG 
            height=2 src="img/1x1_pix.gif" width=1></TD>
      <TD vAlign=top><TABLE width="100%" border=0 cellPadding=0 cellSpacing=0>
          <TBODY>
            
            <TR>
                  <TD>&nbsp;</TD>
              <TD> <TABLE cellSpacing=0 cellPadding=0 width="555" border=0>
                        <TBODY>
                          <TR> 
                            <TD><table width="100%" border="0" cellpadding="0" cellspacing="0" background="img/buttonnewyh.gif">
                                <tr> 
                                  <%
Set rs = Server.CreateObject("ADODB.Recordset")
sql="select content from book order by ID desc"
rs.open sql,conn,1,1
%>
                                  <td width="22%" height="36">&nbsp;</td>
                                  <td width="78%"><marquee>
                                    <font color="#FFFFFF"><%=rs("content")%></font> </marquee> <%rs.close%> </td>
                                </tr>
                              </table></TD>
                          </TR>
                        </TBODY>
                      </TABLE></TD>
            </TR>
            <TR> 
              <TD></TD>
                  <TD><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr> 
                        <td height="21"> 　企业新闻&gt;&gt;</td>
                        <td>　业内资讯&gt;&gt;</td>
                      </tr>
                    </table>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr> 
                        <td width="50%" height="100" colspan="2"> 
                          <%
set rs_news=server.createobject("adodb.recordset")
sqltext4="select top 5 * from news where BigClassName='企业新闻' order by id desc"
rs_news.open sqltext4,conn,1,1
				
				 	
%>
                          <table width="100%" border="0" cellspacing="1" cellpadding="0">
                            <tr> 
                              <td width="7%" height="8"></td>
                              <td width="93%"></td>
                            </tr>
                            <%i=0
do while not rs_news.eof%>
                            <tr align="center"> 
                              <td><img src="Img/arrow_6.gif" width="11" height="11"> 
                              </td>
                              <td> <div align="left"> 
                                  <p style='line-height:150%'><a href="shownews.asp?id=<%=rs_news("id")%>" target="_blank"> 
                                    <%=cutstr(rs_news("title"),18)%></a><br>
                                </div></td>
                            </tr>
                            <%   rs_news.movenext
i=i+1
if i=5 then exit do
loop
rs_news.close %>
                            <tr> 
                              <td height="8"></td>
                              <td></td>
                            </tr>
                          </table></td>
                        <td width="50%" colspan="2"> 
                          <%
set rs_news=server.createobject("adodb.recordset")
sqltext4="select top 5 * from news where BigClassName='业内资讯' order by id desc"
rs_news.open sqltext4,conn,1,1
				
				 	
%>
                          <table width="100%" border="0" cellspacing="1" cellpadding="0">
                            <tr> 
                              <td width="6%" height="8"></td>
                              <td width="94%"></td>
                            </tr>
                            <%i=0
do while not rs_news.eof%>
                            <tr align="center"> 
                              <td><img src="Img/arrow_6.gif" width="11" height="11"> 
                              </td>
                              <td> <div align="left"> 
                                  <p style='line-height:150%'><a href="shownews.asp?id=<%=rs_news("id")%>" target="_blank"> 
                                    <%=cutstr(rs_news("title"),20)%></a> <br>
                                </div></td>
                            </tr>
                            <%   rs_news.movenext
i=i+1
if i=5 then exit do
loop
rs_news.close %>
                            <tr> 
                              <td height="8"></td>
                              <td></td>
                            </tr>
                          </table></td>
                      </tr>
                      <tr> 
                        <td colspan="2"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr> 
                              <td height="15"> <div align="right"><img src="Img/more_1.gif" width="85" height="27" border="0" usemap="#Map2Map"> 
                                  <map name="Map2Map">
                                    <area shape="rect" coords="21,15,71,25" href="otype.asp?owen1=企业新闻">
                                  </map>
                                </div></td>
                            </tr>
                          </table></td>
                        <td colspan="2"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr> 
                              <td><div align="right"><img src="Img/more_1.gif" width="85" height="27" border="0" usemap="#Map2"></div></td>
                            </tr>
                          </table></td>
                      </tr>
                    </table>
                    <map name="Map2">
                      <area shape="rect" coords="22,15,72,25" href="otype.asp?owen1=业内资讯">
                    </map></TD>
            </TR>
            <TR> 
              <TD>&nbsp;</TD>
              <TD>
<TABLE cellSpacing=0 cellPadding=0 width="555" border=0>
                  <TBODY>
                    <TR> 
                      <TD height="5"></TD>
                    </TR>
                    <TR> 
                      <TD height="13"><img src="Img/buttoncpseek.gif" width="557" height="36"></TD>
                    </TR>
                  </TBODY>
                </TABLE></TD>
            </TR>
            <TR> 
              <TD><IMG height=1 src="img/1x1_pix.gif" 
                width=10></TD>
              <TD background=img/naBialym.gif><IMG height=1 src="img/1x1_pix.gif" 
              width=10></TD>
            </TR>
			<%
 set rs_Product=server.createobject("adodb.recordset")
sqltext="select top 10 * from Product where Passed=True order by UpdateTime desc"
rs_Product.open sqltext,conn,1,1
%>
            <TR> 
              <TD>&nbsp;</TD>
              <TD> 
                 <script language=JavaScript>marquee3();</script> 
            <%
do while not rs_Product.eof
%>
            <a href="ArticleShow.asp?ArticleID=<%=rs_Product("ArticleID")%>" target="_blank"> 
            <img border="0" height="120" src="<%if rs_Product("DefaultPicUrl")="" then%>Img/nopic.gif<%else%><%=rs_Product("DefaultPicUrl")%><%end if%>" width="100" alt="<%=rs_Product("title")%>"></a>
            <% 			 
rs_Product.movenext 
loop                    
rs_Product.close     					      
%>
                </TD>
            </TR>
            <TR> 
              <TD><IMG height=1 src="img/1x1_pix.gif" 
                width=10></TD>
              <TD background=img/naBialym.gif><IMG height=1 src="img/1x1_pix.gif" 
              width=10></TD>
            </TR>
            <TR> 
              <TD>&nbsp;</TD>
              <TD>
<TABLE cellSpacing=0 cellPadding=0 width="555" border=0>
                  <TBODY>
                    <TR> 
                      <TD height="5"></TD>
                    </TR>
                    <TR> 
                      <TD height="13"><img src="Img/bgtop_2.gif" width="557" height="36"></TD>
                    </TR>
                  </TBODY>
                </TABLE></TD>
            </TR>
            <TR> 
              <TD><IMG height=1 src="img/1x1_pix.gif" 
                width=10></TD>
              <TD background=img/naBialym.gif><IMG height=1 src="img/1x1_pix.gif" 
              width=10></TD>
            </TR>
            <TR> 
              <TD>&nbsp;</TD>
              <TD valign="top"> 
                <%i=1 
set rs_Product=server.createobject("adodb.recordset")
sqltext="select top 7 * from Product where Passed=True And Elite=True order by UpdateTime desc"
rs_Product.open sqltext,conn,1,1
				
				 	
%> 
                <table width="100%" border="0" cellspacing="1" cellpadding="0">
                  <tr> 
                    <td></td>
                  </tr>
                  <tr align="center"> 
                    <td><table width="100%" border="0" cellpadding="1" cellspacing="1" class="blueout">
                            <tr bgcolor="#C0C0C0"> 
                              <td width="40%" height="29" bgcolor="#538CC6" > 
                                <div align="center"><font color="#FFFFFF">产品名称</font></div></td>
                              <td width="13%" bgcolor="#538CC6" > 
                                <div align="center"><font color="#FFFFFF">规格</font></div></td>
                              <td width="10%" bgcolor="#538CC6" > 
                                <div align="center"><font color="#FFFFFF">单位</font></div></td>
                              <td width="37%" bgcolor="#538CC6" > 
                                <div align="center"><font color="#FFFFFF">备注</font></div></td>
                            </tr>
                            <%
do while not rs_Product.eof
%>
                            <% if i mod 2 =0 then%>
                            <tr bgcolor="#E6E6E6"> 
					<% else %>
							<tr bgcolor="#ffffff"> 
					<% end if %>
                              <td height="22"><a href="ArticleShow.asp?ArticleID=<%=rs_Product("articleid")%>" target="_blank"><%=cutstr(rs_Product("Title"),15)%></a></td>
                              <td > 
                                <div align="center"><%=cutstr(rs_Product("Spec"),6)%></div></td>
                              <td> 
                                <div align="center"><%=rs_Product("Unit")%></div></td>
                              <td> <div align="left"><%=cutstr(rs_Product("Memo"),15)%></div></td>
                            </tr>
                            <% 
	i=i+1
   rs_Product.movenext 
loop 
%>
                          </table></td>
                    <%                   
rs_Product.close     					      
%>
                  </tr>
                  <tr> 
                    <td></td>
                  </tr>
                </table>
                <table>
                  <tr> 
                    <td width="591"><div align="right"><a href="Product.asp">更多产品&gt;&gt;&gt;</a></div></td>
                  </tr>
                </table>
                <div align="right"></div>
                
              </TD>
            </TR>
          </TBODY>
        </TABLE> </TD>
    </TR>
  </TBODY>
</TABLE>
<!-- #include file="Inc/Foot.asp" -->
<map name="Map">
  <area shape="rect" coords="18,14,69,24" href="News.asp">
</map>
</BODY></HTML>
