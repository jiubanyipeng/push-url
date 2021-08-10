<?php
header("Content-type:text/html;charset=utf-8");
date_default_timezone_set('PRC'); //调整时区



$user_list = array("admin", "peng", "user", "Administrator");  //特权用户，这个是要在数据库里面
$conn = mysqli_connect('localhost','root','aa19991104..', 'mysql_log');

if (isset($_POST["post"])) {
	$username = trim($_POST["username"]);//用户名
	$password = trim($_POST["password"]);//密码
	$time = date("Y:m:d H:i:s",time());//获取当前登录时的时间
	$ip = $_SERVER["SERVER_ADDR"];//接收ip位置

	//判断是否为空
	if (empty($username) || empty($password) ) {
		echo "<script>alert('用户名或密码不能为空！')</script>";
		header("Refresh: 1; url= login.php");
	}else{
		//这里应该多一个数据库的账号权限处理
		
		$query ="SELECT  user_name,user_passwd FROM username_login WHERE  user_name = '$username' AND user_passwd ='$password'";
		$sql = mysqli_query($conn, $query);
		$row = mysqli_fetch_assoc($sql);
		if(!empty($row)  ){
			setcookie("name",$row['user_name'],time()+3600);
			setcookie("ip",$ip,time()+3600);
			setcookie("time",$time,time()+3600);
		 	session_start();
        	$_SESSION["value"] = session_id();
        	
        	// 这里要做一个token
        	// 这里要坐一个登陆日志 
        	
        	header("Location:htgl.php"); 
		}else{
 			echo "<script>alert('账号或者密码不对！！！');window.history.back(-1)</script>";
 			//header("Refresh: 2; url= login.php"); //这里使用js返回
 			
 		}
	}


}else{
 	echo "<script>alert('请先登陆！！！')</script>";  // 需要使用该输出限制
 	header('HTTP/1.1 404 Not Found'); // 限制用户不能访问该页
	header("status: 404 Not Found");  // 限制用户不能访问该页
	header("Pragma: no-cache");//禁止本页被缓存
	header("Refresh: 1; url= login.php");


}















?>