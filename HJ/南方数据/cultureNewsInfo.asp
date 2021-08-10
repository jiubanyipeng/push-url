<!--#include file="Inc/syscode.asp"-->
<!-- #include file="Inc/Head.asp" -->
<SCRIPT language=JavaScript>
var currentpos,timer; 
function initializeScroll() { timer=setInterval("scrollwindow()",80);} 
function scrollclear(){clearInterval(timer);}
function scrollwindow() {currentpos=document.body.scrollTop;window.scroll(0,++currentpos);if (currentpos != document.body.scrollTop) sc();} 
document.onmousedown=scrollclear
document.ondblclick=initializeScroll
</SCRIPT>
<SCRIPT language=javascript>
function ContentSize(size)
{
	var obj=document.all.BodyLabel;
	obj.style.fontSize=size+"px";
}
</SCRIPT>
<TABLE width="760" border=0 align="center" cellPadding=0 cellSpacing=0 bgcolor="#FFFFFF">
  <TBODY>
    <TR> 
      <TD width=196 vAlign=top bgcolor="#FFFFFF"> 
        <table width="92%" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
          <tr> 
            <td valign="top"><TABLE width="100%" border=0 cellPadding=0 cellSpacing=0 background="Img/index_01b.gif">
                <TBODY>
                  <TR> 
                    <TD height=5 bgcolor="#FFFFFF"></TD>
                  </TR>
                  <TR> 
                    <TD height="35" background="Img/index_01.gif"> 
                      <div align="center">会员登陆 
                      </div></TD>
                  </TR>
                  <TR> 
                    <TD height="5"> </TD>
                  </TR>
                  <TR> 
                    <TD vAlign=top><table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
                        <tr> 
                          <td> 
                            <% call ShowUserLogin() %>
                          </td>
                        </tr>
                      </table></TD>
                  </TR>
                  <TR> 
                    <TD height="5"> </TD>
                  </TR>
                  <TR> 
                    <TD 
                            height=1 colspan="2" 
                            background=img/naSzarym.gif><IMG height=1 src="img/1x1_pix.gif" 
                              width=10></TD>
                  </TR>
                </TBODY>
              </TABLE>
              
            </td>
          </tr>
        </table>
      </TD>
      <TD width=1 background=img/kropki_pion_naBialym.gif><IMG 
            height=2 src="img/1x1_pix.gif" width=1></TD>
      <TD vAlign=top> <TABLE width="90%" border=0 align="right" cellPadding=0 cellSpacing=0>
          <TBODY>
            <TR> 
              <TD 
                  height=1 background=img/naBialym.gif><IMG height=1 src="img/1x1_pix.gif" 
              width=10></TD>
            </TR>
            <TR> 
              <TD> <TABLE cellSpacing=0 cellPadding=0 width="555" border=0>
                  <TBODY>
                    <TR> 
                      <TD height="25"><img src="Img/buttonnewyh.gif" width="557" height="37"></TD>
                    </TR>
                  </TBODY>
                </TABLE></TD>
            </TR>
            <TR> 
              <TD 
                  height=1 background=img/naBialym.gif><IMG height=1 src="img/1x1_pix.gif" 
              width=10></TD>
            </TR>
            <TR> 
              <TD 
                  height=1> <%
if not isEmpty(request.QueryString("id")) then
id=request.QueryString("id")
else
id=1
end if

Set rs = Server.CreateObject("ADODB.Recordset")
rs.Open "Select * From culture where id="&id, conn,3,3
'纪录访问次数
rs("counter")=rs("counter")+1
rs.update
nCounter=rs("counter")
'定义内容
content=ubbcode(rs("content"))
%> <table width="100%" height="19" border="0" align="center" cellpadding="0" cellspacing="0">
                  <tr> 
                    <td width="57%" height="22" bgcolor="#FDFFFB">&nbsp;首页》企业文化 
                      》正文<strong> </strong></td>
                    <td width="43%" bgcolor="#FDFFFB"><div align="right"></div></td>
                  </tr>
                  <tr> 
                    <td height="1" colspan="2" bgcolor="#CCCCCC"></td>
                  </tr>
                </table>
                <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FDFFFB">
                  <tr> 
                    <td><table width="95%" border="0" align="center" cellpadding="0" cellspacing="5">
                        <tr> 
                          <td height="5"></td>
                        </tr>
                        <tr> 
                          <td><div align="center"><span class="biaoti"><strong><%=rs("title")%></strong></span><br>
                              <br>
                              发布日期：[<%=rs("time")%>]&nbsp;&nbsp;&nbsp; 共阅[<%=rs("counter")%>]次</div></td>
                        </tr>
                        <tr> 
                          <td height="5"></td>
                        </tr>
                        <tr> 
                          <td height="19"> <p style='line-height:150%'> <span class="zhiwen"><%=content%></span> 
                              <%rs.close%>
                              </td>
                        </tr>
                        <tr> 
                          <td>&nbsp;</td>
                        </tr>
                      </table></td>
                  </tr>
                </table>
                <table width="100%" height="19" border="0" align="center" cellpadding="0" cellspacing="0">
                  <tr> 
                    <td height="1" colspan="2" bgcolor="#CCCCCC"></td>
                  </tr>
                  <tr> 
                    <td width="31%" height="22" bgcolor="#FDFFFB"> <div align="right"></div></td>
                    <td width="69%" bgcolor="#FDFFFB"><div align="right">【<a href='javascript:window.print()'>打印此页</a>】&nbsp;【<a href='javascript:history.back()'>返回</a>】【<A 
            href="javascript:window.scroll(0,-360)">顶部</A>】【<a href="javascript:self.close()">关闭</a>】</div></td>
                  </tr>
                </table></TD>
            </TR>
            <TR> 
              <TD 
                  height=1 background=img/naBialym.gif><IMG height=1 src="img/1x1_pix.gif" 
              width=10></TD>
            </TR>
            <TR> 
              <TD 
                  height=1>&nbsp;</TD>
            </TR>
          </TBODY>
        </TABLE></TD>
    </TR>
  </TBODY>
</TABLE>
<!-- #include file="Inc/Foot.asp" -->
</BODY></HTML>
