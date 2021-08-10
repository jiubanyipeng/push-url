<%@language=vbscript codepage=936 %>
<!--#include file="Admin.asp"-->
<!--#include file="Conn.asp"-->
<!--#include file="../inc/config.asp"-->
<!--#include file="../inc/function.asp"-->
<!-- #include file="Inc/Head.asp" -->

<%
Const MaxPerPage=20
dim strFileName
dim totalPut,CurrentPage,TotalPages
dim UploadDir,TruePath,fso,theFolder,theFile,whichfile,thisfile,FileCount,TotleSize
strFileName="UploadFileManage.asp"

if request("page")<>"" then
    currentPage=cint(request("page"))
else
	currentPage=1
end if

if right(SaveUpFilesPath,1)<>"/" then
	UploadDir="../" & SaveUpFilesPath & "/"
else
	UploadDir="../" & SaveUpFilesPath
end if
TruePath=Server.MapPath(UploadDir)
If not IsObjInstalled("Scripting.FileSystemObject") Then
	Response.Write "<b><font color=red>你的服务器不支持 FSO(Scripting.FileSystemObject)! 不能使用本功能</font></b>"
Else
	set fso=CreateObject("Scripting.FileSystemObject")
	if request("Action")="Del" then
		whichfile=server.mappath(Request("FileName")) 
		Set thisfile = fso.GetFile(whichfile) 
		thisfile.Delete True
	end if

%>
<script language="JavaScript">
function ConfirmDel()
{
if (confirm("你真的要删除此文件吗!"))
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
                      <td width="66%" valign="bottom"><a href="Manage_Admin.asp"><font color="#FFFF00">管理员管理</font></a></td>
                    </tr>
                  </table>
                  <table width="90%" border="0" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td width="34%" height="20" align="right"><img src="../Img/Left_1_1.gif" width="29" height="16"></td>
                      <td width="66%" valign="bottom"><a href="Manage_backup.asp"><font color="#FFFF00">数据库备份</font></a></td>
                    </tr>
                  </table>
                  <table width="90%" border="0" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td width="34%" height="20" align="right"><img src="../Img/Left_1_1.gif" width="29" height="16"></td>
                      <td width="66%" valign="bottom"><a href="Manage.asp"><font color="#FFFF00">系统帮助</font></a></td>
                    </tr>
                  </table>
                  <table width="90%" border="0" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td width="34%" height="20" align="right"><img src="../Img/Left_1_1.gif" width="29" height="16"></td>
                      <td width="66%" valign="bottom"><a href="UploadFileManage.asp"><font color="#FFFF00">上传文件管理</font></a></td>
                    </tr>
                  </table></td>
              </tr>
            </table></td>
        </tr>
      </table></td>
    <td width="862" align="center" valign="top">
	<br>
        <br>
        <br>
        <br>
      <p align="center"><strong>上 传 文 件 管 理</strong></p>
      <%
  if fso.FolderExists(TruePath)then
	FileCount=0
	TotleSize=0
	Set theFolder=fso.GetFolder(TruePath)
	For Each theFile In theFolder.Files
		FileCount=FileCount+1
		TotleSize=TotleSize+theFile.Size
	next
    totalPut=FileCount
	if currentpage<1 then
   		currentpage=1
   	end if
   	if (currentpage-1)*MaxPerPage>totalput then
		if (totalPut mod MaxPerPage)=0 then
	  		currentpage= totalPut \ MaxPerPage
	  	else
	      	currentpage= totalPut \ MaxPerPage + 1
		end if

    end if
	if currentPage=1 then
		showpage2 strFileName,totalput,MaxPerPage
		showContent     	
		showpage2 strFileName,totalput,MaxPerPage
		response.write "<br><div align='center'>本页共显示 <b>" & FileCount & "</b> 个文件，占用 <b>" & TotleSize\1024 & "</b> K</div>"
   	else
   	   	if (currentPage-1)*MaxPerPage<totalPut then
			showpage2 strFileName,totalput,MaxPerPage
			showContent     	
			showpage2 strFileName,totalput,MaxPerPage
			response.write "<br><div align='center'>本页共显示 <b>" & FileCount & "</b> 个文件，占用 <b>" & TotleSize\1024 & "</b> K</div>"
       	else
        	currentPage=1
			showpage2 strFileName,totalput,MaxPerPage
			showContent     	
			showpage2 strFileName,totalput,MaxPerPage
			response.write "<br><div align='center'>本页共显示 <b>" & FileCount & "</b> 个文件，占用 <b>" & TotleSize\1024 & "</b> K</div>"
    	end if
	end if
  else
	response.write "找不到文件夹！可能是配置有误！"
  end if
end if

sub showContent()
   	dim c
	FileCount=0
	TotleSize=0
%>
      <table width="550" border="0" align="center" cellpadding="0" cellspacing="2" class="border">
        <tr bgcolor="#C0C0C0" class="title"> 
          <td width="158" height="25" align="center">文件名</td>
          <td width="84" height="20" align="center">文件大小</td>
          <td width="134" height="20" align="center">文件类型</td>
          <td width="119" height="20" align="center">最后修改时间</td>
          <td width="43" height="20" align="center">操作</td>
        </tr>
        <%

For Each theFile In theFolder.Files
	c=c+1
	if FileCount>=MaxPerPage then
		exit for
	elseif c>MaxPerPage*(CurrentPage-1) then
%>
        <tr bgcolor="#E3E3E3" class="tdbg"> 
          <td height="22"><a href="<%=(UploadDir & theFile.Name)%>" target="_blank"><strong>&nbsp;<%=theFile.Name%></strong></a></td>
          <td width="84" align="right"><%=theFile.size%>字节</td>
          <td width="134" align="center"><%=theFile.type%></td>
          <td width="119" align="center"><%=theFile.DateLastModified%></td>
          <td width="43" align="center"><a href="UploadFileManage.asp?Action=Del&FileName=<%=UploadDir&theFile.Name%>" onclick="return ConfirmDel()">删除</a></td>
        </tr>
        <%
		FileCount=FileCount+1
		TotleSize=TotleSize+theFile.Size
	end if
Next
%>
      </table>
      <%
end sub
%>
    </td>
  </tr>
</table>
<!-- #include file="Inc/Foot.asp" -->
<%
sub showpage2(sfilename,totalnumber,maxperpage)
	dim n, i,strTemp
	if totalnumber mod maxperpage=0 then
    	n= totalnumber \ maxperpage
  	else
    	n= totalnumber \ maxperpage+1
  	end if
  	strTemp= "<table align='center'><form name='showpages' method='Post' action='" & sfilename & "'><tr><td>"
	strTemp=strTemp & "共 <b>" & totalnumber & "</b> 个文件，占用 <b>" & TotleSize\1024 & "</b> K&nbsp;&nbsp;&nbsp;"
	sfilename=JoinChar(sfilename)
  	if CurrentPage<2 then
    		strTemp=strTemp & "首页 上一页&nbsp;"
  	else
    		strTemp=strTemp & "<a href='" & sfilename & "page=1'>首页</a>&nbsp;"
    		strTemp=strTemp & "<a href='" & sfilename & "page=" & (CurrentPage-1) & "'>上一页</a>&nbsp;"
  	end if

  	if n-currentpage<1 then
    		strTemp=strTemp & "下一页 尾页"
  	else
    		strTemp=strTemp & "<a href='" & sfilename & "page=" & (CurrentPage+1) & "'>下一页</a>&nbsp;"
    		strTemp=strTemp & "<a href='" & sfilename & "page=" & n & "'>尾页</a>"
  	end if
   	strTemp=strTemp & "&nbsp;页次：<strong><font color=red>" & CurrentPage & "</font>/" & n & "</strong>页 "
    strTemp=strTemp & "&nbsp;<b>" & maxperpage & "</b>" & "个文件/页"
	strTemp=strTemp & "&nbsp;转到：<select name='page' size='1' onchange='javascript:submit()'>"   
    for i = 1 to n   
   		strTemp=strTemp & "<option value='" & i & "'"
		if cint(CurrentPage)=cint(i) then strTemp=strTemp & " selected "
		strTemp=strTemp & ">第" & i & "页</option>"   
	next
	strTemp=strTemp & "</select>"
	strTemp=strTemp & "</td></tr></form></table>"
	response.write strTemp
end sub
%>