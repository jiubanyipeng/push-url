<%@language=vbscript codepage=936 %>
<!--#include file="Admin.asp"-->
<!--#include file="Conn.asp"-->
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
                      <td width="84%" height="20"><font color="#FFFF00">�ʼ��б����</font></td>
                    </tr>
                  </table>
                  <table width="90%" border="0" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td width="34%" height="20" align="right"><img src="../Img/Left_1_1.gif" width="29" height="16"></td>
                      <td width="66%" valign="bottom"><a href="Maildefault.asp"><font color="#FFFF00">�ʼ��б�����</font></a></td>
                    </tr>
                  </table>
                  <table width="90%" border="0" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td width="34%" height="20" align="right"><img src="../Img/Left_1_1.gif" width="29" height="16"></td>
                      <td width="66%" valign="bottom"><a href="Sendmail.asp"><font color="#FFFF00">�����ʼ�</font></a></td>
                    </tr>
                  </table>
                  <table width="90%" border="0" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td width="34%" height="20" align="right"><img src="../Img/Left_1_1.gif" width="29" height="16"></td>
                      <td width="66%" valign="bottom"><a href="Viewuser.asp"><font color="#FFFF00">�û�����</font></a></td>
                    </tr>
                  </table>
                  <table width="90%" border="0" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td width="34%" height="20" align="right"><img src="../Img/Left_1_1.gif" width="29" height="16"></td>
                      <td width="66%" valign="bottom"><a href="Adduser.asp"><font color="#FFFF00">����û�</font></a></td>
                    </tr>
                    <tr>
                      <td height="20" align="right">&nbsp;</td>
                      <td valign="bottom">&nbsp;</td>
                    </tr>
                  </table></td>
              </tr>
            </table></td>
        </tr>
      </table></td>
    <td width="862" align="center" valign="top">
	<br>
      <br>
      <b>�� �� �� ��</b><br>
      <br>
      <br>
	  <% 
'����
set rs=server.createobject("adodb.recordset") 
sql="select * from email "
rs.open sql,conn,1,3  

'��ȡĬ�ϵ��ʼ����⼰���� 
set rs1=server.createobject("adodb.recordset")
sql1="select * from maildefault "
rs1.open sql1,conn,1,3  

'���÷�����
frommail=request("frommail")
if frommail="" then
frommail=rs1("frommail")
end if

'�����ʼ�����
mailsubject=request("mailsubject")
if mailsubject="" then
mailsubject=rs1("mailsubject")
end if

'�����ʼ�����
mailbody=request("mailbody")
if mailbody="" then
mailbody=rs1("mailbody")
end if

'�ж϶�˭����
tomail=request("tomail")
'д������Ϣ
response.write "�����˵�ַ: "&frommail
response.write "<br><br><br>"
if tomail<>"" then
response.write "�����˵�ַ��"&tomail
else
response.write "���ڽ����ʼ�Ⱥ����"
end if

if tomail<>"" then
'���ڵ�һ�û�����
Set objCDOMail = Server.CreateObject("CDONTS.NewMail")
objCDOMail.From = frommail
objCDOMail.To = tomail
objCDOMail.Subject = mailsubject  
objCDOMail.Body = mailbody   
objCDOMail.Send
Set objCDOMail = Nothing
else

'�������û����ݿ��е�ȫ���û�����
for i=1 to rs.recordcount
tomail=rs("email")
Set objCDOMail = Server.CreateObject("CDONTS.NewMail")
objCDOMail.From = frommail
objCDOMail.To = tomail
objCDOMail.Subject = mailsubject  
objCDOMail.Body = mailbody   
objCDOMail.Send
Set objCDOMail = Nothing
rs.movenext
next
end if
response.write "<br><br><br>"
response.write "�ʼ����ͳɹ���^&^"
'response.write "<br><br><br>"
'response.write rs1("mailsubject")
%> <a href="Sendmail.asp">����</a>
    </td>
  </tr>
</table>
<!-- #include file="Inc/Foot.asp" -->