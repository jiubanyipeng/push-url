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
<TITLE>商品结算</TITLE>
<meta name="Author" content="heweiqun">
<meta name="Contact" content="hdz2008@163.com">
<meta name="Copyright" content="southidc.net">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="Inc/Css.css" rel="stylesheet" type="text/css">
</HEAD>
<BODY bgcolor="#D9D9D9" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<FORM name=FORM1"
action=ment4.asp method=post>
<input type=hidden Name="username" Value="<%=Request.form("username")%>" >
<input type=hidden Name="Comane" Value="<%=Request.form("Comane")%>" >
<input type=hidden Name="Somane" Value="<%=Request.form("Somane")%>" >
<input type=hidden Name="Add" Value="<%=Request.form("Add")%>" >
<input type=hidden Name="Zip" Value="<%=Request.form("Zip")%>" >
<input type=hidden Name="Phone" Value="<%=Request.form("Phone")%>" >
<input type=hidden Name="Fox" Value="<%=Request.form("Fox")%>" >
<input type=hidden Name="Email" Value="<%=Request.form("Email")%>" >
<input type=hidden Name="Pays" Value="<%=Request.form("Pays")%>" >
<input type=hidden Name="Remark" Value="<%=Request.form("Remark")%>" >
  <TABLE width=95% align="center" cellPadding=4 cellSpacing=1 bgColor=#666666 1>
    <TBODY>
      <TR vAlign=top bgColor=#999999> 
        <TD height="22" colSpan=4> <div align="center"><font color="#FFFFFF">购物结算--(第三步)信息确认</font></div></TD>
      </TR>
      <tr bgcolor="#F0FCFF"> 
        <TD height=7 align="right" colspan="4"> <div align="center"> 
            <center>
              <table border="0" cellpadding="0" cellspacing="1" width="98%" height="61" bgcolor="#666666">
                <tr bgcolor="#006699"> 
                  <td align="center" width="197"  height="22" bgcolor="#999999"><font color="#FFFFFF">商品编号</font></td>
                  <td align="center" width="522"  height="22" bgcolor="#999999"><font color="#FFFFFF">商品名称</font></td>
                  <td align="center" width="205" height="22" bgcolor="#999999"><font color="#FFFFFF">商品数量</font></td>
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
                  <td align="center" width="197" height="23" bgcolor="#F0FCFF"><%=rs("Product_ID")%> 
                  </td>
                  <td align="center" width="522" height="23" bgcolor="#F0FCFF"><%=rs("Title")%> 
                  </td>
                  <td align="center" width="205" height="23" bgcolor="#F0FCFF"><%=Quatity%></td>
                </tr>
                <%
rs.MoveNext
Wend
%>
                <tr bgcolor="#F0FCFF"> 
                  <td height="22" ColSpan="3" Align="Right">&nbsp;</td>
                </tr>
              </table>
            </center>
          </div>
          <blockquote> </blockquote></TD>
      </tr>
      <tr> 
        <TD width=162 bgcolor=#F0FCFF height=3 align="right">收货人姓名：</TD>
        <TD height=3 colspan="3" bgcolor="#F0FCFF"><%=Request.form("Somane")%></TD>
      </tr>
      <tr> 
        <TD bgcolor=#F0FCFF height=3 align="right">收货人公司名称：</TD>
        <TD height=3 colspan="3" bgcolor="#F0FCFF"><%=Request.form("Comane")%></TD>
      </tr>
      <tr> 
        <TD width=162 bgcolor=#F0FCFF height=7 align="right">收货地址：</TD>
        <TD height=7 bgcolor="#F0FCFF" colspan="3"><%=Request.form("Add")%></TD>
      </tr>
      <tr> 
        <TD width=162 bgcolor=#F0FCFF height=7 align="right">邮政编码：</TD>
        <TD width=184 height=7 bgcolor="#F0FCFF"><%=Request.form("Zip")%></TD>
        <TD width=158 height=7 bgcolor="#999999"> <p align="center"><font color="#FFFFFF">联系电话：</font> 
        </TD>
        <TD width=219 height=7 bgcolor="#F0FCFF"><%=Request.form("Phone")%></TD>
      </tr>
      <tr> 
        <TD width=162 bgcolor=#F0FCFF height=7 align="right">电子信箱：</TD>
        <TD height=7 bgcolor="#F0FCFF"><%=Request.form("Email")%></TD>
        <TD height=7 bgcolor="#999999"><div align="center"><font color="#FFFFFF">联系传真：</font></div></TD>
        <TD height=7 bgcolor="#F0FCFF"><%=Request.form("Fox")%></TD>
      </tr>
      <tr> 
        <TD width=162 bgcolor=#F0FCFF height=7 align="right">所选汇款账号：</TD>
        <TD height=7 bgcolor="#F0FCFF" colspan="3"><%=Request.form("Pays")%></TD>
      </tr>
      <tr> 
        <TD width=162 bgcolor=#F0FCFF height=7 align="right">订单备注：</TD>
        <TD height=7 bgcolor="#F0FCFF" colspan="3"><%=Request.form("Remark")%></TD>
      </tr>
      <TR bgColor=#F0FCFF> 
        <TD colSpan=4> <DIV align=center> 
            <input type="button" value="上一步" name="B4" onclick="javascript:window.history.go(-1)">
            <INPUT  type=submit value=提交定单 name=Submit2>
          </DIV></TD>
      </TR>
    </TBODY>
  </TABLE>
<BR></FORM>
</BODY></HTML>
<%
rs.close
conn.close
%>