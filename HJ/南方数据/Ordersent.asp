<!--#include file="inc/conn.asp" -->
<%
Name=session("UserName")			'登陆用户id
RecName=request.form("RecName")			'必填字段
RecPhone=request.form("RecPhone")		'必填字段
RecAddress=request.form("RecAddress")	'必填字段
PayType=request.form("PayType")			'必填字段
Notes=request.form("Notes")				'
Recmail=request.form("Recmail")			'
RecTime=request.form("RecTime")			'
Zipcode=request.form("ZipCode")			'
Discount=request.form("Discount")		'使用点券
Comane=request.form("Comane")			
Fox=request.form("Fox")		
if Name="" then Name="游客" 

'判断购物车是否为空
ProductList = Session("ProductList")
if productlist="" then
response.redirect "error.asp?error=007"
response.end
else
sql="select * from Product where Product_Id in ("&productlist&") order by Product_Id"
Set rs = conn.Execute( sql )
end if

'如果没有购买任何物品的出错处理
if session("sum")="" then response.redirect "error.asp?error=007"
Total=session("sum")

'产生订单号（内部和外部）及定单产生日期及其他信息
BranchID="0022"
CoNo="000040"

'交易日期，格式：YYYYMMDD
yy=right(year(date),2)
mm=right("00"&month(date),2)
dd=right("00"&day(date),2)
riqi=yy & mm & dd

'生成订单号所有所需元素,格式为：小时，分钟，秒
xiaoshi=right("00"&hour(time),2)
fenzhong=right("00"&minute(time),2)
miao=right("00"&second(time),2)

'产生外部和内部定单号
BillNo=xiaoshi & fenzhong & miao
inBillNo=yy & mm & dd & "-" & xiaoshi & fenzhong & miao

'初始化用户选择的支付方式,产生对用户的反馈信息
paytype=request("PayType")

sqlp="select * from paydefault where paytype='"&paytype&"'"
set rsp=server.createobject("adodb.recordset") 
rsp.open sqlp,conn,1,1 

Set rsadd=server.createobject("adodb.recordset")
rsadd.Open "OrderList" ,conn,3,3
Set rsdetail=server.createobject("adodb.recordset")
rsdetail.Open "OrderDetail" ,conn,3,3

'事务定义开始
conn.Begintrans

'操作之一开始写入订单列表信息
rsadd.AddNew 
rsadd("UserId")=Name
rsadd("OrderNum")=inBillNo
rsadd("RecName")=RecName
rsadd("OrderSum")=Total
rsadd("RecPhone")=RecPhone
rsadd("RecAddress")=RecAddress
if ZipCode<>"" then rsadd("ZipCode")=ZipCode
if RecTime<>"" then rsadd("RecTime")=RecTime
if Recmail<>"" then rsadd("Recmail")=Recmail
if Comane<>"" then rsadd("Comane")=Comane
if Fox<>"" then rsadd("Fox")=Fox
if Discount="" then Discount=0 
rsadd("Discount")=Discount
rsadd("PayType")=PayType
if Notes<>"" then rsadd("Notes")=Notes

if error>0 then
		response.write " 操作订单列表生成错误！！"
    return
end if
rsadd.Update


'擦作二订单详细信息写入另外的表中
 Sum = 0
 While Not rs.EOF '把购买的产品资料读出来，写入定单详细资料表中
     Quatity = CInt( Request( "Q_" & rs("Product_Id")) )
     If Quatity <= 0 Then 
        Quatity = CInt( Session(rs("Product_Id")) )
        If Quatity <= 0 Then Quatity = 1
     End If
     Session(rs("Title")) = Quatity
     Sum = Sum + csng(rs("Price")) * Quatity
     Sum = FormatNumber(Sum,2) 

rsdetail.AddNew 
if Name<>"" then rsdetail("UserId")=Name		'下单用户号
rsdetail("OrderNum")=inBillNo		'订单号码
rsdetail("Product_Id")=rs("Product_Id")		'产品编码
rsdetail("ProdUnit")=Quatity		'购买数量
rsdetail("BuyPrice")=rs("Price")'购买单价

IF ERROR>0 THEN
	response.write "操作订单详细信息表生成错误！！"
	RETURN
END if

rsdetail.Update
rs.MoveNext
Wend

'事务操作结束
conn.CommitTrans

rsdetail.close
set rsdetail=nothing
rsadd.close
set rsadd=nothing
Conn.Close
Session("ProductList") = ""

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>订单提交成功</TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta name="Author" content="heweiqun">
<meta name="Contact" content="hdz2008@163.com">
<meta name="Copyright" content="southidc.net">
<meta name="Keywords" Content="南方数据企业网站管理系统">
<meta name="Description" Content="欢迎使用南方数据 www.0791idc.com">
<link href="mt_style.css" rel="stylesheet" type="text/css">
</HEAD>

<BODY>
<table border="0" cellspacing="1" cellpadding="0" align="center" valign=absmiddle width="100%" height="100%" bgcolor="B0266D">
  <tr bgcolor="eeeeee"> 
    <td  bgcolor="eeeeee" align="center"><font color="B0266D">谢谢您，订单提交成功，请您记住您的订单号码，以便查询。</font></td>
  </tr> <tr bgcolor="#FFFFFF"> 
    <td width="100%" height="100%" align="center" valign="middle"> <font color="B0266D"><b>谢谢您的参与！</font><br>
	<br><font color="B0266D">您的订单号码是：<b><%=inBillNo%></b><br>
      <br>
      </font>
	<%
	response.write message
%>
    <br><br>
	<a href="javascript:self.close()">点击关闭窗口</a></td>
  </tr>
</table>
</BODY>
</HTML>
<%
set conn=nothing
%>