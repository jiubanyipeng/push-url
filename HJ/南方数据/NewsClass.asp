<! *************************************************************
�������ƣ��Ϸ��������ŷ���ϵͳ V9.0
�����Ȩ���Ϸ����� (www.southidc.net)
�������ߣ���ΰȺ (weiqun)
��ϵ��ʽ��E-mail:hdz2008@163.com   QQ: 635495  
*************************************************************** >
<!--#Include File="inc/Check_Sql.asp"-->
<!--#include file="inc/conn.asp"-->
<!--#include file="inc/Skin_css.asp"-->
<!-- #include file="inc/config.asp" -->
<!--#include file="inc/Function.asp"-->
<!-- #include file="Head.asp" -->
<% 
BigClass=request("BigClass")
SmallClass=request("SmallClass")
%>
<table width="760" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="5" valign="top" bgcolor="#FFFFFF"></td>
  </tr>
  <tr> 
    <td height="72" valign="top" bgcolor="#FFFFFF"><table width="746" border="0" align="center" cellpadding="0" cellspacing="0">
	
        <tr> 
          <td class="tdbg_left" width="190" height="179" valign="top"> <table width="100%" border="0" cellspacing="0" cellpadding="0">
		  <form name="form1" method="get" action="News_search.asp">
              <tr> 
                <td height="34" class="title_left">&nbsp;&nbsp;&nbsp;<img src="Images/smallbook.jpg" width="10" height="10">&nbsp;&nbsp;<font color="#000000">�� 
                  �� �� ��</font></td>
              </tr>
              <tr> 
                <td height="21"><input type="text" name="key" size="19" class="input"></td>
              </tr>
              <tr> 
                <td height="21"><select name="otype" class="input">
                    <option value="title" selected class="input">���ű���</option>
                    <option value="msg" class="input">��������</option>
                  </select> <input type="submit" name="Submit" value="����" class="input"></td>
              </tr>
              <tr> 
                <td height="5"></td>
              </tr>
			  </form>
            </table>
			
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="28" align="center" bgcolor="#CCCCCC"> 
                  <div align="left"><a  href="NewsClass.asp?BigClass=<%=BigClass%>"><font color="#000000"> 
                    &nbsp;&nbsp;<%=BigClass%></font></a></div></td>
              </tr>
              <%
set rsSmallClass=server.CreateObject("adodb.recordset")
rsSmallClass.open "Select * From SmallClass_New Where BigClassName='" & BigClass & "'",conn,1,1
if not(rsSmallClass.bof and rsSmallClass.eof) then
 do while not rsSmallClass.eof
%>
              <tr onMouseOver="this.bgColor='#FFFFFF';" onMouseOut="this.bgColor='#EFEFEF';" bgColor=#EFEFEF> 
                <td height="28" bgcolor="#CCCCCC" > 
                  <div align="left"><a  href="NewsClass.asp?BigClass=<%=BigClass%>&SmallClass=<%=rsSmallClass("SmallClassName")%>">&nbsp;&nbsp;</a><a  href="NewsClass.asp?BigClass=<%=BigClass%>&SmallClass=<%=rsSmallClass("SmallClassName")%>">&nbsp;&nbsp;</a><a  href="NewsClass.asp?BigClass=<%=BigClass%>&SmallClass=<%=rsSmallClass("SmallClassName")%>"><%=rsSmallClass("SmallClassName")%></a></div></td>
              </tr>
              <%
 rsSmallClass.movenext
 loop
end if
rsSmallClass.close
set rsSmallClass=nothing	
%>
            </table></td>
          <td width="6"></td>
          <td  valign="top"><table Class=border width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
              <tr> 
                <td height="206" valign="top"> <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td class="title_right" height="32">&nbsp;&nbsp;&nbsp;<img src="Images/smallbook.jpg" width="10" height="10">&nbsp;&nbsp;<a href="index.asp">��ҳ</a>&gt;&gt;<a  href="NewsClass.asp?BigClass=<%=BigClass%>"><%=BigClass%></a></td>
                    </tr>
                  </table>
                  <table width="100%" border="0" cellpadding="0" cellspacing="0">
                    <% 
page=clng(request("page"))		 
Set rs=Server.CreateObject("ADODB.RecordSet") 
if BigClass<>"" and SmallClass <>"" then
sql="select * from news where BigClassName='"&BigClass&"' and SmallClassName='"&SmallClass&"' order by AddDate desc"
rs.Open sql,conn,1,1
elseif BigClass<>"" then
sql="select * from news where BigClassName='"&BigClass&"' order by AddDate desc"
rs.Open sql,conn,1,1
end if
if rs.eof and rs.bof then
  response.Write("��ʱû�м�¼")
else 
%>
                    <% 
rs.PageSize=20
if page=0 then page=1 
pages=rs.pagecount
if page > pages then page=pages
rs.AbsolutePage=page  
for j=1 to rs.PageSize 
%>
                    <tr> 
                      <td width="6%" height="24" align="center" ><img src="Img/arrow_6.gif" width="11" height="11"></td>
                      <td width="65%" height="24" style="BORDER-bottom: #999999 1px dotted"> 
                        <% if rs("FirstImageName")<>"" then response.write "<img src='images/news.gif' border=0 alt='ͼƬ����'>" end if %> <a href="shownews.asp?id=<%= RS("id") %>&BigClass=<%=BigClass%>" target="_blank"><%= RS("TITLE") %></a>��</td>
                      <td width="29%" style="BORDER-bottom: #999999 1px dotted"><font color="#999999">[<%=FormatDateTime(RS("AddDate"),2)%>] (���<font color="#ff0000"><%= RS("hits") %></font>) </font></td>
                    </tr>
                    <%
rs.movenext
if rs.eof then exit for
next
%>
                    <tr valign="bottom"> 
                      <td height="50" colspan="3" align="center" > <form method=Post action="NewsClass.asp?BigClass=<%=BigClass%>&SmallClass=<%=SmallClass%>">
                          <%if Page<2 then      
    response.write "��ҳ ��һҳ&nbsp;"
  else
    response.write "<a href=NewsClass.asp?BigClass="&BigClass&"&SmallClass="&SmallClass&"&page=1>��ҳ</a>&nbsp;"
    response.write "<a href=NewsClass.asp?BigClass="&BigClass&"&SmallClass="&SmallClass&"&page=" & Page-1 & ">��һҳ</a>&nbsp;"
  end if
  if rs.pagecount-page<1 then
    response.write "��һҳ βҳ"
  else
    response.write "<a href=NewsClass.asp?BigClass="&BigClass&"&SmallClass="&SmallClass&"&page=" & (page+1) & ">"
    response.write "��һҳ</a> <a href=NewsClass.asp?BigClass="&BigClass&"&SmallClass="&SmallClass&"&SmallClass="&SmallClass&"&page="&rs.pagecount&">βҳ</a>"
  end if
   response.write "&nbsp;ҳ�Σ�<strong><font color=red>"&Page&"</font>/"&rs.pagecount&"</strong>ҳ "
    response.write "&nbsp;��<b><font color='#FF0000'>"&rs.recordcount&"</font></b>����¼ <b>"&rs.pagesize&"</b>����¼/ҳ"
   response.write " ת����<input type='text' name='page' size=4 maxlength=10 class=input value="&page&">"
   response.write " <input class=input type='submit'  value=' Goto '  name='cndok'></span></p>"     
%>
                        </form></td>
                    </tr>
                    <% 
end if
rs.close
set rs=nothing
%>
                  </table> </td>
              </tr>
            </table></td>
        </tr>
      </table></td>
  </tr>
</table>
<!--#include file="Inc/foot.asp"-->
</body>

