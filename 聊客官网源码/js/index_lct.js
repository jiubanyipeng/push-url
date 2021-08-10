function myBrowser() {
        var userAgent = navigator.userAgent; //取得浏览器的userAgent字符串
        var isChrome = userAgent.indexOf("Chrome") > -1; //判断是否Chrome浏览器
        var isOpera = userAgent.indexOf("Opera") > -1; //判断是否Opera浏览器
        var isIE = userAgent.indexOf("compatible") > -1 && userAgent.indexOf("MSIE") > -1 && !isOpera; //判断是否IE浏览器
        var isFF = userAgent.indexOf("Firefox") > -1; //判断是否Firefox浏览器
        var isSafari = userAgent.indexOf("Safari") > -1; //判断是否Safari浏览器

        if (isIE) {
            var IE5 = IE55 = IE6 = IE7 = IE8 = false;

            var reIE = new RegExp("MSIE (\\d+\\.\\d+);");
            reIE.test(userAgent);

            var fIEVersion = parseFloat(RegExp["$1"]);
            IE55 = fIEVersion == 5.5;
            IE6 = fIEVersion == 6.0;
            IE7 = fIEVersion == 7.0;
            IE8 = fIEVersion == 8.0;

            if (IE55) { return "IE55"; }
            else if (IE6) { return "IE6"; }
            else if (IE7) { return "IE7"; }
            else if (IE8) { return "IE8"; }
        }
        else if (isFF) { return "FF"; }
        else if (isChrome) { return "Chrome"; }
        else if (isOpera) { return "Opera"; }
        else if (isSafari) { return "Safari"; }
    }
 var myBrowserVal=myBrowser();
// zhuge.track('PC端访问的游览器', {
//  '游览器类型' :myBrowserVal
//  });
//zhuge.track('PC端访问');

function is_weixin() {
    var ua = navigator.userAgent.toLowerCase();
    if (ua.match(/MicroMessenger/i) == "micromessenger") {
        return true;
    } else {
        return false;
    }
}

function Isan(){
    if(is_weixin()){
        window.location.href="http://a.app.qq.com/o/simple.jsp?pkgname=com.esky.echat&ckey=CK1292434798497";
    } else {
        window.location.href="http://down.ipaychat.com/echat.apk";
    }
}

define(function(require, exports, module) {
    var jQuery = require('./jquery-1.12.4.min.js');
    var config = require('config.js');
    require.async(['./jquery-1.12.4.min.js', './jquery.mousewheel.min.js'], function() {
        $(function() {
            //start
            var href=window.location.href;
            console.log(href)
            var uA = navigator.userAgent;
            function isIE() { //ie?
                if (!!window.ActiveXObject || "ActiveXObject" in window) {
                    return true;
                } else {
                    return false;
                };
            };
            //window height setting
            var windowHeight = $(window).height();
            var docHeight = $(document).height();
            var htmlHeight = $('html').height();
            $('.smdl').height(4780);
            var wenzi_height = $('.section_inner').height(); //144
            var jianxi = wenzi_height; //144
            var xia_jianxi = 30; //下面的间隙
            var shang_jianxi = 30; //上面的间隙
            var tupian_height = 655;
            var yuanshi_height = jianxi + xia_jianxi + tupian_height; //设计稿中完整的高度v 829
            var dy_width = 1890; //相除的比例
            var jisuan_img_bg_size = function() {
                var windowHeight = $(window).height();
                $('.sectionpart').height(windowHeight);
                var widowsWidth = $(window).width();
//              if (windowHeight < yuanshi_height) {
//                  //小于参考比例829，背景大小就缩小
//                  var outHeight = windowHeight - jianxi - shang_jianxi - xia_jianxi; //背景高
//                  var bg_width = (outHeight / tupian_height) * dy_width; //背景宽
//                  var textbg = bg_width + 'px ' + outHeight + 'px';
//                  $('.bgimg').css("background-size", textbg);
//              } else {
                    $('.bgimg').css("background-size", '100%');
               // };
            };
            jisuan_img_bg_size();
            $(window).on('resize', jisuan_img_bg_size);
            //window height setting
            var ie = isIE();
            if (ie) {
                console.log('ie');
            } else {
                //不是ie
                var fnScroll = function() {
                    var windowHeight_scroll = $(window).height();
                    var part1 = document.getElementById('separt1');
                    var part2 = document.getElementById('separt1');
                    var part3 = document.getElementById('separt3');
                    var reat1 = part1.getBoundingClientRect();
                    var reat2 = part2.getBoundingClientRect();
                    var reat3 = part3.getBoundingClientRect();
                    var top1 = reat1.top;
                    var top2 = reat2.top;
                    var top3 = reat3.top;
                    if (top1 < 1) {
                        //添加背景属性了
                        $('.sectionpart .bgimg').addClass('bga');
                        $('#fix_out').addClass('fixedstyle').show().css({ 'color': '#fff' });
                        $('.section_inner2').hide();
                        if (reat1.bottom > 174) {
                            $('#separt1').css({ 'opacity': 1 });
                            $('#fix_out').css({ 'opacity': 1 });
                            $('#fix_out .text01').text('随机速配 缘分注定');
                            $('#fix_out .text02').text('每次速配只为遇见心仪的Ta，这里是暧昧的开始！');
                        } else {
                            //第一张bottom值是174--87 是第一段文字显示的 过了这个就是第二段文字显示
                            var bottom01 = reat1.bottom - 20;
                            if (bottom01 > 87) {
                                var op_rate = (bottom01 / 174);
                                op_rate = parseFloat(op_rate - 0.1);
                                $('#fix_out').css({ 'opacity': op_rate });
                                $('#separt1').css({ 'opacity': op_rate });
                                $('#fix_out .text01').text('随机速配 缘分注定');
                                $('#fix_out .text02').text('每次速配只为遇见心仪的Ta，这里是暧昧的开始！');
                            } else {
                                //小于87
                                $('#fix_out .text01').text('交友互动 私密话语');
                                $('#fix_out .text02').text('与心仪的Ta私密聊天，语音视频陪伴你~');
                                $('#fix_out').css({ 'color': '#e96968' })
                                if (bottom01 < 10) {
                                    $('#fix_out').css({ 'opacity': 1 });
                                } else if (bottom01 < 20) {
                                    $('#fix_out').css({ 'opacity': 0.8 });
                                } else if (bottom01 < 30) {
                                    $('#fix_out').css({ 'opacity': 0.7 });
                                } else if (bottom01 < 40) {
                                    $('#fix_out').css({ 'opacity': 0.6 });
                                } else if (bottom01 < 50) {
                                    $('#fix_out').css({ 'opacity': 0.5 });
                                } else if (bottom01 < 60) {
                                    $('#fix_out').css({ 'opacity': 0.4 });
                                } else if (bottom01 < 70) {
                                    $('#fix_out').css({ 'opacity': 0.3 });
                                } else if (bottom01 < 80) {
                                    $('#fix_out').css({ 'opacity': 0.2 });
                                };
                            };
                            if (reat3.top < 174) {
                                $('#fix_out').css({ 'color': '#e96968' });
                                var top3 = reat3.top;
                                $('#fix_out .text01').text('交友互动 私密话语');
                                $('#fix_out .text02').text('与心仪的Ta私密聊天，语音视频陪伴你~');
                                if (reat3.top < 97) {
                                    $('#fix_out').css({ 'opacity': 0.2 });
                                } else if (bottom01 < 117) {
                                    $('#fix_out').css({ 'opacity': 0.4 });
                                } else if (bottom01 < 137) {
                                    $('#fix_out').css({ 'opacity': 0.6 });
                                } else if (bottom01 < 157) {
                                    $('#fix_out').css({ 'opacity': 0.8 });
                                };
                                if (top3 < 87) {
                                    $('#fix_out').css({ 'color': '#55340d' });
                                    $('#fix_out .text01').text('交友互动 私密话语');
                                    $('#fix_out .text02').text('与心仪的Ta私密聊天，语音视频陪伴你~');
                                    if (top3 < 0) {
                                        $('#fix_out').hide();
                                        $('#separt3 .section_inner').show();
                                    } else if (top3 < 37) {
                                        $('#fix_out').css({ 'opacity': 0.9 });
                                    } else if (top3 < 47) {
                                        $('#fix_out').css({ 'opacity': 0.5 });
                                    } else if (top3 < 57) {
                                        $('#fix_out').css({ 'opacity': 0.3 });
                                    } else if (top3 < 77) {
                                        $('#fix_out').css({ 'opacity': 0.1 });
                                    };
                                };
                                if (reat3.top < 1) {
                                    $('#separt3 .bgimg').removeClass('bga');
                                };
                            };
                        };
                        if (top3 < 1) {
                            //移动到第三张的时候
                            $('#separt3 .bgimg').removeClass('bga');
                        };
                    } else {
                        //上面已经移出了
                        $('.sectionpart .bgimg').removeClass('bga');
                        $('#fix_out').hide();
                        $('.section_inner2').show();
                    };
                };
                //处理滚动部分
                $(window).on('mousewheel', function(event) {
                    fnScroll();
                });
                $(window).on('scroll', function(event) {
                    fnScroll();
                });
                //处理滚动部分
            };
            //erweima hover
            $('.erweima').hover(function() {
                $(this).find('.erweimabufen').show();
            }, function() {
                $(this).find('.erweimabufen').hide();
            });
            //erweima hover
            var part1 = document.getElementById('separt1');
            var reat1 = part1.getBoundingClientRect();
            var top1 = reat1.top;
            var height = reat1.height;
            var total1 = top1 + height;
            var scrollTopInit = $(window).scrollTop();
            //zhifu bufen
            $('.close').click(function(event) {
                /* Act on the event */
                $('.smdl').hide();
                clearInterval(terval);
            });
            $('.close2').click(function(event) {
                /* Act on the event */
                $('.smdl').hide();
                clearInterval(terval);
            });
           /* $('.a_pay').click(function(event) {
                *//* Act on the event *//*
                $('.smdl').show();
            });*/
            $('.fhdenglu').click(function(event) {
                /* Act on the event */
                $('.smdlinner').show();
                $('.smdlinner2').hide();
            });
            //zhifu bufen
            //注册人数
//          $.ajax({
//              type: "get",
//              async: false,
//              url: 'index!queryTotalNum.jhtml',
//              data: {},
//              dataType: "jsonp",
//              jsonp: "callback",
//              jsonpCallback: "totalNumCallback",
//              success: function(data) {
//                  // console.log(data);
//
//                  var dataInfo = data;
//                  if (dataInfo.resultCode == 1000) {
//                      var num = dataInfo.info.num;
//                      $('.sp1').html(num);
//
//
//                  }
//
//              },
//              error: function(error) {
//                  console.log('fail');
//              }
//          });
            //注册人数
            //end
        });

    });
});


