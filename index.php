<?php
/**
 *  index.php PHPCMS 入口
 *
 * @copyright            (C) 2005-2010 PHPCMS
 * @license                http://www.phpcms.cn/license/
 * @lastmodify            2010-6-1
 */
//PHPCMS根目录
if (isset($_GET['m'])) {
    define('PHPCMS_PATH', dirname(__FILE__) . DIRECTORY_SEPARATOR);
    include PHPCMS_PATH . '/phpcms/base.php';
    pc_base::creat_app();
} else {
    header('Location:frame/index.php');
}
