<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>修改新闻</title>
</head>
<body>

<?php 
$servername = "localhost"; //数据库的地址
$username = "root";        //数据库的账号
$password = "aa19991104";      //数据库的密码
$sqldb = "newsdb";         //数据库的名字
$conn =  mysqli_connect($servername, $username, $password,$sqldb);// 创建连接
mysqli_query($conn,"set names utf8");// 设置编码，防止中文乱码    
    $id = $_GET['id'];
    $sql = mysqli_query($conn,"SELECT * FROM news WHERE id=$id");
    $sql_arr = mysqli_fetch_assoc($sql);
?>

<h3>编辑新闻</h3>
<form action="zxsjcz.php?action=xgxw" method="post" >
    <label>新闻的ID: </label><input type="text" name="id"   value="<?php echo $sql_arr['id'];?>" readonly><br>
    <label>新闻时间: </label><input type="text" name="time" value="<?php echo $sql_arr['time'];?>" readonly><br>
    <label>新闻标题: </label><input type="text" name="title" value="<?php echo $sql_arr['title'];?>"><br>
    <label>新闻作者: </label><input type="text" name="zz" value="<?php echo $sql_arr['zz'];?>"> <br>
    <label>新闻内容: </label><textarea rows="10" cols="100" name="nr" ><?php echo $sql_arr['nr'];?></textarea>   
    <br>
    <h2><input type="submit" value="提交"></h2>
</form>

</body>
</html>









