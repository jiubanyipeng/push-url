<%
on error resume next
if err then
err.clear
end if
%>
<!--#include file="inc/right.asp"--> 
<!--#include file="inc/conn.asp"-->
<!--#include file="../inc/config.asp"-->
<!--#include file="inc/function.asp"-->
<%
dim ObjInstalled,Action,FoundErr,ErrMsg
ObjInstalled=IsObjInstalled("Scripting.FileSystemObject")
Action=trim(request("Action"))
if Action="" then
	Action="ShowInfo"
end if
%>
<html>
<head>
<title><%=sysConfig%></title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="images/main.css" rel="stylesheet" type="text/css">
<script language="JavaScript">
<!--
 function changeN()
 {
  add.spec.disabled=true;
 }
 function changeY()
 {
  add.spec.disabled=false;
 }
 function next()
 {
  if(event.keyCode==13)event.keyCode=9;
 }
-->
</script>
</head>
<body>
<%
if Action="SaveConfig" then
	call SaveConfig()
	Response.Redirect "SiteConfig.asp" 
else
	call ShowConfig()
end if
if FoundErr=true then
	call WriteErrMsg()
end if
sub ShowConfig()
%>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr valign="top">
    <td bgcolor="#FFFFFF"><br>
     <form method="POST" action="SiteConfig.asp" id="form" name="form">
      <table width="96%"  border="0" align="center" cellpadding="4" cellspacing="1" bgcolor="#aec3de">
		<tr align="center" bgcolor="#F2FDFF">
          <td width="100%" class="optiontitle" colspan="2">网站信息设置</td>	
        </tr>
        <tr> 
         <td align="right" bgcolor="#FFFFFF">网站名称：</td>
         <td bgcolor="#FFFFFF"><input name="SiteName" type="text" id="SiteName" value="<%=SiteName%>" size="40" maxlength="50" onKeyDown="next()"> <font color="red">*</font></td>
        </tr>
        <tr> 
         <td align="right" bgcolor="#FFFFFF">关键字：</td>
         <td bgcolor="#FFFFFF"><input name="keywords" type="text" id="keywords" value="<%=keywords%>" size="61" maxlength="50" onKeyDown="next()"></td>
        </tr>
        <tr> 
         <td align="right" bgcolor="#FFFFFF">描述：</td>
         <td bgcolor="#FFFFFF"><input name="description" type="text" id="description" value="<%=description%>" size="61" maxlength="50" onKeyDown="next()"></td>
        </tr>
        <tr> 
         <td align="right" bgcolor="#FFFFFF">版权信息：</td>
         <td bgcolor="#FFFFFF"><textarea name="Copyright" cols="60" rows="5" id="Copyright" onKeyDown="next()"><%=Copyright%></textarea><br>
           支持html代码，不支持换行空格。<font color="red">更多设置可购买商业版。</font></td>
        </tr>
        <tr> 
        <td colspan="2" align="center" bgcolor="#FFFFFF"> <input name="Action" type="hidden" id="Action" value="SaveConfig"> 
        <input name="cmdSave" type="submit" id="cmdSave" value=" 保存设置 " <% If ObjInstalled=false Then response.write "disabled" %>></td>
        </tr>
<%
If ObjInstalled=false Then
	Response.Write "<tr><td height='40' colspan='3'><b><font color=red>你的服务器不支持 FSO(Scripting.FileSystemObject)! 不能使用本功能。<br>请直接修改“Inc/config.asp”文件中的内容。</font></b></td></tr>"
End If
%>
      </table>
<%
end sub
%>
</form>
    </td>
  </tr>
</table>
</body>
</HTML>
<%
 Function InPutStr(Input)'向数据库中保存字符串时用 
     IF IsEmpty(Input) Then Input="" 
     IF IsNull(Input) Then Input="" 
     IF instr(input,chr(34))>0 Then input=replace(input,chr(34),chr(39))'将"替换成',以便在向数据库里存放 
     InPutStr=input 
End function 
sub SaveConfig()
	If ObjInstalled=false Then
		FoundErr=true
		ErrMsg=ErrMsg & "<br><li>你的服务器不支持 FSO(Scripting.FileSystemObject)! </li>"
		exit sub
	end if
	dim fso,hf
	set fso=Server.CreateObject("Scripting.FileSystemObject")
	set hf=fso.CreateTextFile(Server.mappath("../inc/config.asp"),true)
	hf.write "<" & "%" & vbcrlf
	hf.write "Const SiteName=" & chr(34) & trim(request("SiteName")) & chr(34) & "              '网站名称" & vbcrlf
	hf.write "Const keywords=" & chr(34) & trim(request("keywords")) & chr(34) & "              '关键字" & vbcrlf
	hf.write "Const description=" & chr(34) & trim(request("description")) & chr(34) & "           '描述" & vbcrlf
	hf.write "Const Copyright=" & chr(34) & InPutStr(trim(request("Copyright"))) & chr(34) & "  '版权信息" & vbcrlf
	hf.write "%" & ">"
	hf.close
	set hf=nothing
	set fso=nothing	
end sub
%>