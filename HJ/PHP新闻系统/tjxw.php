<html>
	<head>
	<meta charset="utf-8">
	<title>添加新闻</title>
	</head>
	<body>
		<form action="zxsjcz.php?action=add" method="post">			
			<input type="text" name="title" placeholder="标题" size="25" maxlength="15" requied><br>
			<input type="text" name="zz" placeholder="作者" size="25" maxlength="10" requied><br>
			<textarea placeholder="请输入内容，最多输入1500字内容" maxlength="1500" name="nr" rows="10" cols="100"  required></textarea><br>  
			<!-- rows:规定文本区域内可见的行数 size和cols: 规定文本区域内可见的宽度。required:规定文本区域是必需的/必填的。placeholder:规定一个简短的提示 maxlength:	规定文本区域允许的最大字符数。 -->

			<input type="submit" formmethod="post" formaction="zxsjcz.php?action=add" value="确认添加">
		</form>
	</body>
</html>





