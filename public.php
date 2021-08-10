<?php 

$servername = "localhost"; //数据库的地址
$username = "root";        //数据库的账号
$password = "aa19991104..";      //数据库的密码
$sqldb = "index_html";         // 前端显示数据库
$sqldb_1 = "mysql_log";        //  后端管理数据库

$conn =  mysqli_connect($servername, $username, $password,$sqldb);
$sqllogin = mysqli_connect($servername, $username, $password,$sqldb_1);
mysqli_query($conn,"set names utf8");// 设置编码，防止中文乱码    


$html_1 = '<!DOCTYPE html>
				<html lang="en">
				<head>
				    <meta charset="UTF-8">
				    <title>后台管理系统</title>
				</head>
				<body>';
$html_2 = '</body></html>';

$html_a1 = '<a herf="/mailserver/PHPWebAdmin/index.php">后台邮件系统</a><br>';
$html_a2 =  '<a herf="/yunpanserver/index.php">云盘系统</a>';
?>