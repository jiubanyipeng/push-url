<%@language=vbscript codepage=936 %>
<!--#include file="Admin.asp"-->
<!--#include file="Conn.asp"-->
<!-- #include file="Inc/Head.asp" -->
<%
dim sql,rsBigClass,rsSmallClass,ErrMsg
set rsBigClass=server.CreateObject("adodb.recordset")
rsBigClass.open "Select * From BigClass_New",conn,1,3
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
   if(confirm("确定要删除此大类吗？删除此大类同时将删除所包含的小类和该类下的所有新闻，并且不能恢复！"))
     return true;
   else
     return false;
	 
}

function ConfirmDelSmall()
{
   if(confirm("确定要删除此小类吗？删除此小类同时将删除该类下的所有新闻，并且不能恢复！"))
     return true;
   else
     return false;
	 
}
</script>
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
  <tr> 
    <td width="150" align="center" valign="top"> <table width="150" height="100%" border="0" cellpadding="0" cellspacing="0" class="HeaderTdStyle">
        <tr> 
          <td align="center" valign="top"><table width="100%" height="24" border="0" cellpadding="0" cellspacing="0">
              <tr> 
                <td align="center">系统管理</td>
              </tr>
            </table>
            <table width="100%" height="90%" border="0" cellpadding="0" cellspacing="0" class="MenuBg">
              <tr> 
                <td align="center" valign="top"><br> <table width="90%" border="0" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td width="16%"><img src="../Img/Left_1.gif" width="28" height="11"></td>
                      <td width="84%" height="20"><font color="#FFFF00">系统管理</font></td>
                    </tr>
                  </table>
                  <table width="90%" border="0" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td width="34%" height="20" align="right"><img src="../Img/Left_1_1.gif" width="29" height="16"></td>
                      <td width="66%" valign="bottom"><a href="admin_addinfo.asp">添加新闻内容</a><a href="Manage_Admin.asp"></a></td>
                    </tr>
                  </table>
                  <table width="90%" border="0" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td width="34%" height="20" align="right"><img src="../Img/Left_1_1.gif" width="29" height="16"></td>
                      <td width="66%" valign="bottom"><a href="Manage_news.asp">管理全部新闻</a><a href="Manage_backup.asp"></a></td>
                    </tr>
                  </table>
                  <table width="90%" border="0" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td width="34%" height="20" align="right"><img src="../Img/Left_1_1.gif" width="29" height="16"></td>
                      <td width="66%" valign="bottom"><a href="News_ClassManage.asp">管理新闻类别</a></td>
                    </tr>
                  </table>
                  
                </td>
              </tr>
            </table></td>
        </tr>
      </table></td>
    <td align="center" valign="top"><table width="90" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr> 
    <td align="center" valign="top"><br>
            <a href="News_ClassAddBig.asp"><strong><font color="#FF0000"><u>添加新闻一级分类</u></font></strong></a><br>
      <br> 
      <table width="500" border="0" cellpadding="0" cellspacing="1" bgcolor="#000000">
              <tr> 
          <td width="50%" height="30" align="center" bgcolor="#999999"><strong>栏目名称</strong></td>
          <td height="30" align="center" bgcolor="#999999"><strong>操作选项</strong></td>
        </tr>
        <%
	do while not rsBigClass.eof
%>
        <tr bgcolor="#E3E3E3" class="tdbg"> 
                <td width="233" height="22" bgcolor="#C0C0C0"><img src="../Images/tree_folder4.gif" width="15" height="15"><%=rsBigClass("BigClassName")%></td>
          <td align="right" bgcolor="#C0C0C0" style="padding-right:10"><a href="News_ClassAddSmall.asp?BigClassName=<%=rsBigClass("BigClassName")%>"><font color="#FF0000">添加二级分类</font></a> 
            | <a href="News_ClassModifyBig.asp?BigClassID=<%=rsBigClass("BigClassID")%>">修改</a> 
            | <a href="News_ClassDelBig.asp?BigClassName=<%=rsBigClass("BigClassName")%>" onClick="return ConfirmDelBig();">删除</a></td>
        </tr>
        <%
	  set rsSmallClass=server.CreateObject("adodb.recordset")
	  rsSmallClass.open "Select * From SmallClass_New Where BigClassName='" & rsBigClass("BigClassName") & "'",conn,1,1
	  if not(rsSmallClass.bof and rsSmallClass.eof) then
		do while not rsSmallClass.eof
	%>
        <tr bgcolor="#EAEAEA" class="tdbg"> 
                <td width="233" height="22">&nbsp;&nbsp;<img src="../Images/tree_folder3.gif" width="15" height="15"><%=rsSmallClass("SmallClassName")%></td>
          <td align="right" style="padding-right:10"><a href="News_ClassModifySmall.asp?SmallClassID=<%=rsSmallClass("SmallClassID")%>">修改</a> 
            | <a href="News_ClassDelSmall.asp?SmallClassID=<%=rsSmallClass("SmallClassID")%>&SmallClassName=<%=rsSmallClass("SmallClassName")%>" onClick="return ConfirmDelSmall();">删除</a></td>
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
      </table>
      <br>
    </td>
  </tr>
</table>
<%
rsBigClass.close
set rsBigClass=nothing
%>
</td>
  </tr>
</table>
<!-- #include file="Inc/Foot.asp" -->