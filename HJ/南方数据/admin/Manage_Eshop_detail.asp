<!--#include file="conn.asp"-->
<!--#include file="admin.asp"-->
<%
id=request("id")
page=request("page")
set rs=server.createobject("adodb.recordset")
sqltext="select * from OrderList where OrderNum='"&id&"'"
rs.open sqltext,conn,1,1
%>
<!-- #include file="Inc/Head.asp" -->
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
  <tr> 
    <td align="center" valign="top"> <strong><br>
      </strong> <table  width="560" border="0" cellpadding="2" cellspacing="1" class="table_southidc">
        <tr> 
          <td class="back_southidc" height="25"> 
            <div align="center"><strong><%=rs("OrderNum")%>号订单管理 <br>
              </strong></div></td>
        </tr>
        <tr> 
          <form method='POST' action="OrderList_Save.asp?OrderNum=<%=rs("OrderNum")%>">
            <td> <TABLE cellSpacing=1 cellPadding=4 width=562 bgColor=#006699 height="436">
                <TBODY>
                  <TR> 
                    <TD width="548" height="10"  colSpan=2 valign="top" bgcolor="#DBDBDB"></TD>
                  </TR>
                  <TR bgColor=#eeeeee> 
                    <TD width="548" height="32"  colSpan=2><font color="#000000">客户订货单详细资料</font></TD>
                  </TR>
                  <TR> 
                    <TD  width=126 bgColor=#DBDBDB height=25 align="right"><font color="#000000">订货单号：</font></TD>
                    <TD  width=410 height=25 bgcolor="#eeeeee">&nbsp; <%=rs("OrderNum")%></TD>
                  </TR>
                  <tr> 
                    <TD  width=126 bgColor=#DBDBDB height=25 align="right">公司名称<font color="#000000">：</font></TD>
                    <TD  width=410 height=25 bgcolor="#eeeeee">&nbsp; <%=rs("Comane")%></TD>
                  </TR>
                  <tr> 
                    <TD  width=126 bgColor=#DBDBDB height=25 align="right"><font color="#000000">收货人姓名：</font></TD>
                    <TD  width=410 height=25 bgcolor="#eeeeee">&nbsp; <%=rs("RecName")%></TD>
                  </tr>
                  <tr> 
                    <TD  width=126 bgColor=#DBDBDB height=25 align="right"><font color="#000000">收货地址：</font></TD>
                    <TD  width=410 height=-2 bgcolor="#eeeeee">&nbsp; <%=rs("RecAddress")%></TD>
                  </tr>
                  <tr> 
                    <TD bgColor=#DBDBDB height=25 align="right"><font color="#000000">邮政编码：</font></TD>
                    <TD  width=410 height=0 bgcolor="#eeeeee"> &nbsp; <%=rs("ZipCode")%></TD>
                  </tr>
                  <tr> 
                    <TD bgColor=#DBDBDB height=25 align="right"><font color="#000000">联系电话：</font></TD>
                    <TD  width=410 height=25 bgcolor="#eeeeee">&nbsp; <%=rs("RecPhone")%></TD>
                  </tr>
                  <tr> 
                    <TD  width=126 bgColor=#DBDBDB height=25 align="right">联系传真<font color="#000000">：</font></TD>
                    <TD  width=410 height=25 bgcolor="#eeeeee">&nbsp; <%=rs("Fox")%></TD>
                  </tr>
                  <tr> 
                    <TD  width=126 bgColor=#DBDBDB height=25 align="right"><font color="#000000">电子信箱：</font></TD>
                    <TD  width=410 height=25 bgcolor="#eeeeee">&nbsp; <%=rs("RecMail")%></TD>
                  </tr>
                  <tr> 
                    <TD  width=126 bgColor=#DBDBDB height=25 align="right"><font color="#000000">所选汇款账号：</font></TD>
                    <TD  width=410 height=25 bgcolor="#eeeeee">&nbsp; <%=rs("PayType")%></TD>
                  </tr>
                  <tr> 
                    <TD  width=126 height=25 align="right" bgColor=#DBDBDB><font color="#000000">备注：</font></TD>
                    <TD  width=410 height=25 bgcolor="#eeeeee">&nbsp; <%=rs("Notes")%></TD>
                  </tr>
                  <tr> 
                    <TD  width=126 bgColor=#DBDBDB height=24 align="right"><font color="#000000">订货日期：</font></TD>
                    <TD  width=410 height=24 bgcolor="#eeeeee">&nbsp; <%=rs("OrderTime")%></TD>
                  </tr>
                  <tr> 
                    <TD  width=126 bgColor=#DBDBDB height=25 align="right"><font color="#000000">订单是否已经处理：</font></TD>
                    <TD  width=410 height=25 bgcolor="#eeeeee"> <%If rs("Flag")="尚未处理" Then%>
                      尚未处理 
                      <%else%>
                      已经发货 
                      <%End If%> </TD>
                  </tr>
                  <TR> 
                    <TD width="548" height="31"  colSpan=2 valign="top" bgcolor="#eeeeee"> 
                      <p align="center">订货商品细目</p></TD>
                  </TR>
                  <%
set rs2=server.createobject("adodb.recordset")

sqltext2 = "select A.OrderNum,A.Product_Id,A.BuyPrice,A.ProdUnit,"&_		
		"C.Title,C.Buy_Price "&_
		" from OrderDetail A,Product C"&_
		" where A.OrderNum='"&id&"' and A.Product_Id=C.Product_Id"
		
'sqltext2="select * from OrderDetail where OrderNum='"&id&"'"
rs2.open sqltext2,conn,1,1
%>
                  <TR> 
                    <TD width="548" height="15"  colSpan=2 valign="top" bgcolor="#eeeeee"> 
                      <div align="center"> 
                        <table border="1" cellpadding="0" cellspacing="0" width="100%" bordercolorlight="#006699" bordercolordark="#eeeeee"  height="67">
                          <tr> 
                            <td width="49%" bgcolor="#DBDBDB" height="21" align="center"><font color="#000000">产品名称</font></td>
                            <td width="14%" bgcolor="#DBDBDB" height="21" align="center"><font color="#000000">购买数量</font></td>
                            <td width="18%" bgcolor="#DBDBDB" height="21" align="center">购买单价</td>
                            <td width="19%" height="21" align="center" bgcolor="#DBDBDB">合 
                              计</td>
                          </tr>
                          <% Total = 0
						  BuyTotal=0
While Not rs2.EOF
     Sum=0
	 BuySum=0
     Sum = rs2("ProdUnit")*  FormatNumber(rs2("BuyPrice"),1)
	 BuySum = rs2("ProdUnit")*  FormatNumber(rs2("Buy_Price"),1)
	 Sum = FormatNumber(Sum,1) 
	 BuySum = FormatNumber(BuySum,1) 
	 Total = Sum + Total 
	 BuyTotal = BuySum + BuyTotal '计算总金额%>
                          <tr> 
                            <td width="49%" align="center" height="22"><%=rs2("Title")%></td>
                            <td width="14%" align="center" height="22"><%=rs2("ProdUnit")%></td>
                            <td width="18%" align="center" height="22"><%=rs2("BuyPrice")%> </td>
                            <td height="22" align="center"><%=Sum%></td>
                          </tr>
                          <%
rs2.MoveNext
Wend
%>
                          <tr> 
                            <td colspan="2" height="22"> <p align="left">进价总金额:<%=FormatNumber(BuyTotal,2)%></p></td>
                            <td height="22" colspan="2">&nbsp;售价总金额:<%=FormatNumber(Total,2)%></td>
                          </tr>
                        </table>
                      </div></TD>
                  </TR>
                <center>
                  <TR> 
                    <TD width="548" height="25"  colSpan=2 bgcolor="#eeeeee"> 
                      <p align="center"> 
                        <%If rs("Flag")="尚未处理" Then%>
                        <input type="submit" value="订单处理" name="B1">
                        <%
rs.close
rs2.close
conn.close
End If
%>
                        <input type="button" value="返回" name="B4" onclick="javascript:window.history.go(-1)">
                    </TD>
                  </TR>
                  <TR bgColor=#DBDBDB> 
                    <TD width="548" height="3"  colSpan=2></TD>
                  </TR>
                </center>
              </TABLE></td>
          </form>
        </tr>
      </table></td>
  </tr>
</table>
<!-- #include file="Inc/Foot.asp" -->