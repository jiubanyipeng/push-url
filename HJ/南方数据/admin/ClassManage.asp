<%@language=vbscript codepage=936 %>
<!--#include file="Admin.asp"-->
<!--#include file="Conn.asp"-->
<%
dim sql,rsBigClass,rsSmallClass,ErrMsg
set rsBigClass=server.CreateObject("adodb.recordset")
rsBigClass.open "Select * From BigClass",conn,1,3
%>
<script language="JavaScript" type="text/JavaScript">
function checkBig()
{
  if (document.form1.BigClassName.value=="")
  {
    alert("大类名称不能为空！");
    document.form1.BigClassName.focus();
    return false;
  }
}
function checkSmall()
{
  if (document.form2.BigClassName.value=="")
  {
    alert("请先添加大类名称！");
	document.form1.BigClassName.focus();
	return false;
  }

  if (document.form2.SmallClassName.value=="")
  {
    alert("小类名称不能为空！");
	document.form2.SmallClassName.focus();
	return false;
  }
}
function ConfirmDelBig()
{
   if(confirm("确定要删除此大类吗？删除此大类同时将删除所包含的小类，并且不能恢复！"))
     return true;
   else
     return false;
	 
}

function ConfirmDelSmall()
{
   if(confirm("确定要删除此小类吗？一旦删除将不能恢复！"))
     return true;
   else
     return false;
	 
}
</script>
<!-- #include file="Inc/Head.asp" -->
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
  <tr> 
    <td width="150" align="center" valign="top"> <table width="150" height="100%" border="0" cellpadding="0" cellspacing="0" class="HeaderTdStyle">
        <tr> 
          <td align="center" valign="top"><table width="100%" height="24" border="0" cellpadding="0" cellspacing="0">
              <tr> 
                <td align="center">功能菜单</td>
              </tr>
            </table>
            <table width="100%" height="90%" border="0" cellpadding="0" cellspacing="0" class="MenuBg">
              <tr> 
                <td align="center" valign="top"><br> <table width="90%" border="0" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td width="16%"><img src="../Img/Left_1.gif" width="28" height="11"></td>
                      <td width="84%" height="20"><font color="#FFFF00">产品管理</font></td>
                    </tr>
                  </table>
                  <table width="90%" border="0" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td width="34%" height="20" align="right"><img src="../Img/Left_1_1.gif" width="29" height="16"></td>
                      <td width="66%" valign="bottom"><a href="ClassManage.asp"><font color="#FFFF00">产品类别设置</font></a></td>
                    </tr>
                  </table>
                  <table width="90%" border="0" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td width="34%" height="20" align="right"><img src="../Img/Left_1_1.gif" width="29" height="16"></td>
                      <td width="66%" valign="bottom"><a href="ArticleManage.asp"><font color="#FFFF00">产品管理</font></a></td>
                    </tr>
                  </table>
                  <table width="90%" border="0" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td width="34%" height="20" align="right"><img src="../Img/Left_1_1.gif" width="29" height="16"></td>
                      <td width="66%" valign="bottom"><a href="ArticleAdd.asp"><font color="#FFFF00">添加产品</font></a></td>
                    </tr>
                  </table>
                  <table width="90%" border="0" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td width="34%" height="20" align="right"><img src="../Img/Left_1_1.gif" width="29" height="16"></td>
                      <td width="66%" valign="bottom"><a href="ArticleCheck.asp"><font color="#FFFF00">审核产品</font></a></td>
                    </tr>
                  </table></td>
              </tr>
            </table></td>
        </tr>
      </table></td>
    <td align="center" valign="top">
	<br>
      <br>
      <a href="Manage_Product1.asp"><strong>产 品 类 别 设 置</strong></a> <br>
      <br>
      管理选项：<a href="ClassAddBig.asp">添加产品大类</a><br>
      <br>
      <br>
      <table width="414" border="0" cellpadding="0" cellspacing="2" class="border">
        <tr bgcolor="#999999" class="title"> 
          <td width="160" height="25" align="center"><strong>栏目名称</strong></td>
          <td width="251" height="20" align="center"><strong>操作选项</strong></td>
        </tr>
        <%
	do while not rsBigClass.eof
%>
        <tr bgcolor="#E3E3E3" class="tdbg"> 
          <td width="160" height="22" bgcolor="#C0C0C0"><img src="../Images/tree_folder4.gif" width="15" height="15"><%=rsBigClass("BigClassName")%></td>
          <td align="center" bgcolor="#C0C0C0"><a href="ClassAddSmall.asp?BigClassName=<%=rsBigClass("BigClassName")%>">添加子栏目</a> 
            | <a href="ClassModifyBig.asp?BigClassID=<%=rsBigClass("BigClassID")%>">修改</a> 
            | <a href="ClassDelBig.asp?BigClassName=<%=rsBigClass("BigClassName")%>" onClick="return ConfirmDelBig();">删除</a></td>
        </tr>
        <%
	  set rsSmallClass=server.CreateObject("adodb.recordset")
	  rsSmallClass.open "Select * From SmallClass Where BigClassName='" & rsBigClass("BigClassName") & "'",conn,1,3
	  if not(rsSmallClass.bof and rsSmallClass.eof) then
		do while not rsSmallClass.eof
	%>
        <tr bgcolor="#E3E3E3" class="tdbg"> 
          <td width="160" height="22">&nbsp;&nbsp;<img src="../Images/tree_folder3.gif" width="15" height="15"><%=rsSmallClass("SmallClassName")%></td>
          <td align="center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
            <a href="ClassModifySmall.asp?SmallClassID=<%=rsSmallClass("SmallClassID")%>">修改</a> 
            | <a href="ClassDelSmall.asp?SmallClassID=<%=rsSmallClass("SmallClassID")%>" onClick="return ConfirmDelSmall();">删除</a></td>
        </tr>
        <%
			rsSmallClass.movenext
		loop
	  end if
	  rsSmallClass.close
	  set rsSmallClass=nothing	
	  rsBigClass.movenext
	loop
%>
      </table> </td>
  </tr>
</table>
<!-- #include file="Inc/Foot.asp" -->

<%
rsBigClass.close
set rsBigClass=nothing
call CloseConn()
%>