<!--#include file="Inc/syscode.asp"-->
<!-- #include file="Inc/Head.asp" -->
<TABLE width="760" border=0 align="center" cellPadding=0 cellSpacing=0 bgcolor="#FFFFFF">
  <TBODY>
    <TR> 
      <TD width=196 vAlign=top bgcolor="#FFFFFF"> 
        <table width="92%" height="100%" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
          <tr> 
            <td valign="top"><TABLE width="100%" border=0 cellPadding=0 cellSpacing=0 background="Img/index_01b.gif">
                <TBODY>
                  <TR> 
                    <TD height=5 bgcolor="#FFFFFF"></TD>
                  </TR>
                  <TR> 
                    <TD height="33" background="Img/index_01.gif"> 
                      <div align="center">��Ա��½ </div></TD>
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
                      <div align="center">�����뽡��</div></TD>
                  </TR>
                  <TR> 
                    <TD height="22"> <div align="center"><a href="News.asp">�� 
                        ҵ �� ��</a></div></TD>
                  </TR>
                  <TR> 
                    <TD 
                            height=1 colspan="2" 
                            background=img/naSzarym.gif><IMG height=1 src="img/1x1_pix.gif" 
                              width=10></TD>
                  </TR>
                  <TR> 
                    <TD height="22"><div align="center"><a href="yeNews.asp">ҵ 
                            �� �� Ѷ</a></div></TD>
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
      <TD vAlign=top> <TABLE width="99%" border=0 align="right" cellPadding=0 cellSpacing=0>
          <TBODY>
            <TR> 
              <TD 
                  height=1 background=img/naBialym.gif><IMG height=1 src="img/1x1_pix.gif" 
              width=10></TD>
            </TR>
            <TR> 
              <TD><img src="Img/buttonjk.gif" width="557" height="37"></TD>
            </TR>
            <TR> 
              <TD 
                  height=1 background=img/naBialym.gif><IMG height=1 src="img/1x1_pix.gif" 
              width=10></TD>
            </TR>
            <TR> 
              <TD 
                  height=1> <%
if not isEmpty(request.QueryString("id")) then
id=request.QueryString("id")
else
id=1
end if

Set rs = Server.CreateObject("ADODB.Recordset")
rs.Open "Select * From Yenews where id="&id, conn,3,3
'��¼���ʴ���
rs("counter")=rs("counter")+1
rs.update
nCounter=rs("counter")
'��������
content=ubbcode(rs("content"))
%> 
                <table width="100%" height="19" border="0" align="center" cellpadding="0" cellspacing="0">
                  <tr> 
                        <td height="22" bgcolor="#FDFFFB">&nbsp;��ҳ��ҵ����Ѷ ������</td>
                  </tr>
                  <tr> 
                    <td height="1" bgcolor="#CCCCCC"></td>
                  </tr>
                </table>
                <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FDFFFB">
                  <tr> 
                    <td><table width="95%" border="0" align="center" cellpadding="0" cellspacing="5">
                        <tr> 
                          <td height="5"></td>
                        </tr>
                        <tr> 
                          <td><div align="center"><span class="biaoti"><%=rs("title")%></span><br>
                              <br>
                              �������ڣ�[<%=rs("time")%>]&nbsp;&nbsp;&nbsp; ����[<%=rs("counter")%>]��</div></td>
                        </tr>
                        <tr> 
                          <td height="5"></td>
                        </tr>
                        <tr> 
                          <td><p style='line-height:200%'><span class="zhiwen"><%=content%></span> 
                              <%rs.close%> </td>
                        </tr>
                        <tr> 
                          <td>&nbsp;</td>
                        </tr>
                      </table></td>
                  </tr>
                </table>
                <table width="100%" height="19" border="0" align="center" cellpadding="0" cellspacing="0">
                  <tr> 
                    <td height="1" colspan="2" bgcolor="#CCCCCC"></td>
                  </tr>
                  <tr> 
                    <td width="55%" height="22" bgcolor="#FDFFFB"> <div align="right"></div></td>
                    <td width="45%" bgcolor="#FDFFFB"><div align="right">��<a href='javascript:window.print()'>��ӡ��ҳ</a>��&nbsp;��<a href='javascript:history.back()'>����</a>����<A 
            href="javascript:window.scroll(0,-360)">����</A>����<a href="javascript:self.close()">�ر�</a>��</div></td>
                  </tr>
                </table></TD>
            </TR>
            <TR> 
              <TD 
                  height=1 background=img/naBialym.gif><IMG height=1 src="img/1x1_pix.gif" 
              width=10></TD>
            </TR>
            <TR> 
              <TD 
                  height=1>&nbsp;</TD>
            </TR>
          </TBODY>
        </TABLE></TD>
    </TR>
  </TBODY>
</TABLE>
<!-- #include file="Inc/Foot.asp" -->
</BODY></HTML>
