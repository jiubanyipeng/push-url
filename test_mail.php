<?php

if(!function_exists('fsockopen')) {
echo '系统不支持fsockopen函数,请联系空间商';

}

$fp = fsockopen('smtp.foxmail.com', 25, $errno, $errstr, 60);

if(!$fp) {
echo "联接失败了";

} else {
echo "联接成功哦";

}

?>