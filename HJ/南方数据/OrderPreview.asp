<!--#include file="Inc/SysProduct.asp" -->
<!--#include file="inc/Skin_css.asp"-->
<%
Subject=request.form("Subject")
UserName=session("UserName")
Receiver=request.form("Receiver")
Sex=request.form("Sex")
Phone=request.form("Phone")
Add=request.form("Add")
Email=request.form("Email")
Notes=request.form("Notes")
CompanyName=request.form("CompanyName")
Fax=request.form("Fax")

ProductList = Session("ProductList")
if productlist<>"" then
  sql="select Title from Product where Product_Id in ("&productlist&") order by Product_Id"
  Set rs_title = conn.Execute( sql )
else
  response.redirect "error.asp?error=007"
  response.end
end if
%>

<!-- #include file="Head.asp" -->
<table width="760" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="5" valign="top" bgcolor="#FFFFFF"></td>
  </tr>
  <tr> 
    <td height="72" valign="top" bgcolor="#FFFFFF"><table width="746" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr> 
          <td class="tdbg_left"  width="190" height="179" valign="top" > <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="34" class="title_left">&nbsp;&nbsp;&nbsp;<img src="Images/smallbook.jpg" width="10" height="10">&nbsp;&nbsp;用户登陆 
                </td>
              </tr>
              <tr> 
                <td height="5"></td>
              </tr>
              <tr> 
                <td height="10"><table width="92%" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td> 
                        <% call ShowUserLogin() %>
                      </td>
                    </tr>
                  </table></td>
              </tr>
              <tr> 
                <td height="5"></td>
              </tr>
            </table>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="34" class="title_left">&nbsp;&nbsp;&nbsp;<img src="Images/smallbook.jpg" width="10" height="10">&nbsp;&nbsp;产品列表</td>
              </tr>
              <tr> 
                <td height="5"></td>
              </tr>
              <tr> 
                <td height="10"><table width="92%" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td> 
                        <% call ShowSmallClass_Tree() %>
                      </td>
                    </tr>
                  </table></td>
              </tr>
              <tr> 
                <td height="5"></td>
              </tr>
            </table> 
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="34" class="title_left">&nbsp;&nbsp;&nbsp;<img src="Images/smallbook.jpg" width="10" height="10">&nbsp;&nbsp;产品搜索</td>
              </tr>
              <tr> 
                <td height="5"></td>
              </tr>
              <tr> 
                <td height="10"><table width="92%" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td> 
                        <% call ShowSearch(1) %>
                      </td>
                    </tr>
                  </table></td>
              </tr>
              <tr> 
                <td height="5"></td>
              </tr>
            </table></td>
          <td width="6"></td>
          <td  valign="top"><table Class=border width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
              <tr> 
                <td height="206" valign="top"> <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td class="title_right" height="32">&nbsp;&nbsp;&nbsp;<img src="Images/smallbook.jpg" width="10" height="10">&nbsp;在 
                        线 询 价</td>
                    </tr>
					
                    
                  </table>
                  <table width=100% cellpadding=0 cellspacing=0>
                    <tr>
                      <td><form name=confirm action="ordersent.asp" method=post>
                          <%=UserName%>:<br>
                          　　您好！<br>
                          　　以下是您的询价信息，如果没有问题请 
                          <input name="submit" type="submit" value="马上提交">
                          ，或者返回 
                          <input type="button" name="Submit2" onclick="javascript:history.go(-1)" value="返回修改">
                          <br>
                          &nbsp;&nbsp;有任何疑问请及时和我们联系！ <br>
                          <input type=hidden value="ok" name="confirm">
                          <table border="0" cellspacing="1" cellpadding="0" align="center" width="90%" bgcolor="#000000">
                            <tr bgcolor="#FFFFFF"> 
                              <td height="25">联系信息</td>
                            </tr>
                            <tr bgcolor="#FFFFFF"> 
                              <td height="25"><font color="B0266D"> &nbsp;&nbsp;&nbsp;&nbsp;联系人:<%=Receiver%><br>
                                &nbsp;&nbsp;&nbsp;&nbsp;性别: 
                                <% if Sex="1" then response.Write("男") else response.Write("女") end if%>
                                <br>
                                &nbsp;&nbsp;&nbsp;&nbsp;标题：<%=Subject%><br>
                                &nbsp;&nbsp;&nbsp;&nbsp;说明：<%=Notes%><br>
                                &nbsp;&nbsp;&nbsp;&nbsp;公司名称：<%=CompanyName%><br>
                                &nbsp;&nbsp;&nbsp;&nbsp;公司地址：<%=Add%><br>
                                &nbsp;&nbsp;&nbsp;&nbsp;邮箱：<%=Email%><br>
                                &nbsp;&nbsp;&nbsp;&nbsp;公司电话：<%=Phone%><br>
                                &nbsp;&nbsp;&nbsp;&nbsp;传真：<%=Fax%><br>
                           <INPUT TYPE="hidden" name="Receiver" value="<%=Receiver%>">
                           <INPUT TYPE="hidden" name="Subject" value="<%=Subject%>">
                           <INPUT TYPE="hidden" name="Phone" value="<%=Phone%>">
                           <INPUT TYPE="hidden" name="Add" value="<%=Add%>">
                           <INPUT TYPE="hidden" name="Sex" value="<%=Sex%>">
                           <INPUT TYPE="hidden" name="Email" value="<%=Email%>">
                           <INPUT TYPE="hidden" name="Notes" value="<%=Notes%>">
                           <INPUT TYPE="hidden" name="CompanyName" value="<%=CompanyName%>">
                           <INPUT TYPE="hidden" name="Fax" value="<%=Fax%>">
                                </font></td>
                            </tr>
                            <tr bgcolor="#FFFFFF"> 
                              <td width="50%" height="25" align="center"> <font color="B0266D">商 
                                品 名 称</font> </td>
                            </tr>
<%  
  While Not rs_title.Eof    
%> 
                            <tr bgcolor="#FFFFFF"> 
                              <td width="50%" height="20"> <div align="center"><font color="B0266D"><%=rs_title("Title")%></font></div></td>
                            </tr>
<%
rs_title.MoveNext
Wend
rs_title.close
set rs_title=nothing
%>
                          </table>
                        </form></table> </td>
              </tr>
            </table></td>
        </tr>
      </table></td>
  </tr>
</table>
<!-- #include file="Inc/Foot.asp" -->
</BODY></HTML>
<%
set conn=nothing
%>