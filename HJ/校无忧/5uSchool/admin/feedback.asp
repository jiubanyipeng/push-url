<!--#include file="inc/right.asp"--> 
<!--#include file="inc/conn.asp"-->
<script language=JavaScript>
<!--
function DoEmpty(params)
{
if (confirm("���Ҫɾ��������¼��ɾ����˼�¼�ｫ���޷��ָ���"))
window.location = params ;
}
//-->
</script>
<%
IF Request("wor")="del" Then
sql="delete from Feedback where id="&Request("id")
Conn.execute(sql)
Response.Redirect "?action=list"
End IF
%>
<%
action=Request("action")
id=Request("id")
if action="yes" Then
 set rs=server.createobject("adodb.recordset") 
 sql="select * from Feedback where id="&id&"" 
 rs.open sql,conn,1,2
 rs("reply")=Request("reply")
 rs("chk")=1
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
  if (document.add.reply.value=="")
     {
      alert("�ظ����ݲ���Ϊ�գ�")
      document.add.reply.focus()
      document.add.reply.select()
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
<br>
<%if action="list" then%>
      <table width="96%"  border="0" align="center" cellpadding="4" cellspacing="1" bgcolor="#aec3de">
        <tr align="center" bgcolor="#F2FDFF">
          <td colspan="6"  class="optiontitle">�����б�</td>
        </tr>
        <tr align="center" bgcolor="#ebf0f7">
          <td width="5%">���</td>
          <td width="5%">״̬</td>
          <td width="40%">���Ա���</td>
          <td width="10%">������</td>
          <td width="20%">����ʱ��</td>
          <td width="20%">ִ�в���</td>
        </tr>
		
<%
menu=Request("menu")
if menu<>"" then
    sql="select * from Feedback where chk="&menu&" order by id desc"
else
	sql="select * from Feedback order by id desc"
end if
 set rs=server.createobject("adodb.recordset") 
 rs.open sql,conn,1,1
 if not rs.eof then
 proCount=rs.recordcount
	rs.PageSize=20
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
		  <td><%if rs("chk")=0 then%><IMG alt=δ������ src="images/msg_new.gif">
              <%elseif rs("chk")=1 then%><IMG alt=�Ѷ����� src="images/msg_old.gif">
	          <%end if%></td>
          <td align='left' ><%=rs("title")%></td>
		  <td><%=rs("person")%></td>
		  <td><%=rs("sendtime")%></td>
          <td><img src="images/edit.gif" align="absmiddle"><a href="?action=edit&id=<%=rs("id")%>">�鿴</a> | <img src="images/drop.gif" align="absmiddle"><a href="javascript:DoEmpty('?wor=del&id=<%=rs("id")%>&action=list&ToPage=<%=intCurPage%>')">ɾ��</a></td>
        </tr>
<%
rs.movenext 
next
%>
        <tr align="center" bgcolor="#ebf0f7">
          <td colspan="6"> �ܹ���<font color="#ff0000"><%=rs.PageCount%></font>ҳ��<font color="#ff0000"><%=proCount%></font>����¼����ǰҳ��<font color="#ff0000"><%=intCurPage%> </font><%if intCurPage<>1 then%><a href="?action=list">��ҳ</a> | <a href="?action=list&ToPage=<%=intCurPage-1%>">��һҳ</a> | <% end if
if intCurPage<>rs.PageCount then %><a href="?action=list&ToPage=<%=intCurPage+1%>">��һҳ</a> | <a href="?action=list&ToPage=<%=rs.PageCount%>"> ���ҳ</a><% end if%></span></td>
        </tr>
        <tr align="center" bgcolor="#ffffff">
          <td colspan="6"><SPAN><IMG alt=δ������ src="images/msg_new.gif" align=absMiddle></SPAN> <a href="?action=list&menu=0">δ������</a> <span><img alt=�Ѷ����� src="images/msg_old.gif" align=absMiddle> </span><a href="?action=list&menu=1">�Ѷ�����</a> <a href="?action=list">ȫ������</a></td>
        </tr>
<%
else
%>
        <tr align="center" bgcolor="#ffffff">
          <td colspan="6">�Բ���Ŀǰ���ݿ��л�û������������ݣ�</td>
        </tr>
<%
rs.close
set rs=nothing
end if
%>
      </table>
<%end if%>
<%if action="edit" then
set rs=server.createobject("adodb.recordset") 
Tid=Request("id")
sql="select * from Feedback where id="&Tid
rs.open sql,conn,1,1
if not rs.eof Then
%>
	  <table width="96%"  border="0" align="center" cellpadding="4" cellspacing="1" bgcolor="#aec3de">
       <form name="add" method="post" action="Feedback.asp">
		<tr align="center" bgcolor="#F2FDFF">
		  <td colspan=2  class="optiontitle">���Իظ�</td>
		</tr>
        <tr bgcolor="#FFFFFF">
          <td colspan="2"> ������Ϣ�� <font color="#FF6600"><%=rs("person")%></font> ������ <%=rs("sendtime")%></td>
          </tr>
		<tr bgcolor='#F2FDFF'>
		  <td align='right' width="10%">�������⣺</td>
		  <td><%=rs("title")%></td>
		</tr>
		<tr bgcolor='#FFFFFF'>
		  <td align="right">��ϵ��ʽ��</td>
		  <td><%=rs("tel")%> E-mail��<%=rs("email")%></td>
		</tr>
        <tr bgcolor="#FFFFFF">
          <td align="right">�������ݣ�</td>
          <td ><%=rs("content")%></td>
        </tr>
        <tr align="center" bgcolor="#FFFFFF">
          <td width="10%" align="right">�ظ����ݣ�</td>
          <td align="left"><textarea name="reply" cols="80" rows="4"><%=rs("reply")%></textarea></td>
        </tr>	
		<tr align="center" bgcolor="#ebf0f7">
		  <td colspan="2">
		  <input type="hidden" name="action" value="yes">
          <input type="button" name="Submit2" value="�ظ�" onClick="check()">
          <input type="button" name="Submit2" value="����" onClick="location='Feedback.asp?action=list'">
		  <input name="id" type="hidden" id="id" value="<%=rs("id")%>"></td>
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