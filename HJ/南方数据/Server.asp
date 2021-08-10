<!--#include file="Inc/syscode.asp" -->
<!-- #include file="Inc/Head.asp" -->
<TABLE width="760" border=0 align="center" cellPadding=0 cellSpacing=0 bgcolor="#FFFFFF">
  <TBODY>
    <TR> 
      <TD width=196 vAlign=top bgcolor="#FFFFFF"> 
        <table width="92%" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
          <tr>
            <td valign="top"> <TABLE width="100%" border=0 cellPadding=0 cellSpacing=0 background="Img/index_01b.gif">
                    <TBODY>
                      <TR> 
                        <TD height=5 bgcolor="#FFFFFF"></TD>
                      </TR>
                      <TR> 
                        <TD height="34" background="Img/index_01.gif"> <div align="center">会员中心 
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
                        <TD height="22"> <div align="center"><a href="ManagePwd.asp">修改会员密码</a></div></TD>
                      </TR>
                      <TR> 
                        <TD 
                            height=1 colspan="2" 
                            background=img/naSzarym.gif><IMG height=1 src="img/1x1_pix.gif" 
                              width=10></TD>
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
                  </TABLE>
              
            </td>
          </tr>
        </table> 
      </TD>
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
              <TD> <%If Session("UserName")="" Then
%> <br> <br> <table width="100%" border="0" cellpadding="0" cellspacing="3">
                  <tr> 
                    <td width="19%" align="right"></td>
                    <td width="81%"> <p style="word-spacing: 0; margin-top: 0; margin-bottom: 0"><font color="#006699">对不起，您还没有登录，无法进入会员中心，请先登录！</font></p>
                      <p style="word-spacing: 0; margin-top: 0; margin-bottom: 0"><font color="#006699">如果您还不是我们的会员，请立即<a href="UserReg.asp"><font color="#006699">注册</font></a>。</font></p></td>
                  </tr>
                  <tr> 
                    <td width="19%" align="right"></td>
                    <td width="81%"> <div align="center"> 
                        <table class="main" cellSpacing="0" cellPadding="2" width="100%" border="0" height="1">
                          <tbody>
                            <tr> 
                              <td width="100%" height="1"><% call ShowUserLogina() %></td>
                            </tr>
                          </tbody>
                        </table>
                      </div></td>
                  </tr>
                  <tr> 
                    <td width="19%" align="right"></td>
                    <td width="81%"><font color="#990000"><b><font color="#006699">会员中心有以下功能：</font></b></font></td>
                  </tr>
                  <tr> 
                    <td width="19%" align="right"><font color="#666666">1、</font></td>
                    <td width="81%"><font color="#666666">修改您的会员注册资料</font></td>
                  </tr>
                  <tr> 
                    <td width="19%" align="right" height="14"><font color="#666666">2、</font></td>
                    <td width="81%" height="14"> <p><font color="#666666">查询您的订单，以及订单的处理情况</font></p></td>
                  </tr>
                  <tr> 
                    <td width="19%" align="right"><font color="#666666">3、</font></td>
                    <td width="81%"><font color="#666666">专用私人留言簿，您可在此给我们留言和查看我们的回复</font></td>
                  </tr>
                  <tr> 
                    <td height="25" align="right">&nbsp;</td>
                    <td>&nbsp;</td>
                  </tr>
                </table>
                <%else%> 
                <TABLE width="85%" align="center" cellPadding=0 cellSpacing=0>
                  <TBODY>
                    <TR vAlign=top > 
                      <TD  width="100%"> 
                        <p><br>
                         
                        </p>
                        <div align="center"> 
                          <center>
                          </center>
                        </div>
                        <p style="word-spacing: 0; margin-top: 0; margin-bottom: 0"> 
                          <b><font color="#F584B1">会员中心首页：</font></b> <br>
                          <br>
                          <br>
                        <p style="word-spacing: 0; margin-top: 0; margin-bottom: 0">亲爱的<%=Session("UserName")%>： <br>
                        </p>
                            <p style="word-spacing: 0; margin-top: 0; margin-bottom: 0">&nbsp; 
                            </p>
                            <p style="word-spacing: 0; margin-top: 0; margin-bottom: 0">您现在已经进入会员服务中心，这里只有注册会员才能访问。您可在这里修改您的注册信<br>
                              <br>
                              息、给我们留言、查看我们对您留言的答复，也可以查询您的订单及订单处理情况。</p></TD>
                    </TR>
                    <TR vAlign=top > 
                          <TD  width="100%"> &nbsp;&nbsp;</TD>
                    </TR>
                  </TBODY>
                </TABLE>
                <%end if%> </TD>
            </TR>
            <TR> 
              <TD background=img/naBialym.gif 
                  height=1><IMG height=1 src="img/1x1_pix.gif" 
              width=10></TD>
            </TR>
            <TR> 
              <TD 
                  height=15>&nbsp; </TD>
            </TR>
          </TBODY>
        </TABLE> </TD>
    </TR>
  </TBODY>
</TABLE>
<!-- #include file="Inc/Foot.asp" -->
</BODY></HTML>
