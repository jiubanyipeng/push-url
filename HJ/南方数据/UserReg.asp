<!--#include file="Inc/syscode.asp"-->
<HTML><HEAD><TITLE>�Ϸ�������ҵͨ�ý�վϵͳ</TITLE>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<meta name="Author" content="heweiqun">
<meta name="Contact" content="hdz2008@163.com">
<meta name="Copyright" content="southidc.net">
<style type="text/css">
A:link    {	 color: #333333;TEXT-DECORATION: none	}
A:visited {	 color: #333333;TEXT-DECORATION: none	}
A:active  {	 color: #003300;TEXT-DECORATION: none	}
A:hover   {	 color: #003300;TEXT-DECORATION: underline overline	}
.navtrail {  COLOR: #eeeeee; FONT-SIZE: 12px; LINE-HEIGHT: 12px }
A.navtrail:link {  COLOR: #eeeeee; CURSOR: w-resize }
A.navtrail:visited {  COLOR: #eeeeee; CURSOR: w-resize }
A.navtrail:active {  COLOR: #eeeeee; CURSOR: w-resize }
A.navtrail:hover {  COLOR: #eeeeee; CURSOR: e-resize }
INPUT{BORDER-TOP-WIDTH: 1px; PADDING-RIGHT: 1px; PADDING-LEFT: 1px; BORDER-LEFT-WIDTH: 1px; FONT-SIZE: 9pt; BORDER-LEFT-COLOR: #cccccc; BORDER-BOTTOM-WIDTH: 1px; BORDER-BOTTOM-COLOR: #cccccc; PADDING-BOTTOM: 1px; BORDER-TOP-COLOR: #cccccc; PADDING-TOP: 1px; HEIGHT: 18px; BORDER-RIGHT-WIDTH: 1px; BORDER-RIGHT-COLOR: #cccccc}
<!--
td {  font-family: "����"; font-size: 9pt; color: #333333; text-decoration: none}
-->
</style>
<BODY bgColor=#666666 leftMargin=0 topMargin=0 marginheight="0" marginwidth="0">
<!-- #include file="Inc/Head.asp" -->
<TABLE width="760" border=0 align="center" cellPadding=0 cellSpacing=0 bgcolor="#FFFFFF">
  <TBODY>
    <TR> 
      <TD width=196 vAlign=top> 
        <table width="92%" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
          <tr> 
            <td valign="top"><TABLE width="100%" border=0 cellPadding=0 cellSpacing=0 background="Img/index_01b.gif">
                <TBODY>
                  <TR> 
                    <TD height=5 bgcolor="#FFFFFF"></TD>
                  </TR>
                  <TR> 
                    <TD height="35" background="Img/index_01.gif"> 
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
                    <TD height="35" background="Img/index_01.gif"> 
                      <div align="center">վ�ڵ��� 
                      </div></TD>
                  </TR>
                  <TR> 
                    <TD height="12"> </TD>
                  </TR>
                  <TR> 
                    <TD vAlign=top><table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
                        <tr>
                          <TD> 
                            <% call ShowVote() %>
                          </TD>
                        </tr>
                      </table></TD>
                  </TR>
                  <TR> 
                    <TD height="10"> </TD>
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
      <TD vAlign=top> <TABLE width="90%" border=0 align="right" cellPadding=0 cellSpacing=0>
          <TBODY>
            <TR> 
              <TD 
                  height=1 background=img/naBialym.gif><IMG height=1 src="img/1x1_pix.gif" 
              width=10></TD>
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
              <TD 
                  height=1 background=img/naBialym.gif><IMG height=1 src="img/1x1_pix.gif" 
              width=10></TD>
            </TR>
            <TR> 
              <TD height="1"> <FORM name='UserReg' action='UserRegPost.asp' method='post'>
                  <table width=95% border=0 align="center" cellpadding=5 cellspacing=1 bordercolor="#FFFFFF" style="border-collapse: collapse">
                    <TR align=center> 
                      <TD height=20 colSpan=2><b>���û�ע��</b></TD>
                    </TR>
                    <TR class="tdbg" > 
                      <TD width="37%"><b>�û�����</b><BR>
                        ����С��4���ַ���2�����֣�</TD>
                      <TD width="63%"> <INPUT   maxLength=14 size=30 name=UserName> 
                        <font color="#FF0000">*</font> </TD>
                    </TR>
                    <TR class="tdbg" > 
                      <TD width="37%"><B>����(����6λ)��</B><BR>
                        ���������룬���ִ�Сд�� ��Ҫʹ������ '*'��' '�������ַ�</TD>
                      <TD width="63%"> <INPUT   type=password maxLength=12 size=30 name=Password> 
                        <font color="#FF0000">*</font> </TD>
                    </TR>
                    <TR class="tdbg" > 
                      <TD width="37%"><strong>ȷ������(����6λ)��</strong><BR>
                        ������һ��ȷ��</TD>
                      <TD width="63%"> <INPUT   type=password maxLength=12 size=30 name=PwdConfirm> 
                        <font color="#FF0000">*</font> </TD>
                    </TR>
                    <TR class="tdbg" > 
                      <TD width="37%"><strong>�������⣺</strong><BR>
                        �����������ʾ����</TD>
                      <TD width="63%"> <INPUT   type=text maxLength=50 size=30 name="Question"> 
                        <font color="#FF0000">*</font> </TD>
                    </TR>
                    <TR class="tdbg" > 
                      <TD width="37%"><strong>����𰸣�</strong><BR>
                        �����������ʾ����𰸣�����ȡ������</TD>
                      <TD width="63%"> <INPUT   type=text maxLength=20 size=30 name="Answer"> 
                        <font color="#FF0000">*</font> </TD>
                    </TR>
                    <TR class="tdbg" > 
                      <TD width="37%"><strong>�Ա�</strong><BR>
                        ��ѡ�������Ա�</TD>
                      <TD width="63%"> <INPUT type=radio CHECKED value="1" name=sex>
                        �� &nbsp;&nbsp; <INPUT type=radio value="0" name=sex>
                        Ů</TD>
                    </TR>
                    <TR class="tdbg" > 
                      <TD width="37%"><strong>Email��ַ��</strong><BR>
                        ��������Ч���ʼ���ַ</TD>
                      <TD width="63%"> <INPUT   maxLength=50 size=30 name=Email> 
                        <font color="#FF0000">*</font></TD>
                    </TR>
                    <TR class="tdbg" > 
                      <TD><strong>��˾��ַ��</strong></TD>
                      <TD width="63%"><INPUT name=homepage id="homepage" value="http://" size=30   maxLength=50></TD>
                    </TR>
                    <TR class="tdbg" > 
                      <TD width="37%"><strong>��˾���ƣ�</strong><BR>
                        ���Ĺ�˾����</TD>
                      <TD width="63%"> <INPUT name=Comane id="Comane" size=30   maxLength=100></TD>
                    </TR>
                    <TR class="tdbg" > 
                      <TD><strong>�������룺</strong></TD>
                      <TD width="63%"><input name=Zip id="Zip" size=30 maxlength=20> 
                        <font color="#FF0000">*</font></TD>
                    </TR>
                    <TR class="tdbg" > 
                      <TD><strong>��ϵ�绰��<br>
                        </strong>��ʽ+86-791-6274752<strong> </strong></TD>
                      <TD width="63%"><input name=Phone id="Phone" value="+86" size=30 maxlength=20> 
                        <font color="#FF0000">*</font></TD>
                    </TR>
                    <TR class="tdbg" > 
                      <TD width="37%"><strong>�� �棺</strong></TD>
                      <TD width="63%"> <INPUT name=Fox id="Fox" size=30 maxLength=50></TD>
                    </TR>
                  </TABLE>
                  <div align="center"> 
                    <INPUT   type=submit value=" ע �� " name=Submit>
                    &nbsp; 
                    <INPUT name=Reset   type=reset id="Reset" value=" �� �� ">
                  </div>
                </form></TD>
            </TR>
            <TR> 
              <TD 
                  height=1 background=img/naBialym.gif><IMG height=1 src="img/1x1_pix.gif" 
              width=10></TD>
            </TR>
            <TR> 
              <TD><IMG height=1 src="img/1x1_pix.gif" 
              width=10> </TD>
            </TR>
          </TBODY>
        </TABLE></TD>
    </TR>
  </TBODY>
</TABLE>
<!-- #include file="Inc/Foot.asp" -->
</BODY></HTML>
