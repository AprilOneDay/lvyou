<?php defined('IN_PHPCMS') or exit('No permission resources.'); ?><?php
session_start();
if(isset($_SESSION['yh'])){ $yh = array(); $yh = (array)$_SESSION['yh']; $validate = 'true';  }else{ $validate = 'false'; }
$bodyClass = $_GET['catid'] == '30' ||  $_GET['catid'] == '18'  ? 'class="validate"' : '';
if($description != '' && !isset($_GET['id']))
{
header('location:http://'.$_SERVER['HTTP_HOST'].'/index.php?m=content&c=index&a=lists&catid='.$description);
} 
?>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=8">
    <meta name="keywords" content="重庆继续医学教育,重庆继续教育,重庆医学继续教育,重庆医学继续教育学分,公共卫生,乡村医生,远程教育,华医网,医学培训,,社区卫生人员培训,农村卫生人员"/>
    <title><?php if(isset($SEO['title']) && !empty($SEO['title'])) { ?><?php echo $SEO['title'];?><?php } ?><?php echo $SEO['site_title'];?></title>
    <!--<link rel="stylesheet" type="text/css" href="css/css.css"/>
    <script type="text/jscript" src="/js/jquery-1.6.min.js"></script>
    <script type="text/javascript" src="/js/common.js"></script>-->
    <link rel="stylesheet" href="/jquery-ui/css/flick/jquery-ui-1.8.21.custom.css" />
    <link rel="stylesheet" type="text/css" href="/css/css.css"/>
    <script type="text/jscript" src="/js/jquery-1.6.min.js"></script>
    <script type="text/javascript" src="/jquery-ui/js/jquery-ui-1.8.21.custom.min.js"></script>
    <script type="text/javascript" src="/js/common.js"></script>
    <script><?php echo 'var oResponse='.@json_encode($response).',bLogin='.@json_encode($bLogin).';'; ?></script>
    <script>
        $(document).ready(function() {
            $(".cp-show li").mouseover(function(){
                $(this).find('img').attr('src','/images/cp-hover.png');
            })
            $(".cp-show li").mouseleave(function(){
                $(this).find('img').attr('src','/images/cp.png');
            })
            if($('body').hasClass('validate') && $('body').attr('hy') == 'false')
            {
                newLogin('back');
            }
        });
    </script>
</head>

<body <?php echo $bodyClass;?> hy="<?php echo $validate;?>">

<div class="top w100">
    <div class="w1000">
        <div class="toplink left"><a href="http://www.189120.com" target="_blank"> 重庆助医网</a> | <a href="http://www.cqwsjsw.gov.cn/" target="_blank">重庆市卫生和计划生育委员会</a> </div>
        <?php if(isset($_SESSION['yh'])) { ?>
        <div class="top-member right">
            会员名：欢迎 <?=$yh['xm']?> 归来  |
            <a href="/frame/index.php?m=user&c=credit&a=list_one&type=2">I类学习</a> |
            <a href="/frame/index.php?m=user&c=credit&a=list_two&type=1">II类学习</a>| <a href="/personal.php">修改信息</a> |
            <a href="javascript:;" onclick="exit()">退出登录</a>
        </div>
        <?php } else { ?>
        <div class="function right">欢迎来到重庆医学继续教育网 <a href="javascript:;" onclick="newLogin('now')">[登录]</a> <a href="/register.php">[注册]</a> </div>
        <?php } ?>
    </div>
    <div class="clear"></div>
</div>
<div class="header w100">
    <div class="w1000">
        <div class="logo left"><img src="images/logo.png"></div>
        <div class="tel left"><img src="images/header-tel.png"></div>
        <div class="search right">
            <form action="/index.php" method="get">
                <input type="text" placeholder="请输入关键字"  name="key" class="search-left left"  />
                <input type="hidden" value="content" name="m"  />
                <input type="hidden" value="index" name="c"  />
                <input type="hidden" value="lists" name="a"  />
                <input type="hidden" value="27" name="catid"  />
                <input type="submit" value="" class="search-right left">
            </form>
        </div>
    </div>
</div>
<div class="nav w100">
    <div class="nav-lemid w1000">
        <ul>
            <?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"content\" data=\"op=content&tag_md5=b43f1459ac702900c8d44c91a5e796dd&action=category&catid=0&num=25&siteid=%24siteid&order=listorder+ASC\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}$content_tag = pc_base::load_app_class("content_tag", "content");if (method_exists($content_tag, 'category')) {$data = $content_tag->category(array('catid'=>'0','siteid'=>$siteid,'order'=>'listorder ASC','limit'=>'25',));}?>
            <li><a href="<?php echo siteurl($siteid);?>">网站首页</a>|</li>
            <?php $n=1;if(is_array($data)) foreach($data AS $r) { ?>
            <li>|<a href="<?php echo $r['url'];?>"><?php echo $r['catname'];?></a></li>
            <?php $n++;}unset($n); ?>
            <?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?>
            <?php echo runhook('glogal_menu')?>
        </ul>
    </div>
</div>
<div class="banner w1000">
    <!--<img src="/images/banner.jpg">-->
    <script language='javascript'>
        linkarr = new Array();
        picarr = new Array();
        textarr = new Array();
        var swf_width=1000;
        var swf_height=125;
        //文字颜色|文字位置|文字背景颜色|文字背景透明度|按键文字颜色|按键默认颜色|按键当前颜色|自动播放时间|图片过渡效果|是否显示按钮|打开方式
        var configtg='0x000000|1|0xcccccc|5|0xffffff|0xC5DDBC|0x000033|5|3|1|_self';
        var files = "";
        var links = "";
        var texts = "";
        //这里设置调用标记


        <?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"get\" data=\"op=get&tag_md5=cb925394c995cea3fa8951685f31c20b&sql=SELECT+%2A++FROM+v9_news+where+catid+%3D+%2734%27+order+by+listorder+desc%2Cupdatetime+desc+&return=data\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}pc_base::load_sys_class("get_model", "model", 0);$get_db = new get_model();$r = $get_db->sql_query("SELECT *  FROM v9_news where catid = '34' order by listorder desc,updatetime desc  LIMIT 20");while(($s = $get_db->fetch_next()) != false) {$a[] = $s;}$data = $a;unset($a);?>
        <?php $i=0;?>
        <?php $n=1;if(is_array($data)) foreach($data AS $r) { ?>
        linkarr[<?php echo $i;?>] = "<?=$url=str_replace('&','%26',$r['url'])?>";
        picarr[<?php echo $i;?>]  = "<?=thumb($r[thumb],280,205)?>";
        textarr[<?php echo $i;?>] = "";
        <?php $i++?>
        <?php $n++;}unset($n); ?>
        <?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?>

        for(i=0;i<picarr.length;i++){
            if(files=="") files = picarr[i];
            else files += "|"+picarr[i];
        }
        for(i=0;i<linkarr.length;i++){
            if(links=="") links = linkarr[i];
            else links += "|"+linkarr[i];
        }
        for(i=0;i<textarr.length;i++){
            if(texts=="") texts = textarr[i];
            else texts += "|"+textarr[i];
        }
        document.write('<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0" width="'+ swf_width +'" height="'+ swf_height +'">');
        document.write('<param name="movie" value="/js/bcastr3.swf"><param name="quality" value="high">');
        document.write('<param name="menu" value="false"><param name=wmode value="opaque">');
        document.write('<param name="FlashVars" value="bcastr_file='+files+'&bcastr_link='+links+'&bcastr_title='+texts+'&bcastr_config='+configtg+'">');
        document.write('<embed src="/js/bcastr3.swf" wmode="opaque" FlashVars="bcastr_file='+files+'&bcastr_link='+links+'&bcastr_title='+texts+'&bcastr_config='+configtg+'&menu="false" quality="high" width="'+ swf_width +'" height="'+ swf_height +'" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />'); document.write('</object>');
    </script>
</div>