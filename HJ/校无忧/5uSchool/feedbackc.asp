<!--#include file="inc/config.asp"-->
<!--#include file="inc/conn.asp"-->
<%
page=request("page")
up_down=request.QueryString("up_down")
Set rs=Server.CreateObject("Adodb.Recordset")
rs.open "select * from Feedback where chk=1 order by id desc",Conn,1,2
pgsz=10
 if rs.recordcount=0 then
   cur_page=1
   total=1
   session("count")=0
  else
   if isempty(session("cur_page")) or isNull(session("cur_page")) then
      session("cur_page")=0
   end if
   cur_page=session("cur_page")
   rs.pagesize=cint(pgsz)
   if (rs.recordcount/pgsz)=INT(rs.recordcount/pgsz) then
      total=INT(rs.recordcount/pgsz)
   else
      total=INT(rs.recordcount/pgsz)+1
   end if
   if page="" then
   if len(up_down)=0 then
      cur_page=1
   end if
   if up_down="up" then
      cur_page=cur_page-1
   end if
   if up_down="down" then
      cur_page=cur_page+1
   end if
   if cur_page>total then
      cur_page=total
   end if
   if cur_page=0 then
      cur_page=1
   end if
   else
   	  cur_page=page
   end if
   session("count")=rs.recordcount
   
   rs.absolutepage=cur_page
   rowcount=rs.pagesize
end if
   session("cur_page")=cur_page
   session("total")=total
%>
<!DOCTYPE html PUBLIC "-//W3C//Dtd XHTML 1.0 Transitional//EN" "http://www.w3.org/tr/xhtml1/Dtd/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title><%=SiteName%>_校无忧科技_Www.Xiao5u.Com</title>
<meta name="keywords" content="<%=keywords%>"/>
<meta name="description" content="<%=description%>"/>
<link href="images/Xiao5u.css" rel="stylesheet" type="text/css">
</head>
<body>
<table width="1000" border="0" bgcolor="#FFFFFF" align="center">
  <tr>
    <td>
<!--#include file="inc/top.asp"-->
<table width="1000" border="0" align="center" cellpadding="0" cellspacing="0" id="bor">
  <tr>
    <td width="233" valign="top"><!--#include file="inc/left.asp"--></td>
    <td valign="top"><table width="757" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td width="132" height="33" align="center" background="images/right_01.jpg" class=whitetitle>互动平台</td>
        <td width="616" align="right" background="images/right_02.jpg"><img src="images/home.gif" width="16" height="16" align="absmiddle" />您当前的位置：<a href="index.asp">首页</a> &gt;&gt; 互动平台</td>
        <td><img src="images/right_03.jpg" width="9" height="33" /></td>
      </tr>
    </table>
      <table width="757" border="0" align="center" cellpadding="0" cellspacing="0" background="images/right_04.jpg">
        <tr>
          <td>
		  <table width="96%" border="0" align="center" cellpadding="5" cellspacing="1" bgcolor="cccccc" id="tab">
<%
if rs.eof then 
response.Write("<tr><td align=center>暂无留言信息！</td></tr>")
else
	i=1
	do while not rs.eof and i<=pgsz%>
			<tr>
              <td bgcolor="#efefef">※ <span id="righttitle"><%=rs("title")%>| <strong><%=rs("person")%></strong> 发表于 <%=rs("sendtime")%></td>
            </tr>
            <tr>
              <td bgcolor="#FFFFFF" class="txt"><%=rs("content")%></td>
            </tr>
            <tr>
              <td bgcolor="efefef"><strong>管理员回复：</strong>
                  <p class="txt"><%=rs("reply")%></p></td>
            </tr>
<%
	i=i+1
	rs.movenext
	loop
end if
%>
            <tr>
              <td align="right" bgcolor="#FFFFFF"><font color="#FF0000"><%=session("cur_page")%></font>/<font color="#FF0000"><%=session("total")%></font>, [<a href="?up_down=up">上一页</a>] [<a href="?up_down=down">下一页</a>]【<a href="feedback.asp#pub">我要留言</a>】</td>
            </tr>
          </table></td>
        </tr>
        <tr>
          <td><img src="images/right_05.jpg" width="757" height="6" /></td>
        </tr>
      </table></td>
  </tr>
</table>
<!--#include file="inc/bottom.asp"-->
	</td>
  </tr>
</table>
<%
rs.close
set rs=nothing
%>
</body>
</html>
