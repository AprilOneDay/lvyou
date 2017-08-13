<?php defined('IN_PHPCMS') or exit('No permission resources.'); ?><?php if(!isset($_GET['type'])) { ?>
	<?php include template("content","header"); ?>
	<div class="middlen w1000">
		<?php include template("content","list-left"); ?>
		<div class="right left">
			<div class="location">
				<img src="/images/list-ico-2.jpg">您的当前位置：<a href="<?php echo siteurl($siteid);?>">首页</a><span> > </span><?php echo catpos($catid);?>
			</div>
			<div class="content">
				<div class="list-kaoshi-center">
					<ul>
						<li><a href="/index.php?m=content&c=index&a=lists&catid=30&type=1">一类</a></li>
						<li><a href="/index.php?m=content&c=index&a=lists&catid=30&type=2">二类</a></li>
					</ul>
				</div>
	            <div class="clear"></div>	
	            <div class="prenext"><ul id="prenext"><?php echo $wd_pages;?></ul><div class="clear"></div></div>
			</div>
		</div>
	</div>
	<div class="clear"></div>
	<?php include template("content","footer"); ?>
<?php } else { ?>
	<?php include template("content","list_video_2"); ?>
<?php } ?>