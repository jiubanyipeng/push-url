function dianji(){
	alert("提示：我知道它有很多漏洞，做做实验就可以了\n请不要搞破坏以及修改，谢谢！\n "+Date());
}
function xianshi(){
	alert("提示：我知道它有很多漏洞，做做实验就可以了\n请不要搞破坏以及修改，谢谢！\n "+Date());
	cars=["a_1","a_2","a_3","a_4","a_5","a_6","a_7","a_8","a_9","a_10","a_11","a_12"];  //为了简介代码，显示全部的
	for(var i=0;i<cars.length;i++){
		var div1 = document.getElementById(cars[i]);
		div1.style.visibility="visible";
	}

}
function buyi(obj){
	obj.innerHTML = "当你来查看js文件时，我就知道你不简单，此服务器是腾讯云，里面没有什么文件，我重装系统很麻烦的，要我一个多小时呢"
}
