<!--#include file="inc/config.asp"-->
<!--#include file="inc/conn.asp"-->
<%
if request.Form("action")="add" then
   if validCode<>CStr(session("validCode")) then
      response.write("<script>alert('您输入的验证码与系统产生的不一致，请重新输入！');window.close();</script>")
   else
	Conn.execute("insert into feedback(person,tel,email,title,content) values('"&request.Form("data_Author")&"','"&request.Form("data_Tel")&"','"&request.Form("data_Email")&"','"&request.Form("data_Title")&"','"&request.Form("data_Content")&"')")
response.write "<script language=JavaScript>alert('您的留言提交成功，请等待管理员审核！'); window.location.href='feedbackc.asp'</script>"
   end if
end if
%>
<!DOCTYPE html PUBLIC "-//W3C//Dtd XHTML 1.0 Transitional//EN" "http://www.w3.org/tr/xhtml1/Dtd/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>互动平台_<%=SiteName%>_校无忧科技_Www.Xiao5u.Com</title>
<meta name="keywords" content="<%=keywords%>"/>
<meta name="description" content="<%=description%>"/>
<link href="images/Xiao5u.css" rel="stylesheet" type="text/css">
</head>
<body>
<table width="1000" border="0" bgcolor="#FFFFFF" align="center">
  <tr>
    <td>
<!--#include file="inc/top.asp"-->
<table width="1000" border="0" align="center" cellpadding="0" cellspacing="0" id="bor">
  <tr>
    <td width="233" valign="top"><!--#include file="inc/left.asp"--></td>
    <td valign="top"><table width="757" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td width="132" height="33" align="center" background="images/right_01.jpg" class=whitetitle>互动平台</td>
        <td width="616" align="right" background="images/right_02.jpg"><img src="images/home.gif" width="16" height="16" align="absmiddle" />您当前的位置：<a href="index.asp">首页</a> &gt;&gt; 互动平台</td>
        <td><img src="images/right_03.jpg" width="9" height="33" /></td>
      </tr>
    </table>
      <table width="757" border="0" align="center" cellpadding="0" cellspacing="0" background="images/right_04.jpg">
        <tr>
          <td>

            <table cellspacing="0" cellpadding="5" width="96%" align="center" border="0" id="tab">
              <script language="JavaScript" type="text/javascript">
				function VerifyInput()
				{
				 if (document.feedback.data_Author.value == "")
				 {
				  alert("请输入您的姓名");
				  document.feedback.data_Author.focus();
				  return false;
				 }
				 if (document.feedback.data_Title.value == "")
				 {
				  alert("留言主题是必须输入的");
				  document.feedback.data_Title.focus();
				  return false;
				 }
			      if (document.feedback.data_Content.value == "")
				 {
				  alert("请输入您的留言内容");
			      document.feedback.data_Content.focus();
				  return false;
				  }
                 if (document.feedback.validCode.value == "")
				 {
                  alert("请输入随机验证码!");
		          document.feedback.validCode.focus();
                  return false;
                  }
				 }
			  </script>
              <form action="feedback.asp" method="post" name="feedback" id="feedback">
                <tbody>
                  <tr>
                    <td colspan="2">请详细填写，（*为必填项）<a name="pub" id="pub"></a></td>
                  </tr>
                  <tr>
                    <td align="right">*姓名 :</td>
                    <td width="90%"><input name="data_Author" id="inputstyle" type="text" size="15" maxlength="8"  msg="请输入您的姓名" datatype="Require" class="box" /></td>
                  </tr>
                  <tr>
                    <td align="right">电话 :</td>
                    <td ><input name="data_Tel" type="text"  id="tel" size="15" maxlength="15" msg="请输入您的电话" datatype="Phone" class="box" /></td>
                  </tr>
                  <tr>
                    <td align="right">信箱 :</td>
                    <td><input name="data_Email" id="inputstyle" type="text" size="30" maxlength="50"  msg="请输入您的电子邮箱" datatype="Email" class="box" /></td>
                  </tr>
                  <tr>
                    <td align="right">*主题 :</td>
                    <td><input name="data_Title" type="text"  id="data_Title" size="40" maxlength="30" msg="请输入您的问题标题" datatype="Require" class="box" /></td>
                  </tr>
                  <tr>
                    <td valign="top" align="right">*内容 :</td>
                    <td ><textarea name="data_Content" rows="8" cols="70" class="box2" msg="请输入您的咨询内容" datatype="Require"></textarea>
                    </td>
                  </tr>
                  <tr>
                    <td  align="right" >*验证码 :</td>
                    <td ><input name="validCode" type="text" id="inputstyle" size="4" maxlength="4"  msg="请输入验证码" datatype="Require" class="box" />
                  <img src="images/CheckCode.asp" style='cursor:hand;width:40px;height:14px' border='0' align='absmiddle' onClick="this.src='images/CheckCode.asp'" alt='请点击刷新验证码' /></td>
                  </tr>
                  <tr>
                    <td align="center" colspan="2"><input onclick="return VerifyInput();" type="submit" value=" 提交留言 " name="Submit" />
                        <input type="reset" value=" 重新填写 " name="Reset" />
                        <input name="action" value="add" type="hidden" /></td>
                  </tr>
                </tbody>
              </form>
          </table></td>
        </tr>
        <tr>
          <td><img src="images/right_05.jpg" width="757" height="6" /></td>
        </tr>
      </table></td>
  </tr>
</table>
<!--#include file="inc/bottom.asp"-->
	</td>
  </tr>
</table>
</body>
</html>