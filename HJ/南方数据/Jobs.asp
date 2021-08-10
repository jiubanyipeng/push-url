<!--#include file="Inc/syscode.asp" -->
<!--#include file="Inc/TOP.asp"-->
<!--#include file="Inc/eshopcode.asp"-->
<!-- #include file="Inc/Head.asp" -->
<TABLE width="760" border=0 align="center" cellPadding=0 cellSpacing=0 bgcolor="#FFFFFF">
  <TBODY>
    <TR> 
      <TD width=196 vAlign=top bgcolor="#FFFFFF"> 
        <table width="92%" height="100%" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
          <tr>
            <td valign="top" bgcolor="#FFFFFF"> 
              <TABLE width="100%" border=0 cellPadding=0 cellSpacing=0 background="Img/index_01b.gif">
                <TBODY>
				<TR> 
                    <TD height=5 bgcolor="#FFFFFF"></TD>
                  </TR>
                  <TR> 
                    <TD height=15 bgcolor="#FFFFFF"><TABLE width="100%" border=0 cellPadding=0 cellSpacing=0 background="Img/index_01b.gif">
                        <TBODY>
                          
                          <TR> 
                            <TD height="35" background="Img/index_01.gif">
<div align="center">会员登陆 
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
                      </TABLE></TD>
                  </TR>
                  <TR> 
                    <TD height="35" background="Img/index_01.gif">
<div align="center">人才招聘 
                      </div></TD>
                  </TR>
                  <TR> 
                    <TD height="22"> <div align="center"><a href="Job.asp">人 才 
                        招 聘</a></div></TD>
                  </TR>
                  <TR> 
                    <TD 
                            height=1 colspan="2" 
                            background=img/naSzarym.gif><IMG height=1 src="img/1x1_pix.gif" 
                              width=10></TD>
                  </TR>
                  <TR> 
                    <TD height="22"><div align="center"><a href="Jobs.asp">人 才 
                        策 略</a></div></TD>
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
              <TD   height=5></TD>
            </TR>            
            <TR> 
              <TD> <TABLE cellSpacing=0 cellPadding=0 width="555" border=0>
                  <TBODY>
                    <TR> 
                      <TD height="25"><img src="Img/bgtop_13.gif" width="557" height="37"></TD>
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
              <TD><table width="95%" border="0" cellpadding="0" cellspacing="0">
                  <tr> 
                    <td>&nbsp;</td>
                  </tr>
                  <tr> 
                    <td height="19" style="line-height: 150%"><%=Job%></td>
                  </tr>
                  <tr> 
                    <td>&nbsp;</td>
                  </tr>
                </table></TD>
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
