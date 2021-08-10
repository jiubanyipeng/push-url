<! *************************************************************
程序名称：南方数据新闻发布系统 V2.6

程序版权：南方数据 (www.0791idc.com)

程序作者：贺伟群 (weiqun)

联系方式：E-mail:jxhwq@hotmail.com    QQ: 635495  
*************************************************************** >
<!--#include file="Inc/conn.asp"-->
<% 
owen1=request("owen1")
owen2=request("owen2")
 %>
 <html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="css.css" type="text/css">
<meta name="keywords" content="owen,主页，个人主页，新闻，新闻发布，南方数据，新闻发布管理系统">
<title>南方数据新闻--<%=owen1%></title>
</head>

<body topmargin="0"><!--#include file="Inc/head.asp"-->
<table width="760" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr> 
    <td width="181" height="300" valign="top" bgcolor="efefef"><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr> 
              <td height="35" align="center" background="Img/index_01.gif" style="border-bottom: 1 solid #000000"><font color="#000000">新 
                闻 搜 索</font></td>
        </tr>
        <tr> 
          <td><table width="100%" border="0" cellpadding="0" cellspacing="0">
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
      </table> 
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr> 
              <td height="36" align="center" background="Img/index_01.gif" style="border-top: 1 solid #000000;border-bottom: 1 solid #000000"><a  href="otype.asp?owen1=<%=owen1%>"><font color="#000000"><%=owen1%></font></a></td>
        </tr>
<%
set rsSmallClass=server.CreateObject("adodb.recordset")
rsSmallClass.open "Select * From SmallClass_New Where BigClassName='" & owen1 & "'",conn,1,1
if not(rsSmallClass.bof and rsSmallClass.eof) then
do while not rsSmallClass.eof
%>
        <tr onmouseover="this.bgColor='#FFFFFF';" onmouseout="this.bgColor='#EFEFEF';" bgColor=#EFEFEF> 
              <td height="25" align="center" bgcolor="#EFEFEF" style="border-bottom: 1 solid #000000"><a  href="otype.asp?owen1=<%=owen1%>&owen2=<%=rsSmallClass("SmallClassName")%>"><font size="2"><%=rsSmallClass("SmallClassName")%></font></a></td>
        </tr>
        <%
			rsSmallClass.movenext
		loop
	  end if
	  rsSmallClass.close
	  set rsSmallClass=nothing	
%>
      </table></td>
    <td width="575" align="center" valign="top" bgcolor="#FFFFFF">
<table width="95%" border="0" cellspacing="0" cellpadding="0">
            <tr> 
              <td height="5"> </td>
            </tr>
            <tr> 
              <td height="5"> </td>
            </tr>
          </table>
      <table width="95%" border="0" cellpadding="0" cellspacing="0">
        <% 
page=clng(request("page"))		 
Set rs=Server.CreateObject("ADODB.RecordSet") 
if owen1<>"" and owen2 <>"" then
sql="select * from news where BigClassName='"&owen1&"' and SmallClassName='"&owen2&"' order by id desc"
rs.Open sql,conn,1,1
elseif owen1<>"" then
sql="select * from news where BigClassName='"&owen1&"' order by id desc"
rs.Open sql,conn,1,1
end if
if rs.eof and rs.bof then
response.Write("暂时没有记录")
else 
%>
        <tr> 
          <td width="6%" height="30" rowspan="2"><img src="images/sub.gif" width="31" height="30"></td>
              <td width="76%" height="28">　<a href="index.asp">首页</a>&gt;&gt;<a  href="otype.asp?owen1=<%=owen1%>"><%=owen1%></a></td>
              <td width="18%" align="center">&nbsp;</td>
        </tr>
        <tr> 
          <td height="2" colspan="2" bgcolor="#6699cc"> </td>
        </tr>
        <% 
rs.PageSize=20
if page=0 then page=1 
pages=rs.pagecount
if page > pages then page=pages
rs.AbsolutePage=page  
for j=1 to rs.PageSize 
%>
        <tr> 
          <td height="24" align="center" >◎</td>
          <td height="24" colspan="2" style="BORDER-bottom: #999999 1px dotted"> <% if rs("imagenum")<>"0" then response.write "<img src='images/news.gif' border=0 alt='图片新闻'>" end if %>
            <a href="shownews.asp?id=<%= RS("id") %>" target="_blank"><%= RS("TITLE") %></a>　<font color="#999999">[<%= RS("infotime") %>] 
            (阅读<font color="#ff0000"><%= RS("hits") %></font>次) </font></td>
        </tr>
        <%
rs.movenext
if rs.eof then exit for
next
%>
        <tr valign="bottom"> 
            <td height="50" colspan="3" align="center" > 
          <form method=Post action="otype.asp?owen1=<%= owen1 %>&owen2=<%= owen2 %>">  
              <%if Page<2 then      
    response.write "首页 上一页&nbsp;"
  else
    response.write "<a href=otype.asp?owen1="&owen1&"&owen2="&owen2&"&page=1>首页</a>&nbsp;"
    response.write "<a href=otype.asp?owen1="&owen1&"&owen2="&owen2&"&page=" & Page-1 & ">上一页</a>&nbsp;"
  end if
  if rs.pagecount-page<1 then
    response.write "下一页 尾页"
  else
    response.write "<a href=otype.asp?owen1="&owen1&"&owen2="&owen2&"&page=" & (page+1) & ">"
    response.write "下一页</a> <a href=otype.asp?owen1="&owen1&"&owen2="&owen2&"&owen2="&owen2&"&page="&rs.pagecount&">尾页</a>"
  end if
   response.write "&nbsp;页次：<strong><font color=red>"&Page&"</font>/"&rs.pagecount&"</strong>页 "
    response.write "&nbsp;共<b><font color='#FF0000'>"&rs.recordcount&"</font></b>条记录 <b>"&rs.pagesize&"</b>条记录/页"
   response.write " 转到：<input type='text' name='page' size=4 maxlength=10 class=input value="&page&">"
   response.write " <input class=input type='submit'  value=' Goto '  name='cndok'></span></p>"     
%>
           </form>  </td> 
         
        </tr>
<% 
end if
rs.close
set rs=nothing
%>
      </table>
      
    </td>
  </tr>
</table><!--#include file="Inc/foot.asp"-->
</body>
</html>
