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
sql="delete from SClass where id="&Request("id")
Conn.execute(sql)
Response.Redirect "?action=list"
End IF
%>
<%
action=Request("action")
yn=Request("yn")
id=Request("id")
if action="yes" Then
 set rs=server.createobject("adodb.recordset") 
if id="" then
   sql="select * from SClass" 
   rs.open sql,conn,3,3
   rs.addnew
else
   sql="select * from SClass where id="&id&"" 
   rs.open sql,conn,1,2
end if
 rs("cname")=Request("cname")
 rs("tid")=Request("tid")
 rs("pid")=Request("pid")
 rs("content")=Request("content")
 rs("keywords")=Request("keywords")
 rs("description")=Request("description")
 rs("IsMenu")=Request("IsMenu")
 rs("yn")=Request("yn")
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
      alert("����д���ű��⣡")
      document.add.title.focus()
      document.add.title.select()
      return
     }

     document.add.submit()
}
</SCRIPT>
<style type="text/css">
<!--
.r2 {padding:0 7px; }
-->
</style>
</head>
<body>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr valign="top">
    <td bgcolor="#FFFFFF">
<%
if action="add" and yn=0 then	
%>
	<br>
      <table width="96%"  border="0" align="center" cellpadding="4" cellspacing="1" bgcolor="#aec3de">
        <form name="add" method="post" action="SClass.asp">
        <tr align="center" bgcolor="#F2FDFF">
          <td colspan="2"  class="optiontitle">�����Ŀ</td>
        </tr>
		<tr align='center' bgcolor='#F2FDFF'>
		  <td align='right'>�������ƣ�</td>
		  <td align='left'><input name="cname" type="text" id="cname" size="50"></td>
		</tr>
		<tr align='center' bgcolor='#FFFFFF'>
		  <td align='right'> ��Ŀ˳��</td>
		  <td align='left'><input name="pid" type="text" id="pid" value="20" size="5" maxlength="2"></td>
		</tr>
		<tr align='center' bgcolor='#FFFFFF'>
		  <td align='right'>���ӵ�ַ��</td>
		  <td align='left'><input name="content" type="text" id="content" value="http://" size="50"> (ֱ��д��url����: http://www.xiao5u.com) </td>
		</tr>
		<tr align='center' bgcolor='#FFFFFF'>
          <td align='right'>��������ʾ��</td>
          <td align='left'>
		  <input name="IsMenu" type="radio" value="1" checked>��
          <input name="IsMenu" type="radio" value="0">��</td>
        </tr>
        <tr align="center" bgcolor="#ebf0f7">
          <td  colspan="2" >
		    <input type="hidden" name="action" value="yes"><input type="hidden" name="tid" value="0"><input type="hidden" name="yn" value="0">
            <input type="button" name="Submit" value="�ύ" onClick="check()">
          	<input type="button" name="Submit2" value="����" onClick="history.back(-1)"></td>
        </tr>
		</FORM>
      </table> 
<%end if%>
<%
if action="add" and yn=1 then
%>
<script type="text/javascript" charset="utf-8" src="../Editor/kindeditor.js"></script>
<script type="text/javascript">
    KE.show({
        id : 'content_1'
    });
</script>
	<br>
      <table width="96%"  border="0" align="center" cellpadding="4" cellspacing="1" bgcolor="#aec3de">
        <form name="add" method="post" action="SClass.asp">
        <tr align="center" bgcolor="#F2FDFF">
          <td colspan="2"  class="optiontitle">�����Ŀ</td>
        </tr>
		<tr align='center' bgcolor='#F2FDFF'>
		  <td align='right'> �������ƣ�</td>
		  <td align='left'><input name="cname" type="text" id="cname" size="50"></td>
		</tr>
		<tr align='center' bgcolor='#FFFFFF'>
		  <td align='right'> ��Ŀ˳��</td>
		  <td align='left'><input name="pid" type="text" id="pid" value="20" size="5" maxlength="2"></td>
		</tr>
		<tr align='center' bgcolor='#FFFFFF'>
		  <td align='right'> �������ݣ�</td>
		  <td align='left'><textarea id="content_1" name="content" cols="100" rows="8" style="width:550px;height:300px;"></textarea></td>
		</tr>
		<tr align='center' bgcolor='#FFFFFF'>
          <td align='right'>��������ʾ��</td>
          <td align='left'>
		  <input name="IsMenu" type="radio" value="1" checked>��
          <input name="IsMenu" type="radio" value="0">��</td>
        </tr>
        <tr align="center" bgcolor="#ebf0f7">
          <td  colspan="2" >
		    <input type="hidden" name="action" value="yes"><input type="hidden" name="tid" value="0"><input type="hidden" name="yn" value="1">
            <input type="button" name="Submit" value="�ύ" onClick="check()">
          	<input type="button" name="Submit2" value="����" onClick="history.back(-1)"></td>
        </tr>
		</FORM>
      </table> 
<%end if%>
<%
if action="add" and yn=2 then
%>
	<br>
      <table width="96%"  border="0" align="center" cellpadding="4" cellspacing="1" bgcolor="#aec3de">
        <form name="add" method="post" action="SClass.asp">
        <tr align="center" bgcolor="#F2FDFF">
          <td colspan="2"  class="optiontitle">�����Ŀ</td>
        </tr>
		<tr align='center' bgcolor='#F2FDFF'>
		  <td align='right'> ��Ŀ���ƣ�</td>
		  <td align='left'><input name="cname" type="text" id="cname" size="50"></td>
		</tr>
		<tr align='center' bgcolor='#FFFFFF'>
		  <td align='right'> ��Ŀ���ƣ�</td>
		  <td align='left'>
		  <%
          Set rsClass = Server.CreateObject("ADODB.Recordset")
          rsClass.open "select * from SClass where yn=2 order by tid asc",Conn,1,2
          %>
		  <SELECT name='tid' id="tid">
          <option value="0">һ����Ŀ</option>
		  <%
		  j=1
		  do while not rsClass.eof
		  %>
		  <option value="<%=rsClass("id")%>"><%=rsClass("cname")%></option>
          <%
			j=j+1
			rsClass.movenext
			loop
			set rsClass=nothing
		  %>
		  </SELECT></td>
		</tr>
		<tr align='center' bgcolor='#FFFFFF'>
		  <td align='right'> ��Ŀ˳��</td>
		  <td align='left'><input name="pid2" type="text" id="pid2" value="20" size="5" maxlength="2"></td>
		</tr>
		<tr align='center' bgcolor='#FFFFFF'>
		  <td align='right'> ��Ŀ�ؼ��֣�</td>
		  <td align='left'><input name="keywords" type="text" id="keywords" size="100"></td>
		</tr>
		<tr align='center' bgcolor='#FFFFFF'>
		  <td align='right'> ��Ŀ������</td>
		  <td align='left'><textarea name="description" cols="100" rows="3" id="description"></textarea></td>
		</tr>
		<tr align='center' bgcolor='#FFFFFF'>
          <td align='right'>��������ʾ��</td>
          <td align='left'>
		  <input name="IsMenu" type="radio" value="1" checked>��
          <input name="IsMenu" type="radio" value="0">��</td>
        </tr>
        <tr align="center" bgcolor="#ebf0f7">
          <td  colspan="2" >
		    <input type="hidden" name="action" value="yes"><input type="hidden" name="yn" value="2">
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
          <td colspan="8"  class="optiontitle">��Ŀ�б�</td>
        </tr>
        <tr align="center" bgcolor="#ebf0f7">
          <td width="30%">��Ŀ����</td>
          <td width="10%">��ĿID</td>
          <td width="10%">����</td>
          <td width="10%">���</td>
          <td width="10%">�˵���ʾ</td>
          <td width="20%">��ҳ����ShowArticle(��Ŀ,��ʾ��)</td>
          <td colspan="2">����</td>
        </tr>
	 <%
	  dim sql,rsBigClass,rsSmallClass,ErrMsg
	  set rsBigClass=server.CreateObject("adodb.recordset")
	  rsBigClass.open "Select * From SClass where tid=0 order by pid asc",conn,1,3
	 %>
	 <%
	  do while not rsBigClass.eof
	 %>
        <tr align="center" bgcolor="#F2FDFF">
          <td><img src="images/tree1.gif" width="15" height="15"><%=rsBigClass("cname")%></td>
          <td><b><%=rsBigClass("id")%></b></td>
          <td><%=rsBigClass("pid")%></td>
          <td><%if rsBigClass("yn")=0 then Response.Write("<font color=blue>������</font>") else if rsBigClass("yn")=1 then Response.Write("<font color=orange>�ļ���</font>") else Response.Write("<font color=green>���ϼ�</font>") end if%></td>
          <td><%if rsBigClass("IsMenu")=1 then Response.Write("<font color=red>��</font>") else Response.Write("��") end if%></td>
          <td><%if rsBigClass("yn")=0 then Response.Write(" ") else Response.Write("&lt;%ShowArticle("&rsBigClass("id")&",8)%&gt;") end if%>  </td>
          <td><a href="?action=edit&yn=<%=rsBigClass("yn")%>&id=<%=rsBigClass("id")%>">�޸�</a></td>
          <td><a href="javascript:DoEmpty('?wor=del&id=<%=rsBigClass("id")%>&action=list&ToPage=<%=intCurPage%>')">ɾ��</a></td>
        </tr>
    <%
	  set rsSmallClass=server.CreateObject("adodb.recordset")
	  rsSmallClass.open "Select * From SClass where tid="&rsBigClass("id")&"",conn,1,3
	  if not(rsSmallClass.bof and rsSmallClass.eof) then
	  do while not rsSmallClass.eof
	%>
        <tr align='center' bgcolor='#FFFFFF' onmouseover='this.style.background="#F2FDFF"' onmouseout='this.style.background="#FFFFFF"'>
          <td height="22"> &nbsp;&nbsp;&nbsp;&nbsp;<img src="images/tree2.gif" width="15" height="15"><%=rsSmallClass("cname")%></td>
          <td><b><%=rsSmallClass("id")%></b></td>
          <td><%=rsSmallClass("pid")%></td>
          <td><%if rsSmallClass("yn")=2 then Response.Write("���ϼ�") else Response.Write("") end if%></td>
          <td><%if rsSmallClass("IsMenu")=1 then Response.Write("<font color=red>��</font>") else Response.Write("��") end if%></td>
          <td>&lt;%<%response.write"ShowArticle("&rsSmallClass("id")&",2)"%>%&gt;</td>
          <td><a href="?action=edit&yn=<%=rsSmallClass("yn")%>&id=<%=rsSmallClass("id")%>">�޸�</a></td>
          <td><a href="javascript:DoEmpty('?wor=del&id=<%=rsSmallClass("id")%>&action=list&ToPage=<%=intCurPage%>')">ɾ��</a></td>
        </tr>
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
      </table>
	  <br>
      <table width="96%"  border="0" align="center" cellpadding="4" cellspacing="1" bgcolor="#aec3de">
        <tr align="center" bgcolor="#F2FDFF">
          <td  class="optiontitle">�����Ŀ</td>
        </tr>
		<form action="?action=add" method="post">
        <tr align="center" bgcolor="#FFFFFF">
          <td>
		  <input type="radio" name="yn" value="1"><font color="blue">�ļ���</font>
	      <input type="radio" name="yn" value="0"><font color="orange">������</font>
	      <input type="radio" name="yn" value="2" checked="true"><font color="green">���ϼ�</font>
	      <input type="submit" name="submit" value="ȷ�����"></td>
        </tr>
		</form>
        <tr bgcolor="#FFFFFF">
          <td>
		  <font color="blue">�ļ���</font>��һ��ͼ�Ĳ�ï��ҳ�档�磺ѧУ��顢��ϵ��ʽ�ɲ��ø�ģʽ��<br>
          <font color="orange">������</font>���������������ϵ���һ��ַ���ӱ�վ�����ӡ�<br>
		  <font color="green">���ϼ�</font>������ʽ��������Ŀ��ʾ���磺֪ͨ���桢У԰��Ѷ�ɲ��ñ�ģʽ��<br>
		  <font color="red">��ҵ�棺�����˵������������Ŀ���¡���ҳ���ࡢ�����ϴ�����</font>
        </td>
        </tr>
      </table>
	  <br>
<%end if%>
<%if action="edit" and yn=0 then
set rs=server.createobject("adodb.recordset") 
id=Request("id")
sql="select * from SClass where id="&id
rs.open sql,conn,1,1
if not rs.eof Then
%>
	  <table width="96%"  border="0" align="center" cellpadding="4" cellspacing="1" bgcolor="#aec3de">
       <form name="add" method="post" action="SClass.asp">
		<tr align="center" bgcolor="#F2FDFF">
		  <td colspan=2  class="optiontitle">�޸���Ŀ</td>
		</tr>
		<tr align='center' bgcolor='#F2FDFF'>
		  <td align='right'>�������ƣ�</td>
		  <td align='left'><input name="cname" type="text" id="cname" value="<%=rs("cname")%>" size="50"></td>
		</tr>
		<tr align='center' bgcolor='#FFFFFF'>
		  <td align='right'> ��Ŀ˳��</td>
		  <td align='left'><input name="pid" type="text" id="pid" value="<%=rs("pid")%>" size="5" maxlength="2"></td>
		</tr>
		<tr align='center' bgcolor='#FFFFFF'>
		  <td align='right'>���ӵ�ַ��</td>
		  <td align='left'><input name="content" type="text" id="content" value="<%=rs("content")%>" size="50"></td>
		</tr>
		<tr align='center' bgcolor='#FFFFFF'>
          <td align='right'>��������ʾ��</td>
          <td align='left'>
		  <input name="IsMenu" type="radio" value="1" <%If rs("IsMenu")=1 then Response.Write(" checked") end if%>>��
          <input name="IsMenu" type="radio" value="0" <%If rs("IsMenu")=0 then Response.Write(" checked") end if%>>��</td>
        </tr>	
		<tr align="center" bgcolor="#ebf0f7">
		  <td colspan="2">
		  <input type="hidden" name="action" value="yes"><input type="hidden" name="tid" value="0"><input type="hidden" name="yn" value="0">
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
<%if action="edit" and yn=1 then
set rs=server.createobject("adodb.recordset") 
id=Request("id")
sql="select * from SClass where id="&id
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
       <form name="add" method="post" action="SClass.asp">
		<tr align="center" bgcolor="#F2FDFF">
		  <td colspan=2  class="optiontitle">�޸���Ŀ</td>
		</tr>
		<tr align='center' bgcolor='#F2FDFF'>
		  <td align='right'>�������ƣ�</td>
		  <td align='left'><input name="cname" type="text" id="cname" value="<%=rs("cname")%>" size="50"></td>
		</tr>
		<tr align='center' bgcolor='#FFFFFF'>
		  <td align='right'> ��Ŀ˳��</td>
		  <td align='left'><input name="pid" type="text" id="pid" value="<%=rs("pid")%>" size="5" maxlength="2"></td>
		</tr>
		<tr align='center' bgcolor='#FFFFFF'>
		  <td align='right'>�������ݣ�</td>
		  <td align='left'><textarea id="content_1" name="content" cols="100" rows="8" style="width:550px;height:300px;"><%=Server.HTMLEncode(rs("Content"))%></textarea></td>
		</tr>
		<tr align='center' bgcolor='#FFFFFF'>
          <td align='right'>��������ʾ��</td>
          <td align='left'>
		  <input name="IsMenu" type="radio" value="1" <%If rs("IsMenu")=1 then Response.Write(" checked") end if%>>��
          <input name="IsMenu" type="radio" value="0" <%If rs("IsMenu")=0 then Response.Write(" checked") end if%>>��</td>
        </tr>	
		<tr align="center" bgcolor="#ebf0f7">
		  <td colspan="2">
		  <input type="hidden" name="action" value="yes"><input type="hidden" name="tid" value="0"><input type="hidden" name="yn" value="1">
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
<%if action="edit" and yn=2 then
set rs=server.createobject("adodb.recordset") 
id=Request("id")
sql="select * from SClass where id="&id
rs.open sql,conn,1,1
if not rs.eof Then
%>
	  <table width="96%"  border="0" align="center" cellpadding="4" cellspacing="1" bgcolor="#aec3de">
       <form name="add" method="post" action="SClass.asp">
		<tr align="center" bgcolor="#F2FDFF">
		  <td colspan=2  class="optiontitle">�޸���Ŀ</td>
		</tr>
		<tr align='center' bgcolor='#F2FDFF'>
		  <td align='right'> ��Ŀ���ƣ�</td>
		  <td align='left'><input name="cname" type="text" id="cname" value="<%=rs("cname")%>" size="50"></td>
		</tr>
		<tr align='center' bgcolor='#FFFFFF'>
		  <td align='right'> ��Ŀ���ƣ�</td>
		  <td align='left'>
		  <%
          Set rsClass = Server.CreateObject("ADODB.Recordset")
          rsClass.open "select * from SClass where Tid=0 order by tid asc",Conn,1,2
          %>
		  <SELECT name='tid' id="tid">
          <option value="0">һ����Ŀ</option>
		  <%
		  j=1
		  do while not rsClass.eof
		  %>
		  <option value="<%=rsClass("id")%>" <%if rs("tid")=rsClass("id") then response.write " selected"%>><%=rsClass("cname")%></option>
          <%
			j=j+1
			rsClass.movenext
			loop
			set rsClass=nothing
		  %>
		  </SELECT></td>
		</tr>
		<tr align='center' bgcolor='#FFFFFF'>
		  <td align='right'> ��Ŀ˳��</td>
		  <td align='left'><input name="pid" type="text" id="pid" value="<%=rs("pid")%>" size="5" maxlength="2"></td>
		</tr>
		<tr align='center' bgcolor='#FFFFFF'>
		  <td align='right'> ��Ŀ�ؼ��֣�</td>
		  <td align='left'><input name="keywords" type="text" id="keywords" value="<%=rs("keywords")%>" size="100"></td>
		</tr>
		<tr align='center' bgcolor='#FFFFFF'>
		  <td align='right'> ��Ŀ������</td>
		  <td align='left'><textarea name="description" cols="100" rows="3" id="description"><%=rs("description")%></textarea></td>
		</tr>
		<tr align='center' bgcolor='#FFFFFF'>
          <td align='right'>��������ʾ��</td>
          <td align='left'>
		  <input name="IsMenu" type="radio" value="1" <%If rs("IsMenu")=1 then Response.Write(" checked") end if%>>��
          <input name="IsMenu" type="radio" value="0" <%If rs("IsMenu")=0 then Response.Write(" checked") end if%>>��</td>
        </tr>	
		<tr align="center" bgcolor="#ebf0f7">
		  <td colspan="2">
		  <input type="hidden" name="action" value="yes"><input type="hidden" name="yn" value="2">
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