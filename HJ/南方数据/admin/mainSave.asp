<%@language=vbscript codepage=936 %>
<!--#include file="Admin.asp"-->
<!--#include file="Conn.asp"-->
<!--#include file="../Inc/Config.asp"-->
<!--#include file="../Inc/Ubbcode.asp"-->
<!--#include file="Inc/Function.asp"-->
<%
dim rs,sql,ErrMsg,FoundErr
dim ArticleID,Product_Id,Title,Content,key,UpdateTime,Hits
dim IncludePic,DefaultPicUrl,UploadFiles,Passed,arrUploadFiles
dim ObjInstalled
ObjInstalled=IsObjInstalled("Scripting.FileSystemObject")
FoundErr=false
Product_Id=trim(request.form("Product_Id"))
Title=trim(request.form("Title"))
Key=trim(request.form("Key"))
Content=trim(request.form("Content"))
UpdateTime=trim(request.form("UpdateTime"))
IncludePic=trim(request.form("IncludePic"))
DefaultPicUrl=trim(request.form("DefaultPicUrl"))
UploadFiles=trim(request.form("UploadFiles"))
Passed=trim(request.form("Passed"))
Hits=trim(request.form("Hits"))

'if Title="" then
	'founderr=true
	'errmsg="<li>���±��ⲻ��Ϊ��</li>"
'end if
if Key="" then
	founderr=true
	errmsg=errmsg+"<li>���������¹ؼ���</li>"
end if
if Content="" then
	founderr=true
	errmsg=errmsg+"<li>�������ݲ���Ϊ��</li>"
end if

if founderr=false then
	Title=dvhtmlencode(Title)
	Key=replace(replace(replace(replace(replace(replace(replace(Key,"'",""),"*",""),"?",""),"(",""),")",""),",",""),".","")
	Key=Key & " "
	Content=ubbcode(Content)
	if UpdateTime<>"" and IsDate(UpdateTime)=true then
		UpdateTime=CDate(UpdateTime)
	else
		UpdateTime=now()
	end if
	if Hits<>"" then
		Hits=CLng(Hits)
	else
		Hits=0
	end if
	set rs=server.createobject("adodb.recordset")
	if request("action")="add" then
		sql="select top 1 * from Product" 
		rs.open sql,conn,1,3
		rs.addnew
		call SaveData()
		'rs("Editor")=Editor
		rs.update
		ArticleID=rs("ArticleID")
		rs.close
		set rs=nothing
	elseif request("action")="Modify" then
  		if ArticleID<>"" then
			sql="select * from main"
			rs.open sql,conn,1,3
			if not (rs.bof and rs.eof) then
				call SaveData()
				rs.update
				rs.close
				set rs=nothing
 			else
				founderr=true
				errmsg=errmsg+"<li>�Ҳ��������£������Ѿ���������ɾ����</li>"
				call WriteErrMsg()
			end if
		else
			founderr=true
			errmsg=errmsg+"<li>����ȷ��ArticleID��ֵ</li>"
			call WriteErrMsg()
		end if
	else
		founderr=true
		errmsg=errmsg+"<li>û��ѡ������</li>"
		call WriteErrMsg()
	end if

	call CloseConn()
%>
<!-- #include file="Inc/Head.asp" -->
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
  <tr> 
    <td width="150" align="center" valign="top"> <table width="150" height="100%" border="0" cellpadding="0" cellspacing="0" class="HeaderTdStyle">
        <tr> 
          <td align="center" valign="top"><table width="100%" height="24" border="0" cellpadding="0" cellspacing="0">
              <tr> 
                <td align="center">���ܲ˵�</td>
              </tr>
            </table>
            <table width="100%" height="90%" border="0" cellpadding="0" cellspacing="0" class="MenuBg">
              <tr> 
                <td align="center" valign="top"><br> <table width="90%" border="0" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td width="16%"><img src="../Img/Left_1.gif" width="28" height="11"></td>
                      <td width="84%" height="20"><font color="#FFFF00">��Ʒ����</font></td>
                    </tr>
                  </table>
                  <table width="90%" border="0" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td width="34%" height="20" align="right"><img src="../Img/Left_1_1.gif" width="29" height="16"></td>
                      <td width="66%" valign="bottom"><a href="ClassManage.asp"><font color="#FFFF00">��Ʒ�������</font></a></td>
                    </tr>
                  </table>
                  <table width="90%" border="0" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td width="34%" height="20" align="right"><img src="../Img/Left_1_1.gif" width="29" height="16"></td>
                      <td width="66%" valign="bottom"><a href="ArticleManage.asp"><font color="#FFFF00">��Ʒ����</font></a></td>
                    </tr>
                  </table>
                  <table width="90%" border="0" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td width="34%" height="20" align="right"><img src="../Img/Left_1_1.gif" width="29" height="16"></td>
                      <td width="66%" valign="bottom"><a href="ArticleAdd.asp"><font color="#FFFF00">��Ӳ�Ʒ</font></a></td>
                    </tr>
                  </table>
                  <table width="90%" border="0" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td width="34%" height="20" align="right"><img src="../Img/Left_1_1.gif" width="29" height="16"></td>
                      <td width="66%" valign="bottom"><a href="ArticleCheck.asp"><font color="#FFFF00">��˲�Ʒ</font></a></td>
                    </tr>
                  </table></td>
              </tr>
            </table></td>
        </tr>
      </table></td>
    <td width="862" align="center" valign="top">
	<br>
      <br>
      <b> </b><br>
      <br>
      <br>
      <table class="border" align=center width="50%" border="0" cellpadding="0" cellspacing="2" bordercolor="#999999">
        <tr align=center bgcolor="#999999"> 
          <td  height="25" colspan="2" class="title"><b> 
            <%if request("action")="add" then%>
            ��� 
            <%else%>
            �޸� 
            <%end if%>
            ��Ʒ�ɹ�</b></td>
        </tr>
        <tr> 
          <td width="19%" height="22" bgcolor="#C0C0C0" class="tdbg"> <p align="right">��Ʒ��ţ�</p></td>
          <td width="81%" bgcolor="#E3E3E3" class="tdbg"><%=ArticleID%></td>
        </tr>
        <tr> 
          <td height="22" bgcolor="#C0C0C0" class="tdbg"><div align="right">��Ʒ��ţ�</div></td>
          <td bgcolor="#E3E3E3" class="tdbg"><%=Product_Id%></td>
        </tr>
        <tr> 
          <td height="22" bgcolor="#C0C0C0" class="tdbg"><div align="right">��Ʒ���ƣ�</div></td>
          <td bgcolor="#E3E3E3" class="tdbg"><%=Title%></td>
        </tr>
        <tr> 
          <td height="22" bgcolor="#C0C0C0" class="tdbg"><div align="right">�������</div></td>
          <td bgcolor="#E3E3E3" class="tdbg"> 
            <%response.write BigClassName
		if SmallClassName<>"" then response.write " &gt;&gt; " & SmallClassName
		if SpecialName<>"" then response.write "<br>����ר�⣺" & SpecialName
		 %>
          </td>
        </tr>
        <tr> 
          <td height="22" bgcolor="#C0C0C0" class="tdbg"><div align="right">�� 
              �� �֣�</div></td>
          <td bgcolor="#E3E3E3" class="tdbg"><%=Key%></td>
        </tr>
        <tr> 
          <td height="22" colspan="2" bgcolor="#E3E3E3" class="tdbg"> 
            <p align="center"> ��<a href="ArticleModify.asp?ArticleID=<%=ArticleID%>">�޸ı���</a>��&nbsp;��<a href="ArticleAdd.asp">�����������</a>��&nbsp;��<a href="ArticleManage.asp">���¹���</a>��&nbsp;��<a href="../ArticleShow.asp?ArticleID=<%=ArticleID%>" target="_blank">Ԥ����������</a>��</p></td>
        </tr>
      </table>
    </td>
  </tr>
</table>
<!-- #include file="Inc/Foot.asp" -->
<%
else
	WriteErrMsg
end if

sub SaveData()
	rs("Product_Id")=Product_Id
	'rs("SpecialName")=SpecialName
	rs("Title")=Title
	rs("Content")=Content
	rs("Key")=Key
	rs("Hits")=Hits
	'rs("Author")=Author
	'rs("CopyFrom")=CopyFrom
	if IncludePic="yes" then
		rs("IncludePic")=True
	else
		rs("IncludePic")=False
	end if
	if Passed="yes" then
		rs("Passed")=True
	else
		if EnableArticleCheck="No" then
			rs("Passed")=True
		else
			rs("Passed")=False
		end if
	end if
	'if OnTop="yes" then
		'rs("OnTop")=True
	'else
		'rs("OnTop")=False
	'end if
	'if Hot="yes" then
		'rs("Hot")=True
	'else
		'rs("Hot")=False
	'end if
	'if Elite="yes" then
		'rs("Elite")=True
	'else
		'rs("Elite")=False
	'end if
	rs("UpdateTime")=UpdateTime

	'***************************************
	'ɾ�����õ��ϴ��ļ�
	if ObjInstalled=True and UploadFiles<>"" then
		dim fso,strRubbishFile
		Set fso = Server.CreateObject("Scripting.FileSystemObject")
		if instr(UploadFiles,"|")>1 then
			dim arrUploadFiles,intTemp
			arrUploadFiles=split(UploadFiles,"|")
			UploadFiles=""
			for intTemp=0 to ubound(arrUploadFiles)
				if instr(Content,arrUploadFiles(intTemp))<=0 and arrUploadFiles(intTemp)<>DefaultPicUrl then
					strRubbishFile=server.MapPath("../" & arrUploadFiles(intTemp))
					if fso.FileExists(strRubbishFile) then
						fso.DeleteFile(strRubbishFile)
						response.write "<br><li>" & arrUploadFiles(intTemp) & "��������û���õ���Ҳû�б���Ϊ��ҳͼƬ�������Ѿ���ɾ����</li>"
					end if
				else
					if intTemp=0 then
						UploadFiles=arrUploadFiles(intTemp)
					else
						UploadFiles=UploadFiles & "|" & arrUploadFiles(intTemp)
					end if
				end if
			next
		else
			if instr(Content,UploadFiles)<=0 and UploadFiles<>DefaultPicUrl then
				strRubbishFile=server.MapPath("../" & UploadFiles)
				if fso.FileExists(strRubbishFile) then
					fso.DeleteFile(strRubbishFile)
					response.write "<br><li>" & UploadFiles & "��������û���õ���Ҳû�б���Ϊ��ҳͼƬ�������Ѿ���ɾ����</li>"
				end if
				UploadFiles=""
			end if
		end if
		set fso=nothing
	end If
	'����
	'***************************************
	rs("DefaultPicUrl")=DefaultPicUrl
	rs("UploadFiles")=UploadFiles
end sub
	
%>