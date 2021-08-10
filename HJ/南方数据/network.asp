<!--#include file="Inc/SysProduct.asp" -->
<!--#include file="inc/Skin_css.asp"-->
<!-- #include file="Head.asp" -->
<Script language="JavaScript1.3" type="text/javascript">
<!--
function gopage()
{
	var o=document.getElementById("num");
	var num=o.value;
	if(!isNaN(parseInt(num)))
	{
		document.URL="network.asp?page="+num+"&nb=<%=nb%>&pid=<%=pid%>&psort=<%=psort%>";
	}
}
//-->
</Script>
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
                <td height="34" class="title_left">&nbsp;&nbsp;&nbsp;<img src="Images/smallbook.jpg" width="10" height="10">&nbsp;&nbsp;营销网络</td>
              </tr>
              <tr> 
                <td height="20"> <div align="center"><a href="HomeMarket.asp">国 
                    内 市 场</a></div></td>
              </tr>
              <TR> 
                <TD 
                            height=1 colspan="2" 
                            background=img/naSzarym.gif><IMG height=1 src="img/1x1_pix.gif" 
                              width=10></TD>
              </TR>
              <tr> 
                <td height="20"> <div align="center"><a href="OverseasMarket.asp">国 
                    外 市 场</a></div></td>
              </tr>
              <TR> 
                <TD 
                            height=1 colspan="2" 
                            background=img/naSzarym.gif><IMG height=1 src="img/1x1_pix.gif" 
                              width=10></TD>
              </TR>
            </table></td>
          <td width="6"></td>
          <td valign="top"><table Class=border width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
              <tr> 
                <td height="206" valign="top"> <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td class="title_right" height="32">&nbsp;&nbsp;&nbsp;<img src="Images/smallbook.jpg" width="10" height="10">&nbsp;&nbsp;国 
                        内 市 场</td>
                    </tr>
                  </table>
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td height="16">&nbsp;</td>
                    </tr>
                    <tr> 
                      <td height="34"><div align="center"> 
                          <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="535" height="389">
                            <param name="movie" value="Images/map.swf">
                            <param name="quality" value="high">
                            <embed src="Images/map.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="535" height="389"></embed></object>
                        </div></td>
                    </tr>
                    <tr>
                      <td height="34"><TABLE width="99%" border=0 cellPadding=0 cellSpacing=1 
                        bgColor=#ffffff class="main3">
                          <TR align="center"  bgColor=#f8f8f8> 
                            <TD width="21%"  height=30><strong>省/市</strong></TD>
                            <TD width="41%"  height=23><strong>服务店地址</strong></TD>
                            <TD width="19%"  height=23><strong>时间</strong></TD>
                            <TD width="19%"><strong>电话</strong></TD>
                          </TR>
                          <%
psort=request.QueryString("psort")
Set Rs=Server.CreateObject("Adodb.RecordSet")
if psort<>"" then
  Sql="Select * from ServerMeshwork where shengName='"&psort&"' order by shengName,diquname,diquOrder desc"
else
  Sql="Select * from ServerMeshwork order by shengName,diquname,diquOrder desc"
end if
Rs.OPen Sql,conn,1,3
  page=Request("page")
  if page<>"" then 
     page=cdbl(page)
  else
     page=1
  end if

  Rs.PageSize=15
  Total_Page=Rs.PageCount
  if (Rs.PageCount<page) then page=Rs.PageCount
  if (page<1) then  page=1
  if not Rs.eof then  Rs.AbsolutePage=page
if not Rs.eof then
		for i=1 to Rs.PageSize
		if Rs.eof or Rs.bof then exit for
%>
                          <TR <%if i mod 2<>0 then%>bgColor=#dfdfdf<%else%>bgColor=#f5f5f5<%end if%>> 
                            <TD height=23 align="center">                               
                              <%=rs("shengName")%>/<%=Rs("diquname")%> </TD>
                            <TD align="center"><%=RS("diquDizhi")%></TD>
                            <TD align="center"><%=RS("diquShijian")%></TD>
                            <TD align="center"><%=RS("diquDianhua")%></TD>
                          </TR>
                          <%
		rs.movenext
		next 
		i=i+1
%>
                          <%else%>
                          <TR  bgColor=#f5f5f5> 
                            <TD height=23 colspan="4">对不起,暂无数据!</TD>
                          </TR>
                          <%end if%>
                        </TABLE></td>
                    </tr>
                    <tr> 
                      <td height="34"><table width="92%" border="0" align="right" cellpadding="0" cellspacing="0">
                          <tr> 
                            <td width="81%" align="right" class="blue2" colspan="2"> 
                              第<%=page%>页 共<%=total_page%>页 共<%=Rs.recordcount%>条&nbsp; 
                              <%
		if totalpage<>1 then
			if page>1 then
				response.Write("[<a href='network.asp?page=1&nb="&nb&"&pid="&pid&"&psort="&psort&"'>&lt;&lt;首页</a>] [<a href='network.asp?page="&page-1&"&nb="&nb&"&psort="&psort&"'>&lt;上一页</a>]")
			else
				response.Write("[&lt;&lt;首页] [&lt;上一页]")
			end if
			
			if page<Total_Page then
				response.Write("[<a href='network.asp?page="&page+1&"&nb="&nb&"&pid="&pid&"&psort="&psort&"'>下一页&gt;</a>] [<a href='network.asp?page="&Total_Page&"&nb="&nb&"&pid="&pid&"&psort="&psort&"'>未页&gt;&gt;</a>]")
			else
				response.Write("[下一页&gt;] [未页&gt;&gt;]")
			end if
		end if
%>
                              &nbsp;转到： 
                              <input name="num" type="text" class="area0" id="num2" size="3"> 
                              &nbsp; <input name="btngo" type="button" class="area0" id="btngo" onClick="gopage();" value="GO"></td>
                          </tr>
                        </table></td>
                    </tr>
                  </table></td>
              </tr>
            </table></td>
        </tr>
      </table></td>
  </tr>
</table>
<%
rs.close
set rs=nothing
%>
<!-- #include file="Inc/Foot.asp" -->
</BODY></HTML>
