<?php defined('IN_PHPCMS') or exit('No permission resources.'); ?><div class="left left">
		<div class="lemid">
			<div class="lemid-title">
				<span><?php echo $CATEGORYS[$top_parentid]['catname'];?></span>
			</div>
			<div class="lemid-content">
				<ul>
				<?php if($top_parentid) { ?>
		<?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"content\" data=\"op=content&tag_md5=e2d89d148c1070b6cf76db580866206c&action=category&catid=%24top_parentid&num=15&siteid=%24siteid&order=listorder+desc\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}$content_tag = pc_base::load_app_class("content_tag", "content");if (method_exists($content_tag, 'category')) {$data = $content_tag->category(array('catid'=>$top_parentid,'siteid'=>$siteid,'order'=>'listorder desc','limit'=>'15',));}?>
			<?php $n=1;if(is_array($data)) foreach($data AS $r) { ?>
				<?php if($catid == $r['catid']) { ?>
					<li class="curr"><a href="<?php echo $r['url'];?>"><img src="/images/lemid-ico.png"><?php echo $r['catname'];?></a></li>
				<?php } else { ?>
					<li><a href="<?php echo $r['url'];?>"><img src="/images/lemid-ico.png"><?php echo $r['catname'];?></a></li>
				<?php } ?>
			<?php $n++;}unset($n); ?>
			<?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?>
	<?php } ?>
					 <div class="clear"></div>
				</ul>
			</div>
			 <div class="clear"></div>
		</div>
		<div class="list-kejian">
			<div class="list-kejian-title">
				<span>热门课件</span>
			</div>
			<div class="list-kejian-content">
				<ul>
                    <?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"get\" data=\"op=get&tag_md5=06298e122cea29d191e1af3cc8710826&sql=SELECT+%2A++FROM+v9_kj+where+catid+%3D+%2730%27+order+by+listorder+desc%2Cupdatetime+desc&num=%278%27+++return%3D\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}pc_base::load_sys_class("get_model", "model", 0);$get_db = new get_model();$r = $get_db->sql_query("SELECT *  FROM v9_kj where catid = '30' order by listorder desc,updatetime desc LIMIT 20");while(($s = $get_db->fetch_next()) != false) {$a[] = $s;}$data = $a;unset($a);?>
                    <?php $n=1;if(is_array($data)) foreach($data AS $r) { ?>
					<li><a href="<?php echo $r['url'];?>"><b style="margin-top: 12px;"></b><?php echo str_cut($r[title],50,'...');?></a></li>
                    <?php $n++;}unset($n); ?>
                    <?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?>
				</ul>
			</div>
		</div>		
	</div>