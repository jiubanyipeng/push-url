<!--#include file="inc/right.asp"--> 
<!--#include file="inc/conn.asp"-->
<script language=JavaScript>
<!--
function DoEmpty(params)
{
if (confirm("���Ҫɾ��������¼��ɾ����˼�¼����������ݶ�����ɾ�������޷��ָ���"))
window.location = params ;
}
//-->
</script>

<%
IF Request("wor")="del" Then
sql="delete from School where id="&Request("id")
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
   set rsCheck = conn.execute("select title from School where title='" & trim(Request.Form("title")) & "'")
     if not (rsCheck.bof and rsCheck.eof) then
      response.write "<script language='javascript'>alert('���� " & trim(Request.Form("title")) & " �Ѵ��ڣ����飡');history.back(-1);</script>"
      response.end
     end if
   set rsCheck=nothing
   sql="select * from School" 
   rs.open sql,conn,3,3
   rs.addnew 	
else
   sql="select * from School where id="&id&"" 
   rs.open sql,conn,1,2
end if
 rs("title")=Request("title")
 rs("pic") = Request("pic")
 rs("content")=Request("content")
 rs("cname")="School"
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
<script LANGUAGE="JavaScript">
function check()
{
  if (document.add.title.value=="")
     {
      alert("����д��ò���⣡")
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
%>
	<br>
      <table width="96%"  border="0" align="center" cellpadding="4" cellspacing="1" bgcolor="#aec3de">
        <form name="add" method="post" action="School.asp">
        <tr align="center" bgcolor="#F2FDFF">
          <td colspan="2"  class="optiontitle">��ӷ�ò</td>
        </tr>
		<tr align='center' bgcolor='#F2FDFF'>
		  <td align='right'> ��ò���⣺</td>
		  <td align='left'><input name="title" type="text" id="title" size="50"></td>
		</tr>
		<tr align='center' bgcolor='#FFFFFF'>
		  <td align='right'> ��òͼƬ��</td>
		  <td align='left'><input name="pic" type="text" id="pic" size="50"><iframe border=0 frameborder=0 framespacing=0 height=22 width=240 marginheight=0 marginwidth=0 name=new_pic noResize scrolling=no  src="upload.htm" vspale="0"></iframe></td>
		</tr>
        <tr align="center" bgcolor="#ebf0f7">
          <td  colspan="2" >
		     <INPUT TYPE="hidden" name="action" value="yes">
            <input type="button" name="Submit" value="�ύ" onClick="check()">
          	<input type="button" name="Submit2" value="����" onClick="history.back(-1)"></td>
        </tr>
		</FORM>
      </table> 
<%end if%>
<br>
<%if action="list" then%>
      <table width="96%"  border="0" align="center" cellpadding="4" cellspacing="1" bgcolor="#aec3de">
        <tr align="center" bgcolor="#F2FDFF">
          <td colspan="4"  class="optiontitle">��ò�б�</td>
        </tr>
        <tr align="center" bgcolor="#ebf0f7">
          <td width="5%">���</td>
          <td width="75%">��ò����</td>
          <td width="20%">ִ�в���</td>
        </tr>
		
<%
sql="select * from School order by id desc"
 set rs=server.createobject("adodb.recordset") 
 rs.open sql,conn,1,1
 if not rs.eof then
 proCount=rs.recordcount
	rs.PageSize=10
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
		  <td width="5%"><%=rs("id")%></td>
          <td align='left' ><%=rs("title")%></td>
          <td align='center'><img src="images/edit.gif" align="absmiddle"><a href="?action=edit&id=<%=rs("id")%>">�޸�</a> | <img src="images/drop.gif" align="absmiddle"><a href="javascript:DoEmpty('?wor=del&id=<%=rs("id")%>&action=list&ToPage=<%=intCurPage%>')">ɾ��</a></td>
        </tr>
<%
rs.movenext 
next
%>
        <tr align="center" bgcolor="#ebf0f7">
          <td colspan="4"> �ܹ���<font color="#ff0000"><%=rs.PageCount%></font>ҳ��<font color="#ff0000"><%=proCount%></font>����¼����ǰҳ��<font color="#ff0000"><%=intCurPage%> </font><%if intCurPage<>1 then%><a href="?action=list">��ҳ</a> | <a href="?action=list&ToPage=<%=intCurPage-1%>">��һҳ</a> | <% end if
if intCurPage<>rs.PageCount then %><a href="?action=list&ToPage=<%=intCurPage+1%>">��һҳ</a> | <a href="?action=list&ToPage=<%=rs.PageCount%>"> ���ҳ</a><% end if%></span></td>
        </tr>
<%
else
%>
        <tr align="center" bgcolor="#ffffff">
          <td colspan="4">�Բ���Ŀǰ���ݿ��л�û����ӷ�ò���ݣ�</td>
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
sql="select * from School where id="&Tid
rs.open sql,conn,1,1
if not rs.eof Then
%>
	  <table width="96%"  border="0" align="center" cellpadding="4" cellspacing="1" bgcolor="#aec3de">
       <form name="add" method="post" action="School.asp">
		<tr align="center" bgcolor="#F2FDFF">
		  <td colspan=2  class="optiontitle">�޸ķ�ò</td>
		</tr>
		<tr align='center' bgcolor='#F2FDFF'>
		  <td align='right'> ��ò���⣺</td>
		  <td align='left'><input name="title" type="text" id="title" value="<%=rs("title")%>" size="50"></td>
		</tr>
		<tr align='center' bgcolor='#FFFFFF'>
		  <td align='right'> ��òͼƬ��</td>
		  <td align='left'><input name="pic" type="text" id="pic" value="<%=rs("pic")%>" size="50"><iframe border=0 frameborder=0 framespacing=0 height=22 width=240 marginheight=0 marginwidth=0 name=new_pic noResize scrolling=no  src="upload.htm" vspale="0"></iframe></td>
		</tr>		
		<tr align="center" bgcolor="#ebf0f7">
		  <td colspan="2">
		  <input type="hidden" name="action" value="yes">
          <input type="button" name="Submit2" value="�ύ" onClick="check()">
          <input type="button" name="Submit2" value="����" onClick="history.back(-1)">
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