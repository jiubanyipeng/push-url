
<html>
<head>
<title>南方数据企业网站后台管理系统</title>
<meta name="Author" content="heweiqun">
<meta name="Contact" content="hdz2008@163.com">
<meta name="Copyright" content="southidc.net">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="Inc/ManageMent.css" rel="stylesheet" type="text/css">
<script language="JavaScript1.2">
 function Td_Over(Element1){
    Element1.className = 'TdOver';
 }
 function Td_Out(Element1){
    Element1.className = 'TdOut';
 }
  function Td_Down(Element1){
    Element1.className = 'TdDown';
 }
  function Td_Click(No){
    var url;
	if (No == 0){
	url = "Manage_Main.asp"; 
	}else if (No == 1){
	url = "ArticleManage.asp";
	}else if (No == 2){
	url = "Manage_Eshop.asp"; 
	}else if (No == 3){
	url = "UserManage.asp"; 
	}else if (No == 4){
	url = "Manage_News.asp"; 
	}else if (No == 5){
	url = "Manage_Book.asp";  
	}else if (No == 6){
	url = "Manage_honor.asp";  
	}else if (No == 7){
	url = "Manage_job.asp";  
	}else if (No == 8){
	url = "Manage_sale.asp"; 
	}else if (No == 9){
	url = "VoteManage.asp"; 
	}else if (No == 10){
	url = "Manage_Link.asp"; 
	}else if (No == 11){
	url = "Loginout.asp"; 
	}else if (No == 12){
	url = "Manage.asp"; 
	}else if (No == 13){
	url = "Viewuser.asp"; 
	}else if (No == 14){
	url = "Down_Manage.asp"; 
	}
    
	location.href=url;
 }
</script>
</head>

<body>
<table width="100%" height="30" border="0" cellpadding="0" cellspacing="0" class="HeaderTdStyle">
  <tr> 
    
    <td><div align="center"><b>南 方 数 据 企 业 通 用 建 站 后 台 管 理 系 统</b></div></td>
  </tr>
</table>
<table width="100%" height="28" border="0" cellpadding="0" cellspacing="0" class="HeaderTdStyle">
  <tr> 
    <td> 
      <table width="100%" height="30" border="0" cellpadding="0" cellspacing="2">
        <tr>
          <td align="center" class="TdOut" onClick="Td_Click(12)" onMouseDown="Td_Down(this)" onMouseOver="Td_Over(this)" onMouseOut="Td_Out(this)">系统管理</td>
                  
          <td align="center" class="TdOut" onClick="Td_Click(0)" onMouseDown="Td_Down(this)" onMouseOver="Td_Over(this)" onMouseOut="Td_Out(this)">企业信息</td>
		  <td align="center" class="TdOut" onClick="Td_Click(1)" onMouseDown="Td_Down(this)" onMouseOver="Td_Over(this)" onMouseOut="Td_Out(this)">产品管理 
          </td>
		  <td align="center" class="TdOut" onClick="Td_Click(2)" onMouseDown="Td_Down(this)" onMouseOver="Td_Over(this)" onMouseOut="Td_Out(this)">订单管理 
          </td>
		  <td align="center" class="TdOut" onClick="Td_Click(14)" onMouseDown="Td_Down(this)" onMouseOver="Td_Over(this)" onMouseOut="Td_Out(this)">下载管理 
          </td>
		  <td align="center" class="TdOut" onClick="Td_Click(3)" onMouseDown="Td_Down(this)" onMouseOver="Td_Over(this)" onMouseOut="Td_Out(this)">会员管理 
          </td>
		  <td align="center" class="TdOut" onClick="Td_Click(4)" onMouseDown="Td_Down(this)" onMouseOver="Td_Over(this)" onMouseOut="Td_Out(this)">新闻管理</td>
		  <td align="center" class="TdOut" onClick="Td_Click(5)" onMouseDown="Td_Down(this)" onMouseOver="Td_Over(this)" onMouseOut="Td_Out(this)">留言管理</td>
		  <td align="center" class="TdOut" onClick="Td_Click(6)" onMouseDown="Td_Down(this)" onMouseOver="Td_Over(this)" onMouseOut="Td_Out(this)">荣誉管理</td>
		  <td align="center" class="TdOut" onClick="Td_Click(7)" onMouseDown="Td_Down(this)" onMouseOver="Td_Over(this)" onMouseOut="Td_Out(this)">人才管理</td>
		  <td align="center" class="TdOut" onClick="Td_Click(8)" onMouseDown="Td_Down(this)" onMouseOver="Td_Over(this)" onMouseOut="Td_Out(this)">营销网络</td>
		  <td align="center" class="TdOut" onClick="Td_Click(9)" onMouseDown="Td_Down(this)" onMouseOver="Td_Over(this)" onMouseOut="Td_Out(this)">调查管理</td>
		  <td align="center" class="TdOut" onClick="Td_Click(13)" onMouseDown="Td_Down(this)" onMouseOver="Td_Over(this)" onMouseOut="Td_Out(this)">邮件列表</td>
		  <td align="center" class="TdOut" onClick="Td_Click(10)" onMouseDown="Td_Down(this)" onMouseOver="Td_Over(this)" onMouseOut="Td_Out(this)">友情链接</td>
		  <td align="center" class="TdOut" onClick="Td_Click(11)" onMouseDown="Td_Down(this)" onMouseOver="Td_Over(this)" onMouseOut="Td_Out(this)">退出</td>
		  <td></td>
        </tr>
      </table></td>
  </tr>
</table>
