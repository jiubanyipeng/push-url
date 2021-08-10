<script language="JavaScript">
<!--
function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}

function MM_goToURL() { //v3.0
  var i, args=MM_goToURL.arguments; document.MM_returnValue = false;
  for (i=0; i<(args.length-1); i+=2) eval(args[i]+".location='"+args[i+1]+"'");
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function YY_checkform() { //v4.66
//copyright (c)1998,2002 Yaromat.com
  var args = YY_checkform.arguments; var myDot=true; var myV=''; var myErr='';var addErr=false;var myReq;
  for (var i=1; i<args.length;i=i+4){
    if (args[i+1].charAt(0)=='#'){myReq=true; args[i+1]=args[i+1].substring(1);}else{myReq=false}
    var myObj = MM_findObj(args[i].replace(/\[\d+\]/ig,""));
    myV=myObj.value;
    if (myObj.type=='text'||myObj.type=='password'||myObj.type=='hidden'){
      if (myReq&&myObj.value.length==0){addErr=true}
      if ((myV.length>0)&&(args[i+2]==1)){ //fromto
        var myMa=args[i+1].split('_');if(isNaN(myV)||myV<myMa[0]/1||myV > myMa[1]/1){addErr=true}
      } else if ((myV.length>0)&&(args[i+2]==2)){
          var rx=new RegExp("^[\\w\.=-]+@[\\w\\.-]+\\.[a-z]{2,4}$");if(!rx.test(myV))addErr=true;
      } else if ((myV.length>0)&&(args[i+2]==3)){ // date
        var myMa=args[i+1].split("#"); var myAt=myV.match(myMa[0]);
        if(myAt){
          var myD=(myAt[myMa[1]])?myAt[myMa[1]]:1; var myM=myAt[myMa[2]]-1; var myY=myAt[myMa[3]];
          var myDate=new Date(myY,myM,myD);
          if(myDate.getFullYear()!=myY||myDate.getDate()!=myD||myDate.getMonth()!=myM){addErr=true};
        }else{addErr=true}
      } else if ((myV.length>0)&&(args[i+2]==4)){ // time
        var myMa=args[i+1].split("#"); var myAt=myV.match(myMa[0]);if(!myAt){addErr=true}
      } else if (myV.length>0&&args[i+2]==5){ // check this 2
            var myObj1 = MM_findObj(args[i+1].replace(/\[\d+\]/ig,""));
            if(myObj1.length)myObj1=myObj1[args[i+1].replace(/(.*\[)|(\].*)/ig,"")];
            if(!myObj1.checked){addErr=true}
      } else if (myV.length>0&&args[i+2]==6){ // the same
            var myObj1 = MM_findObj(args[i+1]);
            if(myV!=myObj1.value){addErr=true}
      }
    } else
    if (!myObj.type&&myObj.length>0&&myObj[0].type=='radio'){
          var myTest = args[i].match(/(.*)\[(\d+)\].*/i);
          var myObj1=(myObj.length>1)?myObj[myTest[2]]:myObj;
      if (args[i+2]==1&&myObj1&&myObj1.checked&&MM_findObj(args[i+1]).value.length/1==0){addErr=true}
      if (args[i+2]==2){
        var myDot=false;
        for(var j=0;j<myObj.length;j++){myDot=myDot||myObj[j].checked}
        if(!myDot){myErr+='* ' +args[i+3]+'\n'}
      }
    } else if (myObj.type=='checkbox'){
      if(args[i+2]==1&&myObj.checked==false){addErr=true}
      if(args[i+2]==2&&myObj.checked&&MM_findObj(args[i+1]).value.length/1==0){addErr=true}
    } else if (myObj.type=='select-one'||myObj.type=='select-multiple'){
      if(args[i+2]==1&&myObj.selectedIndex/1==0){addErr=true}
    }else if (myObj.type=='textarea'){
      if(myV.length<args[i+1]){addErr=true}
    }
    if (addErr){myErr+='* '+args[i+3]+'\n'; addErr=false}
  }
  if (myErr!=''){alert('错误:\t\t\t\t\t\n\n'+myErr)}
  document.MM_returnValue = (myErr=='');
}
//-->
</script>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<LINK href="mt_style.css" type=text/css rel=stylesheet>

<SCRIPT language=javascript 
src="js/mt_dropdownC.js"></SCRIPT>

<SCRIPT language=javascript 
src="js/mt_dropdown_initialize.js"></SCRIPT>

<META content="MSHTML 6.00.2600.0" name=GENERATOR></HEAD>
<BODY bgcolor="#004080" leftMargin=0 topMargin=0 marginwidth="0" marginheight="0" onload=init();>
<SCRIPT LANGUAGE="JavaScript">
<!--
function check()
{
   if(checkspace(document.searchform.searchkey.value !='请输入关键字'))  {
	document.searchform.searchkey.focus();
	alert("请输入查讯关键字！");
	return false;
  }
  if(checkspace(document.searchform.searchkey.value))  {
	document.searchform.searchkey.focus();
	alert("请输入查讯关键字！");
	return false;
  }
   document.searchform.submit();
}
function checkspace(checkstr) {
  var str = '';
  for(i = 0; i < checkstr.length; i++) {
    str = str + ' ';
  }
  return (str == checkstr);
}
//-->
</script>
<style>
td{font-size:9pt;line-height:120%;color:#353535} 
body{font-size:9pt;line-height:120%} 

a:link          { color: #000000; text-decoration: none }
a:visited       { color: #000000; text-decoration: none }
a:active        { color: #000000; text-decoration: none }
a:hover         { color: #336699; text-decoration: none; position: relative; right: 0px; top: 1px }
</style>
<script language="JavaScript">
function about()
{
window.showModalDialog("about.htm","","dialogWidth:420px;dialogHeight:240px;scroll:no;status:no;help:no");
}
</script><link rel="stylesheet" href="site_css.css" type="text/css">
<table width="760" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr> 
    <td> 
      <table width=760 border=0 align="center" cellpadding=0 cellspacing=0 bordercolor="#FFFFFF">
        <tr> 
          <td width="168" align=center valign="middle" > 
            <div align="center"><img src="Images/logo.gif" width="150" height="70" border="0" usemap="#Map"></div></td>
          <td width="592" valign="bottom" > <div align="right"><span style="font-size:12px"><a href="http://www.0791idc.com">网站建设</a> 
              | <a href="Contact.asp">联系我们</a> | <a href="http://mail.0791idc.com">企业邮局</a> 
              | <a href="http://bbs.southidc.net">论坛</a> | <a href="admin/index.asp">管理员登入</a></span> 
            </div></td>
        </tr>
      </table>
        
      <tr> 
            
      
    <td > 
      <META content="MSHTML 6.00.2600.0" name=GENERATOR><BODY leftMargin=0 topMargin=0 onload=init();> 
        <TABLE width=760 border=0 align=center cellPadding=0 cellSpacing=0 background="images/navbg.gif">
        <TBODY>
          <TR> 
            <TD width="476"> <div align="right"><a href="index.asp"><img src="images/homepage.gif" border="0"></a></div></TD>
            <TD width="33"> <div align="right"><A href="About.asp" id=menu1><IMG id=button1 
      src="images/bbs.gif"  border=0 name=button1></A></div></TD>
            <TD width="33"> <div align="right"><A href="news.asp" id=menu2><IMG id=button2 
      src="images/shop.gif"  border=0 name=button2></A></div></TD>
            <TD width="33"> <div align="right"><A id=menu3 href="Product.asp"><IMG id=button3 
      src="images/pick.gif" border=0 name=button3></A></div></TD>
            <TD width="33"> <div align="right"><A id=menu9 href="download.asp"><IMG id=button9 
      src="images/zy.gif" border=0 name=button9></A></div></TD>
            <TD width="33"> <div align="right"><A id=menu4 href="Honor.asp"><IMG id=button4 
       src="images/pic.gif"  border=0 name=button4></A></div></TD>
            <TD width="33"> <div align="right"><A id=menu5 href="Sale.asp"><IMG id=button5 
       src="images/jc.gif" border=0 name=button5></A></div></TD>
            <TD width="33"> <div align="right"><A id=menu6 href="Job.asp"><IMG id=button6 
       src="images/rencai.gif"  border=0 name=button6></A></div></TD>
            <TD width="40"> <div align="right"><A id=menu8 href="Server.asp"><IMG id=button8 
       src="images/lj.gif"  border=0 name=button8></A></div></TD>
            <TD width="1" background="images/navbg.gif"></TD>
          </TR>
          <TR> 
            <TD colspan="8" background="images/aniuxia.gif"></TD>
            <TD background="images/navbg.gif"></TD>
          </TR>
        </TBODY>
      </TABLE>
<SCRIPT language=javascript src="js/mt_dropdown_content.js"></SCRIPT>
    </td>
  </tr>
</table>
<table width="760" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="760" height="100">
        <param name="movie" value="Img/0791idc.swf">
        <param name="quality" value="high">
        <param name="wmode" value="transparent">
        <embed src="Img/0791idc.swf" width="760" height="100" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" wmode="transparent"></embed></object></td>
  </tr>
</table>
<TITLE></TITLE>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<LINK href="mt_style.css" type=text/css rel=stylesheet>

<tr> 
      <td > 
        <SCRIPT language=JavaScript>
	var currentCategory =new String("");
	
	//方法turnX的参数说明：
	//cate：当前分类的分类号
	function turnX(cate)
	{
		document.all("currentLocation").style.display="none";
		if(currentCategory != "")
		{
			document.all(currentCategory).style.display="none";
		}
		currentCategory = cate;
		document.all(currentCategory).style.display="";
		return;
	}
</SCRIPT>
 
<map name="Map">
  <area shape="rect" coords="11,7,139,62" href="http://www.0791idc.com" target="_blank">
</map>
