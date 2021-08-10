<?php
session_start();

include './public.php';  //获取公共资源

$user_list = array("admin", "peng", "user", "Administrator");  //特权用户
$name = $_COOKIE["name"];   
$ip = $_COOKIE["ip"];
$time = $_COOKIE["time"];   
$value = $_SESSION["value"];

if(!isset($_COOKIE['name']) || !isset($_SESSION["value"]) ){
  header('Location:login.php');
}else{
  if(empty($name)  || empty($value) ){
    header('Location:login.php');
  }
}

if( session_id() === $_SESSION["value"] && in_array($name,$user_list)) {
  //这里应该做一个登陆后的日志

  echo '欢迎你  '.$name."  您本次访问的时间是：".$time.'<br/>';
  echo "您的ip：".$ip."<br>";
  echo '<form method="post"><input type="submit" name="submit" value="注销"></form> ';
  // 这里要做一个只能从这里运行才能进入后台管理


$cxsj = "select * from work_notes";
$zxcx = mysqli_query( $conn, $cxsj );
if(! $zxcx ){
    die('无法读取数据: ' . mysqli_error($conn));
}else{
  echo $html_1;
  echo $html_a1;
  echo "$html_a2";
	echo '<h2>学习数据查看<h2>';
	echo '<form action="root.php" method="POST">
	<table border="1"> <tr> <td>ID</td> <td>标签</td> <td>标题</td> <td>内容</td> <td>日期与时间</td><td>操作</td></tr>';
	while($row = mysqli_fetch_array($zxcx, MYSQLI_ASSOC)){
   	 echo"<tr><td>{$row['ID']}    </td> ".
   	    	"<td>{$row['label']} </td> ".
   	    	"<td>{$row['title']}    </td> ".
        	"<td height='50' width='150'><p style='overflow:hidden; width:150px; height:50px;'>{$row['content']} </p></td> ".
        	"<td>{$row['table_time']} </td> ".        	 
        	"<td><input type='submit' formmethod='post'  formaction='sjcl1.php?id={$row['ID']}' name='caozuo' value='删除' >".
        	     "<input type='submit' formmethod='post' formaction='sjcl.php?id={$row['ID']}' name='add' value='修改' >".
        	     "<input type='submit' formmethod='post' formaction='sjcl.php' name='add'value='创建' >".
        	     "<input type='submit' formmethod='post' formaction='sjcl1.php?id={$row['ID']}' name='caozuo' value='查看详细' >".
         "</td></tr>".
         "</form>";
	} 

}
echo "<hr>";
$cxsj_1 = "select * from work_log";
$zxcx_1 = mysqli_query( $conn, $cxsj_1 );
if(! $zxcx_1 ){
    die('无法读取数据: ' . mysqli_error($conn));
}else{

  echo '<h2>工作日记查看<h2>';
  echo '<form action="root.php" method="POST">
    <table border="1"> <tr> <td>ID</td> <td>内容</td> <td>日期与时间</td><td>操作</td></tr>';
    while($row_1 = mysqli_fetch_array($zxcx_1, MYSQLI_ASSOC)){
       echo"<tr><td>{$row_1['ID']}    </td> ".
            "<td height='50' width='150'><p style='overflow:hidden; width:150px; height:50px;'>{$row_1['context']} </p></td> ".
            "<td>{$row_1['table_time']} </td> ".           
            "<td><input type='submit' formmethod='post'  formaction='sjcl1.php?id={$row_1['ID']}' name='caozuo' value='删除1' >".
                 "<input type='submit' formmethod='post' formaction='sjcl.php?id={$row_1['ID']}' name='add' value='修改1' >".
                 "<input type='submit' formmethod='post' formaction='sjcl.php' name='add' value='创建1' >".
                 "<input type='submit' formmethod='post' formaction='sjcl1.php?id={$row_1['ID']}' name='caozuo' value='查看详细1' >".
           "</td></tr>".
           "</form>";
    }                                                             
echo $html_2;
}
// 这里是注销登陆功能
  if($_SERVER["REQUEST_METHOD"] == "POST"){
    if(isset($_COOKIE['name'])){
        //将各个cookie的到期时间设为过去的某个时间，使它们由系统删除，时间以秒为单位
        setcookie('name','',time()-3600);
        setcookie('time','',time()-3600);
        setcookie('ip','',time()-3600);
        $_SESSION = array();  // 清空session变量和删除session内容
        session_destroy();   // 关闭session和删除session文件

    }     
    header('Location:login.php');
  }

}else{
  echo "<script>alert('请先登录！！！')</script>";
  header("Refresh: 1; url= login.php");
}









?>                                                                                                   