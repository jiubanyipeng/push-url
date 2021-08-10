<?php

// 引入公共资源
include './public.php';      # 数据库部分跟html的代码
// include './'

$action = $_POST["add"];
$id = $_GET["id"];

switch ($action) {
   case "创建":
     echo  $html_1.'<form action="sjcl1.php" method="post">
				选择标签<select name="label">
				//这里的值应该是动态的，但没有时间去做
					<option value="工作">工作</option>
					<option value="日常">日常</option>
					<option value="生活" >生活</option>
					<option value="学习">学习</option>
				</select> <br>
				输入标题<input type="text" name="title"><br>
				输入内容<input type="text" name="context" height="200px" width="150px">
				<input type="submit" formaction="sjcl1.php" name="caozuo" value="创建1">
				</form>
			'.$html_2;
     break;
    case "创建1":
        echo $html_1.'<form action="sjcl1.php" method="post">
            输入内容<input type="text" name="context" height="200px" width="350px">
            <input type="submit" formaction="sjcl1.php" name="caozuo" value="创建1">
            </form>
        '.$html_2;
        break;
   case "修改":
    $sql = mysqli_query($conn,"SELECT * FROM work_notes WHERE id=$id");
    $sql_arr = mysqli_fetch_assoc($sql);    //把结果集排序起来
    if(!$sql){
    	die('无法读取数据: '.mysqli_error($conn));
    }else{ 	
    $html_id = $sql_arr["ID"];
    $html_label = $sql_arr["label"];
    $html_title = $sql_arr["title"];
    $html_content = $sql_arr["content"];
    $html_time = $sql_arr["table_time"];
    echo $html_1."
  		<h3>编辑新闻</h3>
	 	<form action='sjcl1.php?id=$html_id' method='post'>
    		<label>新闻的ID: </label><input type='text' value='$html_id' readonly><br>
    		<label>新闻的标签: </label><input type='text' value='$html_label' name='label' readonly><br>
    		<label>新闻的标题: </label><input type='text' value='$html_title' name='title' ><br>
    		<label>新闻时间: </label><input type='text'   value='$html_time' readonly><br>
    		<label>新闻内容: </label><textarea rows='10' cols='100' name='content'>$html_content</textarea><br>
    	<h2><input type='submit' name='caozuo'  value='确定修改'></h2>
    	</form>".$html_2;
	}

     break;
    case "修改1":
        
        break;
   default:
     header('Location:htgl.php');
}





?>