<%@ LANGUAGE="VBScript" %>
<!--#include file="admin.asp"-->
<!--#include file="conn.asp"-->
<!--#include file="Inc/articlechar.inc"-->
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
                      <td width="84%" height="20"><font color="#FFFF00">�˲Ź���</font></td>
                    </tr>
                  </table>
                  <table width="90%" border="0" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td width="34%" height="20" align="right"><img src="../Img/Left_1_1.gif" width="29" height="16"></td>
                      <td width="66%" valign="bottom"><a href="Manage_Job.asp"><font color="#FFFF00">��Ƹ����</font></a></td>
                    </tr>
                  </table>
                  <table width="90%" border="0" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td width="34%" height="20" align="right"><img src="../Img/Left_1_1.gif" width="29" height="16"></td>
                      <td width="66%" valign="bottom"><a href="Manage_JobAdd.asp"><font color="#FFFF00">������Ƹ</font></a></td>
                    </tr>
                  </table>
                  <table width="90%" border="0" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td width="34%" height="20" align="right"><img src="../Img/Left_1_1.gif" width="29" height="16"></td>
                      <td width="66%" valign="bottom"><a href="Manage_JobBook.asp"><font color="#FFFF00">ӦƸ����</font></a></td>
                    </tr>
                  </table>
                  <table width="90%" border="0" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td width="34%" height="20" align="right"><img src="../Img/Left_1_1.gif" width="29" height="16"></td>
                      <td width="66%" valign="bottom"><a href="Manage_Jobs.asp"><font color="#FFFF00">�˲Ų���</font></a></td>
                    </tr>
                  </table></td>
              </tr>
            </table></td>
        </tr>
      </table></td>
    <td align="center" valign="top">
	<br>
      <strong><br>
      </strong> <br>
      <br>
      <table width="550" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td height="25"> <div align="center"><strong>ӦƸ����<br>
              <br>
              </strong></div></td>
        </tr>
        <tr> 
			<td><div align="center"> 
			<% 
const MaxPerPage=5 '��ҳ��ʾ�ļ�¼���� 
dim sql 
dim rs 
dim totalPut 
dim CurrentPage 
dim TotalPages 
dim i,j 
 
 
if not isempty(request("page")) then 
currentPage=cint(request("page")) 
else 
currentPage=1 
end if 
set rs=server.createobject("adodb.recordset") 
sql="select * from jobbook order by id desc" 
rs.open sql,conn,1,1 
 
if rs.eof and rs.bof then 
response.write "<p align='center'>��û���κ�ӦƸ��Ϣ!</p>" 
else 
totalPut=rs.recordcount 
totalPut=rs.recordcount 
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
showpages 
showContent 
showpages 
else 
if (currentPage-1)*MaxPerPage<totalPut then 
rs.move (currentPage-1)*MaxPerPage 
dim bookmark 
bookmark=rs.bookmark 
showpages 
showContent 
showpages 
else 
currentPage=1 
showContent 
end if 
end if 
rs.close 
end if 
set rs=nothing 
conn.close 
set conn=nothing 
sub showContent 
dim i 
i=0 
do while not (rs.eof or err) %>
                
              <table width="100%" border="0" cellspacing="2" cellpadding="3">
                <tr bgcolor="#C0C0C0"> 
                  <td width="17%" height="25" bgcolor="#C0C0C0"> <div align="center">ӦƸ��λ</div></td>
                  <td colspan="2" bgcolor="#C0C0C0">&nbsp;&nbsp;<b><%=rs("jobname")%></b> 
                    &nbsp; </td>
                  <td bgcolor="#C0C0C0"><a href="Deljobbook.asp?id=<%=rs("ID")%>">ɾ��</a>&nbsp;&nbsp;&nbsp;<a href="Sendmail.asp?email=<%=rs("email")%>">����</a> 
                  </td>
                </tr>
                <%if rs("email")<>"" then%>
                <tr bgcolor="#E3E3E3"> 
                  <td height="10"> <div align="center">�� ��</div></td>
                  <td width="34%" bgcolor="#E3E3E3">&nbsp;&nbsp;<%=rs("mane")%></td>
                  <td width="13%" bgcolor="#E3E3E3"><div align="center">�� ��</div></td>
                  <td width="36%" bgcolor="#E3E3E3"><%=rs("sex")%></td>
                </tr>
                <tr bgcolor="#E3E3E3"> 
                  <td height="22" bgcolor="#E3E3E3"> <div align="center">��������</div></td>
                  <td bgcolor="#E3E3E3">&nbsp;&nbsp;<%=rs("birthday")%></td>
                  <td bgcolor="#E3E3E3"><div align="center">����״��</div></td>
                  <td bgcolor="#E3E3E3"><%=rs("marry")%></td>
                </tr>
                <tr bgcolor="#E3E3E3"> 
                  <td height="22"><div align="center">��ҵԺУ</div></td>
                  <td colspan="3" bgcolor="#E3E3E3">&nbsp;&nbsp;<%=rs("school")%></td>
                </tr>
                <tr bgcolor="#E3E3E3"> 
                  <td height="22"><div align="center">ѧ ��</div></td>
                  <td bgcolor="#E3E3E3">&nbsp;&nbsp;<%=rs("studydegree")%></td>
                  <td bgcolor="#E3E3E3"><div align="center">ר ҵ</div></td>
                  <td bgcolor="#E3E3E3"><%=rs("specialty")%></td>
                </tr>
                <tr bgcolor="#E3E3E3"> 
                  <td height="22"><div align="center">��ҵʱ��</div></td>
                  <td bgcolor="#E3E3E3">&nbsp;&nbsp;<%=rs("gradyear")%></td>
                  <td bgcolor="#E3E3E3"><div align="center"><font color="#FF0000">ӦƸ����</font></div></td>
                  <td bgcolor="#E3E3E3"><font color="#FF0000"><%=rs("time")%></font></td>
                </tr>
                <tr bgcolor="#E3E3E3"> 
                  <td height="22"><div align="center">�� ��</div></td>
                  <td colspan="3" bgcolor="#E3E3E3">&nbsp;&nbsp;<%=rs("telephone")%></td>
                </tr>
                <tr bgcolor="#E3E3E3"> 
                  <td height="22"><div align="center">E-mail</div></td>
                  <td colspan="3" bgcolor="#E3E3E3">&nbsp;&nbsp;<a href="Sendmail.asp?email=<%=rs("email")%>"><%=rs("email")%></a></td>
                </tr>
                <tr bgcolor="#E3E3E3"> 
                  <td height="22"><div align="center">��ϵ��ַ</div></td>
                  <td colspan="3" bgcolor="#E3E3E3">&nbsp;&nbsp;<%=rs("address")%></td>
                </tr>
                <%end if%>
                <tr bgcolor="#C0C0C0"> 
                  <td height="25" bgcolor="#C0C0C0"><div align="center">ˮƽ������</div></td>
                  <td height="25" colspan="3">&nbsp;&nbsp;<%=rs("ability")%></td>
                </tr>
                <tr bgcolor="#E3E3E3"> 
                  <td height="25" bgcolor="#C0C0C0"> <div align="center">���˼���</div></td>
                  <td height="25" colspan="3" bgcolor="#C0C0C0">&nbsp;&nbsp;<%=rs("resumes")%></td>
                </tr>
              </table>
              </div></td>
        </tr>
      </table>
      <br>
      <table width="550" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td><div align="center"><% i=i+1 
if i>=MaxPerPage then exit do 
rs.movenext 
loop 
end sub 
sub showpages() 
dim n 
if (totalPut mod MaxPerPage)=0 then 
n= totalPut \ MaxPerPage 
else 
n= totalPut \ MaxPerPage + 1 
end if 
if n=1 then 
response.write "���Բ��������" 
 
exit sub 
end if 
dim k 
response.write "<p align='left'>&gt;&gt; ���Է�ҳ " 
for k=1 to n 
if k=currentPage then 
response.write "[<b>"+Cstr(k)+"</b>] " 
else 
response.write "[<b>"+"<a href='Manage_Book.asp?page="+cstr(k)+"'>"+Cstr(k)+"</a></b>] " 
end if 
next 
end sub 
%></div></td>
        </tr>
      </table> 
      <br>
      <br>
    </td>
  </tr>
</table>
<!-- #include file="Inc/Foot.asp" -->