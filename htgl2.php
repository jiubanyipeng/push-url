<?php
//已登录页面，显示登录用户名
//这里设置解码的，还未完成
session_start();
//include './logincpu.php';

$user_list = array("admin", "peng", "user", "Administrator");  //特权用户

$name = $_COOKIE["name"];   
$ip = $_COOKIE["ip"];
$time = $_COOKIE["time"];   // 这里应该做一个存入库里面，一个是sql库，一个是日志
$value = $_SESSION["value"];


if(!isset($_COOKIE['name']) || !isset($_SESSION["value"]) ){
	header('Location:login.php');
}else{
	if(empty($name)  || empty($value) ){
		header('Location:login.php');

	}
}

	if( session_id() === $_SESSION["value"] && in_array($name,$user_list)) {
	    echo '欢迎你  '.$name."  您上次访问的时间是：".$time.'<br/>';
 		echo "您的ip：".$ip."<br>";
		echo '<form method="post"><input type="submit" name="submit" value="注销"></form> ';
		echo '<a href="login.php"> ht </a>';

		if($_SERVER["REQUEST_METHOD"] == "POST"){
			if(isset($_COOKIE['name'])){
			    //将各个cookie的到期时间设为过去的某个时间，使它们由系统删除，时间以秒为单位
			    setcookie('name','',time()-3600);
			    setcookie('time','',time()-3600);
			    setcookie('ip','',time()-3600);
			    $_SESSION = array();  // 清空session变量和删除session内容
			    session_destroy();   // 关闭session和删除session文件

			}
			//location首部使浏览器重定向到另一个页面
			$home_url = 'login.php';
			header('Location:'.$home_url);
		}

	}else{
		//$_SESSION = array();
		//session_destroy();
		//header('Location:login.php');
		//
		echo "本身的值: ".session_id()."<br>";
		echo "你的值:".$_SESSION["value"]."<br>";
		echo "你的权限: ".$_COOKIE["name"]."<br>";
	}



?>