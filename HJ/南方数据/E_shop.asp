<!--#include file="inc/conn.asp"-->
<%If Session("UserName")="" Then
response.redirect"Server.asp"
end if%>

<SCRIPT language=javascript>

function chkitem(str)
{	
var strSource ="0123456789-";
var ch;
var i;
var temp;

for (i=0;i<=(str.length-1);i++)
{

ch = str.charAt(i);
temp = strSource.indexOf(ch);
if (temp==-1)
{
return 0;
}
}
if (strSource.indexOf(ch)==-1)
{
return 0;
}
else
{
return 1;
}


}

function FORM1_onsubmit()
{
if (chkitem(document.FORM1.Form_Id.value)==0)
{
alert("��������ȷ�Ķ������롣");
document.FORM1.Form_Id.focus();
return false;
}
}
</SCRIPT>
<!-- #include file="Inc/Head.asp" -->
<TABLE width="760" border=0 align="center" cellPadding=0 cellSpacing=0 bgcolor="#FFFFFF">
  <TBODY>
    <TR> 
      <TD width=196 vAlign=top bgcolor="#FFFFFF"> 
        <table width="92%" height="100%" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#f2f2f2">
          <tr>
            <td valign="top">
<TABLE width="100%" border=0 cellPadding=0 cellSpacing=0 background="Img/index_01b.gif">
                <TBODY>
                  <TR> 
                    <TD height=5 bgcolor="#FFFFFF"></TD>
                  </TR>
                  <TR> 
                    <TD height="26" background="Img/index_01.gif"><div align="center">��Ա����</div></TD>
                  </TR>
                  <TR>
                    <TD height="22"> <div align="center"><a href="Manage.asp">�޸Ļ�Ա����</a></div></TD>
                  </TR>
                  <TR> 
                    <TD 
                            height=1 colspan="2" 
                            background=img/naSzarym.gif><IMG height=1 src="img/1x1_pix.gif" 
                              width=10></TD>
                  </TR>
                  <TR>
                    <TD height="22"> <div align="center"><a href="ManagePwd.asp">�޸Ļ�Ա����</a></div></TD>
                  </TR>
                  <TR> 
                    <TD 
                            height=1 colspan="2" 
                            background=img/naSzarym.gif><IMG height=1 src="img/1x1_pix.gif" 
                              width=10></TD>
                  </TR>
                  <TR>
                    <TD height="22"><div align="center"><a href="E_shop.asp">���ﶩ����ѯ</a></div></TD>
                  </TR>
                  <TR> 
                    <TD 
                            height=1 colspan="2" 
                            background=img/naSzarym.gif><IMG height=1 src="img/1x1_pix.gif" 
                              width=10></TD>
                  </TR>
                  <TR>
                    <TD height="22"><div align="center"><a href="NetBook.asp">վ����������</a></div></TD>
                  </TR>
                  <TR> 
                    <TD 
                            height=1 colspan="2" 
                            background=img/naSzarym.gif><IMG height=1 src="img/1x1_pix.gif" 
                              width=10></TD>
                  </TR>
                  <TR>
                    <TD height="22"><div align="center"><a href="UserLogout.asp">�˳���Ա����</a></div></TD>
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
                    <TD height="26" background="Img/index_01.gif"><div align="center">�ʼ��б� 
                      </div></TD>
                  </TR>
                  <TR> 
                    <TD height="5"> </TD>
                  </TR>
                  <TR> 
                    <form method="POST" action="chkemail.asp">
                      <TD vAlign=top><table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
                          <tr> 
                            <td height="25"> <div align="center"> 
                                <input name='email' type='text' value="@" size='15'>
                              </div></td>
                          </tr>
                          <tr> 
                            <td height="25"><div align="center"> 
                                <input type="submit" value="����" name="action">
                                &nbsp; 
                                <input type="submit" value="�˶�" name="action">
                              </div></td>
                          </tr>
                        </table></TD>
                    </form>
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
              </TABLE></td>
          </tr>
        </table> 
      </TD>
      <TD width=1 background=img/kropki_pion_naBialym.gif><IMG 
            height=2 src="img/1x1_pix.gif" width=1></TD>
      <TD vAlign=top><TABLE width="90%" border=0 align="right" cellPadding=0 cellSpacing=0>
              <TBODY>
                <TR> 
                  <TD> <TABLE cellSpacing=0 cellPadding=0 width="555" border=0>
                      <TBODY>
                        <TR> 
                          <TD height="25"><img src="Img/bgtop_21.gif" width="557" height="37"></TD>
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
                  <TD><TABLE width=95% height="136" align="center" cellPadding=4 cellSpacing=1>
                      <TBODY>
                        <TR vAlign=top > 
                          <TD  width="100%" height="18"> <form action="orderofind.asp" method="post" name=FORM1 onsubmit="return FORM1_onsubmit()" language=javascript>
                              <p align="center"> <font color="#FF0000">�װ���&nbsp;&nbsp;</font><font size="4" face="Arial"><%=Session("UserName")%></font></p>
                              <p style="word-spacing: 0; margin-left: 10; margin-right: 10; margin-top: 0; margin-bottom: 0" align="center">���ã����������Ѿ��ڱ�վ�ύ�Ķ����� 
                                <%rs.close%>
                                <%


Id=Session("UserName")
set Rs = Server.CreateObject("ADODB.recordset")
sql="select * from OrderList where UserName='"&Id&"'"
rs.open sql,conn,1,1


%>
                              </p>
                              <p align="center" style="word-spacing: 0; margin-top: 0; margin-bottom: 0">������ϸ���ϲ�ѯ����������Ҫ��ѯ�Ķ������� 
                                <input type="text" name="Form_Id" size="11">
                                <input type="submit" value="��ѯ" name="B1">
                            </form>
                            <div align="center"> 
                              <TABLE cellSpacing=0 cellPadding=0 width=100%>
                                <TBODY>
                                  <TR> 
                                    <TD align=middle width="100%"> <p align="center" style="word-spacing: 0; margin-top: 0; margin-bottom: 0">���������ڱ�վ�ύ�����ж����б�</p>
                                      <table border="0" cellpadding="2" cellspacing="1" width="100%" bgcolor="#000000">
                                        <tr > 
                                          <td width="26%" align="center" height="20" bgcolor="#CCCCCC"><font color="#000000">�������</font></td>
                                          <td width="21%" align="center" height="20" bgcolor="#CCCCCC"><font color="#000000">�ͻ�����</font></td>
                                          <td width="53%" align="center" height="20" bgcolor="#CCCCCC"><font color="#000000">�����Ķ����Ĵ������</font></td>
                                        </tr>
                                        <% While Not rs.EOF %>
                                        <tr > 
                                          <td width="26%" align="center" height="25" bgcolor="#FFFFFF"> 
                                            <%=rs("Form_Id")%> </td>
                                          <td width="21%" align="center" height="25" bgcolor="#FFFFFF"><%=rs("Somane")%></td>
                                          <td width="53%" align="center" height="25" bgcolor="#FFFFFF"> 
                                            <%If rs("Flag")="��δ����" Then%>
                                            ���Ŀ�����δ�����ǵ��ʻ����˶�����վ��δ���� 
                                            <%else%> <font color="#FF0000">�˶����Ѿ�������������ע����գ�</font> 
                                            <%End If%> </td>
                                        </tr>
                                        <%
rs.MoveNext
Wend
rs.close
%>
                                      </table>
                                      <%

rs.close

%> </TD>
                                  </TR>
                                </TBODY>
                              </TABLE>
                            </div></TD>
                        </TR>
                        <TR vAlign=top > 
                          <TD  width="100%" height="15"> &nbsp;&nbsp; </TD>
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