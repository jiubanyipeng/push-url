<!--#include file="inc/config.asp"-->
<!--#include file="inc/conn.asp"-->
<%
id=Trim(request("id"))
if id="" or IsNumeric(id)=false then
  response.Redirect("index.asp")
end if
Set rs=Server.CreateObject("Adodb.Recordset")
rs.open "select * from Article where id="&id,Conn,1,2
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title><%=rs("title")%>_<%=SiteName%>_У���ǿƼ�_Www.Xiao5u.Com</title>
<meta name="keywords" content="<%=rs("keywords")%>"/>
<meta name="description" content="<%=rs("description")%>"/>
<link href="images/Xiao5u.css" rel="stylesheet" type="text/css">
<SCRIPT language=JavaScript> 
function fontZoom(size)
{
 document.getElementById('fontzoom').style.fontSize=size+'px'
}
</SCRIPT>
</head>
<body>
<table width="1000" border="0" bgcolor="#FFFFFF" align="center">
  <tr>
    <td>
<!--#include file="inc/top.asp"-->
<table width="1000" border="0" align="center" cellpadding="0" cellspacing="0" id="bor">
  <tr>
    <td valign="top"><table width="1000" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td width="132" height="33" align="center" background="images/center_01.jpg" class=whitetitle>�����Ϣ</td>
        <td width="868" align="right" background="images/center_02.jpg"><img src="images/home.gif" width="16" height="16" align="absmiddle" />����ǰ��λ�ã�<a href="index.asp">��ҳ</a> &gt;&gt; �����Ϣ</td>
        <td><img src="images/center_03.jpg" width="9" height="33" /></td>
      </tr>
    </table>
      <table width="1000" border="0" align="center" cellpadding="0" cellspacing="0" background="images/center_04.jpg">
        <tr>
          <td><table width="98%" border="0" cellspacing="0" cellpadding="5" align=center>
          <tr>
            <td align="center" class="title"><%=rs("title")%></td>
            </tr>
          <tr>
            <td align="center" bgcolor="efefef" > �����壺
			<a href="javascript:fontZoom(16)" class="news">��</a>
			<a href="javascript:fontZoom(14)" class="news"> ��</a> 
			<a  href="javascript:fontZoom(12)" class="news">С</a>�� �� ��ʱ�䣺<%=rs("addtime")%>�� �������ߣ�<%=rs("author")%>�� ����<a href="javascript:window.close();" class="news">�� ��</a>��������<a href="javascript:window.print()" class="news">�� ӡ</a>��</td>
          </tr>
          <tr>
            <td class="txt" id=fontzoom><%=rs("content")%></td>
          </tr>
        </table>
            <table width="98%" border="0" align="center" cellpadding="5" cellspacing="0">
              <tr>
                <td align="center">��<a href="javascript:window.close()">�ر�ҳ��</a>����<a href="#top">ҳ�涥��</a>��</td>
              </tr>
            </table></td>
        </tr>
        <tr>
          <td><img src="images/center_05.jpg" width="1000" height="6" /></td>
        </tr>
      </table></td>
  </tr>
</table>
<!--#include file="inc/bottom.asp"-->
	</td>
  </tr>
</table>
<%
rs.close
set rs=nothing
%>
</body>
</html>