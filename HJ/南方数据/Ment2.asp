<%@ LANGUAGE="VBScript" %>
<!--#include file="Inc/Conn.asp" -->
<%
Id=Session("username")
ProductList = Session("ProductList")
Products = Split(Request("cpbm"), ", ")
For I=0 To UBound(Products)
PutToShopBag Products(I), ProductList
Next
Session("ProductList") = ProductList

ProductList = Session("ProductList")
If Len(ProductList) =0 Then
Response.Redirect "nothing.asp"
response.end
end if

set rs=server.createobject("adodb.recordset")
sql = "Select * From Product"
sql = sql & " Where Product_Id In (" & ProductList & ")"
rs.open sql,conn,3,3

%>

<HTML>
<HEAD>
<meta name="Author" content="heweiqun">
<meta name="Contact" content="hdz2008@163.com">
<meta name="Copyright" content="southidc.net">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="Inc/Css.css" rel="stylesheet" type="text/css">
<TITLE>��Ʒ����</TITLE>
</HEAD>
<BODY bgcolor="#D9D9D9" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<br>
<FORM name=FORM1"
action=ment3.asp method=post>
<input type=hidden Name="username" Value="<%=Request.form("username")%>" >
<input type=hidden Name="Comane" Value="<%=Request.form("Comane")%>" >
<input type=hidden Name="Somane" Value="<%=Request.form("Somane")%>" >
<input type=hidden Name="Add" Value="<%=Request.form("Add")%>" >
<input type=hidden Name="Zip" Value="<%=Request.form("Zip")%>" >
<input type=hidden Name="Phone" Value="<%=Request.form("Phone")%>" >
<input type=hidden Name="Fox" Value="<%=Request.form("Fox")%>" >
<input type=hidden Name="Email" Value="<%=Request.form("Email")%>" >
<TABLE cellSpacing=0 cellPadding=0 width=100%>
<TBODY>
<TR>
<TD align=middle width="100%">
<div align="center">
<center>
              <TABLE width=95% align="center" cellSpacing=1 bgColor=#666666 >
                <TBODY> 
                  <TR bgColor=#999999> 
                    <TD height="22"  colSpan=2> <div align="center"><font color="#FFFFFF">�������--(�ڶ���)������Ϣ�����ʽ</font> 
                      </div></TD></TR>
                  <tr bgcolor="#F0FCFF"> 
                    <TD height=7 align="right" colspan="2"> 
                      <div align="center"><br>
                        <table border="0" cellspacing="1" width="580"  height="61" bgcolor="#666666" bordercolorlight="#000000" bordercolordark="#FFFFFF">
                          <tr bgcolor="#006699"> 
                            <td align="center" width="117"  height="22" bgcolor="#999999"><font color="#FFFFFF">��Ʒ���</font></td>
                            <td align="center" width="335"  height="22" bgcolor="#999999"><font color="#FFFFFF">��Ʒ����</font></td>
                            <td align="center" width="118" height="22" bgcolor="#999999"><font color="#FFFFFF">��Ʒ����</font></td>
                          </tr>
                          <%
Sum = 0
While Not rs.EOF
Quatity = CInt( Request( "Q_" & rs("Product_Id")) )
If Quatity <= 0 Then
Quatity = CInt( Session(rs("Product_Id")) )
If Quatity <= 0 Then Quatity = 1
End If
Session(rs("Product_Id")) = Quatity
Sum = Sum + ccur(rs("P_NewPrice")) * Quatity
%>
                          <tr> 
                            <td align="center" width="117" height="23" bgcolor="#EEEEEE"><%=rs("Product_ID")%> 
                            </td>
                            <td align="center" width="335" height="23" bgcolor="#EEEEEE"><%=rs("Title")%> 
                            </td>
                            <td align="center" width="118" height="23" bgcolor="#EEEEEE"><%=Quatity%></td>
                          </tr>
                          <%
rs.MoveNext
Wend
%>
                          <tr> 
                            <td Align="Right" ColSpan="3" height="22" bgcolor="#EEEEEE">&nbsp;</td>
                          </tr>
                        </table>  
</div><blockquote>  
</blockquote>  
</TD>  
</tr>  
<tr>  
                    <TD  width=250 bgcolor=#F0FCFF height=7>�����ṩ�������е��˺Ź������,����ѡ��:</TD>  
                    <TD  width=501 height=7 bgcolor="#F0FCFF">
<select size="1" name="Pays" style="font-size: 14px">  
<option>��������һ��ͨ</option> 
<option>��ͨ����̫ƽ��</option> 
<option>���������������</option> 
  </select>
                    </TD> 
</tr> 
<tr> 
                    <TD  width=250 bgcolor=#F0FCFF height=7>������ע:
<p>��</p>
</TD>
                    <TD  width=501 height=7 bgcolor="#F0FCFF">
<textarea rows="6" name="Remark" cols="45" style="font-size: 10pt"></textarea>
                    </TD>
</tr>

                  <TR bgColor=#F0FCFF> 
                    <TD height="22"  colSpan=2> 
                      <DIV align=center>&nbsp; 
                        <input type="button" value="��һ��" name="B4" onclick="javascript:window.history.go(-1)">
<INPUT type=submit size=3 value=��һ�� name=Submit2>  
</DIV></TD></TR></TBODY></TABLE>  
</center>  
</div>  
</TD></TR></TBODY></TABLE><BR></FORM>  
</BODY></HTML>  
<%
rs.close
conn.close
%>