<?php defined('IN_PHPCMS') or exit('No permission resources.'); ?><?php include template("content","header"); ?>
<div class="middlen w1000">
	<div class="depot-video">
		<div class="left left">
			<div class="title">本视频库收录了数千名专家录制的具有很强学术权威性的海量多媒体医学视频</div>
			<div class="clear"></div>
			<div class="video-search">
				 <form method="get" action="/index.php?m=content&c=index&a=lists&catid=23">
					<input type="text" value="" placeholder="请输入要搜索的名称" class="key" name="key" />
                    <input type="submit" value="" class="video-search-btn"  />
                    <input type="hidden" value="content" name="m"  />
                    <input type="hidden" value="index" name="c"  />
                    <input type="hidden" value="lists" name="a"  />
                    <input type="hidden" value="23" name="catid"  />
				</form>
				<div class="clear"></div>
			</div>
			<div class="video-info">
                <?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"get\" data=\"op=get&tag_md5=cda8f3c07659ba98c775d17e33ec012a&sql=SELECT+%2A++FROM+cqks_kc&num=99&return=data\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}pc_base::load_sys_class("get_model", "model", 0);$get_db = new get_model();$r = $get_db->sql_query("SELECT *  FROM cqks_kc LIMIT 99");while(($s = $get_db->fetch_next()) != false) {$a[] = $s;}$data = $a;unset($a);?>
                <?php $n=1; if(is_array($data)) foreach($data AS $key => $val) { ?>
                <a href="/index.php?key=<?=$val['mc']?>&m=content&c=index&a=lists&catid=23"><?php echo $val['mc'];?></a>
                <?php $n++;}unset($n); ?>
                <?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?>
			</div>
			
			<div class="video-banner">
				<img src="/images/video-1.jpg" />
			</div>
			
		</div>
		<div class="right left">
			<div class="video-lemid">
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
			<div class="list-kejian">
			<div class="list-kejian-title">
				<span>热门课件</span>
			</div>
			<div class="list-kejian-content">
				<ul>
					<li><a href=""><b>·</b>新生儿疾病筛查与分子诊断2014年总结会</a></li>
					<li><a href=""><b>·</b>新生儿疾病筛查与分子诊断2014年总结会</a></li>
					<li><a href=""><b>·</b>新生儿疾病筛查与分子诊断2014年总结会</a></li>
					<li><a href=""><b>·</b>新生儿疾病筛查与分子诊断2014年总结会</a></li>
					<li><a href=""><b>·</b>新生儿疾病筛查与分子诊断2014年总结会</a></li>
					<li><a href=""><b>·</b>新生儿疾病筛查与分子诊断2014年总结会</a></li>
					<li><a href=""><b>·</b>新生儿疾病筛查与分子诊断2014年总结会</a></li>
					<li><a href=""><b>·</b>新生儿疾病筛查与分子诊断2014年总结会</a></li>	
					<li><a href=""><b>·</b>新生儿疾病筛查与分子诊断2014年总结会</a></li>
					<li><a href=""><b>·</b>新生儿疾病筛查与分子诊断2014年总结会</a></li>							
				</ul>
			</div>
		</div>
		</div> 
		<div class="clear"></div>
		<div class=""
	</div>
</div>
<div class="clear"></div>
<?php include template("content","footer"); ?>