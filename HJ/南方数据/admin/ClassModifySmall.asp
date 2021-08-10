<%@language=vbscript codepage=936 %>
<!--#include file="Admin.asp"-->
<!--#include file="Conn.asp"-->
<!--#include file="Inc/Function.asp"-->
<%
dim SmallClassID,Action,BigClassName, SmallClassName, OldSmallClassName,rs,FoundErr,ErrMsg
SmallClassID=trim(Request("SmallClassID"))
Action=trim(Request("Action"))
BigClassName=trim(Request.form("BigClassName"))
SmallClassName=trim(Request.form("SmallClassName"))
OldSmallClassName=trim(request.form("OldSmallClassName"))
if SmallClassID="" then
	response.Redirect("ClassManage.asp")
end if
Set rs=Server.CreateObject("Adodb.RecordSet")
rs.Open "Select * from SmallClass where SmallClassID="&SmallClassID&"",conn,1,3
if rs.Bof or rs.EOF then
	FoundErr=True
	ErrMsg=ErrMsg & "<br><li>此文章小类不存在！</li>"
else
	if Action="Modify" then
		if SmallClassName="" then
			FoundErr=True
			ErrMsg=ErrMsg & "<br><li>文章小类名不能为空！</li>"
		end if
		if FoundErr<>True then
			rs("SmallClassName")=SmallClassName
     		rs.update
			rs.Close
    	 	set rs=Nothing
			if SmallClassName<>OldSmallClassName then
				conn.execute "Update Product set SmallClassName='" & SmallClassName & "' where BigClassName='" & BigClassName & "' and SmallClassName='" & OldSmallClassName & "'"
	     	end if	
			call CloseConn()
    	 	Response.Redirect "ClassManage.asp"
		end if
	end if
	if FoundErr=True then
		call WriteErrMsg()
	else
%>
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
                      <td width="66%" valign="bottom"><a href="Manage_Product1.asp"><font color="#FFFF00">产品类别设置</font></a></td>
                    </tr>
                  </table>
                  <table width="90%" border="0" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td width="34%" height="20" align="right"><img src="../Img/Left_1_1.gif" width="29" height="16"></td>
                      <td width="66%" valign="bottom"><a href="Manage_Product.asp"><font color="#FFFF00">产品管理</font></a></td>
                    </tr>
                  </table>
                  <table width="90%" border="0" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td width="34%" height="20" align="right"><img src="../Img/Left_1_1.gif" width="29" height="16"></td>
                      <td width="66%" valign="bottom"><a href="Manage_Product3.asp"><font color="#FFFF00">添加产品</font></a></td>
                    </tr>
                  </table>
                  
                </td>
              </tr>
            </table></td>
        </tr>
      </table></td>
    <td align="center" valign="top">
	<br>
      <br>
      <a href="Manage_Product1.asp"><strong>产 品 类 别 设 置</strong></a> <br>
      <br>
      <br>
<form name="form1" method="post" action="ClassModifySmall.asp">
        <p>&nbsp;</p>
        <table width="350" border="0" align="center" cellpadding="0" cellspacing="2" class="border">
          <tr bgcolor="#999999" class="title"> 
            <td height="25" colspan="2" align="center"><strong>修改小类名称</strong></td>
          </tr>
          <tr class="tdbg"> 
            <td width="126" height="22" bgcolor="#C0C0C0"><strong>所属大类：</strong></td>
            <td width="204" bgcolor="#E3E3E3"><%=rs("BigClassName")%> 
              <input name="SmallClassID" type="hidden" id="SmallClassID" value="<%=rs("SmallClassID")%>"> 
              <input name="OldSmallClassName" type="hidden" id="OldSmallClassName" value="<%=rs("SmallClassName")%>"> 
              <input name="BigClassName" type="hidden" id="BigClassName" value="<%=rs("BigClassName")%>"></td>
          </tr>
          <tr class="tdbg"> 
            <td height="22" bgcolor="#C0C0C0"><strong>小类名称：</strong></td>
            <td bgcolor="#E3E3E3">
<input name="SmallClassName" type="text" id="SmallClassName" value="<%=rs("SmallClassName")%>" size="20" maxlength="30"></td>
          </tr>
          <tr class="tdbg"> 
            <td height="22" align="center" bgcolor="#C0C0C0">&nbsp;</td>
            <td align="center" bgcolor="#E3E3E3"> <div align="left">
                <input name="Action" type="hidden" id="Action4" value="Modify">
                <input name="Save" type="submit" id="Save" value=" 修 改 ">
              </div></td>
          </tr>
        </table>  
  </form>
   </td>
  </tr>
</table>
<!-- #include file="Inc/Foot.asp" -->
<%
	end if
end if
rs.close
set rs=nothing
call CloseConn()
%>