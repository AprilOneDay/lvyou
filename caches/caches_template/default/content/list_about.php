<?php defined('IN_PHPCMS') or exit('No permission resources.'); ?><?php include template("content","header"); ?>
<div class="middlen w1000">
	<?php include template("content","list-left"); ?>
	<div class="right left">
		<div class="location">
			<img src="/images/list-ico-2.jpg">您的当前位置：<a href="<?php echo siteurl($siteid);?>">首页</a><span> > </span><?php echo catpos($catid);?>
		</div>
		<div class="content">
			<div class="srcontent">
			<?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"get\" data=\"op=get&tag_md5=d6025b407884cb4e813b5a7ef20d2dd6&sql=SELECT+b.content++FROM+v9_news+as+a%2Cv9_news_data+as+b+where+a.id+%3D+b.id+and+catid+%3D+%24catid+order+by+a.id+desc&cache=3600&page=%24page&return=data\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}pc_base::load_sys_class("get_model", "model", 0);$get_db = new get_model();$pagesize = 20;$page = intval($page) ? intval($page) : 1;if($page<=0){$page=1;}$offset = ($page - 1) * $pagesize;$r = $get_db->sql_query("SELECT COUNT(*) as count FROM (SELECT b.content  FROM v9_news as a,v9_news_data as b where a.id = b.id and catid = $catid order by a.id desc) T");$s = $get_db->fetch_next();$pages=pages($s['count'], $page, $pagesize, $urlrule);$r = $get_db->sql_query("SELECT COUNT(*) as count FROM (SELECT b.content  FROM v9_news as a,v9_news_data as b where a.id = b.id and catid = $catid order by a.id desc) T");$s = $get_db->fetch_next();$wd_pages=wd_pages($s['count'], $page, $pagesize, $urlrule);$r = $get_db->sql_query("SELECT b.content  FROM v9_news as a,v9_news_data as b where a.id = b.id and catid = $catid order by a.id desc LIMIT $offset,$pagesize");while(($s = $get_db->fetch_next()) != false) {$a[] = $s;}$data = $a;unset($a);?>
				<?php $n=1; if(is_array($data)) foreach($data AS $key => $val) { ?>

 						<?php print_r($val[content])?>

				<?php $n++;}unset($n); ?>
			<?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?>
			</div>
		</div>
	</div>
</div>
<div class="clear"></div>
<?php include template("content","footer"); ?>