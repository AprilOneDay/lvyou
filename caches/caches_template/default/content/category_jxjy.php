<?php defined('IN_PHPCMS') or exit('No permission resources.'); ?><?php include template("content","header"); ?>
<div class="middlen w1000">
    <div class="home-jxjy">
        <div class="row-1">
            <ul>
                <li>
                    <div class="title">最新动态</div>
                    <div class="clear"></div>
                    <?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"get\" data=\"op=get&tag_md5=acd543bbcac19b8b6ae97d353768c6eb&sql=SELECT+%2A++FROM+v9_news+where+catid+%3D+%2728%27+order+by+listorder+desc&num=1&return=data\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}pc_base::load_sys_class("get_model", "model", 0);$get_db = new get_model();$r = $get_db->sql_query("SELECT *  FROM v9_news where catid = '28' order by listorder desc LIMIT 1");while(($s = $get_db->fetch_next()) != false) {$a[] = $s;}$data = $a;unset($a);?>
                    <?php $n=1; if(is_array($data)) foreach($data AS $key => $val) { ?>
                    <div class="info left">
                        <h2><a href="<?php echo $val['url'];?>"><?php echo $val['title'];?></a></h2>
                        <p><?php echo $val['description'];?></p>
                        <div class="more"><a href="/index.php?m=content&c=index&a=lists&catid=28"> 点击更多>></a></div>
                    </div>
                    <?php $n++;}unset($n); ?>
                    <?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?>
                    <?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"get\" data=\"op=get&tag_md5=6f232a4ef65fa0beeea41056b773f410&sql=SELECT+%2A++FROM+v9_category+where+catid+%3D+%2728%27+order+by+listorder+desc&num=1&return=data\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}pc_base::load_sys_class("get_model", "model", 0);$get_db = new get_model();$r = $get_db->sql_query("SELECT *  FROM v9_category where catid = '28' order by listorder desc LIMIT 1");while(($s = $get_db->fetch_next()) != false) {$a[] = $s;}$data = $a;unset($a);?>
                    <?php $n=1; if(is_array($data)) foreach($data AS $key => $val) { ?>
                    <div class="pic left">
                        <img src="<?php echo $val['image'];?>" width="235" height="235" />
                    </div>
                    <?php $n++;}unset($n); ?>
                    <?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?>
                </li>
                <li style="margin-right: 0px;">
                    <div class="title">帮助中心</div>
                    <div class="clear"></div>
                    <?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"get\" data=\"op=get&tag_md5=d6a0702bdd0850749cd6d4427b126b6a&sql=SELECT+%2A++FROM+v9_news+where+catid+%3D+%2729%27+order+by+listorder+desc&num=1&return=data\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}pc_base::load_sys_class("get_model", "model", 0);$get_db = new get_model();$r = $get_db->sql_query("SELECT *  FROM v9_news where catid = '29' order by listorder desc LIMIT 1");while(($s = $get_db->fetch_next()) != false) {$a[] = $s;}$data = $a;unset($a);?>
                    <?php $n=1; if(is_array($data)) foreach($data AS $key => $val) { ?>
                    <div class="info left">
                        <h2><a href="<?php echo $val['url'];?>"><?php echo $val['title'];?></a></h2>
                        <p><?php echo $val['description'];?></p>
                        <div class="more"><a href="/index.php?m=content&c=index&a=lists&catid=29"> 点击更多>></a></div>
                    </div>
                    <?php $n++;}unset($n); ?>
                    <?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?>
                    <?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"get\" data=\"op=get&tag_md5=50f99b6153de442f6075398d459f55b3&sql=SELECT+%2A++FROM+v9_category+where+catid+%3D+%2729%27+order+by+listorder+desc&num=1&return=data\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}pc_base::load_sys_class("get_model", "model", 0);$get_db = new get_model();$r = $get_db->sql_query("SELECT *  FROM v9_category where catid = '29' order by listorder desc LIMIT 1");while(($s = $get_db->fetch_next()) != false) {$a[] = $s;}$data = $a;unset($a);?>
                    <?php $n=1; if(is_array($data)) foreach($data AS $key => $val) { ?>
                    <div class="pic left">
                        <img src="<?php echo $val['image'];?>" width="235" height="235" />
                    </div>
                    <?php $n++;}unset($n); ?>
                    <?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?>
                </li>
            </ul>
        </div>
        <div class="clear"></div>
        <div class="row-2">
            <ul>
                <li>
                    <?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"get\" data=\"op=get&tag_md5=b84ec1095b97f02149543b1ae53b2ea2&sql=SELECT+%2A++FROM+v9_category+where+catid+%3D+%2717%27+order+by+listorder+desc&num=1&return=data\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}pc_base::load_sys_class("get_model", "model", 0);$get_db = new get_model();$r = $get_db->sql_query("SELECT *  FROM v9_category where catid = '17' order by listorder desc LIMIT 1");while(($s = $get_db->fetch_next()) != false) {$a[] = $s;}$data = $a;unset($a);?>
                    <?php $n=1; if(is_array($data)) foreach($data AS $key => $val) { ?>
                    <div class="title"><?php echo $val['catname'];?></div>
                    <div class="clear"></div>
                    <div class="pic">
                        <a href="/index.php?m=content&c=index&a=lists&catid=30&type=1"><img src="<?php echo $val['image'];?>" width="452" height="180" /></a>
                    </div>
                    <div class="clear"></div>
                    <div class="more"><a href="/index.php?m=content&c=index&a=lists&catid=30&type=1"> 点击更多>></a></div>
                    <?php $n++;}unset($n); ?>
                    <?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?>
                </li>
                <li style="margin-right: 0px;">
                    <?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"get\" data=\"op=get&tag_md5=c8e3efaa770aa08c3a8541ebb618dfe6&sql=SELECT+%2A++FROM+v9_category+where+catid+%3D+%2718%27+order+by+listorder+desc&num=1&return=data\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}pc_base::load_sys_class("get_model", "model", 0);$get_db = new get_model();$r = $get_db->sql_query("SELECT *  FROM v9_category where catid = '18' order by listorder desc LIMIT 1");while(($s = $get_db->fetch_next()) != false) {$a[] = $s;}$data = $a;unset($a);?>
                    <?php $n=1; if(is_array($data)) foreach($data AS $key => $val) { ?>
                    <div class="title"><?php echo $val['catname'];?></div>
                    <div class="clear"></div>
                    <div class="pic">
                        <a href="/index.php?m=content&c=index&a=lists&catid=30&type=2"><img src="<?php echo $val['image'];?>" width="452" height="180" /></a>
                    </div>
                    <div class="clear"></div>
                    <div class="more"><a href="/index.php?m=content&c=index&a=lists&catid=30&type=2"> 点击更多>></a></div>
                    <?php $n++;}unset($n); ?>
                    <?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?>
                </li>
            </ul>
        </div>
    </div>
</div>
<div class="clear"></div>
<?php include template("content","footer"); ?>