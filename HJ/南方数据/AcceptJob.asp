<!--#include file="Inc/syscode.asp" -->
<!-- #include file="Inc/Head.asp" -->
<TABLE width="760" border=0 align="center" cellPadding=0 cellSpacing=0 bgcolor="#FFFFFF">
  <TBODY>
    <TR> 
      <TD width=188 vAlign=top bgcolor="#FFFFFF"> 
        <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#f2f2f2">
          <tr>
            <td valign="top"><TABLE width="100%" border=0 cellPadding=0 cellSpacing=0 background="Img/index_01b.gif">
                <TBODY>
                  <TR> 
                    <TD height=5 bgcolor="#FFFFFF"></TD>
                  </TR>
                  <TR> 
                    <TD height="34" background="Img/index_01.gif">
<div align="center">��Ա��½ 
                      </div></TD>
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
              <TABLE width="100%" border=0 cellPadding=0 cellSpacing=0 background="Img/index_01b.gif">
                <TBODY>
                  <TR> 
                    <TD height=15 bgcolor="#FFFFFF"></TD>
                  </TR>
                  <TR> 
                    <TD height="33" background="Img/index_01.gif">
<div align="center">�˲���Ƹ</div></TD>
                  </TR>
                  <TR> 
                    <TD height="22"> <div align="center"><a href="Job.asp">�� �� 
                        �� Ƹ</a></div></TD>
                  </TR>
                  <TR> 
                    <TD 
                            height=1 colspan="2" 
                            background=img/naSzarym.gif><IMG height=1 src="img/1x1_pix.gif" 
                              width=10></TD>
                  </TR>
                  <TR> 
                    <TD height="22"><div align="center"><a href="Jobs.asp">�� �� 
                        �� ��</a></div></TD>
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
        </table> 
      </TD>
      <TD width=1 background=img/kropki_pion_naBialym.gif><IMG 
            height=2 src="img/1x1_pix.gif" width=1></TD>
      <TD width="567" vAlign=top><TABLE width="90%" border=0 align="right" cellPadding=0 cellSpacing=0>
          <TBODY>
           
            <TR> 
              <TD height=5></TD>
            </TR>
            <TR> 
              <TD> <TABLE cellSpacing=0 cellPadding=0 width="555" border=0>
                  <TBODY>
                    <TR> 
                      <TD height="25"><img src="Img/bgtop_23.gif" width="557" height="37"></TD>
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
              <TD><TABLE width=98% height="136" align="center" cellPadding=0 cellSpacing=0>
                  <TBODY>
                    <TR vAlign=top > 
                      <TD  width="80%" height="18"> <form method="post" action="SaveAcceptJob.asp">
                          <table width="80%" border="0" align="center" cellpadding="0" cellspacing="0">
                            <tr> 
                              <td width="100%"> <div align="center"> 
                                  <table width="100%" height="79"
border="0" align="center" cellpadding="0" cellspacing="3">
                                    <tr> 
                                      <%job=request("job")%>
                                      <td width="23%" height="25" align="right">ӦƸ��λ�� 
                                      </td>
                                      <td width="77%" height="25"><b><%=job%></b> <input name="jobname" type="hidden" value="<%=job%>"></td>
                                    </tr>
                                    <tr> 
                                      <td width="23%" height="25" align="right">�� 
                                        ����</td>
                                      <td width="77%" height="-6"><font> 
                                        <input name="mane" type="text" class="smallInput" id="mane" style="font-size: 14px" size="12" maxlength="16">
                                        </font></td>
                                    </tr>
                                    <tr> 
                                      <td height="25" align="right">�� ��</td>
                                      <td width="77%" height="-2"><font> 
                                        <select name="sex">
                                          <option value="��" selected>��</option>
                                          <option value="Ů">Ů</option>
                                        </select>
                                        </font></td>
                                    </tr>
                                    <tr> 
                                      <td height="25" align="right">�������ڣ�</td>
                                      <td width="77%" height="-1"> <input name="birthday" type="text" class="smallInput" id="birthday" style="font-size: 14px" size="14" maxlength="30">
                                        ��ʽ��1976-02-02 </td>
                                    </tr>
                                    <tr> 
                                      <td height="25" align="right">����״����</td>
                                      <td width="77%" height="11"><font> 
                                        <select name="marry">
                                          <option value="δ��" selected>δ��</option>
                                          <option value="�ѻ�">�ѻ�</option>
                                        </select>
                                        </font></td>
                                    </tr>
                                    <tr> 
                                      <td height="25" align="right">��ҵԺУ��</td>
                                      <td width="77%" height="11"><font> 
                                        <input name="school" type="text" class="smallInput" id="school" style="font-size: 14px" size="30" maxlength="50">
                                        </font></td>
                                    </tr>
                                    <tr> 
                                      <td width="23%" height="25" align="right">ѧ 
                                        ���� </td>
                                      <td width="77%" height="-6"><input name="studydegree" type="text" class="smallInput" id="studydegree" style="font-size: 14px" size="10" maxlength="16"></td>
                                    </tr>
                                    <tr> 
                                      <td height="25" align="right">ר ҵ��</td>
                                      <td width="77%" height="-3"><font> 
                                        <input name="specialty" type="text" class="smallInput" id="specialty" style="font-size: 14px" size="10" maxlength="30">
                                        </font></td>
                                    </tr>
                                    <tr> 
                                      <td height="25" align="right">��ҵʱ�䣺</td>
                                      <td width="77%" height="-2"> <input name="gradyear" type="text" class="smallInput" id="gradyear" style="font-size: 14px" size="14" maxlength="30">
                                        ��ʽ��1998-7��</td>
                                    </tr>
                                    <tr> 
                                      <td height="25" align="right">�� ����</td>
                                      <td width="77%" height="-1"><font> 
                                        <input name="telephone" type="text" class="smallInput" id="telephone" style="font-size: 14px" size="16" maxlength="30">
                                        </font></td>
                                    </tr>
                                    <tr> 
                                      <td height="25" align="right">E-mail��</td>
                                      <td width="77%" height="-6"><font> 
                                        <input name="email" type="text" class="smallInput" id="email" style="font-size: 14px" size="20" maxlength="30">
                                        </font></td>
                                    </tr>
                                    <tr> 
                                      <td height="25" align="right">��ϵ��ַ��</td>
                                      <td width="77%" height="-3"><font> 
                                        <input name="address" type="text" class="smallInput" id="address" style="font-size: 14px" size="30" maxlength="50">
                                        </font></td>
                                    </tr>
                                    <tr> 
                                      <td height="25" align="right">ˮƽ��������</td>
                                      <td width="77%" height="-2"><font> 
                                        <textarea name="ability" cols="35" rows="5" class="smallInput" id="ability" style="font-size: 14px"></textarea>
                                        </font></td>
                                    </tr>
                                    <tr> 
                                      <td height="25" align="right">���˼�����</td>
                                      <td width="77%" height="-1"><font> 
                                        <textarea name="resumes" cols="35" rows="5" class="smallInput" id="resumes" style="font-size: 14px"></textarea>
                                        </font></td>
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
                        </form></TD>
                    </TR>
                    <TR vAlign=top > 
                      <TD  width="100%" height="15"> </TD>
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
