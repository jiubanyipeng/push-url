<?php
session_start();


if (session_id() === $_SESSION["value"]){
//先不做token
//token 生成
// $key = 'key';  //最好是换成username
// $name_key = 'peng';
// $time = time();
// $end_tiem = time() + 3600;
// $info = $key.'.'.$time.'.'.$end_tiem; // 设置token过期为一小时
//根据上面信息生成签名 密钥是$name_key
// $signature = hash_hmac('md5', $info, $name_key);
// $token = $info . '.' .$signature;  //最终的token字符串

// token 验证

// public function check_token($token)
// 	{
// 		// api传来的token 
// 		if(!isset($token) || empty($token))
// 		{
// 			$msg['code']='400';
//             $msg['msg']='非法请求';
//             return json_encode($msg,JSON_UNESCAPED_UNICODE);
// 		}
// 		//对比token
// 		$explode = explode('.',$token);//以.分割token为数组
// 		if(!empty($explode[0]) && !empty($explode[1]) && !empty($explode[2]) && !empty($explode[3]) )
// 		{
// 			$info = $explode[0].'.'.$explode[1].'.'.$explode[2];//信息部分
// 	        $true_signature = hash_hmac('md5',$info,'siasqr');//正确的签名
// 			if(time() > $explode[2])
// 			{
// 				$msg['code']='401';
// 	            $msg['msg']='Token已过期,请重新登录';
// 	            return json_encode($msg,JSON_UNESCAPED_UNICODE);
// 			}
// 			if ($true_signature == $explode[3])
// 			{
// 			    $msg['code']='200';
// 	            $msg['msg']='Token合法';
// 	            return json_encode($msg,JSON_UNESCAPED_UNICODE);
// 			}
// 			else
// 			{
// 			    $msg['code']='400';
// 	            $msg['msg']='Token不合法';
// 	            return json_encode($msg,JSON_UNESCAPED_UNICODE);	
// 			}
// 		}
// 		else
// 		{
//             $msg['code']='400';
//             $msg['msg']='Token不合法';
//             return json_encode($msg,JSON_UNESCAPED_UNICODE);
// 		}
		
// 	}


    header('Location:htgl2.php ');


}else{

    echo '

<!DOCTYPE HTML> 
<html>
<head>
	<meta charset="utf-8">
	<title>后台管理系统测试</title>
</head>
<body> 
<form method="post" action="loginout.php"> 
账号：<input type="text" name="username" ><br>
密码：<input type="password" name="password"><br>
<input type="submit" name="post" value="提交"> 
</form>
</body>
</html>
';

}

?>


