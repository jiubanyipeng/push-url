<!--#include file="Inc/syscode.asp" -->
<!--#include file="inc/md5.asp"-->
<%If Session("UserName")="" Then
response.redirect"Server.asp"
end if%>
<%
Id=Session("UserName")
set rsUser = Server.CreateObject("ADODB.recordset")
sql="select * from User where UserName='"&Id&"'"
rsUser.open sql,conn,1,1
%>
<!-- #include file="Inc/Head.asp" -->
<TABLE width="760" border=0 align="center" cellPadding=0 cellSpacing=0 bgcolor="#FFFFFF">
  <TBODY>
    <TR> 
          <TD width=196 vAlign=top bgcolor="#FFFFFF"> <table width="92%" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
              <tr> 
                <td valign="top"> <TABLE width="100%" border=0 cellPadding=0 cellSpacing=0 background="Img/index_01b.gif">
                    <TBODY>
                      <TR> 
                        <TD height=5 bgcolor="#FFFFFF"></TD>
                      </TR>
                      <TR> 
                        <TD height="33" background="Img/index_01.gif"> <div align="center">会员中心 
                          </div></TD>
                      </TR>
                      <TR> 
                        <TD height="22"> <div align="center"><a href="Manage.asp">修改会员资料</a></div></TD>
                      </TR>
                      <TR> 
                        <TD 
                            height=1 colspan="2" 
                            background=img/naSzarym.gif><IMG height=1 src="img/1x1_pix.gif" 
                              width=10></TD>
                      </TR>
                      <TR> 
                        <TD height="22"><div align="center"><a href="E_shop.asp">购物订单查询</a></div></TD>
                      </TR>
                      <TR> 
                        <TD 
                            height=1 colspan="2" 
                            background=img/naSzarym.gif><IMG height=1 src="img/1x1_pix.gif" 
                              width=10></TD>
                      </TR>
                      <TR> 
                        <TD height="22"><div align="center"><a href="E_shop.asp">购物订单查询</a></div></TD>
                      </TR>
                      <TR> 
                        <TD height="22"><div align="center"><a href="NetBook.asp">站内留言中心</a></div></TD>
                      </TR>
                      <TR> 
                        <TD 
                            height=1 colspan="2" 
                            background=img/naSzarym.gif><IMG height=1 src="img/1x1_pix.gif" 
                              width=10></TD>
                      </TR>
                      <TR> 
                        <TD height="22"><div align="center"><a href="UserLogout.asp">退出会员中心</a></div></TD>
                      </TR>
                      <TR> 
                        <TD 
                            height=1 colspan="2" 
                            background=img/naSzarym.gif><IMG height=1 src="img/1x1_pix.gif" 
                              width=10></TD>
                      </TR>
                    </TBODY>
                  </TABLE></td>
              </tr>
            </table></TD>
      <TD width=1 background=img/kropki_pion_naBialym.gif><IMG 
            height=2 src="img/1x1_pix.gif" width=1></TD>
      <TD vAlign=top><TABLE width="90%" border=0 align="right" cellPadding=0 cellSpacing=0>
          <TBODY>
            <TR> 
              <TD background=img/naBialym.gif 
                  height=1><IMG height=1 src="img/1x1_pix.gif" 
              width=10></TD>
            </TR>
            <TR> 
              <TD height=5><IMG height=1 
                  src="img/1x1_pix.gif" width=1></TD>
            </TR>
            <TR> 
              <TD> <TABLE cellSpacing=0 cellPadding=0 width="555" border=0>
                  <TBODY>
                    <TR> 
                      <TD height="25"><img src="Img/bgtop_18.gif" width="557" height="37"></TD>
                    </TR>
                  </TBODY>
                </TABLE></TD>
            </TR>
            <TR> 
              <TD background=img/naBialym.gif 
                  height=1><IMG height=1 src="img/1x1_pix.gif" 
              width=10></TD>
            </TR>
            <TR> 
              <TD><table width=500 border=0 align="center" cellpadding=2 cellspacing=2 class='border'>
                  <TR align=center class='title'> 
                    <TD height=20 colSpan=2><font class=en><b>修改注册用户信息</b></font></TD>
                  </TR>
                  <TR class="tdbg" > 
                    <TD width="120" align="right"><b>用 户 名：</b></TD>
                    <TD> <INPUT name=UserName value="<%=rsUser("UserName")%>" size=30   maxLength=14></TD>
                  </TR>
                  <TR class="tdbg" > 
                    <TD width="120" align="right"><B>密码(至少6位)：</B></TD>
                    <TD> <INPUT   type=password maxLength=16 size=30 name=Password> 
                      <font color="#FF0000">如果不想修改，请留空</font> </TD>
                  </TR>
                  <TR class="tdbg" > 
                    <TD width="120" align="right"><strong>密码问题：</strong></TD>
                    <TD> <INPUT name="Question"   type=text value="<%=rsUser("Question")%>" size=30> 
                    </TD>
                  </TR>
                  <TR class="tdbg" > 
                    <TD width="120" align="right"><strong>问题答案：</strong></TD>
                    <TD> <INPUT   type=text size=30 name="Answer"> <font color="#FF0000">如果不想修改，请留空</font></TD>
                  </TR>
                  <TR class="tdbg" > 
                    <TD width="120" align="right"><strong>性别：</strong></TD>
                    <TD> <INPUT type=radio value="1" name=sex <%if rsUser("Sex")=1 then response.write "CHECKED"%>>
                      男 &nbsp;&nbsp; <INPUT type=radio value="0" name=sex <%if rsUser("Sex")=0 then response.write "CHECKED"%>>
                      女</TD>
                  </TR>
                  <TR class="tdbg" > 
                    <TD width="120" align="right"><strong>Email地址：</strong></TD>
                    <TD> <INPUT name=Email value="<%=rsUser("Email")%>" size=30   maxLength=50> 
                    </TD>
                  </TR>
                  <TR class="tdbg" > 
                    <TD width="120" align="right"><strong>主页：</strong></TD>
                    <TD> <INPUT   maxLength=100 size=30 name=homepage value="<%=rsUser("HomePage")%>"></TD>
                  </TR>
                  <TR class="tdbg" > 
                    <TD width="120" align="right"><strong>公司名称：</strong></TD>
                    <TD> <INPUT name=Comane value="<%=rsUser("Comane")%>" size=30 maxLength=20></TD>
                  </TR>
                  <TR class="tdbg" > 
                    <TD width="120" align="right"><strong>收货地址：</strong></TD>
                    <TD> <INPUT name=Add value="<%=rsUser("Add")%>" size=30 maxLength=50></TD>
                  </TR>
                  <TR class="tdbg" > 
                    <TD align="right"><strong>收货人：</strong></TD>
                    <TD><INPUT name=Somane value="<%=rsUser("Somane")%>" size=30 maxLength=50></TD>
                  </TR>
                  <TR class="tdbg" > 
                    <TD align="right"><strong>邮政编码：</strong></TD>
                    <TD><INPUT name=Zip value="<%=rsUser("Zip")%>" size=30 maxLength=50></TD>
                  </TR>
                  <TR class="tdbg" > 
                    <TD align="right"><strong>联系电话：</strong><br></TD>
                    <TD><INPUT name=Phone value="<%=rsUser("Phone")%>" size=30 maxLength=50></TD>
                  </TR>
                  <TR class="tdbg" > 
                    <TD align="right"><strong>传 真：</strong></TD>
                    <TD><INPUT name=Fox value="<%=rsUser("Fox")%>" size=30 maxLength=50></TD>
                  </TR>
                  <TR align="center" class="tdbg" > 
                    <TD height="40" colspan="2"><input name="Action" type="hidden" id="Action" value="Modify"> 
                      <input name=Submit2   type=submit id="Submit" value="保存修改结果"> 
                      <input name="UserID" type="hidden" id="UserID" value="<%=rsUser("UserID")%>"></TD>
                  </TR>
                </TABLE></TD>
            </TR>
            <TR> 
              <TD background=img/naBialym.gif 
                  height=1><IMG height=1 src="img/1x1_pix.gif" 
              width=10></TD>
            </TR>
            <TR> 
              <TD 
                  height=45>&nbsp; </TD>
            </TR>
          </TBODY>
        </TABLE> </TD>
    </TR>
  </TBODY>
</TABLE>
<!-- #include file="Inc/Foot.asp" -->
</BODY></HTML>
