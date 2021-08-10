<!--#include file="inc/conn.asp"-->
<%owen=request("id")%>
<style type="text/css">
.content { font-size: 11pt; }
td{word-break:break-all}
</style>
<SCRIPT language=JavaScript>
var currentpos,timer;

function initialize()
{
timer=setInterval("scrollwindow()",50);
}
function sc(){
clearInterval(timer);
}
function scrollwindow()
{
currentpos=document.body.scrollTop;
window.scroll(0,++currentpos);
if (currentpos != document.body.scrollTop)
sc();
}
document.onmousedown=sc
document.ondblclick=initialize
</SCRIPT>
<% 
Set rsnews=Server.CreateObject("ADODB.RecordSet") 
sql="update news set hits=hits+1 where id="&cstr(request("id"))
conn.execute sql
sql="select * from news where id="&owen
rsnews.Open sql,conn,1,1
title=rsnews("title")
if rsnews.eof and rsnews.bof then
response.Write("数据库出错")
else
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta name="keywords" content="owen,主页，个人主页，新闻，新闻发布，南方数据，新闻发布管理系统">
<link rel="stylesheet" href="css.css" type="text/css">
<title><%= title %></title>
</head>
<body topmargin="0">
<!--#include file="inc/head.asp"-->
<table width="760" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#FFFFFF">
      <tr> 
    <td width="180" rowspan="2" align="center" valign="top" bgcolor="#EFEFEF"><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
              <td height="36" align="center" background="Img/index_01.gif" style="border-bottom: 1 solid #000000"><font color="#000000">新 
                闻 搜 索</font></td>
        </tr>
        <tr>
          <td><table width="100%" border="0" cellpadding="0" cellspacing="0" style="border-bottom: 1 solid #000000">
              <form name="form1" method="get" action="News_search.asp">
                <tr> 
                  <td height="30" align="center" bgcolor="#efefef"> <input type="text" name="key" size="19" class="input"> 
                  </td>
                </tr>
                <tr> 
                  <td height="30" align="center" bgcolor="#efefef"> <select name="otype" class="input">
                      <option value="title" selected class="input">新闻标题</option>
                      <option value="msg" class="input">新闻内容</option>
                    </select>
                    　 
                    <input type="submit" name="Submit" value="搜索" class="input"></td>
                </tr>
              </form>
            </table></td>
        </tr>
      </table></td>
        <td width="590" align="right" valign="top"> 
          <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr> 
          <td height="50" colspan="2" align="center" class="tit"><%= rsnews("title") %></td>
        </tr>
        <tr> 
          <td width="40%" height="30" style="border-top: 1 solid #666666;border-bottom: 1 solid #666666">双击自动滚屏</td>
          <td width="60%" align="center" style="border-top: 1 solid #666666;border-bottom: 1 solid #666666">发布者：<%= rsnews("user") %> 
            发布时间：<%= rsnews("infotime") %> 阅读：<font color="#FF0000"><%= rsnews("hits") %></font>次</td>
        </tr>
        <tr> 
          <td colspan="2"><br><div style='font-size:10.5pt'><%=rsnews("content") %></div></td>
        </tr>
        <tr align="right"> 
          <td colspan="2">&nbsp;</td>
        </tr>
        <tr align="right"> 
          <td colspan="2">&nbsp;</td>
        </tr>
        <% 
		end if
		rsnews.close
		set rsnews=nothing
		 %>
      </table>
    </td>
  </tr>
  <tr>
        <td height="40" align="right"> 
          <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td align="right"> <img src="images/printer.gif" width="16" height="14" align="absmiddle"> 
            <a href="javascript:window.print()">打印本页</a> | <img src="images/close.gif" width="14" height="14" align="absmiddle"> 
            <a href="javascript:window.close()">关闭窗口</a></td>
        </tr>
      </table>
    </td>
  </tr>
</table>
<!--#include file="inc/foot.asp"-->
