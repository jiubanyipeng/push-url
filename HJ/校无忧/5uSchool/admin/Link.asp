<!--#include file="inc/right.asp"--> 
<!--#include file="inc/conn.asp"-->
<script language=JavaScript>
<!--
function DoEmpty(params)
{
if (confirm("真的要删除这条记录吗？删除后无法恢复！"))
window.location = params ;
}
//-->
</script>

<%
IF Request("wor")="del" Then
sql="delete from Link where id="&Request("id")
Conn.execute(sql)
Response.Redirect "?action=list"
End IF
%>
<%
action=Request("action")
id=Request("id")
if action="yes" Then
 set rs=server.createobject("adodb.recordset") 
if id="" then
   set rsCheck = conn.execute("select title from Link where title='" & trim(Request.Form("title")) & "'")
     if not (rsCheck.bof and rsCheck.eof) then
      response.write "<script language='javascript'>alert('名称 " & trim(Request.Form("title")) & " 已存在，请检查！');history.back(-1);</script>"
      response.end
     end if
   set rsCheck=nothing
   sql="select * from Link" 
   rs.open sql,conn,3,3
   rs.addnew
else
   sql="select * from Link where id="&id&"" 
   rs.open sql,conn,1,2
end if
 rs("title")=Request.Form("title")
 rs("url")=Request.Form("url")
 rs("yn")=Request.Form("yn")
 rs.update
 rs.close
set rs=nothing
 Response.Redirect "?action=list"
end if
%>
<html>
<head>
<title><%=sysConfig%></title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="images/main.css" rel="stylesheet" type="text/css">
<script language="JavaScript">
function check()
{
  if (document.add.title.value=="")
     {
      alert("请填写链接名称！")
      document.add.title.focus()
      document.add.title.select()
      return
     }
	 
  if (document.add.url.value=="")
     {
      alert("请填写链接地址！")
      document.add.url.focus()
      document.add.url.select()
      return
     }

     document.add.submit()
}
</script>
</head>
<body>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr valign="top">
    <td bgcolor="#FFFFFF">
<%
if action="add" then	
%>
	<br>
      <table width="96%"  border="0" align="center" cellpadding="4" cellspacing="1" bgcolor="#aec3de">
        <form name="add" method="post" action="Link.asp">
        <tr align="center" bgcolor="#F2FDFF">
          <td colspan="2"  class="optiontitle">添加链接</td>
        </tr>
		<tr align='center' bgcolor='#F2FDFF'>
		  <td align='right'> 链接名称：</td>
		  <td align='left'><input name="title" type="text" id="title" size="50"></td>
		</tr>
        <tr align="center" bgcolor="#FFFFFF">
          <td width="10%" align="right">链接地址：</td>
          <td align="left"><input name="url" type="text" id="url" size="50"></td>
        </tr>
        <tr align="center" bgcolor="#FFFFFF">
          <td width="10%" align="right">所属类别：</td>
          <td align="left">
		  <select name="yn" id="yn">
		    <option value="1">政府部门</option>
		    <option value="2">教育部门</option>
		    <option value="3">学校网站</option>
		    <option value="4">其他网站</option>
		  </select></td>
        </tr>
        <tr align="center" bgcolor="#ebf0f7">
          <td  colspan="2" >
		     <INPUT TYPE="hidden" name="action" value="yes">
            <input type="button" name="Submit" value="提交" onClick="check()">
          	<input type="button" name="Submit2" value="返回" onClick="history.back(-1)"></td>
        </tr>
		</FORM>
      </table> 
<%end if%>
<br>
<%if action="list" then%>
      <table width="96%"  border="0" align="center" cellpadding="4" cellspacing="1" bgcolor="#aec3de">
        <tr align="center" bgcolor="#F2FDFF">
          <td colspan="5"  class="optiontitle">链接列表</td>
        </tr>
        <tr align="center" bgcolor="#ebf0f7">
          <td width="5%">序号</td>
          <td width="25%">链接名称</td>
          <td width="30%">链接地址</td>
          <td width="20%">所属类别</td>
          <td width="20%">执行操作</td>
        </tr>
		
<%
sql="select * from Link order by id desc"
 set rs=server.createobject("adodb.recordset") 
 rs.open sql,conn,1,1
 if not rs.eof then
 proCount=rs.recordcount
	rs.PageSize=15
     if not IsEmpty(Request("ToPage")) then
	    ToPage=CInt(Request("ToPage"))
		if ToPage>rs.PageCount then
		   rs.AbsolutePage=rs.PageCount
		   intCurPage=rs.PageCount
		elseif ToPage<=0 then
		   rs.AbsolutePage=1
		   intCurPage=1
		else
		   rs.AbsolutePage=ToPage
		   intCurPage=ToPage
		end if
	 else
		rs.AbsolutePage=1
		intCurPage=1
	 end if
	 intCurPage=CInt(intCurPage)
	 For i = 1 to rs.PageSize
	 if rs.eof then     
	 Exit For 
	 end if
%>
        <tr align='center' bgcolor='#FFFFFF' onmouseover='this.style.background="#F2FDFF"' onmouseout='this.style.background="#FFFFFF"'>
		  <td><%=rs("id")%></td>
          <td><%=rs("title")%></td>
          <td align='left'><a href="<%=rs("url")%>" target="_blank"><%=rs("url")%></a></td>
          <td><%if rs("yn")=1 then response.write"政府部门" end if%><%if rs("yn")=2 then response.write"教育部门" end if%><%if rs("yn")=3 then response.write"学校网站" end if%><%if rs("yn")=4 then response.write"其他网站" end if%></td>  
          <td><img src="images/edit.gif" align="absmiddle"><a href="?action=edit&id=<%=rs("id")%>">修改</a> | <img src="images/drop.gif" align="absmiddle"><a href="javascript:DoEmpty('?wor=del&id=<%=rs("id")%>&action=list&ToPage=<%=intCurPage%>')">删除</a></td>
        </tr>
<%
rs.movenext 
next
%>
        <tr align="center" bgcolor="#ebf0f7">
          <td colspan="5"> 总共：<font color="#ff0000"><%=rs.PageCount%></font>页，<font color="#ff0000"><%=proCount%></font>条记录，当前页：<font color="#ff0000"><%=intCurPage%> </font><%if intCurPage<>1 then%><a href="?action=list">首页</a> | <a href="?action=list&ToPage=<%=intCurPage-1%>">上一页</a> | <% end if
if intCurPage<>rs.PageCount then %><a href="?action=list&ToPage=<%=intCurPage+1%>">下一页</a> | <a href="?action=list&ToPage=<%=rs.PageCount%>"> 最后页</a><% end if%></span></td>
        </tr>
<%
else
%>
        <tr align="center" bgcolor="#ffffff">
          <td colspan="5">对不起！暂时没有添加内容！</td>
        </tr>
<%
rs.close
set rs=nothing
end if
%>
      </table>
	  <br>
<%end if%>
<%if action="edit" then
set rs=server.createobject("adodb.recordset") 
Tid=Request("id")
sql="select * from Link where id="&Tid
rs.open sql,conn,1,1
if not rs.eof Then
%>
	  <table width="96%"  border="0" align="center" cellpadding="4" cellspacing="1" bgcolor="#aec3de">
       <form name="add" method="post" action="Link.asp">
		<tr align="center" bgcolor="#F2FDFF">
		  <td colspan=2  class="optiontitle">修改链接</td>
		</tr>
		<tr align='center' bgcolor='#F2FDFF'>
		  <td align='right'> 链接名称：</td>
		  <td align='left'><input name="title" type="text" id="title" value="<%=rs("title")%>" size="50"></td>
		</tr>
        <tr align="center" bgcolor="#FFFFFF">
          <td width="10%" align="right">链接地址：</td>
          <td align="left"><input name="url" type="text" id="url" value="<%=rs("url")%>" size="50"></td>
        </tr>	
        <tr align="center" bgcolor="#FFFFFF">
          <td width="10%" align="right">所属类别：</td>
          <td align="left">
		  <select name="yn" id="yn">
		    <option value="1" <%if rs("yn")=1 then response.write " selected"%>>政府部门</option>
		    <option value="2" <%if rs("yn")=2 then response.write " selected"%>>教育部门</option>
		    <option value="3" <%if rs("yn")=3 then response.write " selected"%>>学校网站</option>
		    <option value="4" <%if rs("yn")=4 then response.write " selected"%>>其他网站</option>
		  </select></td>
        </tr>
		<tr align="center" bgcolor="#ebf0f7">
		  <td colspan="2">
		  <input type="hidden" name="action" value="yes">
          <input type="button" name="Submit2" value="提交" onClick="check()">
          <input type="button" name="Submit2" value="返回" onClick="history.back(-1)">
		  <input name="id" type="hidden" id="id" value="<%=rs("id")%>">		  </td>
		</tr>
  		</FORM>
  	</table>
<%
end if
end if
%>    
    </td>
  </tr>
</table>
</body>
</html>