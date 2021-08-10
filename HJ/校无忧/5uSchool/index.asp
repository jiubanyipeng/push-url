<!--#include file="inc/config.asp"-->
<!--#include file="inc/conn.asp"-->
<!--#include file="inc/function.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//Dtd XHTML 1.0 Transitional//EN" "http://www.w3.org/tr/xhtml1/Dtd/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title><%=SiteName%>_校无忧科技_Www.Xiao5u.Com</title>
<meta name="keywords" content="<%=keywords%>"/>
<meta name="description" content="<%=description%>"/>
<link href="images/Xiao5u.css" rel="stylesheet" type="text/css">
<link href="images/lh.css" rel="stylesheet" type="text/css">
<!--#include file=images/ini.sys -->
</head>
<body>
<table width="1000" border="0" bgcolor="#FFFFFF" align="center">
  <tr>
    <td>
<!--#include file="inc/top.asp"-->
<table width="1000" border="0" align="center" cellpadding="0" cellspacing="0" id=bor>
  <tr>
<td valign="top" width="260"><table width="250" height="290" border="0" cellpadding="0" cellspacing="0" background="images/leftlm_02.jpg">
      <tr>
        <td background="images/leftlm_01.jpg" width="250" height="31" id="leftlmtitle">通知公告</td>
      </tr>
      <tr>
        <td valign="top"><table width="100%" border="0" align="center" cellpadding="5" cellspacing="0">
         <tr>
           <td valign=top height=244 align=center>
            <div id=ImgDemo style="OVERFLOW: hidden; WIDTH: 100%; HEIGHT: 240px" align=center>
            <div id=ImgDemo1>
            <table cellSpacing=0 cellPadding=0 width="98%" border=0>
              <tbody>
              <tr>
                <td style="PADDING-BOTTOM: 10px" align=middle>
                  <table cellSpacing=0 cellPadding=0 border=0>
                    <tbody><%=ShowNotice(2,8)%></tbody>
				  </table>
				 </td>
				</tr>
				</tbody>
			  </table></div>
            <div id=ImgDemo2></div></div>
<SCRIPT language=JavaScript>
var ScrollingSpeed=60
ImgDemo2.innerHTML=ImgDemo1.innerHTML
function ScrollMarquee(){
if(ImgDemo2.offsetTop-ImgDemo.scrollTop<=0)
{ImgDemo.scrollTop-=ImgDemo1.offsetHeight}
else
{ImgDemo.scrollTop++;}
}
var ScrollingMar=setInterval(ScrollMarquee,ScrollingSpeed)
ImgDemo.onmouseover=function() {clearInterval(ScrollingMar);}//鼠标移上时清除定时器达到滚动停止的目的
ImgDemo.onmouseout=function() {ScrollingMar=setInterval(ScrollMarquee,ScrollingSpeed);}//鼠标移开时重设定时器 
</SCRIPT>
		   </td>
         </tr>
        </table></td>
      </tr>
      <tr>
        <td><img src="images/leftlm_03.jpg" width="250" height="3" /></td>
      </tr>
    </table>
    </td>
    <td width="740" valign="top"><table width="740" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td background="images/news_01.jpg" width="128" height="32" id="centerlmtitle">综合新闻</td>
        <td width="530" background="images/news_02.jpg">&nbsp;</td>
        <td width="77" background="images/news_03.jpg"><a href="Sort.asp?id=1" target="_blank">更多...</a></td>
      </tr>
    </table>
      <table width="740" border="0" align="center" cellpadding="0" cellspacing="0" background="images/news_04.jpg">
        <tr>
          <td><table width="100%" border="0" align="center" cellpadding="5" cellspacing="0">
            <tr>
              <td width="300" align=center>
              <script language="javascript" type="text/javascript" src="images/lh.js"></script>
              <div class="flashnews">
	             <div id="fade_focus">
              <div class="loading">Loading...<br /><img src="images/nopic.gif" width="280" height="200" /></div>
              <ul><%=NewsPic(5)%></ul>
             </div>
             <script language="javascript" type="text/javascript">
             s();
             </script>
             </div>
			  </td>
              <td valign=top height=244>
			  <div><ul id="plist1"><%=ShowNews(3,9)%></ul></div>
			  </td>
            </tr>
          </table></td>
        </tr>
        <tr>
          <td><img src="images/news_05.jpg" width="740" height="4" /></td>
        </tr>
      </table></td>
  </tr>
</table>
<table width="1000" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
   <td align="center"><a href="http://www.xiao5u.com/" target="_blank"><img src="images/banner.jpg"  width="1000" border="0"/></a></td>
  </tr>
</table>
<table width="1000" border="0" align="center" cellpadding="0" cellspacing="0" id="bor">
  <tr>
    <td width="265" valign="top" align="center">
    <table width="100%" border="0" cellspacing="0" cellpadding="2">
      <tr>
        <td align="center"><a href="http://www.xiao5u.com/Demo/Exam" target="_blank"><img src="images/1.gif" width="237" border="0"/></a></td>
      </tr>
      <tr>
        <td align="center"><a href="http://www.xiao5u.com/Demo/Query" target="_blank"><img src="images/2.gif" width="237" border="0"/></a></td>
     </tr>
      <tr>
        <td align="center"><a href="http://www.xiao5u.com/Demo/Salary" target="_blank"><img src="images/3.gif" width="237" border="0"/></a></td>
      </tr>
      <tr>
        <td align="center"><a href="http://www.xiao5u.com/Demo/Teacher" target="_blank"><img src="images/4.gif" swidth="237" border="0"/></a></td>
      </tr>    
    </table>
	</td>
    <td valign="top" width="375"><table width="360" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td width="145" height="33" align="center" background="images/rightlm_01.jpg" class="whitetitle">教学教研</td>
        <td background="images/rightlm_02.jpg">&nbsp;</td>
      </tr>
    </table>
      <table width="360" border="0" align="center" cellpadding="0" cellspacing="0" background="images/rightlm_03.jpg">
        <tr>
          <td valign=top height=200>
		  <div>
			<ul id="plist2"><%=ShowArticle(5,8)%></ul>
		  </div>
		 </td>
        </tr>
        <tr>
          <td><img src="images/rightlm_04.jpg" width="362" height="6" /></td>
        </tr>
      </table></td>
    <td valign="top" width="375"><table width="360" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td width="145" height="33" align="center" background="images/rightlm_01.jpg" class="whitetitle">德育长廊</td>
        <td background="images/rightlm_02.jpg">&nbsp;</td>
      </tr>
    </table>
      <table width="360" border="0" align="center" cellpadding="0" cellspacing="0" background="images/rightlm_03.jpg">
        <tr>
          <td valign=top height=200>
		  <div>
			<ul id="plist2"><%=ShowArticle(6,8)%></ul>
		  </div>
		 </td>
        </tr>

        <tr>
          <td><img src="images/rightlm_04.jpg" width="362" height="6" /></td>
        </tr>
      </table></td>
  </tr>
</table>
<table width="1000" border="0" align="center" cellpadding="0" cellspacing="0" id="bor">
  <tr>
    <td width="260" valign="top"><table width="250" border="0" cellpadding="0" cellspacing="0" background="images/leftlm_02.jpg">
      <tr>
        <td background="images/leftlm_01.jpg" width="250" height="31" id="leftlmtitle">教育法规</td>
      </tr>
      <tr>
        <td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="5">
          <tr>
            <td valign=top height=170>
			<div>
             <ul id="plist"><%=ShowArticle(7,8)%></ul>
          </div>
		  </td>
         </tr>
        </table></td>
      </tr>
      <tr>
        <td><img src="images/leftlm_03.jpg" width="250" height="4" /></td>
      </tr>
    </table></td>
    <td valign="top" width="375"><table width="360" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td width="145" height="33" align="center" background="images/rightlm_01.jpg" class="whitetitle">教师风采</td>
        <td background="images/rightlm_02.jpg">&nbsp;</td>
      </tr>
    </table>
      <table width="360" border="0" align="center" cellpadding="0" cellspacing="0" background="images/rightlm_03.jpg">
        <tr>
          <td valign=top height=210>
		  <div>
			<ul id="plist2"><%=ShowArticle(8,8)%></ul>
		  </div>
		 </td>
        </tr>
        <tr>
          <td><img src="images/rightlm_04.jpg" width="362" height="6" /></td>
        </tr>
      </table></td>
    <td valign="top" width="375"><table width="360" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td width="145" height="33" align="center" background="images/rightlm_01.jpg" class="whitetitle">学生乐园</td>
        <td background="images/rightlm_02.jpg">&nbsp;</td>
      </tr>
    </table>
      <table width="360" border="0" align="center" cellpadding="0" cellspacing="0" background="images/rightlm_03.jpg">
        <tr>
          <td valign=top height=210>
		  <div>
			<ul id="plist2"><%=ShowArticle(9,8)%></ul>
		  </div>
		 </td>
        </tr>
        <tr>
          <td><img src="images/rightlm_04.jpg" width="362" height="6" /></td>
        </tr>
      </table></td>
  </tr>
</table>
<table width="1000" border="0" align="center" cellpadding="0" cellspacing="0" background="images/photo_02.jpg" id="bor">
  <tr>
    <td width="36"><a href="School.asp"><img src="images/photo_01.jpg" width="36" height="182" border="0" /></a></td>
    <td width="959">
     <div id=demo style="OVERFLOW: hidden; WIDTH: 950px" align=center>
      <table cellSpacing=0 cellPadding=0 align=center border=0 cellspace="0">
       <tbody>
        <tr>
         <td id=demo1 vAlign=top>
         <table cellSpacing=1 cellPadding=5 border=0>
          <tr><%=ShowPic(1,5)%></tr>
		 </table>
		 </td>
        <td id=demo2 vAlign=top></td>
	   </tr>
	  </tbody>
	 </table>
	</div>
<SCRIPT>
var speed=30
demo2.innerHTML=demo1.innerHTML
function Marquee1(){
if(demo2.offsetWidth-demo.scrollLeft<=0)
demo.scrollLeft-=demo1.offsetWidth
else{
demo.scrollLeft++
}
}
var MyMar1=setInterval(Marquee1,speed)
demo.onmouseover=function() {clearInterval(MyMar1)}
demo.onmouseout=function() {MyMar1=setInterval(Marquee1,speed)}
</SCRIPT>
    </td>
    <td width="10"><img src="images/photo_03.jpg" width="5" height="182" /></td>
  </tr>
</table>
<table width="1000" border="0" align="center" cellpadding="5" cellspacing="0" id=bor>
   <tr>
     <td align="center">
     <span>
      <select onchange="if (this.options(this.selectedIndex).value!='#') window.open(this.options(this.selectedIndex).value);" name="flink29">
        <option selected="selected" value="#">== 政府部门 ==</option>
        <%=ShowLink(1)%>
      </select>
      &nbsp;&nbsp;&nbsp;&nbsp;
      <select onchange="if (this.options(this.selectedIndex).value!='#') window.open(this.options(this.selectedIndex).value);" name="flink29">
        <option selected="selected" value="#">== 教育部门 ==</option>
        <%=ShowLink(2)%>
      </select>&nbsp;&nbsp;&nbsp;&nbsp;	  
      <select onchange="if (this.options(this.selectedIndex).value!='#') window.open(this.options(this.selectedIndex).value);" name="flink29">
        <option selected="selected" value="#">== 学校网站 ==</option>
        <%=ShowLink(3)%>
      </select>&nbsp;&nbsp;&nbsp;&nbsp;	  
      <select onchange="if (this.options(this.selectedIndex).value!='#') window.open(this.options(this.selectedIndex).value);" name="flink29">
        <option selected="selected" value="#">== 其他网站 ==</option>
        <%=ShowLink(4)%>
      </select>
     </span>
	 </td>
  </tr>
</table>
<!--#include file="inc/bottom.asp"-->
</table>
	</td>
  </tr>
</table>
</body>
</html>