<!--#include file="admin.asp"-->
<!--#include file="conn.asp"-->
<%if Request.QueryString("no")="eshop" then%>
<%
title=server.htmlencode(Trim(Request("title")))
img=server.htmlencode(Trim(Request("img")))
%>
<%


If title="" Then
response.write "SORRY <br>"
response.write "������������ݵı���!!<a href=""javascript:history.go(-1)"">��������</a>"
response.end
end if
If img="" Then
response.write "SORRY <br>"
response.write "���ݲ���Ϊ��!!<a href=""javascript:history.go(-1)"">��������</a>"
response.end
end if

Set rs = Server.CreateObject("ADODB.Recordset")
sql="select * from img "
rs.open sql,conn,1,3
rs.addnew
rs("title")=title
rs("img")=img
rs.update
rs.close
response.redirect "Manage_Img.asp"
end if
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
                      <td width="84%" height="20"><font color="#FFFF00">��ҵ��������</font></td>
                    </tr>
                  </table>
                  <table width="90%" border="0" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td width="34%" height="20" align="right"><img src="../Img/Left_1_1.gif" width="29" height="16"></td>
                      <td width="66%" valign="bottom"><a href="Manage_honor.asp"><font color="#FFFF00">��ҵ��������</font></a></td>
                    </tr>
                  </table>
                  <table width="90%" border="0" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td width="34%" height="20" align="right"><img src="../Img/Left_1_1.gif" width="29" height="16"></td>
                      <td width="66%" valign="bottom"><a href="Manage_honor_add.asp"><font color="#FFFF00">�����ҵ����</font></a></td>
                    </tr>
                  </table>
                  <table width="90%" border="0" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td width="34%" height="20" align="right"><img src="../Img/Left_1_1.gif" width="29" height="16"></td>
                      <td width="66%" valign="bottom"><a href="Manage_Img.asp"><font color="#FFFF00">��ҵ�������</font></a></td>
                    </tr>
                  </table>
                  <table width="90%" border="0" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td width="34%" height="20" align="right"><img src="../Img/Left_1_1.gif" width="29" height="16"></td>
                      <td width="66%" valign="bottom"><a href="Manage_Img_add.asp"><font color="#FFFF00">�����ҵ����</font></a></td>
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
          <td> 
            <div align="center"><strong>�������<br>
              <br>
              </strong></div></td>
        </tr>
        <tr> 
          <form method="post" name="myform" action="Manage_Img_add.asp?no=eshop">
            <td><div align="center"> 
                <table width="100%" border="0" cellspacing="2" cellpadding="3">
                  <tr> 
                    <td width="8%" bgcolor="#C0C0C0"> 
                      <div align="center">��������</div></td>
                    <td width="62%" bgcolor="#C0C0C0"><input type="text" name="title" class="inputtext" maxlength="30" size="25"></td>
                  </tr>
                  <tr> 
                    <td bgcolor="#E3E3E3"> 
                      <div align="center">����ͼƬ</div></td>
                    <td bgcolor="#E3E3E3"><input name="img" type="text" class="inputtext" id="img" size="30" maxlength="50">
                      <font color="#FF0000"> * ͼƬ��ַ</font></td>
                  </tr>
                  <tr bgcolor="#C0C0C0"> 
                    <td colspan="2"> 
                      <div align="center"> 
                        <input name="submit" type="submit" value="ȷ��">
                        &nbsp; 
                        <input name="reset" type="reset" value="ȡ��">
                      </div></td>
                  </tr>
                  <tr> 
                    <td colspan="2">ͼƬ�ϴ�</td>
                  </tr>
                  <tr> 
                    <td colspan="2"> 
                      <div align="center"> 
                        <iframe name="ad" frameborder=0 width=100% height=50 scrolling=no src=../uploada.asp></iframe>
                      </div></td>
                  </tr>
                </table>
              </div></td>
          </form>
        </tr>
      </table>
      <br>
    </td>
  </tr>
</table>
<!-- #include file="Inc/Foot.asp" -->