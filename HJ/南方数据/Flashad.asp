<%
   '以下是试用版代码，是固定的代码，只有正式版才可自动从后台数据库中读取图片。
   piao1="UploadFiles/2005221123046249.jpg"
   piao1url="ProductShow.asp?ID=56"
   piaos1="车"

   piao2="UploadFiles/200522112347133.jpg"
   piao2url="ProductShow.asp?ID=58"
   piaos2="车"

   piao3="UploadFiles/200522112150931.jpg"
   piao3url="ProductShow.asp?ID=59"
   piaos3="车"

   piao4="UploadFiles/2005221122938373.jpg"
   piao4url="ProductShow.asp?ID=57"
   piaos4="车"

   piao5="UploadFiles/200522111558768.jpg"
   piao5url="ProductShow.asp?ID=62"
   piaos5="车"

 
    pic=piao1&"|"&piao2&"|"&piao3&"|"&piao4&"|"&piao5
       	link=piao1url&"|"&piao2url&"|"&piao3url&"|"&piao4url&"|"&piao5url
   	texts=piaos1&"|"&piaos2&"|"&piaos3&"|"&piaos4&"|"&piaos5
%>
  
  
<script language="" type="text/javascript">
	<!--	
	var focus_width=270
	var focus_height=210
	var text_height=0
	var swf_height = focus_height+text_height	
	
	var pics='<%=pic%>'
	var links='<%=link%>'
	var texts='<%=texts%>'	
	document.write('<object ID="focus_flash" classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0" width="'+ focus_width +'" height="'+ swf_height +'">');
	document.write('<param name="allowScriptAccess" value="sameDomain"><param name="movie" value="images/pixviewer.swf"><param name="quality" value="high"><param name="bgcolor" value="#AFDBFE">');
	document.write('<param name="menu" value="false"><param name=wmode value="opaque">');
	document.write('<param name="FlashVars" value="pics='+pics+'&links='+links+'&texts='+texts+'&borderwidth='+focus_width+'&borderheight='+focus_height+'&textheight='+text_height+'">');
	document.write('<embed ID="focus_flash" src="images/pixviewer.swf" wmode="opaque" FlashVars="pics='+pics+'&links='+links+'&texts='+texts+'&borderwidth='+focus_width+'&borderheight='+focus_height+'&textheight='+text_height+'" menu="false" bgcolor="#5A9FB5" quality="high" width="'+ focus_width +'" height="'+ swf_height +'" allowScriptAccess="sameDomain" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />');		
	document.write('</object>');	
	//-->	
</script>