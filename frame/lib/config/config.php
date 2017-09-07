<?php
return array(
    //Cookie配置
    'cookieDomain' => '', //Cookie 作用域
    'cookiePath'   => '', //Cookie 作用路径
    'cookiePre'    => 'xYoum_', //Cookie 前缀，同一域名下安装多套系统时，请修改Cookie前缀
    'cookieTtl'    => 0, //Cookie 生命周期，0 表示随浏览器进程

    'charset'      => 'utf-8', //网站字符集
    'timezone'     => 'Etc/GMT-8', //网站时区（只对php 5.1以上版本有效），Etc/GMT-8 实际表示的是 GMT+8

    'debug'        => 0, //是否显示调试信息
    'adminLog'     => 1, //是否记录后台操作日志
    'errorLog'     => 1, //1、保存错误日志到 cache/error_log.php | 0、在页面直接显示
    'authKey'      => 'QGa9h95r9Q5dYsnpsPb9', //密钥用于可逆加密

    'appID'        => 'wx6d7a0c2f67da5c4f',
    'appSecret'    => '75b2be3d14508ea58f1e574d15d4532d',
);
