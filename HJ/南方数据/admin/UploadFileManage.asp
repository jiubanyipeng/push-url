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
	Response.Write "<b><font color=red>��ķ�������֧�� FSO(Scripting.FileSystemObject)! ����ʹ�ñ�����</font></b>"
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
if (confirm("�����Ҫɾ�����ļ���!"))
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
                <td align="center">ϵͳ����</td>
              </tr>
            </table>
            <table width="100%" height="90%" border="0" cellpadding="0" cellspacing="0" class="MenuBg">
              <tr> 
                <td align="center" valign="top"><br> <table width="90%" border="0" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td width="16%"><img src="../Img/Left_1.gif" width="28" height="11"></td>
                      <td width="84%" height="20"><font color="#FFFF00">ϵͳ����</font></td>
                    </tr>
                  </table>
                  <table width="90%" border="0" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td width="34%" height="20" align="right"><img src="../Img/Left_1_1.gif" width="29" height="16"></td>
                      <td width="66%" valign="bottom"><a href="Manage_Admin.asp"><font color="#FFFF00">����Ա����</font></a></td>
                    </tr>
                  </table>
                  <table width="90%" border="0" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td width="34%" height="20" align="right"><img src="../Img/Left_1_1.gif" width="29" height="16"></td>
                      <td width="66%" valign="bottom"><a href="Manage_backup.asp"><font color="#FFFF00">���ݿⱸ��</font></a></td>
                    </tr>
                  </table>
                  <table width="90%" border="0" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td width="34%" height="20" align="right"><img src="../Img/Left_1_1.gif" width="29" height="16"></td>
                      <td width="66%" valign="bottom"><a href="Manage.asp"><font color="#FFFF00">ϵͳ����</font></a></td>
                    </tr>
                  </table>
                  <table width="90%" border="0" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td width="34%" height="20" align="right"><img src="../Img/Left_1_1.gif" width="29" height="16"></td>
                      <td width="66%" valign="bottom"><a href="UploadFileManage.asp"><font color="#FFFF00">�ϴ��ļ�����</font></a></td>
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
      <p align="center"><strong>�� �� �� �� �� ��</strong></p>
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
		response.write "<br><div align='center'>��ҳ����ʾ <b>" & FileCount & "</b> ���ļ���ռ�� <b>" & TotleSize\1024 & "</b> K</div>"
   	else
   	   	if (currentPage-1)*MaxPerPage<totalPut then
			showpage2 strFileName,totalput,MaxPerPage
			showContent     	
			showpage2 strFileName,totalput,MaxPerPage
			response.write "<br><div align='center'>��ҳ����ʾ <b>" & FileCount & "</b> ���ļ���ռ�� <b>" & TotleSize\1024 & "</b> K</div>"
       	else
        	currentPage=1
			showpage2 strFileName,totalput,MaxPerPage
			showContent     	
			showpage2 strFileName,totalput,MaxPerPage
			response.write "<br><div align='center'>��ҳ����ʾ <b>" & FileCount & "</b> ���ļ���ռ�� <b>" & TotleSize\1024 & "</b> K</div>"
    	end if
	end if
  else
	response.write "�Ҳ����ļ��У���������������"
  end if
end if

sub showContent()
   	dim c
	FileCount=0
	TotleSize=0
%>
      <table width="550" border="0" align="center" cellpadding="0" cellspacing="2" class="border">
        <tr bgcolor="#C0C0C0" class="title"> 
          <td width="158" height="25" align="center">�ļ���</td>
          <td width="84" height="20" align="center">�ļ���С</td>
          <td width="134" height="20" align="center">�ļ�����</td>
          <td width="119" height="20" align="center">����޸�ʱ��</td>
          <td width="43" height="20" align="center">����</td>
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
          <td width="84" align="right"><%=theFile.size%>�ֽ�</td>
          <td width="134" align="center"><%=theFile.type%></td>
          <td width="119" align="center"><%=theFile.DateLastModified%></td>
          <td width="43" align="center"><a href="UploadFileManage.asp?Action=Del&FileName=<%=UploadDir&theFile.Name%>" onclick="return ConfirmDel()">ɾ��</a></td>
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
	strTemp=strTemp & "�� <b>" & totalnumber & "</b> ���ļ���ռ�� <b>" & TotleSize\1024 & "</b> K&nbsp;&nbsp;&nbsp;"
	sfilename=JoinChar(sfilename)
  	if CurrentPage<2 then
    		strTemp=strTemp & "��ҳ ��һҳ&nbsp;"
  	else
    		strTemp=strTemp & "<a href='" & sfilename & "page=1'>��ҳ</a>&nbsp;"
    		strTemp=strTemp & "<a href='" & sfilename & "page=" & (CurrentPage-1) & "'>��һҳ</a>&nbsp;"
  	end if

  	if n-currentpage<1 then
    		strTemp=strTemp & "��һҳ βҳ"
  	else
    		strTemp=strTemp & "<a href='" & sfilename & "page=" & (CurrentPage+1) & "'>��һҳ</a>&nbsp;"
    		strTemp=strTemp & "<a href='" & sfilename & "page=" & n & "'>βҳ</a>"
  	end if
   	strTemp=strTemp & "&nbsp;ҳ�Σ�<strong><font color=red>" & CurrentPage & "</font>/" & n & "</strong>ҳ "
    strTemp=strTemp & "&nbsp;<b>" & maxperpage & "</b>" & "���ļ�/ҳ"
	strTemp=strTemp & "&nbsp;ת����<select name='page' size='1' onchange='javascript:submit()'>"   
    for i = 1 to n   
   		strTemp=strTemp & "<option value='" & i & "'"
		if cint(CurrentPage)=cint(i) then strTemp=strTemp & " selected "
		strTemp=strTemp & ">��" & i & "ҳ</option>"   
	next
	strTemp=strTemp & "</select>"
	strTemp=strTemp & "</td></tr></form></table>"
	response.write strTemp
end sub
%>