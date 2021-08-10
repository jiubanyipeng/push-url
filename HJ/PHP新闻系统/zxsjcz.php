 <?php
 //这是一个信息增、删和改操作的处理页面
$servername = "localhost"; //数据库的地址
$username = "root";        //数据库的账号
$password = "aa19991104";      //数据库的密码
$sqldb = "newsdb";         //数据库的名字
$conn = new mysqli($servername, $username, $password,$sqldb);// 创建连接
mysqli_query($conn , "set names utf8");// 设置编码，防止中文乱码
 
$scid=$_GET["id"]; 
 //根据需要action值，来判断所属操作，执行对应的代码
     switch($_GET["action"])
    {
         case "add": //执行添加操作
             //1.获取要添加的信息，并补充其他信息
            	$title =$_POST["title"];
				$zz =$_POST["zz"];
				$nr =$_POST["nr"];
			//2.拼装添加SQL语句，并执行添加操作
				$tjsj = "INSERT INTO news (title,zz,nr) VALUES ('$title','$zz','$nr')";
				$zxsj = mysqli_query( $conn, $tjsj );
            //3.判断是否成功
                 if($zxsj==true){
                     header("Location:htgl.php");
                 }else{
                     echo "<h3>新闻信息添加失败！</h3>";
                     echo "<a href='htgl.php'>返回后台</a>&nbsp;&nbsp;";
                 	 echo "<a href='ckxw.php'>浏览新闻</a>";
                 } 
                 echo $nr;
            break;
         case "xgxw": //执行修改操作
             //1.获取要修改的信息
                $id=$_POST["id"];
				$title=$_POST["title"];
				$zz=$_POST["zz"];
				$nr=$_POST["nr"];
			 //2.过滤要修改的信息（省略）
			 //3.拼装修改sql语句，并执行修改操作
				$zxxg="UPDATE news SET title='$title',zz='$zz',nr='$nr' where id=$id;";
				$zxcx = mysqli_query( $conn, $zxxg );
				$sql="SELECT zz,title,nr FROM news where id=$id";
				$result=mysqli_query($conn,$sql);
			 //4.判断修改是否成功
				$if=mysqli_fetch_array($result,MYSQLI_ASSOC); 
				if($title==$if["title"]){
					if($zz==$if["zz"]){
						if($nr==$if["nr"]){echo "修改成功\n";
						}else{echo "修改失败\n";}
					}else{echo "修改失败\n";}
				}else{echo "修改失败\n";}
             //5.跳转回浏览界面
             header("Location:htgl.php");
             break;
    }
 //4.关闭数据库连接
     mysqli_close($conn);  

