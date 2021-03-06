<!DOCTYPE html>
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
		<link rel="stylesheet" href="/css/index.css" />
		<link rel="stylesheet" type="text/css" href="/css/main.css">
		<style type="text/css">
			body,
			html {
				width: 100%;
				height: 100%;
				margin: 0;
				font-family: "微软雅黑";
			}
			
			#allmap {
				width: 100%;
				height:100%;
				margin:0;
				padding:0;
			}
		</style>
	
	 	<script type="text/javascript" src="/js/jquery-1.11.0.min.js"></script>
	 	<script type="text/javascript" src="/js/e-smart-zoom-jquery.min.js"></script>
	 	<script type="text/javascript" src="/js/main.js"></script>
		<title>根据关键字本地搜索</title>
	</head>

	<body>
		<header class="header">
			<h1>旅游地图导视</h1>
		</header>
		<div id="allmap">
				<div id="pageContent">
				<div id="imgContainer"> 
					<div id="imageFullScreen"/> 
						<img src="/static/images/test.jpg" id="imagesMap">
						<div id="pointerContainers">
						</div>
					</div>
				</div>
			<div id="positionButtonDiv">
			<p><span> <img id="zoomInButton" class="zoomButton" src="/assets/zoomIn.png" title="zoom in" alt="zoom in" /> <img id="zoomOutButton" class="zoomButton" src="/assets/zoomOut.png" title="zoom out" alt="zoom out" /> </span> </p>
			<p><span class="positionButtonSpan">
			<map name="positionMap" class="positionMapClass">
			<area id="topPositionMap" shape="rect" coords="20,0,40,20" title="move up" alt="move up"/>
			<area id="leftPositionMap" shape="rect" coords="0,20,20,40" title="move left" alt="move left"/>
			<area id="rightPositionMap" shape="rect" coords="40,20,60,40" title="move right" alt="move right"/>
			<area id="bottomPositionMap" shape="rect" coords="20,40,40,60" title="move bottom" alt="move bottom"/>
			</map>
			<img src="/assets/position.png" usemap="#positionMap" /> </span> </p>   
			</div>
		</div>
		</div>
		
		<div id="tab_box">
			<div class="nav">
				<ul>
					<li>旅游景点</li>
					<li>旅游景点</li>
				</ul>
			</div>
			<div class="nav">
				<ul>
					<li>特色美食</li>
					<li>特色美食</li>
				</ul>
			</div>
			<div class="nav">
				<ul>
					<li>民宿客栈</li>
					<li>民宿客栈</li>
				</ul>
			</div>			
		</div>
		
		
		<footer class="footer">
			<ul>
				<li><i class="icon1"></i>旅游景点</li>
				<li><i class="icon2"></i>特色美食</li>
				<li><i class="icon3"></i>民宿客栈</li>
				<li><i class="icon3"></i>民宿客栈</li>
			</ul>
		</footer>
		<script>
			$(function(){
				$('footer>ul>li').click(function(){
					$(this).toggleClass('active').siblings().removeClass('active');
					$('#tab_box').find('.nav').eq($(this).index()).toggleClass('show').siblings().removeClass('show');
				})
			})
		</script>
	</body>

</html>