<!--#include file="admin.asp"-->
<!--#include file="conn.asp"-->
<!-- #include file="Inc/Head.asp" -->
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
    <td align="center" valign="top">
	<br>
      <strong><br>
      </strong>
      <table width="550" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td height="25">
<div align="center"><strong>备份数据库</strong></div><%
if request("action")="Backup" then
call backupdata()
else
%></td>
        </tr>
        <tr> 
          <form method="post" action="Manage_backup.asp?action=Backup">
		    <td><br>
              <table width="80%" border="0" align="center" cellpadding="0" cellspacing="2">
                <tr> 
                  <td height="25"><strong>备份商城数据文件</strong>[需要FSO权限]</td>
                </tr>
                <tr> 
                  <td height="22"> 当前数据库路径</td>
                </tr>
                <tr> 
                  <td height="22"><input type=text size=50 name=DBpath value="<%=db%>"></td>
                </tr>
                <tr> 
                  <td height="22"> 备份数据库目录[如目录不存在，程序将自动创建]</td>
                </tr>
                <tr> 
                  <td height="22"><input type=text size=50 name=bkfolder value=Databackup></td>
                </tr>
                <tr> 
                  <td height="22">备份数据库名称[如备份目录有该文件，将覆盖，如没有，将自动创建]</td>
                </tr>
                <tr> 
                  <td height="22"><input type=text size=30 name=bkDBname value=0791idcbackup.mdb></td>
                </tr>
                <tr> 
                  <td height="22"><div align="center">
                      <input type=submit value="确定">
                    </div></td>
                </tr>
                <tr> 
                  <td height="22"><br>
                    <br>
                    本程序的默认数据库文件为<%=db%><br>
                    您可以用这个功能来备份您的法规数据，以保证您的数据安全！<br>
                    注意：所有路径都是相对与程序空间根目录的相对路径</td>
                </tr>
                <tr> 
                  <td height="22">&nbsp;</td>
                </tr>
              </table></td>
          </form>
        </tr>
      </table>
      <%end if%><% 
sub backupdata() 
Dbpath=request.form("Dbpath") 
Dbpath=server.mappath(Dbpath) 
bkfolder=request.form("bkfolder") 
bkdbname=request.form("bkdbname") 
Set Fso=server.createobject("scripting.filesystemobject") 
if fso.fileexists(dbpath) then 
If CheckDir(bkfolder) = True Then 
fso.copyfile dbpath,bkfolder& "\"& bkdbname 
else 
MakeNewsDir bkfolder 
fso.copyfile dbpath,bkfolder& "\"& bkdbname 
end if 
response.write "备份数据库成功，您备份的数据库路径为" &bkfolder& "\"& bkdbname 
Else 
response.write "找不到您所需要备份的文件。" 
End if 
end sub 
'------------------检查某一目录是否存在------------------- 
Function CheckDir(FolderPath) 
folderpath=Server.MapPath(".")&"\"&folderpath 
Set fso1 = CreateObject("Scripting.FileSystemObject") 
If fso1.FolderExists(FolderPath) then 
'存在 
CheckDir = True 
Else 
'不存在 
CheckDir = False 
End if 
Set fso1 = nothing 
End Function 
'-------------根据指定名称生成目录--------- 
Function MakeNewsDir(foldername) 
Set fso1 = CreateObject("Scripting.FileSystemObject") 
Set f = fso1.CreateFolder(foldername) 
MakeNewsDir = True 
Set fso1 = nothing 
End Function 
%></td>
  </tr>
</table>
<!-- #include file="Inc/Foot.asp" -->