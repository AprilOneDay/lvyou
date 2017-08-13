<?php defined('IN_PHPCMS') or exit('No permission resources.'); ?><?php include template("content","header"); ?>
<?php
$type = isset($_GET['type']) ? $_GET['type'] : 2;
?>
<div class="middlen w1000">
	<div class="depot-video">
		<div class="left left">
			<div class="title">本课程库收录了数千名专家录制的具有很强学术权威性的海量多媒体医学课件</div>
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
                <?PHP $videoClass = ''; if($_GET['kj'] == $val['mc']){ $videoClass = 'style="color:red;"';} ?>
                <a href="/index.php?kj=<?=$val['mc']?>&m=content&c=index&a=lists&catid=30&type=<?=$type?>" <?php echo $videoClass;?>><?php echo $val['mc'];?></a>
                <?php $n++;}unset($n); ?>
                <?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?>
			</div>

			<div class="video-product">
				<div class="video-list-th">
					<ul>
							<li><span style="width:290px;">项目名称</span><img src="/images/member-7.jpg"></li>
							<li><span style="width:104px;">项目负责人</span><img src="/images/member-7.jpg"></li>
							<li><span style="width:164px;">项目负责人单位</span><img src="/images/member-7.jpg"></li>
							<li><span style="width:131px;">时间</span></li>
					 </ul>
				</div>

				<div class="video-content">
                	<?php $i=0;$addsql = '';?>
                    <?php $addsql .= isset($_GET['key']) ? ' and a.title like \'%'.$_GET['key'].'%\'' : '';  ?>
                    <?php $addsql .= isset($_GET['kj']) ? ' and b.kj = \''.$_GET['kj'].'\'' : '';  ?>
                    <?php $addsql .= isset($_GET['type']) ? ' and a.type = \''.$_GET['type'].'\'' : '';  ?>
					<?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"get\" data=\"op=get&tag_md5=e4fe44df4e3b5d490b58437b3b87836f&sql=SELECT+a.title%2Ca.name%2Ca.place%2Ca.inputtime%2Ca.url++FROM+v9_kj+as+a%2Cv9_kj_data+as+b+where++a.id+%3D+b.id+and+a.catid+%3D+%24catid+and+a.sfxj%3D%270%27+%24addsql+order+by+a.listorder%2Cupdatetime+desc&num=15&page=%24page&return=data\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}pc_base::load_sys_class("get_model", "model", 0);$get_db = new get_model();$pagesize = 15;$page = intval($page) ? intval($page) : 1;if($page<=0){$page=1;}$offset = ($page - 1) * $pagesize;$r = $get_db->sql_query("SELECT COUNT(*) as count FROM (SELECT a.title,a.name,a.place,a.inputtime,a.url  FROM v9_kj as a,v9_kj_data as b where  a.id = b.id and a.catid = $catid and a.sfxj='0' $addsql order by a.listorder,updatetime desc) T");$s = $get_db->fetch_next();$pages=pages($s['count'], $page, $pagesize, $urlrule);$r = $get_db->sql_query("SELECT COUNT(*) as count FROM (SELECT a.title,a.name,a.place,a.inputtime,a.url  FROM v9_kj as a,v9_kj_data as b where  a.id = b.id and a.catid = $catid and a.sfxj='0' $addsql order by a.listorder,updatetime desc) T");$s = $get_db->fetch_next();$wd_pages=wd_pages($s['count'], $page, $pagesize, $urlrule);$r = $get_db->sql_query("SELECT a.title,a.name,a.place,a.inputtime,a.url  FROM v9_kj as a,v9_kj_data as b where  a.id = b.id and a.catid = $catid and a.sfxj='0' $addsql order by a.listorder,updatetime desc LIMIT $offset,$pagesize");while(($s = $get_db->fetch_next()) != false) {$a[] = $s;}$data = $a;unset($a);?>
                        <?php $n=1; if(is_array($data)) foreach($data AS $key => $val) { ?>
                         <ul <?php if($i%2 != 0 ) { ?>style="background:#f6f7f9;"<?php } ?> >
                            <li><span style="width:290px;"><a href="<?php echo $val['url'];?>" title="<?php echo $val['title'];?>"><?php echo str_cut($val[title],55,'...');?></a></span></li>
                            <li><span style="width:104px;"><?php echo $val['name'];?></span></li>
                            <li><span style="width:164px;"><?php echo $val['place'];?></span></li>
                            <li><span style="width:141px;"><?php echo  date('Y-m-d',$val[inputtime])?></span></li>
                             <div class="clear"></div>
                        </ul>
                        <div class="clear"></div>
                        <?php $i++?>
                        <?php $n++;}unset($n); ?>
                    <?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?>

                </div>

			</div>
            
            <div class="clear"></div>
            <div class="prenext"><ul id="prenext"><?php echo $wd_pages;?></ul><div class="clear"></div></div>

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
				<span>工作动态</span>
			</div>
			<div class="list-kejian-content">
				<ul>
					<?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"get\" data=\"op=get&tag_md5=d8f04132470b06aae70ed3153a3d2967&sql=SELECT+%2A++FROM+v9_news+where+catid+%3D+%2715%2C16%27+order+by+listorder+desc%2Cinputtime+desc&num=%278%27+++return%3D\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}pc_base::load_sys_class("get_model", "model", 0);$get_db = new get_model();$r = $get_db->sql_query("SELECT *  FROM v9_news where catid = '15,16' order by listorder desc,inputtime desc LIMIT 20");while(($s = $get_db->fetch_next()) != false) {$a[] = $s;}$data = $a;unset($a);?>
					<?php $n=1;if(is_array($data)) foreach($data AS $r) { ?>
					<li><a href="<?php echo $r['url'];?>"><b style="margin-top: 12px;"></b><?php echo str_cut($r[title],55,'...');?></a></li>
					<?php $n++;}unset($n); ?>
					<?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?>
				</ul>
			</div>
		</div>
		</div>
		<div class="clear"></div>
	</div>
</div>
<div class="clear"></div>
<?php include template("content","footer"); ?>
