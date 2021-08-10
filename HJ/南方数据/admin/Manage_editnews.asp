<!--#include file="admin.asp"-->
<!--#include file="conn.asp"-->
<!--#include file="../Inc/articleCHAR.INC"-->
<%if Request.QueryString("no")="eshop" then

id=request("id")
title=request("title")
content=htmlencode2(Request("content"))



If title="" Then
response.write "SORRY <br>"
response.write "请输入更新内容的标题"
response.end
end if
If content="" Then
response.write "SORRY <br>"
response.write "内容不能为空"
response.end
end if


Set rs = Server.CreateObject("ADODB.Recordset")
sql="select * from Conews where id="&id
rs.open sql,conn,1,3

rs("title")=title
rs("content")=content
rs.update
rs.close
response.redirect "Manage_News.asp"
end if
%>
<%
id=request.querystring("id")
Set rs = Server.CreateObject("ADODB.Recordset")
rs.Open "Select * From Conews where id="&id, conn,3,3
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
                      <td width="84%" height="20"><font color="#FFFF00">新闻管理</font></td>
                    </tr>
                  </table>
                  <table width="90%" border="0" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td width="34%" height="20" align="right"><img src="../Img/Left_1_1.gif" width="29" height="16"></td>
                      <td width="66%" valign="bottom"><a href="Manage_News.asp"><font color="#FFFF00">公司新闻管理</font></a></td>
                    </tr>
                  </table>
                  <table width="90%" border="0" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td width="34%" height="20" align="right"><img src="../Img/Left_1_1.gif" width="29" height="16"></td>
                      <td width="66%" valign="bottom"><a href="Manage_NewsAdd.asp"><font color="#FFFF00">添加公司新闻</font></a></td>
                    </tr>
                  </table>
                  <table width="90%" border="0" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td width="34%" height="20" align="right"><img src="../Img/Left_1_1.gif" width="29" height="16"></td>
                      <td width="66%" valign="bottom"><a href="Manage_yeNews.asp"><font color="#FFFF00">健康之行管理</font></a></td>
                    </tr>
                  </table>
                  <table width="90%" border="0" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td width="34%" height="20" align="right"><img src="../Img/Left_1_1.gif" width="29" height="16"></td>
                      <td width="66%" valign="bottom"><a href="Manage_yeNewsAdd.asp"><font color="#FFFF00">添加健康之行</font></a></td>
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
          <td height="25"> <div align="center"><strong>修改新闻<br>
              <br>
              </strong></div></td>
        </tr>
        <tr> 
            <form method="post" action="Manage_editnews.asp?no=eshop">
			<input type=hidden name=id value=<%=id%>>
			<td><div align="center"> 
                <table width="100%" border="0" cellspacing="2" cellpadding="3">
                  <tr> 
                    <td width="8%" height="25" bgcolor="#C0C0C0"> <div align="center">标&nbsp;&nbsp;题</div></td>
                    <td width="62%" bgcolor="#C0C0C0"><input type="text" name="title" maxlength="30" size="25" value="<%=rs("title")%>"></td>
                  </tr>
                  <tr> 
                    <td height="22" bgcolor="#E3E3E3"> 
                      <div align="center">UBB代码</div></td>
                    <td bgcolor="#E3E3E3"><script src=../Inc/eshopcode.js></script> 
                      <!--#include file=../Inc/Ubb.inc -->
                    </td>
                  </tr>
                  <tr> 
                    <td height="25" bgcolor="#C0C0C0"><div align="center">内&nbsp;&nbsp;容</div></td>
                    <td height="25" bgcolor="#C0C0C0">
<textarea name="content" cols="57" rows="12"><%if rs("html")=false then
content=replace(rs("content"),"<br>",chr(13))
content=replace(content,"&nbsp;"," ")
else
content=rs("content")
end if
response.write content%></textarea></td>
                  </tr>
                  <tr> 
                    <td height="25" colspan="2" bgcolor="#E3E3E3"> 
                      <div align="center"> 
                        <input type="submit" value="确定">
                        &nbsp;
                        <input type="reset" value="从来">
                      </div></td>
                  </tr>
                  <tr> 
                    <td colspan="2">图片上传</td>
                  </tr>
                  <tr> 
                    <td colspan="2"><div align="center"> 
                        <iframe name="ad" frameborder=0 width=100% height=50 scrolling=no src=../uploada.asp></iframe>
                      </div></td>
                  </tr>
                </table>
              </div></td></form>
        </tr>
      </table>
      <br>
      <br>
    </td>
  </tr>
</table>
<!-- #include file="Inc/Foot.asp" -->