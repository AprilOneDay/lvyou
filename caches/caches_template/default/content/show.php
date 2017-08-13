<?php defined('IN_PHPCMS') or exit('No permission resources.'); ?><?php include template("content","header"); ?>
<div class="middlen w1000">
	<?php include template("content","list-left"); ?>
	<div class="right left">
		<div class="location">
			<img src="/images/list-ico-2.jpg">您的当前位置：<a href="<?php echo siteurl($siteid);?>">首页</a><span> > </span><?php echo catpos($catid);?>
		</div>
		<div class="content">
			<div class="srcontent">
                <h2><?php echo $title;?></h2>
                <div class="list-content-show-des">
                    <div class="list-content-show-des-content">发布时间：<?php echo date('Y-m-d',$rs['inputtime']);?> 浏览次数：<span id="hits"></span></div>
                </div>
			<?php if($allow_visitor==1) { ?>
				<?php echo $content;?>
				<!--内容关联投票-->
				<?php if($voteid) { ?><script language="javascript" src="<?php echo APP_PATH;?>index.php?m=vote&c=index&a=show&action=js&subjectid=<?php echo $voteid;?>&type=2"></script><?php } ?>
               
                <?php } else { ?>
                    <CENTER><a href="<?php echo APP_PATH;?>index.php?m=content&c=readpoint&allow_visitor=<?php echo $allow_visitor;?>"><font color="red">阅读此信息需要您支付 <B><I><?php echo $readpoint;?> <?php if($paytype) { ?>元<?php } else { ?>点<?php } ?></I></B>，点击这里支付</font></a></CENTER>
                <?php } ?>
			</div>
            <div class="preface">
                <div class="preface-left left">上一篇：<a href="<?php echo $previous_page['url'];?>"><?php echo $previous_page['title'];?></a></div>
                <div class="preface-right right">下一篇：</strong><a href="<?php echo $next_page['url'];?>"><?php echo $next_page['title'];?></a></div>
            </div>	
            <div class="clear"></div>	
		</div>
	</div>
</div>
<div class="clear"></div>
<?php include template("content","footer"); ?>