<!--#include file="Inc/syscode.asp" -->
<!--#include file="inc/Skin_css.asp"-->
<%
Id=Session("UserName")
set Rst = Server.CreateObject("ADODB.recordset")
sql="select * from User where UserName='"&Id&"'"
rst.open sql,conn,1,1
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
                <td height="34" class="title_left">&nbsp;&nbsp;&nbsp;<img src="Images/smallbook.jpg" width="10" height="10">&nbsp;&nbsp;�û���½ 
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
            
          </td>
          <td width="6"></td>
          <td valign="top"><table Class=border width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
              <tr> 
                <td height="206" valign="top"> <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td class="title_right" height="32">&nbsp;&nbsp;&nbsp;<img src="Images/smallbook.jpg" width="10" height="10">&nbsp;&nbsp;�� 
                        Ϣ �� ��</td>
                    </tr>
                  </table>
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td><form method="post" action="SaveNetBooK.asp">
                          <table width="80%" border="0" align="center" cellpadding="0" cellspacing="0">
                            <tr> 
                              <td width="100%"> <div align="center"> 
                                  <table width="100%" height="79"
border="0" align="center" cellpadding="0" cellspacing="3">
                                    <tr> 
                                      <td width="23%" height="25" align="right">�û����ƣ� 
                                      </td>
                                      <td width="77%" height="25"><font> 
                                        <input type="text" readonly name="Name" maxlength="36" value="<%if Session("UserName")="" then response.write"δע���û�" end if%><%=Session("UserName")%>" style="background-color: #FFFFFF; border-style: solid; border-color: #FFFFFF" class="smallInput">
                                        </font></td>
                                    </tr>
                                    <tr> 
                                      <td width="23%" height="25" align="right">��˾���ƣ�</td>
                                      <td width="77%" height="-6"><font> 
                                        <input type="text" name="Comane" size="30" maxlength="36" value="<%=rst("Comane")%>" style="font-size: 14px" class="smallInput">
                                        </font>* </td>
                                    </tr>
                                    <tr> 
                                      <td height="25" align="right">��ϵ�ˣ�</td>
                                      <td width="77%" height="-2"><font> 
                                        <input type="text" name="Somane" size="12" maxlength="30" value="<%=rst("Somane")%>" style="font-size: 14px" class="smallInput">
                                       </font> * </td>
                                    </tr>
                                    <tr> 
                                      <td height="25" align="right">��ϵ�绰��</td>
                                      <td width="77%" height="-1"><font> 
                                        <input type="text" name="Phone" size="24" maxlength="36" value="<%=rst("Phone")%>" style="font-size: 14px" class="smallInput">
                                        </font>* </td>
                                    </tr>
                                    <tr> 
                                      <td height="25" align="right">��ϵ���棺</td>
                                      <td width="77%" height="11"><font> 
                                        <input type="text" name="Fox" size="18" maxlength="36" value="<%=rst("Fox")%>" style="font-size: 14px" class="smallInput">
                                        </font></td>
                                    </tr>
                                    <tr> 
                                      <td height="25" align="right">E-mail��</td>
                                      <td width="77%" height="11"><font> 
                                        <input type="text" name="Email" size="18" maxlength="36" value="<%=rst("Email")%>" style="font-size: 14px" class="smallInput">
                                        </font></td>
                                    </tr>
                                    <tr> 
                                      <td width="23%" height="25" align="right">�������⣺ 
                                      </td>
                                      <td width="77%" height="25"><input type="text" name="Title" size="42" maxlength="36" style="font-size: 14px" class="smallInput">
                                        *</td>
                                    </tr>
                                    <tr> 
                                      <td width="23%" height="1" valign="top" align="right">�������ݣ� 
                                      </td>
                                      <td width="77%" height="1" valign="top"><textarea rows="10" name="Content" cols="45" style="font-size: 14px" class="smallInput"></textarea> 
                                      </td>
                                    </tr>
                                    <tr> 
                                      <td width="23%" height="0" valign="top"> 
                                      </td>
                                      <td width="77%" height="0" valign="top"> 
                                        <input type="submit" value="�ύ����"
name="cmdOk"> <input type="reset" value="��д" name="cmdReset"> </td>
                                    </tr>
                                  </table>
                                </div></td>
                            </tr>
                          </table>
                        </form></td>
                    </tr>
                  </table> </td>
              </tr>
            </table></td>
        </tr>
      </table></td>
  </tr>
</table>
<!-- #include file="Inc/Foot.asp" -->
</BODY></HTML>
