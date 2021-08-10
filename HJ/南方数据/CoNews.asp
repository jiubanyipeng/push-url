<!--#include file="Inc/SysProduct.asp" -->
<!--#include file="inc/Skin_css.asp"-->
<!-- #include file="Head.asp" -->
<table width="760" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="5" valign="top" bgcolor="#FFFFFF"></td>
  </tr>
  <tr> 
    <td height="72" valign="top" bgcolor="#FFFFFF"><table width="746" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr> 
          <td class="tdbg_left"  width="190" height="179" valign="top" > <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="34" class="title_left">&nbsp;&nbsp;&nbsp;<img src="Images/smallbook.jpg" width="10" height="10">&nbsp;&nbsp;用户登陆 
                </td>
              </tr>
              <tr> 
                <td height="5"></td>
              </tr>
              <tr> 
                <td height="10"><table width="92%" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td> 
                        <% call ShowUserLogin() %>
                      </td>
                    </tr>
                  </table></td>
              </tr>
              <tr> 
                <td height="5"></td>
              </tr>
            </table>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
              <tr> 
                <td height="34" class="title_left">&nbsp;&nbsp;&nbsp;<img src="Images/smallbook.jpg" width="10" height="10">&nbsp;&nbsp;新闻资讯</td>
              </tr>
<%
Set rslist = Server.CreateObject("ADODB.Recordset")
sql="select BigClassName from BigClass_New order by BigClassID"
rslist.open sql,conn,1,3
do while not rslist.eof
%>
              <tr> 
                <td height="20"> <div align="center"><a href="NewsClass.asp?BigClass=<%=rslist("BigClassName")%>"><%=rslist("BigClassName")%></a></div></td>
              </tr>
              <TR> 
                <TD 
                            height=1 colspan="2" 
                            background=img/naSzarym.gif><IMG height=1 src="img/1x1_pix.gif" 
                              width=10></TD>
              </TR>
<%rslist.movenext 
loop
rslist.close
set rslist=nothing
%>
            </table></td>
          <td width="6"></td>
          <td valign="top"><table Class=border width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
              <tr> 
                <td height="206" valign="top"> <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td class="
title_right" height="32">&nbsp;&nbsp;&nbsp;<img src="Images/smallbook.jpg" width="10" height="10">&nbsp;新 
                        闻 资 讯</td>
                    </tr>
					            <TR> 
              <TD    
                  height=1> 
				  
<%
Set RsNews = Server.CreateObject("ADODB.Recordset")
sql="select BigClassName from BigClass_New order by BigClassID"
RsNews.open sql,conn,1,3
do while not RsNews.eof
%>

 <table width="100%" height="19" border="0" align="center" cellpadding="0" cellspacing="0">
                  <tr> 
                            <td width="21%" height="18" bgcolor="#eeeeee">&nbsp;&nbsp;首页 
                              &gt;&gt; <%=RsNews("BigClassName")%></td>
                        <td width="79%" bgcolor="#eeeeee">&nbsp; </td>
                  </tr>
                  <tr> 
                    <td height="1" colspan="2" bgcolor="#999999"></td>
                  </tr>
                </table>
                <table width="100%" border="0" align="center" cellpadding="0" cellspacing="3" bgcolor="#FBFEFF">
                  <tr> 
                    <td height="8"></td>
                  </tr>
                 
                  <tr> 
                            <td> <table width="100%" border="0" cellspacing="0" cellpadding="0"><%
BigClass=RsNews("BigClassName")
n=6
If  BigClass<>"" then
sql="select top 8 * from News where BigClassName='"& BigClass &"' order by AddDate desc"
set rs=conn.execute(sql) 
do while not rs.eof 
%>

                               <tr> 
                      <td width="6%" height="24" align="center" ><img src="Img/arrow_6.gif" width="11" height="11"></td>
                      <td width="65%" height="24" style="BORDER-bottom: #999999 1px dotted"> 
                        <% if rs("FirstImageName")<>"" then response.write "<img src='images/news.gif' border=0 alt='图片新闻'>" end if %> <a href="shownews.asp?id=<%= RS("id") %>&BigClass=<%=RS("BigClassName")%>" target="_blank"><%= RS("TITLE") %></a>　</td>
                      <td width="29%" style="BORDER-bottom: #999999 1px dotted"><font color="#999999">[<%=FormatDateTime(RS("AddDate"),2)%>] (点击<font color="#ff0000"><%= RS("hits") %></font>) </font>
					  
<%
n=n-1
if n<1 then exit do
rs.movenext 
loop
rs.close   
set rs=nothing   
%>
<% End If %></td>
                    </tr>
                              </table> </td>
                  </tr>             

                  <tr> 
                    <td height="8"><div align="right"><a href="NewsClass.asp?BigClass=<%=RsNews("BigClassName")%>">更多>>></a></div></td>
                  </tr>
                </table>
<%RsNews.movenext 
loop
RsNews.close
set RsNews=nothing
%>                        
                      </TD>
            </TR>
                  </table>
                  
                </td>
              </tr>
			  
            </table></td>
        </tr>
      </table></td>
  </tr>
</table>
<!-- #include file="Inc/Foot.asp" -->
</BODY></HTML>
