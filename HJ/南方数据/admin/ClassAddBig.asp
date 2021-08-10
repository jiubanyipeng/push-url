<%@language=vbscript codepage=936 %>
<!--#include file="Admin.asp"-->
<!--#include file="Conn.asp"-->
<!--#include file="Inc/Function.asp"-->
<%
dim Action,BigClassName,rs,FoundErr,ErrMsg
Action=trim(Request("Action"))
BigClassName=trim(request("BigClassName"))
if Action="Add" then
	if BigClassName="" then
		FoundErr=True
		ErrMsg=ErrMsg & "<br><li>文章大类名不能为空！</li>"
	end if
	if FoundErr<>True then
		Set rs=Server.CreateObject("Adodb.RecordSet")
		rs.open "Select * From BigClass Where BigClassName='" & BigClassName & "'",conn,1,3
		if not (rs.bof and rs.EOF) then
			FoundErr=True
			ErrMsg=ErrMsg & "<br><li>文章大类“" & BigClassName & "”已经存在！</li>"
		else
    	 	rs.addnew
     		rs("BigClassName")=BigClassName
    	 	rs.update
     		rs.Close
	     	set rs=Nothing
    	 	call CloseConn()
			Response.Redirect "ClassManage.asp"  
		end if
	end if
end if
if FoundErr=True then
	call WriteErrMsg()
else
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
      <br><form name="form1" method="post" action="ClassAddBig.asp" onsubmit="return checkBig()">
        <table width="350" border="0" align="center" cellpadding="0" cellspacing="2" class="border">
          <tr bgcolor="#999999" class="title"> 
            <td height="25" colspan="2" align="center"><strong>添加大类</strong></td>
          </tr>
          <tr bgcolor="#E3E3E3" class="tdbg"> 
            <td width="126" height="22" bgcolor="#C0C0C0"> 
              <div align="right"><strong>大类名称：</strong></div></td>
            <td width="218" bgcolor="#E3E3E3"> 
              <input name="BigClassName" type="text" size="20" maxlength="30">
            </td>
          </tr>
          <tr bgcolor="#C0C0C0" class="tdbg"> 
            <td height="22" align="center" bgcolor="#C0C0C0">&nbsp; </td>
            <td height="22" align="center" bgcolor="#E3E3E3"> 
              <div align="left">
                <input name="Action" type="hidden" id="Action" value="Add">
                <input name="Add" type="submit" value=" 添 加 ">
              </div></td>
          </tr>
        </table>
</form> </td>
  </tr>
</table>
<!-- #include file="Inc/Foot.asp" -->
<%
end if
call CloseConn()
%>