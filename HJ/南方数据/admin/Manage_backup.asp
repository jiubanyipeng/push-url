<!--#include file="admin.asp"-->
<!--#include file="conn.asp"-->
<!-- #include file="Inc/Head.asp" -->
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
    <td align="center" valign="top">
	<br>
      <strong><br>
      </strong>
      <table width="550" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td height="25">
<div align="center"><strong>�������ݿ�</strong></div><%
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
                  <td height="25"><strong>�����̳������ļ�</strong>[��ҪFSOȨ��]</td>
                </tr>
                <tr> 
                  <td height="22"> ��ǰ���ݿ�·��</td>
                </tr>
                <tr> 
                  <td height="22"><input type=text size=50 name=DBpath value="<%=db%>"></td>
                </tr>
                <tr> 
                  <td height="22"> �������ݿ�Ŀ¼[��Ŀ¼�����ڣ������Զ�����]</td>
                </tr>
                <tr> 
                  <td height="22"><input type=text size=50 name=bkfolder value=Databackup></td>
                </tr>
                <tr> 
                  <td height="22">�������ݿ�����[�籸��Ŀ¼�и��ļ��������ǣ���û�У����Զ�����]</td>
                </tr>
                <tr> 
                  <td height="22"><input type=text size=30 name=bkDBname value=0791idcbackup.mdb></td>
                </tr>
                <tr> 
                  <td height="22"><div align="center">
                      <input type=submit value="ȷ��">
                    </div></td>
                </tr>
                <tr> 
                  <td height="22"><br>
                    <br>
                    �������Ĭ�����ݿ��ļ�Ϊ<%=db%><br>
                    ������������������������ķ������ݣ��Ա�֤�������ݰ�ȫ��<br>
                    ע�⣺����·��������������ռ��Ŀ¼�����·��</td>
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
response.write "�������ݿ�ɹ��������ݵ����ݿ�·��Ϊ" &bkfolder& "\"& bkdbname 
Else 
response.write "�Ҳ���������Ҫ���ݵ��ļ���" 
End if 
end sub 
'------------------���ĳһĿ¼�Ƿ����------------------- 
Function CheckDir(FolderPath) 
folderpath=Server.MapPath(".")&"\"&folderpath 
Set fso1 = CreateObject("Scripting.FileSystemObject") 
If fso1.FolderExists(FolderPath) then 
'���� 
CheckDir = True 
Else 
'������ 
CheckDir = False 
End if 
Set fso1 = nothing 
End Function 
'-------------����ָ����������Ŀ¼--------- 
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