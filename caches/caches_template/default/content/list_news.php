<?php defined('IN_PHPCMS') or exit('No permission resources.'); ?><?php include template("content","header"); ?>
<div class="middlen w1000">
	<?php include template("content","list-left"); ?>
	<div class="right left">
		<div class="location">
			<img src="/images/list-ico-2.jpg">您的当前位置：<a href="<?php echo siteurl($siteid);?>">首页</a><span> > </span><?php echo catpos($catid);?>
		</div>
		<div class="content">
			<div class="list-news">
				<ul>
                    <?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"get\" data=\"op=get&tag_md5=cb2309c67edc8f708aa9e3b54e2cb854&sql=SELECT+%2A++FROM+v9_news+where+catid+%3D+%24catid+order+by+listorder+desc%2Cinputtime+desc&num=15&cache=3600&page=%24page&return=data\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}pc_base::load_sys_class("get_model", "model", 0);$get_db = new get_model();$pagesize = 15;$page = intval($page) ? intval($page) : 1;if($page<=0){$page=1;}$offset = ($page - 1) * $pagesize;$r = $get_db->sql_query("SELECT COUNT(*) as count FROM (SELECT *  FROM v9_news where catid = $catid order by listorder desc,inputtime desc) T");$s = $get_db->fetch_next();$pages=pages($s['count'], $page, $pagesize, $urlrule);$r = $get_db->sql_query("SELECT COUNT(*) as count FROM (SELECT *  FROM v9_news where catid = $catid order by listorder desc,inputtime desc) T");$s = $get_db->fetch_next();$wd_pages=wd_pages($s['count'], $page, $pagesize, $urlrule);$r = $get_db->sql_query("SELECT *  FROM v9_news where catid = $catid order by listorder desc,inputtime desc LIMIT $offset,$pagesize");while(($s = $get_db->fetch_next()) != false) {$a[] = $s;}$data = $a;unset($a);?>
                        <?php $n=1; if(is_array($data)) foreach($data AS $key => $val) { ?>
                                <li><b style="margin-top:15px;"></b> <a href="<?php echo $val['url'];?>"><?php echo $val['title'];?></a><span>[<?php echo  date('Y-m-d',$val[updatetime])?>]</span></li>
                        <?php $n++;}unset($n); ?>
                    <?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?>
				</ul>
			</div>
            <div class="clear"></div>	
            <div class="prenext"><ul id="prenext"><?php echo $wd_pages;?></ul><div class="clear"></div></div>
		</div>
	</div>
</div>
<div class="clear"></div>
<?php include template("content","footer"); ?>