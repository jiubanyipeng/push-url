<html>
	<head>
	<meta charset="utf-8">
	<title>后台管理系统</title>
	</head>
	<body>
		<h1>欢迎来到新闻发布系统后台</h1>
		<h3><a href="tjxw.php">发布新闻</a></h3>
		<h3><a href="ckxw.php">查看详细新闻</a></h3>
	</body>
</html>

<?php 
$servername = "localhost"; //数据库的地址
$username = "root";        //数据库的账号
$password = "aa19991104";      //数据库的密码
$sqldb = "newsdb";         //数据库的名字
$conn = new mysqli($servername, $username, $password,$sqldb);// 创建连接
mysqli_query($conn , "set names utf8");// 设置编码，防止中文乱码

//查询数据的全部内容


$cxsj = 'SELECT * FROM news';
$zxcx = mysqli_query( $conn, $cxsj );
if(! $zxcx ){
    die('无法读取数据: ' . mysqli_error($conn));
}else{
	echo '<h2>数据查看<h2>';
	echo '<table border="1"><tr><td>ID</td><td>标题</td><td>作者</td><td>内容</td><td>日期与时间</td><td>操作</td></tr>';
	while($row = mysqli_fetch_array($zxcx, MYSQLI_ASSOC))
	{
   	 echo"<form action='zxsjcz.php' method='post'>".
   	 "<tr><td>{$row['id']}</td> ".
   	    	 "<td>{$row['title']} </td> ".
    		 "<td>{$row['zz']} </td> ".
        	 "<td height='50' width='150'><p style='overflow:hidden; width:150px; height:50px;'>{$row['nr']} </p></td> ".
        	 "<td>{$row['time']} </td> ".
        	 "<td><input type='submit' formmethod='post' formaction='scxw.php?id={$row['id']}' value='删除' >".
        	     "<input type='submit' formmethod='post' formaction='bjxg.php?id={$row['id']}' value='修改' >".
        	     "<input type='submit' formmethod='post' formaction='ckxw.php?id={$row['id']}' value='查看详细' >".
         "</td></tr>".
         "</form>";
	}                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          

	echo '</table>'.'<br/>';
}

mysqli_free_result($zxcx);// 释放查询的内存
mysqli_close($conn); //关闭数据库连接

?>