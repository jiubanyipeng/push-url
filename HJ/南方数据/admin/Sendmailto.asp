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
                <td align="center">功能菜单</td>
              </tr>
            </table>
            <table width="100%" height="90%" border="0" cellpadding="0" cellspacing="0" class="MenuBg">
              <tr> 
                <td align="center" valign="top"><br> <table width="90%" border="0" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td width="16%"><img src="../Img/Left_1.gif" width="28" height="11"></td>
                      <td width="84%" height="20"><font color="#FFFF00">邮件列表管理</font></td>
                    </tr>
                  </table>
                  <table width="90%" border="0" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td width="34%" height="20" align="right"><img src="../Img/Left_1_1.gif" width="29" height="16"></td>
                      <td width="66%" valign="bottom"><a href="Maildefault.asp"><font color="#FFFF00">邮件列表设置</font></a></td>
                    </tr>
                  </table>
                  <table width="90%" border="0" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td width="34%" height="20" align="right"><img src="../Img/Left_1_1.gif" width="29" height="16"></td>
                      <td width="66%" valign="bottom"><a href="Sendmail.asp"><font color="#FFFF00">发送邮件</font></a></td>
                    </tr>
                  </table>
                  <table width="90%" border="0" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td width="34%" height="20" align="right"><img src="../Img/Left_1_1.gif" width="29" height="16"></td>
                      <td width="66%" valign="bottom"><a href="Viewuser.asp"><font color="#FFFF00">用户管理</font></a></td>
                    </tr>
                  </table>
                  <table width="90%" border="0" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td width="34%" height="20" align="right"><img src="../Img/Left_1_1.gif" width="29" height="16"></td>
                      <td width="66%" valign="bottom"><a href="Adduser.asp"><font color="#FFFF00">添加用户</font></a></td>
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
      <b>发 送 邮 件</b><br>
      <br>
      <br>
	  <% 
'发送
set rs=server.createobject("adodb.recordset") 
sql="select * from email "
rs.open sql,conn,1,3  

'读取默认的邮件标题及内容 
set rs1=server.createobject("adodb.recordset")
sql1="select * from maildefault "
rs1.open sql1,conn,1,3  

'设置发信人
frommail=request("frommail")
if frommail="" then
frommail=rs1("frommail")
end if

'设置邮件主题
mailsubject=request("mailsubject")
if mailsubject="" then
mailsubject=rs1("mailsubject")
end if

'设置邮件内容
mailbody=request("mailbody")
if mailbody="" then
mailbody=rs1("mailbody")
end if

'判断对谁发信
tomail=request("tomail")
'写发信信息
response.write "发信人地址: "&frommail
response.write "<br><br><br>"
if tomail<>"" then
response.write "收信人地址："&tomail
else
response.write "正在进行邮件群发！"
end if

if tomail<>"" then
'对于单一用户发信
Set objCDOMail = Server.CreateObject("CDONTS.NewMail")
objCDOMail.From = frommail
objCDOMail.To = tomail
objCDOMail.Subject = mailsubject  
objCDOMail.Body = mailbody   
objCDOMail.Send
Set objCDOMail = Nothing
else

'对于在用户数据库中的全体用户发信
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
response.write "邮件发送成功！^&^"
'response.write "<br><br><br>"
'response.write rs1("mailsubject")
%> <a href="Sendmail.asp">返回</a>
    </td>
  </tr>
</table>
<!-- #include file="Inc/Foot.asp" -->