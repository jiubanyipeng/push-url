<!--#include file="admin.asp"-->
<!--#include file="conn.asp"-->
<%Job=server.htmlencode(Trim(Request("content"))) %>
<%if Request.QueryString("no")="eshop" then
set rs=server.createobject("adodb.recordset")
sql="select * from main"
rs.open sql,conn,3,3
rs("Job")=Job
rs.update
rs.close
response.redirect "Manage_Jobs.asp"
end if
sql="select * from main"
Set rs_home= Server.CreateObject("ADODB.Recordset")
rs_home.open sql,conn,1,1
%>
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
                      <td width="84%" height="20"><font color="#FFFF00">人才管理</font></td>
                    </tr>
                  </table>
                  <table width="90%" border="0" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td width="34%" height="20" align="right"><img src="../Img/Left_1_1.gif" width="29" height="16"></td>
                      <td width="66%" valign="bottom"><a href="Manage_Job.asp"><font color="#FFFF00">招聘管理</font></a></td>
                    </tr>
                  </table>
                  <table width="90%" border="0" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td width="34%" height="20" align="right"><img src="../Img/Left_1_1.gif" width="29" height="16"></td>
                      <td width="66%" valign="bottom"><a href="Manage_JobAdd.asp"><font color="#FFFF00">发布招聘</font></a></td>
                    </tr>
                  </table>
                  <table width="90%" border="0" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td width="34%" height="20" align="right"><img src="../Img/Left_1_1.gif" width="29" height="16"></td>
                      <td width="66%" valign="bottom"><a href="Manage_JobBook.asp"><font color="#FFFF00">应聘管理</font></a></td>
                    </tr>
                  </table>
                  <table width="90%" border="0" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td width="34%" height="20" align="right"><img src="../Img/Left_1_1.gif" width="29" height="16"></td>
                      <td width="66%" valign="bottom"><a href="Manage_Jobs.asp"><font color="#FFFF00">人才策略</font></a></td>
                    </tr>
                  </table></td>
              </tr>
            </table></td>
        </tr>
      </table></td>
    <td width="862" align="center" valign="top">
	<br>
      <strong><br>
      </strong>
      <table width="550" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td height="25">
<div align="center"><a href="Manage_Jobs.asp"><strong>人 才 策 略</strong></a> <strong>设 
              置</strong></div></td>
        </tr>
        <tr> 
          <form method="POST" action="Manage_Jobs.asp?no=eshop">
		  <td><table width="100%" border="0" cellspacing="2" cellpadding="0">
                <tr> 
                  <td height="30" colspan="2">&nbsp;</td>
                </tr>
                <tr> 
                  <td width="19%" height="300" bgcolor="#C0C0C0"> <div align="right">付费指南：<br>
                      支持UBB代码 </div></td>
                  <td width="81%" bgcolor="#E3E3E3"> <script src=../Inc/Eshopcode.js></script> 
                    <!--#include file=../Inc/Ubb.inc -->
                    <textarea name="content" cols="58" rows="15"><%if rs_home("html")=false then
Job=replace(rs_home("Job"),"<br>",chr(13))
Job=replace(Job,"&nbsp;"," ")
else
Job=rs_home("Job")
end if
response.write Job%></textarea> </td>
                </tr>
                <tr> 
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                </tr>
                <tr> 
                  <td colspan="2"><div align="center"> 
                      <input type="submit" value=" 修 改 "
name="cmdok">
                      &nbsp; 
                      <input type="reset" value=" 重 写 "
name="cmdcancel">
                    </div></td>
                </tr>
                <tr>
                  <td colspan="2">图片上传</td>
                </tr>
                <tr>
                  <td colspan="2"><div align="center"><iframe name="ad" frameborder=0 width=100% height=50 scrolling=no src=../uploada.asp></iframe></div></td>
                </tr>
              </table></td></form>
        </tr>
      </table>
      <strong> </strong></td>
  </tr>
</table>
<!-- #include file="Inc/Foot.asp" -->