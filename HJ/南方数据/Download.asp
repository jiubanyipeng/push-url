<!--#include file="Inc/syscode.asp"-->
<!--#include file="Inc/Top.asp" -->
<%
'请勿改动下面这三行代码
ShowSmallClassType=ShowSmallClassType_Default
MaxPerPage=MaxPerPage_Default
strFileName="download.asp?BigClassName=" & BigClassName & "&SmallClassName=" & SmallClassName 
%>
<!-- #include file="Inc/Head.asp" -->
<TABLE width="760" border=0 align="center" cellPadding=0 cellSpacing=0 bgcolor="#FFFFFF">
  <TBODY>
    <TR> 
      <TD width=196 vAlign=top> 
        <table width="92%" height="100%" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
          <tr> 
            <td valign="top"><TABLE width="100%" border=0 cellPadding=0 cellSpacing=0 background="Img/index_01b.gif">
                <TBODY>
                  <TR> 
                    <TD height=5 bgcolor="#FFFFFF"></TD>
                  </TR>
                  <TR> 
                    <TD height="34" background="Img/index_01.gif">
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
              </TABLE>
              <TABLE width="100%" border=0 cellPadding=0 cellSpacing=0 background="Img/index_01b.gif">
                <TBODY>
                  <TR> 
                    <TD height=15 bgcolor="#FFFFFF"></TD>
                  </TR>
                  <TR> 
                    <TD height="34" background="Img/index_01.gif"> 
                      <div align="center">下载列表 </div></TD>
                  </TR>
                  <TR> 
                    <TD height="5"> </TD>
                  </TR>
                  <TR> 
                    <TD vAlign=top> 
                      <% call ShowSmallClass_Down_Tree() %>
                    </TD>
                  </TR>
                </TBODY>
              </TABLE>
                  <br>
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
                  height=1 colspan="2"><TABLE cellSpacing=0 cellPadding=0 width="555" border=0>
                  <TBODY>
                    <TR> 
                          <TD height="25"><img src="Img/downloadb.gif" width="557" height="37"></TD>
                    </TR>
                  </TBODY>
                </TABLE></TD>
            </TR>
            <TR> 
              <TD 
                  height=1 colspan="2" background=img/naBialym.gif><IMG height=1 src="img/1x1_pix.gif" 
              width=10></TD>
            </TR>
            <TR> 
              <TD width="453" 
                  height=28> <% call ShowClass_DownGuide() %> </TD>
              <TD width="102"> <% call ShowDownTotal() %> </TD>
            </TR>
            <TR> 
              <TD 
                  height=1 colspan="2" background=img/naBialym.gif><IMG height=1 src="img/1x1_pix.gif" 
              width=10></TD>
            </TR>
            <TR> 
              <TD 
                  height=1 colspan="2"> <% call ShowDown(32) %> </TD>
            </TR>
            <TR> 
              <TD 
                  height=1 colspan="2"> <%
		  if totalput>0 then
		  	call showpage(strFileName,totalput,MaxPerPage,false,true,"个下载")
		  end if
		  %> </TD>
            </TR>
          </TBODY>
        </TABLE></TD>
    </TR>
  </TBODY>
</TABLE>
<!-- #include file="Inc/Foot.asp" -->
</BODY></HTML>
