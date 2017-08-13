<?php defined('IN_PHPCMS') or exit('No permission resources.'); ?><?php include template("content","header"); ?>
<div class="middlen w1000">
	<?php include template("content","list-left"); ?>
	<div class="right left">
		<div class="location">
			<img src="/images/list-ico-2.jpg">您的当前位置：<a href="<?php echo siteurl($siteid);?>">首页</a><span> > </span><?php echo catpos($catid);?>
		</div>
		<div class="content">
			<div class="list-kaoshi-center">
				<ul>
                    <?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"get\" data=\"op=get&tag_md5=cda8f3c07659ba98c775d17e33ec012a&sql=SELECT+%2A++FROM+cqks_kc&num=99&return=data\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}pc_base::load_sys_class("get_model", "model", 0);$get_db = new get_model();$r = $get_db->sql_query("SELECT *  FROM cqks_kc LIMIT 99");while(($s = $get_db->fetch_next()) != false) {$a[] = $s;}$data = $a;unset($a);?>
                        <?php $n=1; if(is_array($data)) foreach($data AS $key => $val) { ?>
                           <li><a href="/index.php?m=content&c=index&a=lists&catid=30&type=<?php if($catid == 17) { ?>1<?php } else { ?>2<?php } ?>&kj=<?php echo $val['mc'];?>"><?php echo $val['mc'];?></a></li>
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