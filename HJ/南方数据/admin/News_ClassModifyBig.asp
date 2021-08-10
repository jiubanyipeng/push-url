<%@language=vbscript codepage=936 %>
<!--#include file="Admin.asp"-->
<!--#include file="Conn.asp"-->
<!-- #include file="Inc/Head.asp" -->
<%
dim BigClassID,Action,rs,NewBigClassName,OldBigClassName,FoundErr,ErrMsg
BigClassID=trim(Request("BigClassID"))
Action=trim(Request("Action"))
NewBigClassName=trim(Request("NewBigClassName"))
OldBigClassName=trim(Request("OldBigClassName"))

if BigClassID="" then
  response.Redirect("ClassManage.asp")
end if
Set rs=Server.CreateObject("Adodb.RecordSet")
rs.Open "Select * from BigClass_New where BigClassID=" & CLng(BigClassID),conn,1,3
if rs.Bof and rs.EOF then
	FoundErr=True
	ErrMsg=ErrMsg & "<br><li>此产品大类不存在！</li>"
else
	if Action="Modify" then
		if NewBigClassName="" then
			FoundErr=True
			ErrMsg=ErrMsg & "<br><li>产品大类名不能为空！</li>"
		end if
		if FoundErr<>True then
			rs("BigClassName")=NewBigClassName
			rs("Admin")=Admin
    	 	rs.update
			rs.Close
	     	set rs=Nothing
			if NewBigClassName<>OldBigClassName then
				conn.execute "Update SmallClass_New set BigClassName='" & NewBigClassName & "' where BigClassName='" & OldBigClassName & "'"
				conn.execute "Update NEWS set BigClassName='" & NewBigClassName & "' where BigClassName='" & OldBigClassName & "'"
     		end if		
			call CloseConn()
     		Response.Redirect "News_ClassManage.asp" 
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
    <td align="center" valign="top"><table width="80%" border="0" cellpadding="0" cellspacing="0">
  <tr> 
    <td align="center" valign="top"><br>
            <a href="News_ClassManage.asp"><strong>新 闻 类 别 设 置</strong></a> <br> <br> <form name="form1" method="post" action="News_ClassModifyBig.asp">
        <table width="350" border="0" align="center" cellpadding="0" cellspacing="2" class="border">
          <tr class="title"> 
            <td height="25" colspan="2" align="center" bgcolor="#999999"><strong>修改大类名称</strong></td>
          </tr>
          <tr class="tdbg"> 
            <td width="126" bgcolor="#C0C0C0"><strong>大类ID：</strong></td>
            <td width="204" bgcolor="#E3E3E3"><%=rs("BigClassID")%> <input name="BigClassID" type="hidden" id="BigClassID" value="<%=rs("BigClassID")%>"> 
              <input name="OldBigClassName" type="hidden" id="OldBigClassName" value="<%=rs("BigClassName")%>"></td>
          </tr>
          <tr class="tdbg"> 
            <td width="126" bgcolor="#C0C0C0"><strong>大类名称：</strong></td>
            <td bgcolor="#E3E3E3"> <input name="NewBigClassName" type="text" id="NewBigClassName" value="<%=rs("BigClassName")%>" size="20" maxlength="30"></td>
          </tr>
          <tr class="tdbg"> 
            <td align="center" bgcolor="#C0C0C0">&nbsp;</td>
            <td align="center" bgcolor="#E3E3E3"> <div align="left"> 
                <input name="Action" type="hidden" id="Action" value="Modify">
                <input name="Save" type="submit" id="Save" value=" 修 改 ">
              </div></td>
          </tr>
        </table>
      </form></td>
  </tr>
</table>
<%
	end if
end if
rs.close
set rs=nothing
%>
</td>
  </tr>
</table>
<!-- #include file="Inc/Foot.asp" -->