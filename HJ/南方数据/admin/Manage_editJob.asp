<!--#include file="admin.asp"-->
<!--#include file="conn.asp"-->
<%if Request.QueryString("no")="eshop" then

id=request("id")
Duix=request("Duix")
Rens=request("Rens")
Did=request("Did")
Daiy=request("Daiy")
Yaoq=request("Yaoq")
Qix=request("Qix")


If Duix="" Then
response.write "SORRY <br>"
response.write "请输入更新内容"
response.end
end if
If Rens="" Then
response.write "SORRY <br>"
response.write "内容不能为空"
response.end
end if
If Did="" Then
response.write "SORRY <br>"
response.write "内容不能为空"
response.end
end if
If Daiy="" Then
response.write "SORRY <br>"
response.write "内容不能为空"
response.end
end if
If Yaoq="" Then
response.write "SORRY <br>"
response.write "内容不能为空"
response.end
end if
If Qix="" Then
response.write "SORRY <br>"
response.write "内容不能为空"
response.end
end if


Set rs = Server.CreateObject("ADODB.Recordset")
sql="select * from Job where id="&id
rs.open sql,conn,1,3

rs("Duix")=Duix
rs("Rens")=Rens
rs("Did")=Did
rs("Daiy")=Daiy
rs("Yaoq")=Yaoq
rs("Qix")=Qix
rs.update
rs.close
response.redirect "Manage_Job.asp"
end if
%>
<%
id=request.querystring("id")
Set rs = Server.CreateObject("ADODB.Recordset")
rs.Open "Select * From Job where id="&id, conn,3,3
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
    <td align="center" valign="top">
	<br>
      <strong><br>
      </strong> <br>
      <br>
      <table width="550" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td height="25"> <div align="center"><strong>修改荣誉<br>
              <br>
              </strong></div></td>
        </tr>
        <tr> 
          <form method="post" action="Manage_editJob.asp?no=eshop">
            <input type=hidden name=id value=<%=id%>>
            <td><div align="center"> 
                <table width="100%" border="0" cellspacing="2" cellpadding="3">
                  <tr> 
                    <td width="19%" height="25" bgcolor="#C0C0C0"> <div align="center">招聘对象</div></td>
                    <td width="81%" bgcolor="#E3E3E3"> <input name="Duix" type="text" class="inputtext" id="Duix" value="<%=rs("Duix")%>" size="25" maxlength="30"></td>
                  </tr>
                  <tr> 
                    <td height="22" bgcolor="#C0C0C0"> <div align="center">招聘人数</div></td>
                    <td bgcolor="#E3E3E3"><input name="Rens" type="text" class="inputtext" id="Rens" value="<%=rs("Rens")%>" size="5" maxlength="30">
                      人</td>
                  </tr>
                  <tr> 
                    <td height="22" bgcolor="#C0C0C0"> <div align="center">工作地点</div></td>
                    <td height="-4" bgcolor="#E3E3E3"> <input name="Did" type="text" class="inputtext" id="Did" value="<%=rs("Did")%>" size="30" maxlength="50"> 
                    </td>
                  </tr>
                  <tr> 
                    <td height="22" bgcolor="#C0C0C0"><div align="center">工资待遇</div></td>
                    <td height="-1" bgcolor="#E3E3E3"> <input name="Daiy" type="text" class="inputtext" id="Daiy" value="<%=rs("Daiy")%>" size="20" maxlength="50"></td>
                  </tr>
                  <tr> 
                    <td height="22" bgcolor="#C0C0C0"> <div align="center">发布日期</div></td>
                    <td height="-3" bgcolor="#E3E3E3"> <%=Date()%></td>
                  </tr>
                  <tr> 
                    <td height="22" bgcolor="#C0C0C0"><div align="center">有效期限</div></td>
                    <td height="0" bgcolor="#E3E3E3"><input name="Qix" type="text" class="inputtext" id="Qix" value="<%=rs("Qix")%>" size="5" maxlength="30">
                      天</td>
                  </tr>
                  <tr> 
                    <td height="22" bgcolor="#C0C0C0"><div align="center">招聘要求</div></td>
                    <td height="10" bgcolor="#E3E3E3"> <textarea name="Yaoq" cols="40" rows="5" class="inputtext" id="Yaoq"><%=rs("Yaoq")%></textarea></td>
                  </tr>
                  <tr> 
                    <td height="25" colspan="2" bgcolor="#E3E3E3"> <div align="center"> 
                        <input name="submit" type="submit" value="确定">
                        &nbsp; 
                        <input name="reset" type="reset" value="取消">
                      </div></td>
                  </tr>
                </table>
              </div></td>
          </form>
        </tr>
      </table> </td>
  </tr>
</table>
<!-- #include file="Inc/Foot.asp" -->