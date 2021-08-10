<?php
// 本页面是专门处理下载的
//header("Content-type:text/html;charset=utf-8");
header('Content-Type: application/zip'); // ZIP文件
header('Content-Transfer-Encoding: binary'); //设置传输方式

if($_SERVER["REQUEST_METHOD"] == "POST"){

if( isset($_POST['bp']) ){	
	header('Content-Disposition: attachment; filename="./download/Burp_Suite_Pro_v1.7.32_Loader_Keygen.zip"'); //设置MIME用户作为附件	s
	header('Content-Length: '.filesize('./download/Burp_Suite_Pro_v1.7.32_Loader_Keygen.zip')); //设置内容长度
exit;
}elseif(isset($_POST['caidao'])){
	header('Content-Disposition: attachment; filename="caidao-20160622.zip"  ');
	header('Content-Length: '.filesize('caidao-20160622.zip')); 

}elseif(isset($_POST['netcat'])){
	header('Content-Disposition: attachment; filename="./download/netcat.zip" ');
	header('Content-Length: '.filesize('../download/netcat.zip')); 

}elseif(isset($_POST['ngrok'])){
	header('Content-Disposition: attachment; filename="./download/ngrok.zip" ');
	header('Content-Length: '.filesize('./download/ngrok.zip')); 
exit;
}elseif(isset($_POST['www'])){
	header('Content-Disposition: attachment; filename="./download/WWW.zip" ');
	header('Content-Length: '.filesize('./download/WWW.zip')); 
exit;
}elseif(isset($_POST['rst'])){
	header('Content-Disposition: attachment; filename="RST.zip" ');
	header('Content-Length: '.filesize('RST.zip')); 
exit;	
}else{
	header('HTTP/1.1 404 Not Found'); // 限制用户不能访问该页
}

}








?>