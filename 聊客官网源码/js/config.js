/** 去掉移动端站点
var apictx = "/mobile/";

if (/Android|webOS|iPhone|Windows Phone|iPod|BlackBerry|SymbianOS/i.test(window.navigator.userAgent) && !/[\?&]pc(?:[=&].*|$)/.test(window.location.href)) {
    window.location.href = apictx;
}

function saveSessionUuid(uuid){
    var result = $.ajax({url:"recharge!saveSessionUuid.jhtml?uuid="+uuid,async:false});
}

function getSessionUuid(){
    var result = $.ajax({url:"recharge!getSessionUuid.jhtml",async:false});
    var uuid = JSON.parse(result.responseText).info.uuid;
    return uuid;
}
 */