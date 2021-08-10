<?php 
//引入公共资源
include './public.php';
header('content-type:text/html; charset=utf-8');

#这里获取处理表单的数据
$cras = $_POST["label"]; //接收表单的数据
$title = $_POST["title"];
$content = $_POST["context"];
$cz =$_POST["caozuo"];
$id = $_GET["id"];

switch ($cz) {
	case "创建":
		$tjsj = "INSERT INTO work_notes (label,title,content) VALUES ('$cras','$title','$content')";
		 $zxsj = mysqli_query( $conn, $tjsj );
		 if ($zxsj == true) {
		 	echo "数据添加成功";
		 	header('Refresh: 3; htgl.php');
		 }else{
		 	echo "数据添加失败";
		 	header('Refresh:3; htgl.php');
		 }
	break;
	case "创建1":
		$tjsj = "INSERT INTO worklog (context) VALUES ('$content')";
		 $zxsj = mysqli_query( $conn, $tjsj );
		 if ($zxsj == true) {
		 	echo "数据添加成功";
		 	$phptime = date('Y-m-d H:i:s');
			$phplog =">>C:\Users\Administrator\Desktop\worklog.txt";
			$cmd = shell_exec("echo  ${content}  ${phptime}   ${phplog} ");
		 	header('Refresh: 2; htgl.php');
		 }else{
		 	echo "数据添加失败";
		 	echo "$content";
		 	header('Refresh:2; htgl.php');
		 }
	break;
	case "删除":
		$sjsc =" delete from work_notes where id=$id";
		$zxsj= mysqli_query($conn, $sjsc);
		 if ($zxsj == true) {
		 	echo "数据删除成功";
		 	header('Refresh:1; htgl.php');
		 }else{
		 	echo "数据删除失败";
		 	header('Refresh:2; htgl.php');
		 }
		break;
		case "删除1":
		$sjsc =" delete from worklog where id=$id";
		$zxsj= mysqli_query($conn, $sjsc);
		 if ($zxsj == true) {
		 	echo "数据删除成功";
		 	header('Refresh:1; htgl.php');
		 }else{
		 	echo "数据删除失败";
		 	header('Refresh:2; htgl.php');
		 }
		break;
	case "确定修改":
	  $zxxg = "update work_notes set label='$cras', title='$title', content='$content' where id=$id";
	  $zxcz= mysqli_query($conn, $zxxg);
		 if ($zxcz == true) {
		 	echo "数据修改成功";
		 	header('Refresh:1; htgl.php');
		 }else{
		 	echo "数据修改失败";
		 	header('Refresh:2; htgl.php');
		 }
	break;
	case "查看详细":
	  $ckxx = "select * from work_notes where ID=$id ";
	  $zxcz= mysqli_query($conn, $ckxx);
	    if(! $zxcz ){
    		die('无法读取数据: ' . mysqli_error($conn));
    		header('Refresh:3; htgl.php');
		}else{
			echo '<h2>数据查看<h2>';
			echo '<h4><a href="./htgl.php"></a><h4>';
			echo '<table border="1"> <tr> <td>ID</td> <td>标签</td> <td>标题</td> <td>日期与时间</td> </tr>';
			while($row = mysqli_fetch_array($zxcz, MYSQLI_ASSOC)){
   			 	echo"<tr><td>{$row['ID']}</td> 
   			 	<td>{$row['label']} </td> 
   			 	<td>{$row['title']} </td> 
   			 	<td>{$row['table_time']} </td></tr> 
   	    		<tr><td>{$row['content']}</td></tr>
   	    			 </table>";
   	    	}
   	    }
	break;
		case "查看详细1":
	  $ckxx = "select * from worklog where ID=$id ";
	  $zxcz= mysqli_query($conn, $ckxx);
	    if(! $zxcz ){
    		die('无法读取数据: ' . mysqli_error($conn));
    		header('Refresh:3; htgl.php');
		}else{
			echo '<h2>数据查看<h2>';
			echo '<h4><a href="./htgl.php"></a><h4>';
			echo '<table border="1"> <tr> <td>ID</td> <td>标签</td> <td>标题</td> <td>日期与时间</td> </tr>';
			while($row = mysqli_fetch_array($zxcz, MYSQLI_ASSOC)){
   			 	echo"<tr><td>{$row['ID']}</td> 
   			 	<td>{$row['table_time']} </td></tr> 
   	    		<tr><td>{$row['context']}</td></tr>
   	    			 </table>";
   	    	}
   	    }
	break;
	default:
		header('Location:htgl.php');
}

?>