<?php 
$servername = "localhost"; //数据库的地址
$username = "root";        //数据库的账号
$password = "aa19991104";      //数据库的密码
$sqldb = "newsdb";         //数据库的名字
$conn = new mysqli($servername, $username, $password,$sqldb);// 创建连接
mysqli_query($conn , "set names utf8");// 设置编码，防止中文乱码

$id=$_GET['id'];//接受id值
//查看数据是否存在
$sql="SELECT * FROM news where id=$id";
$cxsj = mysqli_query( $conn, $sql);
//判断数据是否被删除
if($cxsj==true){
	$cxsj ="DELETE FROM news where id=$id";
	$zxcx = mysqli_query( $conn, $cxsj );
	if($zxcx==true){
		echo "删除成功\n";
		echo "<a href=htgl.php>返回后台</a>\n";
	}else{
		echo "删除失败\n";
		echo "<a href=htgl.php>返回后台</a>\n";
	}
}else{
	echo "找不到数据<br><a href=htgl.php>返回后台</a>\n";
}

mysqli_close($conn); //关闭数据库连接








?>