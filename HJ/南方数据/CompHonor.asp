<!--#include file="Inc/SysProduct.asp" -->
<!--#include file="inc/Skin_css.asp"-->
<!--#include file="inc/Ubbcode.asp"-->
<script language="JavaScript"> 
<!-- 
var flag=false; 
function DrawImage(ImgD){ 
 var image=new Image(); 
 image.src=ImgD.src; 
 if(image.width>0 && image.height>0){ 
  flag=true; 
  if(image.width/image.height>= 150/180){ 
   if(image.width>150){
    ImgD.width=150; 
    ImgD.height=(image.height*150)/image.width; 
   }else{ 
    ImgD.width=image.width;
    ImgD.height=image.height; 
   } 
   ImgD.alt="����鿴��ϸ��Ϣ..."; 
  } 
  else{ 
   if(image.height>180){
    ImgD.height=180; 
    ImgD.width=(image.width*180)/image.height; 
   }else{ 
    ImgD.width=image.width;
    ImgD.height=image.height; 
   } 
   ImgD.alt="����鿴��ϸ��Ϣ..."; 
  } 
 }
}
//--> 
</script> 


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
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
              <tr> 
                <td height="34" class="title_left">&nbsp;&nbsp;&nbsp;<img src="Images/smallbook.jpg" width="10" height="10">&nbsp;&nbsp;��ҵ����</td>
              </tr>
              <tr> 
                <td height="20"> <div align="center"><a href="CompHonor.asp">�� 
                    ҵ �� ��</a></div></td>
              </tr>
              <TR> 
                <TD 
                            height=1 colspan="2" 
                            background=img/naSzarym.gif><IMG height=1 src="img/1x1_pix.gif" 
                              width=10></TD>
              </TR>
              <tr> 
                <td height="20"> <div align="center"><a href="CompVisualize.asp">�� 
                    ҵ �� ��</a></div></td>
              </tr>
              <TR> 
                <TD 
                            height=1 colspan="2" 
                            background=img/naSzarym.gif><IMG height=1 src="img/1x1_pix.gif" 
                              width=10></TD>
              </TR>
            </table></td>
          <td width="6"></td>
          <td valign="top">
		  
		  <%
set rs=server.createobject("adodb.recordset")
sql="select * from CompHonor order by id desc"
rs.open sql,conn,1,1

dim MaPerPage
MaPerPage=9
dim text,checkpage
text="0123456789"
Rs.PageSize=MaPerPage
for i=1 to len(request("page"))
checkpage=instr(1,text,mid(request("page"),i,1))
if checkpage=0 then
exit for
end if
next

If checkpage<>0 then
 If NOT IsEmpty(request("page")) Then
   CurrentPage=Cint(request("page"))
   If CurrentPage < 1 Then CurrentPage = 1
   If CurrentPage > Rs.PageCount Then CurrentPage = Rs.PageCount
 Else
   CurrentPage= 1
 End If
  If not Rs.eof Then Rs.AbsolutePage = CurrentPage end if
Else
 CurrentPage=1
End if

call list

'��ʾ���ӵ��ӳ���
Sub list()%>		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  <table Class=border width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
              <tr> 
                <td height="206" valign="top"> <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td class="title_right" height="32">&nbsp;&nbsp;&nbsp;<img src="Images/smallbook.jpg" width="10" height="10">&nbsp;&nbsp;�� 
                        ҵ �� ��</td>
                    </tr>
                  </table>
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">                              
            <TR> 
              <TD><table width="100%" border="0" cellspacing="1" cellpadding="0">
                  <%i=1 %>
                  <TR> 
                    <% Do While Not rs.eof%>
                    <TD> <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr> 
                          <td><div align="center">
                                  <TABLE border=0 cellPadding=0 cellSpacing=5>
                                    <TBODY>
                                      <TR> 
                                        <TD align=middle width=135> <TABLE align=center border=0 cellPadding=0 cellSpacing=0>
                                            <TBODY>
                                              <TR> 
                                                <TD height=10><IMG height=10 
                        src="Img/bg_0ltop.gif" width=10></TD>
                                                <TD background=Img/bg_01.gif height=10></TD>
                                                <TD height=10><IMG height=10 
                        src="Img/bg_0rtop.gif" width=10></TD>
                                              </TR>
                                              <TR> 
                                                <TD background=Img/bg_03.gif 
                      width=10>&nbsp;</TD>
                                                <TD width="150" height="180" align=middle bgColor=#ffffff vAlign=center><a 
                        href=CompHonorBig.asp?id=<%=rs("id")%> target=_blank><img src="<%=rs("CompHonor")%>" alt="" width="150" height="180" border="0" onload="javascript:DrawImage(this);"></a></TD>
                                                <TD background=Img/bg_04.gif 
                      width=10>&nbsp;</TD>
                                              </TR>
                                              <TR> 
                                                <TD height=10><IMG height=10 
                        src="Img/bg_0lbottom.gif" width=10></TD>
                                                <TD background=Img/bg_02.gif height=10></TD>
                                                <TD height=10><IMG height=10 
                        src="Img/bg_0rbottom.gif" 
                    width=10></TD>
                                              </TR>
                                            </TBODY>
                                          </TABLE></TD>
                                      </TR>
                                    </TBODY>
                                  </TABLE>
                                </div>
                            </td>
                        </tr>
                        <tr> 
                          <td height="10"></td>
                        </tr>
                        <tr> 
                                  <td><div align="center"><%=ubbcode(dvHTMLEncode(rs("explain")))%></div></td>
                        </tr>
                        <tr> 
                          <td height="10"></td>
                        </tr>
                      </table></td>                   
                    <% if i mod 3 =0 then%>
                       </TR>
                       <tr> 
                    <%end if%>                  
<%
i=i+1 
if i >= 10 then exit do 
rs.MoveNext 
loop
%>
                  </tr>
                </table></TD>
            </tr>
			
                  </table> </td>
              </tr>
			  <TR> 
              <TD 
                  height=1 colspan="3" background=img/naBialym.gif><IMG height=1 src="img/1x1_pix.gif" 
              width=10></TD>
            </TR>
            <TR> 
                <TD 
                  height=25 colspan="3" bgcolor="#D8D8D8"> <div align="right">
                    <%
Response.write "ȫ��"
Response.write "��" & Cstr(Rs.RecordCount) & "������&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
Response.write "��" & Cstr(CurrentPage) &  "/" & Cstr(rs.pagecount) & "&nbsp;"
If currentpage > 1 Then
response.write "<a href='CompHonor.asp?&page="+cstr(1)+"'>&nbsp;��ҳ&nbsp;</a>"
Response.write "<a href='CompHonor.asp?page="+Cstr(currentpage-1)+"'>&nbsp;��һҳ&nbsp;</a>"
Else
Response.write "&nbsp;��һҳ&nbsp;"
End if
If currentpage < Rs.PageCount Then
Response.write "<a href='CompHonor.asp?page="+Cstr(currentPage+1)+"'>&nbsp;��һҳ&nbsp;</a>"
Response.write "<a href='CompHonor.asp?page="+Cstr(Rs.PageCount)+"'>&nbsp;βҳ&nbsp;</a>"
Else
Response.write ""
Response.write "&nbsp;��һҳ&nbsp;"
End if
Response.write "ת����"
response.write"<select name='sel_page' onChange='javascript:location=this.options[this.selectedIndex].value;'>"
    for i = 1 to Rs.PageCount
       if i = currentpage then 
          response.write"<option value='CompHonor.asp?page="&i&"&id="&id&"' selected>"&i&"</option>"
       else
          response.write"<option value='CompHonor.asp?page="&i&"&id="&id&"'>"&i&"</option>"
       end if
    next
response.write"</select>ҳ"
%>
                  </div></TD>
            </TR>
            </table>			
<%
End sub
rs.close
set rs=nothing
%> 	
			</td>
        </tr>
      </table></td>
  </tr>
</table>
<!-- #include file="Inc/Foot.asp" -->
</BODY></HTML>
