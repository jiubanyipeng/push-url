<!--#include file="Inc/syscode.asp"-->
<!--#include file="Inc/top.asp"-->
<%
ShowSmallClassType=ShowSmallClassType_Article
dim ID
ID=trim(request("ID"))
if Id="" then
	response.Redirect("Download.asp")
end if

sql="select * from Download where ID=" & ID & ""
Set rs= Server.CreateObject("ADODB.Recordset")
rs.open sql,conn,1,3
if rs.bof and rs.eof then
	response.write"<SCRIPT language=JavaScript>alert('找不到此产品！');"
  response.write"javascript:history.go(-1)</SCRIPT>"
else	
	rs("Hits")=rs("Hits")+1
	rs.update
	if rs("hits")>=HitsOfHot then
		rs("Hot")=True
		rs.update
	end if
	BigClassName=rs("BigClassName")
	SmallClassName=rs("SmallClassName")
%>
<HTML><HEAD><TITLE>南方数据</TITLE>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<meta name="Author" content="Hypo">
<meta name="Contact" content="Hypo@Wz163.com">
<meta name="Copyright" content="Hypo&Zhonghuan Tech">
<style type="text/css">
A:link    {	 color: #333333;TEXT-DECORATION: none	}
A:visited {	 color: #333333;TEXT-DECORATION: none	}
A:active  {	 color: #003300;TEXT-DECORATION: none	}
A:hover   {	 color: #003300;TEXT-DECORATION: underline overline	}
.navtrail {  COLOR: #eeeeee; FONT-SIZE: 12px; LINE-HEIGHT: 12px }
A.navtrail:link {  COLOR: #eeeeee; CURSOR: w-resize }
A.navtrail:visited {  COLOR: #eeeeee; CURSOR: w-resize }
A.navtrail:active {  COLOR: #eeeeee; CURSOR: w-resize }
A.navtrail:hover {  COLOR: #eeeeee; CURSOR: e-resize }
INPUT{BORDER-TOP-WIDTH: 1px; PADDING-RIGHT: 1px; PADDING-LEFT: 1px; BORDER-LEFT-WIDTH: 1px; FONT-SIZE: 9pt; BORDER-LEFT-COLOR: #cccccc; BORDER-BOTTOM-WIDTH: 1px; BORDER-BOTTOM-COLOR: #cccccc; PADDING-BOTTOM: 1px; BORDER-TOP-COLOR: #cccccc; PADDING-TOP: 1px; HEIGHT: 18px; BORDER-RIGHT-WIDTH: 1px; BORDER-RIGHT-COLOR: #cccccc}
<!--
td {  font-family: "宋体"; font-size: 9pt; color: #333333; text-decoration: none}
-->
</style>
<BODY bgColor=#666666 leftMargin=0 topMargin=0 marginheight="0" marginwidth="0" <%if not(rsBigClass.bof and rsBigClass.eof) and ShowSmallClassType="Menu" then response.write " onmousemove='HideMenu()'"%>>
<!-- #include file="Inc/Head.asp" -->
<TABLE width="760" border=0 align="center" cellPadding=0 cellSpacing=0 bgcolor="#FFFFFF">
  <TBODY>
    <TR> 
      <TD width=192 vAlign=top bgcolor="#FFFFFF"> 
        <table width="92%" height="100%" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#f2f2f2">
          <tr> 
            <td valign="top"><TABLE width="100%" border=0 cellPadding=0 cellSpacing=0 background="Img/index_01b.gif">
                <TBODY>
                  <TR> 
                    <TD height=5 bgcolor="#FFFFFF"></TD>
                  </TR>
                  <TR> 
                    <TD height="34" background="Img/index_01.gif"> 
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
              <TABLE width="100%" border=0 cellPadding=0 cellSpacing=0 background="Img/index_01b.gif">
                <TBODY>
                  <TR> 
                    <TD height=15 bgcolor="#FFFFFF"></TD>
                  </TR>
                  <TR> 
                    <TD height="34" background="Img/index_01.gif">
<div align="center">下载列表</div></TD>
                  </TR>
                  <TR> 
                    <TD height="5" background="Img/index_01.gif"> </TD>
                  </TR>
                  <TR> 
                    <TD vAlign=top> 
                       <% call ShowSmallClass_Down_Tree() %>
                    </TD>
                  </TR>
                </TBODY>
              </TABLE>
              <br> </td>
          </tr>
        </table>
      </TD>
      <TD width=1 background=img/kropki_pion_naBialym.gif><IMG 
            height=2 src="img/1x1_pix.gif" width=1></TD>
      <TD width="566" vAlign=top> <TABLE width="90%" border=0 align="right" cellPadding=0 cellSpacing=0>
              <TBODY>
                <TR> 
                  <TD colSpan=3 height=5><IMG height=1 
                  src="img/1x1_pix.gif" width=1></TD>
                </TR>
                <TR> 
                  <TD colspan="3"> <TABLE cellSpacing=0 cellPadding=0 width="555" border=0>
                      <TBODY>
                        <TR> 
                          <TD height="25"><img src="Img/bgtop_2.gif" width="557" height="36"></TD>
                        </TR>
                      </TBODY>
                    </TABLE></TD>
                </TR>
                <TR> 
                  <TD 
                  height=1 colspan="3" background=img/naBialym.gif><IMG height=1 src="img/1x1_pix.gif" 
              width=10></TD>
                </TR>
                <TR> 
                  <TD width="391" 
                  height=25> 
                    <%
response.write "|&nbsp;<a href='Download.asp?BigClassName=" & rs("BigClassName") & "'>" & rs("BigClassName") & "</a>&nbsp;&gt;&gt;&nbsp;"
if rs("SmallClassName") & ""<>"" then
	response.write "<a href='Download.asp?BigClassName=" & rs("BigClassName")&"&SmallClassName=" & rs("SmallClassName") & "'>" & rs("SmallClassName") & "</a>&nbsp;&gt;&gt;&nbsp;"
end if
response.write rs("Title")
%>
                  </TD>
                  <TD width="166"><div align="center"><a href="<%=rs("DownloadUrl")%>"><img src="Img/download.gif" width="85" height="25" border="0"></a></div></TD>
                </TR>
                <TR> 
                  <TD 
                  height=1 colspan="3" background=img/naBialym.gif><IMG height=1 src="img/1x1_pix.gif" 
              width=10></TD>
                </TR>
                <TR> 
                  <TD height="1" colspan="3"><br> <%=rs("Content")%> </TD>
                </TR>
                <TR> 
                  <TD 
                  height=1 colspan="3" background=img/naBialym.gif><IMG height=1 src="img/1x1_pix.gif" 
              width=10></TD>
                </TR>
                <TR> 
                  <TD 
                  height=25><div align="right">点击数：<%=rs("Hits")%>&nbsp; <%= FormatDateTime(rs("UpdateTime"),2) %>&nbsp;【<a href='javascript:history.back()'>返回</a>】</div></TD>
                  <TD 
                  height=25><div align="center"><a href="<%=rs("DownloadUrl")%>"><img src="Img/download.gif" width="85" height="25" border="0"></a></div></TD>
                </TR>
                <TR> 
                  <TD 
                  height=1 colspan="3" background=img/naBialym.gif><IMG height=1 src="img/1x1_pix.gif" 
              width=10></TD>
                </TR>
                <TR> 
                  <TD 
                  height=1 colspan="3">&nbsp; </TD>
                </TR>
                <TR> 
                  <TD 
                  height=1 colspan="3">&nbsp; </TD>
                </TR>
              </TBODY>
            </TABLE></TD>
    </TR>
  </TBODY>
</TABLE>
<!-- #include file="Inc/Foot.asp" -->
</BODY></HTML>
<%
end if
rs.close
set rs=nothing
call CloseConn()
%>