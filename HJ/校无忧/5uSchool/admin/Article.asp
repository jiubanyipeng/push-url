<!--#include file="inc/right.asp"--> 
<!--#include file="inc/conn.asp"-->
<script language=JavaScript>
<!--
function DoEmpty(params)
{
if (confirm("真的要删除这条记录吗？删除后此记录里的所有内容都将被删除并且无法恢复！"))
window.location = params ;
}
//-->
</script>

<%
if request("wor")="del" Then
sql="delete from Article where id="&request("id")
conn.execute(sql)
response.redirect "?action=list"
end if
%>
<%
action=Request("action")
id=Request("id")
if action="yes" Then
 set rs=server.createobject("adodb.recordset") 
if id="" then
   set rsCheck = conn.execute("select title from Article where title='" & trim(Request.Form("title")) & "'")
     if not (rsCheck.bof and rsCheck.eof) then
      response.write "<script language='javascript'>alert('名称 " & trim(Request.Form("title")) & " 已存在，请检查！');history.back(-1);</script>"
      response.end
     end if
   set rsCheck=nothing
   sql="select * from Article" 
   rs.open sql,conn,3,3
   rs.addnew
else
   sql="select * from Article where id="&id&"" 
   rs.open sql,conn,1,2
end if
 rs("title")=Request("title")
 rs("sid")=Request("sid") 
 rs("cid")=Request("cid") 
 cname=Request("cname")
 if cname="" then
   sqlT="select cname from Sclass where id="&Request("cid")
   set rsT=conn.execute(sqlT)
   cname=cstr(rsT("cname"))
   rsT.close
   Set rsT=nothing
 end if
 rs("cname")=cname
 rs("description")=Request("description")
 rs("keywords")=Request("keywords")
 rs("pic")=Request("pic")
 rs("content")=Request("content")
 rs("addtime")=Request("addtime")
 rs("author")=Request("author")
 rs.update
 rs.close
set rs=nothing
 Response.Redirect "?action=list&cname="&cname&""
end if
%>
<html>
<head>
<title><%=sysConfig%></title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="images/main.css" rel="stylesheet" type="text/css">
<script LANGUAGE="JavaScript">
function check()
{
  if (document.add.title.value=="")
     {
      alert("请填写文章标题！")
      document.add.title.focus()
      document.add.title.select()
      return
     }

     document.add.submit()
}
</SCRIPT>
</head>
<body>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr valign="top">
    <td bgcolor="#FFFFFF">
<%
if action="add" then
cname=trim(request("cname"))	
%>
<script type="text/javascript" charset="utf-8" src="../Editor/kindeditor.js"></script>
<script type="text/javascript">
    KE.show({
        id : 'content_1'
    });
</script>
	<br>
      <table width="96%"  border="0" align="center" cellpadding="4" cellspacing="1" bgcolor="#aec3de">
        <form name="add" method="post" action="Article.asp">
        <tr align="center" bgcolor="#F2FDFF">
          <td colspan="2"  class="optiontitle">添加文章</td>
        </tr>
		<tr align='center' bgcolor='#F2FDFF'>
		  <td align='right'> 文章标题：</td>
		  <td align='left'><input name="title" type="text" id="title" size="50"></td>
		</tr>
		<tr align='center' bgcolor='#FFFFFF'>
		  <td align='right'> 文章类别：</td>
		  <td align='left'>
		  <%if cname<>"" then%>
		  <%=cname%>
		  <%
		    sqlT="select id,tid from Sclass where cname='"&cname&"'"
		    set rsT=conn.execute(sqlT)
		    cid=cstr(rsT("id"))
			sid=cstr(rsT("tid"))
		    rsT.close
		    Set rsT=nothing
		  %>
		  <input name="sid" type="hidden" id="sid" value="<%=sid%>">
		  <input name="cid" type="hidden" id="cid" value="<%=cid%>">
		  <input name="cname" type="hidden" id="cname" value="<%=cname%>">  
		  <%else%>
         <select name="cid">
          <option value="">-请选择类别-</option>
    <%
      dim sql,rsBigClass,rsSmallClass,ErrMsg
      set rsBigClass=server.CreateObject("adodb.recordset")
      rsBigClass.open "Select * From SClass where yn=2 order by pid asc",conn,1,3
	  do while not rsBigClass.eof
    %>
          <option value="<%=rsBigClass("id")%>"><%=rsBigClass("cname")%></option>
    <%
	  set rsSmallClass=server.CreateObject("adodb.recordset")
	  rsSmallClass.open "Select * From SClass where tid="&rsBigClass("id")&"",conn,1,3
	  if not(rsSmallClass.bof and rsSmallClass.eof) then
	  do while not rsSmallClass.eof
	%>
          <option value="<%=rsSmallClass("id")%>">-<%=rsSmallClass("cname")%></option>
    <%
	  rsSmallClass.movenext
	  loop
	  end if
	  rsSmallClass.close
	  set rsSmallClass=nothing	
	  rsBigClass.movenext
	  loop
      rsBigClass.close
      set rsBigClass=nothing
	%>
         </select>
		 <%end if%>
		  </td>
		</tr>
		<tr align='center' bgcolor='#FFFFFF'>
		  <td align='right'> 文章摘要：</td>
		  <td align='left'><textarea name="description" cols="89" rows="3" id="description"></textarea></td>
		</tr>
		<tr align='center' bgcolor='#FFFFFF'>
		  <td align='right'> 关 键 字：</td>
		  <td align='left'><input name="keywords" type="text" id="keywords" size="90">[ 使用 "," 间隔 ]</td>
		</tr>
		<tr align='center' bgcolor='#FFFFFF'>
		  <td align='right'> 首页图片：</td>
		  <td align='left'><input name="pic" type="text" id="pic" size="50"><iframe border=0 frameborder=0 framespacing=0 height=22 width=240 marginheight=0 marginwidth=0 name=new_pic noResize scrolling=no  src="upload.htm" vspale="0"></iframe>
		  首页不推荐可不上传</td>
		</tr>
        <tr align="center" bgcolor="#FFFFFF">
          <td width="10%" align="right">文章内容：</td>
          <td align="left"><textarea id="content_1" name="content" cols="100" rows="8" style="width:550px;height:300px;"></textarea></td>
        </tr>
		<tr align='center' bgcolor='#FFFFFF'>
		  <td align='right'> 录入时间：</td>
		  <td align='left'><input name="addtime" type="text" id="addtime" value="<%=Date()%>" size="30"> 编  辑：<input name="author" type="text" id="author" value="<%=session("author")%>" size="20"></td>
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
          <td colspan="4"  class="optiontitle">文章列表</td>
        </tr>
        <tr align="center" bgcolor="#ffffff">
          <td colspan="4">
<%
cname=trim(request("cname"))
Set rsSort=Server.CreateObject("Adodb.Recordset")
rsSort.open "select * from SClass where yn=2 order by pid asc",conn,1,3
do while not rsSort.eof
%>
 <a href="Article.asp?action=list&cname=<%=rsSort("cname")%>"><%if cname=rsSort("cname") then%><font color="#FF0000"><%=rsSort("cname")%></font><%else%><%=rsSort("cname")%></a><%end if%>
<%
rsSort.movenext
loop
rsSort.close
set rsSort=nothing
%>		  </td>
        </tr>
        <tr align="center" bgcolor="#ebf0f7">
          <td width="5%">序号</td>
          <td width="60%">文章标题</td>
          <td width="15%">文章分类</td>
          <td width="20%"><b><%if cname="" then%>单击栏目添加文章<%else%><a href="?action=add&cname=<%=cname%>">添加文章</a><%end if%></b></td>
        </tr>	
<%
cname=trim(request("cname"))
 sql="select * from Article"
 if cname<>"" then
	sql=sql & " where cname='"&cname&"'"
 end if
 sql=sql & " order by id desc"
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
          <td align='left'><a href="../Article.asp?id=<%=rs("id")%>" target="_blank"><%=rs("title")%></a></td>
          <td><%=rs("cname")%></td>
          <td><img src="images/view.gif" align="absmiddle"><a href="../Article.asp?id=<%=rs("id")%>" target="_blank">查看</a> | <img src="images/edit.gif" align="absmiddle"><a href="?action=edit&id=<%=rs("id")%>">修改</a> | <img src="images/drop.gif" align="absmiddle"><a href="javascript:DoEmpty('?wor=del&id=<%=rs("id")%>&action=list&ToPage=<%=intCurPage%>')">删除</a></td>
        </tr>
<%
rs.movenext 
next
%>
        <tr align="center" bgcolor="#ebf0f7">
          <td colspan="4" align="right"><%if intCurPage<>1 then%><a href="?action=list">首页</a> <a href="?action=list&cname=<%=cname%>&ToPage=<%=intCurPage-1%>">上一页</a><%end if%> 第<font color="#ff0000"> <%=intCurPage%> </font>页 <%if intCurPage<>rs.PageCount then %><a href="?action=list&cname=<%=cname%>&ToPage=<%=intCurPage+1%>">下一页</a> <a href="?action=list&cname=<%=cname%>&ToPage=<%=rs.PageCount%>"> 末页</a><% end if%> 共 <font color="#ff0000"><%=rs.PageCount%></font> 页 <font color="#ff0000"><%=proCount%></font> 条</span></td>
        </tr>
<%
else
%>
        <tr align="center" bgcolor="#ffffff">
          <td colspan="4">对不起！目前数据库中还没有添加内容！</td>
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
sql="select * from Article where id="&Tid
rs.open sql,conn,1,1
if not rs.eof Then
%>
<script type="text/javascript" charset="utf-8" src="../Editor/kindeditor.js"></script>
<script type="text/javascript">
    KE.show({
        id : 'content_1'
    });
</script>
	  <table width="96%"  border="0" align="center" cellpadding="4" cellspacing="1" bgcolor="#aec3de">
       <form name="add" method="post" action="Article.asp">
		<tr align="center" bgcolor="#F2FDFF">
		  <td colspan=2  class="optiontitle">修改文章</td>
		</tr>
		<tr align='center' bgcolor='#F2FDFF'>
		  <td align='right'> 文章标题：</td>
		  <td align='left'><input name="title" type="text" id="title" value="<%=rs("title")%>" size="50"></td>
		</tr>
		<tr align='center' bgcolor='#FFFFFF'>
		  <td align='right'> 文章类别：</td>
		  <td align='left'><%=rs("cname")%></td>
		</tr>
		<tr align='center' bgcolor='#FFFFFF'>
		  <td align='right'> 文章摘要：</td>
		  <td align='left'><textarea name="description" cols="89" rows="3" id="description"><%=rs("description")%></textarea></td>
		</tr>
		<tr align='center' bgcolor='#FFFFFF'>
		  <td align='right'> 关 键 字：</td>
		  <td align='left'><input name="keywords" type="text" id="keywords" value="<%=rs("keywords")%>" size="90">[ 使用 "," 间隔 ]</td>
		</tr>
		<tr align='center' bgcolor='#FFFFFF'>
		  <td align='right'> 文章图片：</td>
		  <td align='left'><input name="pic" type="text" id="pic" value="<%=rs("pic")%>" size="50"><iframe border=0 frameborder=0 framespacing=0 height=22 width=240 marginheight=0 marginwidth=0 name=new_pic noResize scrolling=no  src="upload.htm" vspale="0"></iframe></td>
		</tr>
        <tr align="center" bgcolor="#FFFFFF">
          <td width="10%" align="right">文章内容：</td>
          <td align="left"><textarea id="content_1" name="content" cols="100" rows="8" style="width:550px;height:300px;"><%=Server.HTMLEncode(rs("content"))%></textarea></td>
        </tr>	
		<tr align='center' bgcolor='#FFFFFF'>
		  <td align='right'> 录入时间：</td>
		  <td align='left'><input name="addtime" type="text" id="addtime" value="<%=rs("addtime")%>" size="30"> 编  辑：<input name="author" type="text" id="author" value="<%=rs("author")%>" size="15"></td>
		</tr>
		<tr align="center" bgcolor="#ebf0f7">
		  <td colspan="2">
		  <input type="hidden" name="action" value="yes">
          <input type="button" name="Submit2" value="提交" onClick="check()">
          <input type="button" name="Submit2" value="返回" onClick="history.back(-1)">
		  <input name="sid" type="hidden" id="sid" value="<%=rs("sid")%>">
		  <input name="cid" type="hidden" id="cid" value="<%=rs("cid")%>">
		  <input name="id" type="hidden" id="id" value="<%=rs("id")%>">
		  </td>
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