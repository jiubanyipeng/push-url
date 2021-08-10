<!--#include file="Inc/syscode.asp" -->
<%
Id=Session("UserName")
set Rst = Server.CreateObject("ADODB.recordset")
sql="select * from User where UserName='"&Id&"'"
rst.open sql,conn,1,1
%>
<!-- #include file="Inc/Head.asp" -->
<TABLE width="760" border=0 align="center" cellPadding=0 cellSpacing=0 bgcolor="#FFFFFF">
  <TBODY>
    <TR> 
      <TD width=196 vAlign=top bgcolor="#FFFFFF"><table width="92%" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
          <tr> 
            <td width="196" valign="top"> <TABLE width="100%" border=0 cellPadding=0 cellSpacing=0 background="Img/index_01b.gif">
                <TBODY>
                  <TR> 
                    <TD height=5 bgcolor="#FFFFFF"></TD>
                  </TR>
                  <TR> 
                    <TD height="33" background="Img/index_01.gif"> 
                      <div align="center">会员登陆</div></TD>
                  </TR>
                  <TR> 
                    <TD height="5"> </TD>
                  </TR>
                  <TR> 
                    <TD vAlign=top><table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
                        <tr> 
                          <td> 
                            <% call ShowUserLogin() %>
                          </td>
                        </tr>
                      </table></TD>
                  </TR>
                  <TR> 
                    <TD height="5"> </TD>
                  </TR>
                  <TR> 
                    <TD 
                            height=1 colspan="2" 
                            background=img/naSzarym.gif><IMG height=1 src="img/1x1_pix.gif" 
                              width=10></TD>
                  </TR>
                </TBODY>
              </TABLE>
              
            </td>
          </tr>
        </table></TD>
      <TD width=1 background=img/kropki_pion_naBialym.gif><IMG 
            height=2 src="img/1x1_pix.gif" width=1></TD>
      <TD vAlign=top><TABLE width="90%" border=0 align="right" cellPadding=0 cellSpacing=0>
          <TBODY>
            <TR> 
              <TD background=img/naBialym.gif><IMG height=1 src="img/1x1_pix.gif" 
              width=10></TD>
            </TR>
            <TR> 
              <TD><IMG height=1 
                  src="img/1x1_pix.gif" width=1></TD>
            </TR>
            <TR> 
              <TD> <TABLE cellSpacing=0 cellPadding=0 width="555" border=0>
                  <TBODY>
                    <TR> 
                      <TD height="25"><img src="Img/6.gif" width="557" height="37"></TD>
                    </TR>
                  </TBODY>
                </TABLE></TD>
            </TR>
            <TR> 
              <TD background=img/naBialym.gif><IMG height=1 src="img/1x1_pix.gif" 
              width=10></TD>
            </TR>
            <TR> 
              <TD><TABLE width=98% height="136" align="center" cellPadding=0 cellSpacing=0>
                  <TBODY>
                    <TR vAlign=top > 
                      <TD  width="80%" height="18"> <form method="post" action="SaveNetBooK.asp">
                          <table width="80%" border="0" align="center" cellpadding="0" cellspacing="0">
                            <tr> 
                              <td width="100%"> <div align="center"> 
                                  <table width="100%" height="79"
border="0" align="center" cellpadding="0" cellspacing="3">
                                    <tr> 
                                      <td width="23%" height="25" align="right">用户名称： 
                                      </td>
                                      <td width="77%" height="25"><font> 
                                        <input type="text" readonly name="Name" maxlength="36" value="<%if Session("UserName")="" then response.write"未注册用户" end if%><%=Session("UserName")%>" style="background-color: #FFFFFF; border-style: solid; border-color: #FFFFFF" class="smallInput">
                                        </font></td>
                                    </tr>
                                    <tr> 
                                      <td width="23%" height="25" align="right">公司名称：</td>
                                      <td width="77%" height="-6"><font> 
                                        <input type="text" name="Comane" size="30" maxlength="36" value="<%=rst("Comane")%>" style="font-size: 14px" class="smallInput">
                                        * </font></td>
                                    </tr>
                                    <tr> 
                                      <td height="25" align="right">联系人：</td>
                                      <td width="77%" height="-2"><font> 
                                        <input type="text" name="Somane" size="12" maxlength="30" value="<%=rst("Somane")%>" style="font-size: 14px" class="smallInput">
                                        * </font></td>
                                    </tr>
                                    <tr> 
                                      <td height="25" align="right">联系电话：</td>
                                      <td width="77%" height="-1"><font> 
                                        <input type="text" name="Phone" size="24" maxlength="36" value="<%=rst("Phone")%>" style="font-size: 14px" class="smallInput">
                                        * </font></td>
                                    </tr>
                                    <tr> 
                                      <td height="25" align="right">联系传真：</td>
                                      <td width="77%" height="11"><font> 
                                        <input type="text" name="Fox" size="18" maxlength="36" value="<%=rst("Fox")%>" style="font-size: 14px" class="smallInput">
                                        </font></td>
                                    </tr>
                                    <tr> 
                                      <td height="25" align="right">E-mail：</td>
                                      <td width="77%" height="11"><font> 
                                        <input type="text" name="Email" size="18" maxlength="36" value="<%=rst("Email")%>" style="font-size: 14px" class="smallInput">
                                        </font></td>
                                    </tr>
                                    <tr> 
                                      <td width="23%" height="25" align="right">反馈主题： 
                                      </td>
                                      <td width="77%" height="25"><input type="text" name="Title" size="42" maxlength="36" style="font-size: 14px" class="smallInput">
                                        *</td>
                                    </tr>
                                    <tr> 
                                      <td width="23%" height="1" valign="top" align="right">反馈内容： 
                                      </td>
                                      <td width="77%" height="1" valign="top"><textarea rows="10" name="Content" cols="45" style="font-size: 14px" class="smallInput"></textarea> 
                                      </td>
                                    </tr>
                                    <tr> 
                                      <td width="23%" height="0" valign="top"> 
                                      </td>
                                      <td width="77%" height="0" valign="top"> 
                                        <input type="submit" value="提交留言"
name="cmdOk"> <input type="reset" value="重写" name="cmdReset"> </td>
                                    </tr>
                                  </table>
                                </div></td>
                            </tr>
                          </table>
                        </form></TD>
                    </TR>
                    <TR vAlign=top > 
                      <TD  width="100%" height="15"> </TD>
                    </TR>
                  </TBODY>
                </TABLE></TD>
            </TR>
            <TR> 
              <TD background=img/naBialym.gif><IMG height=1 src="img/1x1_pix.gif" 
              width=10></TD>
            </TR>
            <TR> 
              <TD>&nbsp;</TD>
            </TR>
          </TBODY>
        </TABLE> </TD>
    </TR>
  </TBODY>
</TABLE>
<!-- #include file="Inc/Foot.asp" -->
</BODY></HTML>
