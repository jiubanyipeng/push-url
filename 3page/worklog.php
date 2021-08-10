<?php
include '../public.php';
header('content-type:text/html; charset=utf-8');


echo "$html_1";
$ckxx = "select * from worklog  ";
	  $zxcz= mysqli_query($conn, $ckxx);
	    if(! $zxcz ){
    		die('无法读取数据: ' . mysqli_error($conn));
    		header('Refresh:3; htgl.php');
		}else{
			echo '<h2>数据查看<h2>';
			echo '<h4><a href="./htgl.php"></a><h4>';
			echo '<table border="1"> <tr> <td>ID</td> <td>日期与时间</td> </tr>';
			while($row = mysqli_fetch_array($zxcz, MYSQLI_ASSOC)){
   			 	echo"<tr><td>{$row['ID']}</td> 
   			 	<td>{$row['table_time']} </td></tr> 
   	    		<tr><td>{$row['context']}</td></tr>
   	    			 </table>";
   	    	}
   	    }

echo "$html_2";

?>