<%@language=vbscript codepage=936 %>
<!--#include file="Admin.asp"-->
<!--#include file="Conn.asp"-->
<!--#include file="../Inc/Ubbcode.asp"-->
<!--#include file="Inc/Function.asp"-->
<!-- #include file="Inc/Head.asp" -->
<body>
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
  <tr> 
    <td width="150" align="center" valign="top"> <table width="150" height="100%" border="0" cellpadding="0" cellspacing="0" class="HeaderTdStyle">
        <tr> 
          <td align="center" valign="top"><table width="100%" height="24" border="0" cellpadding="0" cellspacing="0">
              <tr> 
                <td align="center">功能菜单</td>
              </tr>
            </table>
            <table width="100%" height="90%" border="0" cellpadding="0" cellspacing="0" class="MenuBg">
              <tr> 
                <td align="center" valign="top"><br> <table width="90%" border="0" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td width="16%"><img src="../Img/Left_1.gif" width="28" height="11"></td>
                      <td width="84%" height="20"><font color="#FFFF00">产品管理</font></td>
                    </tr>
                  </table>
                  <table width="90%" border="0" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td width="34%" height="20" align="right"><img src="../Img/Left_1_1.gif" width="29" height="16"></td>
                      <td width="66%" valign="bottom"><a href="ClassManage.asp"><font color="#FFFF00">产品类别设置</font></a></td>
                    </tr>
                  </table>
                  <table width="90%" border="0" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td width="34%" height="20" align="right"><img src="../Img/Left_1_1.gif" width="29" height="16"></td>
                      <td width="66%" valign="bottom"><a href="ArticleManage.asp"><font color="#FFFF00">产品管理</font></a></td>
                    </tr>
                  </table>
                  <table width="90%" border="0" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td width="34%" height="20" align="right"><img src="../Img/Left_1_1.gif" width="29" height="16"></td>
                      <td width="66%" valign="bottom"><a href="ArticleAdd.asp"><font color="#FFFF00">添加产品</font></a></td>
                    </tr>
                  </table>
                  <table width="90%" border="0" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td width="34%" height="20" align="right"><img src="../Img/Left_1_1.gif" width="29" height="16"></td>
                      <td width="66%" valign="bottom"><a href="ArticleCheck.asp"><font color="#FFFF00">审核产品</font></a></td>
                    </tr>
                  </table></td>
              </tr>
            </table></td>
        </tr>
      </table></td>
    <td width="862" align="center" valign="top"> <br>
      <br> <table width="600" border="0" align="center" cellpadding="0" cellspacing="0" bordercolor="#111111" style="border-collapse: collapse">
        <tr> 
          <td width="9"> <img border="0" src="../../0791idc/Images/top_1.gif" width="59" height="20"></td>
          <td width="731" background="../../0791idc/Images/top_2.gif">　</td>
          <td width="10"> <img border="0" src="../../0791idc/Images/top_3.gif" width="36" height="20"></td>
        </tr>
      </table>
      <table width="600" height="69" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#111111" bordercolorlight="#57801A" bordercolordark="#57801A" style="border-collapse: collapse">
        <tr> 
          <td width="100%" background="../../0791idc/Images/bg1.gif" height="26"> 
            <p align="center">对不起，你访问的网页试用版没有提供，要想更好的服务，请联系我们！</td>
        </tr>
        <tr> 
          <td width="100%" height="41" valign="top"> 　　<br>
            　　<br> <br>
            　　只要在<font color="#FF0000"><strong>南方数据(<a href="http://www.0791idc.com">http://www.0791idc.com</a>)</strong></font>购买二年以上(包括二年)企业空间的客户可免费获得正式版(包括所有的功能)，我们有一支技术和设计一流的开发团队，过不了多久有会就新的版本推出。 
            <br>
            　　南方数据为广大个人和企业提供专业精美的网站代码，所提供的代码功能强大，同时为您定制需要的功能，现在正在提供的商业代码有：房产系统，企业商务网；地方信息港；网络办公系统，专业下载系统，专业影视系统，专业音乐下载系统，新闻系统，网络营销系统，网上购物系统等......<br> 
            <br>
            　　完整演示前台：<a href="http://china.0791idc.com">http://china.0791idc.com</a> 
            <br> <br>
            　　完整演示后台：<a href="http://china.0791idc.com/admin">http://china.0791idc.com/admin</a><br> 
            <br>
            　　用户名：admin 　密码：0791idc<br> <p> 　　访问我们的网站：<a href="http://www.southidc.net">http://www.southidc.net</a> 
              　 <a href="http://www.0791idc.com">http://www.0791idc.com</a></p>
            <p>　　联系方式:QQ:635495 MSN:jxhwq@hotmail.com 
            <p> 　　Email:<a href="mailto:hdz2008@@163.com">hdz2008@@163.com</a> 
              Tel:0791-6274752 8059439　13065161861<br>
              <br>
              　　南方数据为广大网友最优价制作精美网页,专业的程序提供,现在活动中。 
            <p><br>
          </td>
        </tr>
      </table>
      <table width="600" border="0" align="center" cellpadding="0" cellspacing="0" bordercolor="#111111" style="border-collapse: collapse">
        <tr> 
          <td width="4"> <img border="0" src="../../0791idc/Images/end_1.gif" width="7" height="17"></td>
          <td width="740" background="../../0791idc/Images/end_2.gif">　</td>
          <td width="6"> <img border="0" src="../../0791idc/Images/end_3.gif" width="7" height="17"></td>
        </tr>
      </table> </td>
  </tr>
</table>
<!-- #include file="Inc/Foot.asp" -->
