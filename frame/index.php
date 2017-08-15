<?php
defined('PATH') or define('PATH', $_SERVER['DOCUMENT_ROOT']); // 系统更目录
defined('FRAME_PATH') or define('FRAME_PATH', PATH . '/frame/'); // 框架根目录
defined('FRAME_LIB_PATH') or define('FRAME_LIB_PATH', FRAME_PATH . '/lib/'); // 框架视核心目录
defined('FRAME_LIB_CONFIG_PATH') or define('FRAME_LIB_CONFIG_PATH', FRAME_LIB_PATH . 'config/'); // 框架视核配置心目录

define('TIME', $_SERVER['REQUEST_TIME']);
define('REQUEST_METHOD', $_SERVER['REQUEST_METHOD']);
define('IS_GET', REQUEST_METHOD == 'GET' ? true : false);
define('IS_POST', REQUEST_METHOD == 'POST' ? true : false);
define('IS_PUT', REQUEST_METHOD == 'PUT' ? true : false);
define('IS_DELETE', REQUEST_METHOD == 'DELETE' ? true : false);
define('IS_AJAX', (isset($_SERVER['HTTP_X_REQUESTED_WITH']) && (strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) == 'xmlhttprequest')) || !empty($_POST['ajax']) || !empty($_GET['ajax']) ? true : false);

include FRAME_LIB_CONFIG_PATH . 'path.php'; //调用路径配置文档
include FRAME_LIB_BASE_PATH . 'function.php'; //调用公共方法

//调用页面方法
$model      = lcfirst(get('m', 'text', '')); //項目文件
$controller = ucfirst(get('c', 'text', 'Index')); //调用控制器
$action     = convertUnderline(lcfirst(get('a', 'text', 'index'))); //调用方法名

defined('MODEL') or define('MODEL', $model); // 当前文件
defined('CONTROLLER') or define('CONTROLLER', $controller); // 控制器
defined('ACTION') or define('ACTION', $action); // 方法名
defined('LOCATION') or define('LOCATION', '/frame/index.php?m=' . MODEL . '&c=' . CONTROLLER . '&a=' . ACTION);

if (class_exists($controller)) {

    $class = new $controller();
} else {
    $frameUrl = array('model' => $model, 'controller' => $controller, 'action' => $action);
    var_dump($frameUrl);
    die('控制器：' . CONTROLLER . '不存在');
}

if (!method_exists($class, ACTION)) {
    die(CONTROLLER . '控制器中' . ACTION . '方法不存在');
}

if ($action != 'index') {
    $action = $model->$action();
}
