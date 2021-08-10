<?php 
$servername = "localhost"; //数据库的地址
$username = "root";        //数据库的账号
$password = "aa19991104";      //数据库的密码
$sqldb = "newsdb";         //数据库的名字
$conn = new mysqli($servername, $username, $password,$sqldb);// 创建连接
mysqli_query($conn , "set names utf8");// 设置编码，防止中文乱码


//查询数据操作
$cxsj = 'SELECT * FROM news';
$zxcx = mysqli_query( $conn, $cxsj );
if(! $zxcx ){
    die('无法读取数据: ' . mysqli_error($conn));
}else{
	echo '<h2>查询数据<h2>';
	echo '<table border="1"><tr><td>ID</td><td>日期与时间</td><td>标题</td><td>作者</td><td>内容</td></tr>';
	while($row = mysqli_fetch_array($zxcx, MYSQLI_ASSOC))
	{
   	 echo"<tr><td>{$row['id']}</td> ".
            "<td>{$row['time']} </td> ".
   	    	  "<td>{$row['title']} </td> ".
    		    "<td>{$row['zz']} </td> ".
        	  "<td>{$row['nr']} </td> ".        	 
         "</tr>";
	}
	echo '</table>'.'<br/>';
}








?>