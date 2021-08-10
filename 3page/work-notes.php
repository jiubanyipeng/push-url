<?php
include '../public.php';
header('content-type:text/html; charset=utf-8');  //设置编码



$cxsj = 'SELECT * FROM work_notes';
$zxcx = mysqli_query( $conn, $cxsj );
if(! $zxcx ){
    die('无法读取数据: ' . mysqli_error($conn));
}else{
	echo '<h2>数据查看<h2>';
	echo '<table border="1">
	<tr>
	<td>ID</td>
	<td>标签</td>
	<td>标题</td>
	<td>内容</td>
	<td>日期时间</td>
	</tr>';
	while($row = mysqli_fetch_array($zxcx, MYSQLI_ASSOC)){
   	 echo "<tr>
   	 <td>{$row['ID']}</td>
   	 <td>{$row['label']}</td>
   	 <td>{$row['title']}</td>
   	 <td>{$row['content']}</td>
   	 <td>{$row['table_time']}</td>
   	 </tr>";
	}                                                                                                                                                                                                                                                                                                        

	echo '</table>'.'<br/>';
}

mysqli_free_result($zxcx);// 释放查询的内存
mysqli_close($conn); //关闭数据库连接
?>