<?php defined('IN_PHPCMS') or exit('No permission resources.'); ?>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0" />
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="format-detection" content="telephone=no">
<link rel="shortcut icon" type="image/x-icon" href="favicon.png" />
<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="0" />
<meta name="keywords" content="微景通,微信,景区,营销,智能导览,数据分析" />
<meta name="description" content="为景区移动智能提供解决方案，移动互联网时代最流行的平台微信。景区使用微景通能够让景区自己的微信公众账号为游客提供便捷智能的导览服务；实时大数据的分析结果为景区经营提供决策依据；建立景区自己的自媒体平台" />
<title>丹东旅游地图</title>
<link href="http://pwx.weijingtong.net/include/css/base.css?v=0.2" rel="stylesheet" />
<script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
<script src="http://apps.bdimg.com/libs/jquery/1.8.2/jquery.min.js" type="text/javascript" charset="utf-8"></script>
<script src="http://pwx.weijingtong.net/include/js/jquery.cookie.js" type="text/javascript" charset="utf-8"></script><script src="http://pwx.weijingtong.net/include/js/functions.js?v=1.0" type="text/javascript" charset="utf-8"></script>
<script>
$(document).ready(function(){
    ;(function(){
        //是否自动加载wx.config
        if( ! 1 ){
            return false;
        }

        //调试
        var isDebug = false;
        if( "610" == '0' ){
            isDebug = true;
        }
        wx.config({
            debug: isDebug,
            clientId: '610',
            appId: 'wx1ef49f53c35666fd',
            timestamp: 1502853830,
            nonceStr: 'ocVft4elS76o9Und',
            signature: 'ad4b8160f7c0a5edf1332b39a7654ee49ac03dec',
            jsApiList: wjt.wxJsApiList,
        });
        wjt.weixinSdkInit();

    })();
});

$(document).ready(function(){
    //如果内容没有满屏（没有把footer顶到最下面），则把footer定到最下
    ;(function(){
        function setFooterPosition(){
            var contentHeight = $(window).height() - 160;
            $('article').height('auto');

            if( $('article').outerHeight(true) < contentHeight ){
                $('article').height( contentHeight );
            }

            //$('footer').css( 'background', '#fff' ).html( document.getElementsByTagName( 'article' )[0].offsetHeight +  '/' + contentHeight + '/' + $('article').height() + '/'+$('article').outerHeight() + '/' + $(document).height()+ '/' + Math.random());
        }
        setFooterPosition();
        setTimeout(function(){
            setFooterPosition();
        }, 3000);
    })();
});
</script>
</head>
<body>


<link rel="stylesheet" href="http://pwx.weijingtong.net/include/css/base.css" media="screen" />
<link rel="stylesheet" href="http://pwx.weijingtong.net/include/css/destination/Map.css?v=2" media="screen" />
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=D01ff94377084f350f6727e7e37a6c03"></script>
<style type="text/css">
  .scenic-name{
    white-space: normal;
    font: 12px/1.5 "Helvetica Neue", Helvetica, STHeiTi, sans-serif;
  }

/*
 * playing
 */
.playing,.alert-view-open{
  -webkit-animation: 1s ease;
  -moz-animation: 1s ease;
  -ms-animation: 1s ease;
  -o-animation: 1s ease;
  animation: 1s ease;
  -webkit-animation-fill-mode: both;
  -moz-animation-fill-mode: both;
  -ms-animation-fill-mode: both;
  -o-animation-fill-mode: both;
  animation-fill-mode: both;
}
.playing {
  position: fixed;
  left: 0;
  top: -50px;
  width: 100%;
  height: 50px;
  z-index: 10;
  background: #fff;
}
.playing-on {
  -webkit-animation-name: playing-on;
  -moz-animation-name: playing-on;
  -ms-animation-name: playing-on;
  animation-name: playing-on;
  top:0px;
}
.playing-close {
  top:-50px;
  -webkit-animation-name: playing-close;
  -moz-animation-name: playing-close;
  -ms-animation-name: playing-close;
  animation-name: playing-close;
}
@-webkit-keyframes playing-on {
  from {
    opacity: 0;
    top:-50px;
  }
  to {
    opacity: 1;
    top:0px;
  }
}
@-webkit-keyframes playing-close {
  from {
    opacity: 1;
    top:0px;
  }
  to {
    opacity: 0;
    top:-50px;
  }
}
.playing .mic,
.playing .map {
  width: 50px;
  border-left: #d2d2d2 1px solid;
}
.playing .mic a,
.playing .map a {
  display: block;
}
.playing .mic span,
.playing .map span {
  width: 50px;
  height: 50px;
  display: block;
  background: url(../../images/system/map/icon_01.png) no-repeat;
  background-size: 20px 296px;
}
.playing .mic span {
  background-position: 15px 17px;
}
.playing .map span {
  background-position: 15px -92px;
}
.playing .but {
  border-left: #d2d2d2 1px solid;
  width: 68px;
  height: 53px;
}
.playing .but span{
  display: block;
  width: 68px;
  height: 50px;
}
.playing .but span.stop {

  background: url(../../../include/images/system/voicealbum/voicea_icon_06.png) center center no-repeat;
  background-size: 40px 40px;
}
.playing .but span.start{
  background: url(../../../include/images/system/voicealbum/voicea_icon_06.gif) center center no-repeat;
  background-size: 40px 40px;
}
.playing .title {
  font-size: 15px;
  color: #4a4d54;
  line-height: 15px;
}
.playing .title p {
  text-indent: 10px;
  padding-top: 8px;
}
.playing .title p span {
  color: #aaa;
  font-size: 12px;
}
.tabbar .location{
  position: absolute;
  left: 10px;
  bottom: 60px;
  width: 40px;
  height: 40px;
  background: rgba(255,255,255,0.8);
  -moz-box-shadow:0px 0px 5px #828282;
  -webkit-box-shadow:0px 0px 5px #828282;
  box-shadow:0px 0px 5px #828282;
}
.tabbar .location a{
  display: block;
  width: 100%;
  height: 100%;
  position: relative;
}
.tabbar .location a span{
  position: absolute;
  left: 50%;
  top: 50%;
  margin: -13px 0 0 -13px;
  width: 25px;
  height: 25px;
  border: #71b9f8 1px solid;
}
.tabbar .location a span em{
  position: absolute;
  left: 50%;
  top: 50%;
  margin: -7px 0 0 -7px;
  width: 14px;
  height: 14px;
  background: #198cf6;
}
</style>

<article class="w640">
  <section class="map-container" >
    <div class="map">
      <!--<img width="100%" src="http://pwx.weijingtong.net/include/images/60.jpg"/>-->
      <div id="allmap" style="width:100%;min-height:568px;margin: ;">

      </div>

      <div class="alert-view-one fn-hide">
        <div class="view box-zoom">
          <div class="title" id="info-box">
            <h2 id="marker-name-title">停车场</h2>
            <p id="marker-content">这是一个很美味的餐厅！</p>
          </div>
          <div class="pic" id="image-box">
            <img src="http://file.weijingtong.net/uploades/images/Destination/222/20150312/1426130913_861951.jpg_100x100.jpg" id="image-destination"/>
            <p><span id="marker-name">停车场</span></p>
          </div>
          <div class="but">
            <ul class="box box-flex">
              <li class="box-flex" id="play-audio-click">
                <a href="javascript:;">
                  <div class="box box-align box-flex" >
                    <p><i class="pos-yy" style="background-position: 0 -34px;"></i></p>
                    <p>语音解说</p>
                  </div>
                </a>
              </li>
              <li class="box-flex" id="view-map">
                <a href="javascript:;">
                  <div class="box box-align box-flex" >
                    <p><i class="pos-des" style="background-position: 0 -108px;"></i></p>
                    <p>景区地图</p>
                  </div>
                </a>
              </li>
              <li class="box-flex" id="view-detail">
                <a href="javascript:;">
                  <div class="box box-align box-flex" >
                    <p><i class="pos-des"></i></p>
                    <p  id="view-detail-lang">景区详情</p>
                  </div>
                </a>
              </li>
              <li class="box-flex" id="go-to-here">
                <a href="javascript:;">
                  <div class="box box-align box-flex" >
                    <p><i class="pos-nav"></i></p>
                    <p>到这里去</p>
                  </div>
                </a>
              </li>

            </ul>
          </div>
        </div>
      </div>

    </div>
  </section>
  <section class="tabbar">

        <div class="location b-radius-3">
            <a href="javascript:;" id="my-location-but">
                <span class="b-radius-50">
                    <em class="b-radius-50"></em>
                </span>
            </a>
        </div>

    <ul class="box box-flex box-align">
                <li style="width:33.333333333333%">
                                                  <input  class="marker" type="hidden" marker-id = "2239" locationx = "124.83534241" locationy = "40.41957855" qq-locationx = "124.82886844867" qq-locationy = "40.413561918203" logo="http://file.weijingtong.net/uploades/images/map_icon_02.png" data-name="河口断桥" data-type="1" object-id="307"  data-content="" />
                          <input  class="marker" type="hidden" marker-id = "2238" locationx = "124.44582367" locationy = "40.16358948" qq-locationx = "124.43945922107" qq-locationy = "40.157221286301" logo="http://file.weijingtong.net/uploades/images/map_icon_02.png" data-name="丹东“志愿军过江浮桥遗址" data-type="1" object-id="306"  data-content="" />
                          <input  class="marker" type="hidden" marker-id = "2235" locationx = "124.88838959" locationy = "40.93414307" qq-locationx = "124.88183114135" qq-locationy = "40.928294852122" logo="http://file.weijingtong.net/uploades/images/map_icon_02.png" data-name="白石砬子自然保护区" data-type="1" object-id="299"  data-content="" />
                          <input  class="marker" type="hidden" marker-id = "2230" locationx = "124.63258362" locationy = "40.32509995" qq-locationx = "124.62596964346" qq-locationy = "40.319455309945" logo="http://file.weijingtong.net/uploades/images/map_icon_02.png" data-name="大缸山" data-type="1" object-id="304"  data-content="" />
                          <input  class="marker" type="hidden" marker-id = "2229" locationx = "124.64566040" locationy = "40.47917557" qq-locationx = "124.6390763677" qq-locationy = "40.473370487336" logo="http://file.weijingtong.net/uploades/images/map_icon_02.png" data-name="辽东学院金光大道" data-type="1" object-id="292"  data-content="" />
                          <input  class="marker" type="hidden" marker-id = "2228" locationx = "124.38929749" locationy = "40.13635254" qq-locationx = "124.38266917655" qq-locationy = "40.130718720521" logo="http://file.weijingtong.net/uploades/images/map_icon_02.png" data-name="丹东百年银杏老街" data-type="1" object-id="291"  data-content="" />
                          <input  class="marker" type="hidden" marker-id = "2227" locationx = "124.16329193" locationy = "40.06917953" qq-locationx = "124.15672995759" qq-locationy = "40.06342180929" logo="http://file.weijingtong.net/uploades/images/map_icon_02.png" data-name="铁甲水库风景区" data-type="1" object-id="275"  data-content="" />
                          <input  class="marker" type="hidden" marker-id = "2226" locationx = "123.92107391" locationy = "40.17461777" qq-locationx = "123.91450579505" qq-locationy = "40.168892582205" logo="http://file.weijingtong.net/uploades/images/map_icon_02.png" data-name="玉龙湖风景名胜区" data-type="1" object-id="280"  data-content="" />
                          <input  class="marker" type="hidden" marker-id = "2225" locationx = "123.59650421" locationy = "39.79312134" qq-locationx = "123.59011452803" qq-locationy = "39.786802435415" logo="http://file.weijingtong.net/uploades/images/map_icon_02.png" data-name="小岛" data-type="1" object-id="297"  data-content="" />
                          <input  class="marker" type="hidden" marker-id = "2224" locationx = "124.62279510" locationy = "40.67813873" qq-locationx = "124.61618297857" qq-locationy = "40.672508049268" logo="http://file.weijingtong.net/uploades/images/map_icon_02.png" data-name="鸿运谷漂流" data-type="1" object-id="282"  data-content="" />
                          <input  class="marker" type="hidden" marker-id = "2221" locationx = "123.89288330" locationy = "40.63652039" qq-locationx = "123.88630104492" qq-locationy = "40.630804783837" logo="http://file.weijingtong.net/uploades/images/map_icon_02.png" data-name="奇石峡漂流" data-type="1" object-id="281"  data-content="" />
                          <input  class="marker" type="hidden" marker-id = "2219" locationx = "124.51499176" locationy = "40.21663666" qq-locationx = "124.50837279647" qq-locationy = "40.210970618811" logo="http://file.weijingtong.net/uploades/images/map_icon_02.png" data-name="太阳岛滑雪" data-type="1" object-id="285"  data-content="" />
                          <input  class="marker" type="hidden" marker-id = "2218" locationx = "124.64726257" locationy = "41.07150650" qq-locationx = "124.64068680735" qq-locationy = "41.065674299686" logo="http://file.weijingtong.net/uploades/images/map_icon_02.png" data-name="天桥沟滑雪场" data-type="1" object-id="283"  data-content="" />
                          <input  class="marker" type="hidden" marker-id = "2216" locationx = "124.34107208" locationy = "40.25935745" qq-locationx = "124.33465287636" qq-locationy = "40.253085753937" logo="http://file.weijingtong.net/uploades/images/map_icon_02.png" data-name="五龙山风景区" data-type="1" object-id="254"  data-content="" />
                          <input  class="marker" type="hidden" marker-id = "2214" locationx = "123.70310211" locationy = "40.14551163" qq-locationx = "123.69664242638" qq-locationy = "40.139385731382" logo="http://file.weijingtong.net/uploades/images/map_icon_02.png" data-name="金沙谷" data-type="1" object-id="293"  data-content="" />
                          <input  class="marker" type="hidden" marker-id = "2213" locationx = "124.36289215" locationy = "39.99904633" qq-locationx = "124.35633394145" qq-locationy = "39.993162829731" logo="http://file.weijingtong.net/uploades/images/map_icon_02.png" data-name="丹东滨江水上乐园" data-type="1" object-id="286"  data-content="" />
                          <input  class="marker" type="hidden" marker-id = "2212" locationx = "123.97402954" locationy = "40.41016388" qq-locationx = "123.96765958797" qq-locationy = "40.403826417663" logo="http://file.weijingtong.net/uploades/images/map_icon_02.png" data-name="大梨树国家生态旅游区" data-type="1" object-id="277"  data-content="" />
                          <input  class="marker" type="hidden" marker-id = "2211" locationx = "124.09243011" locationy = "40.42905807" qq-locationx = "124.08606032176" qq-locationy = "40.422708415478" logo="http://file.weijingtong.net/uploades/images/map_icon_02.png" data-name="凤凰山国家风景名胜区" data-type="1" object-id="276"  data-content="" />
                          <input  class="marker" type="hidden" marker-id = "2209" locationx = "124.31173706" locationy = "40.42527771" qq-locationx = "124.305340679" qq-locationy = "40.419016235012" logo="http://file.weijingtong.net/uploades/images/map_icon_02.png" data-name="东汤御圣泉温泉度假区" data-type="1" object-id="287"  data-content="" />
                          <input  class="marker" type="hidden" marker-id = "2201" locationx = "123.82569122" locationy = "39.79753113" qq-locationx = "123.81925728747" qq-locationy = "39.791362660611" logo="http://file.weijingtong.net/uploades/images/map_icon_02.png" data-name="獐岛度假区" data-type="1" object-id="273"  data-content="" />
                          <input  class="marker" type="hidden" marker-id = "2200" locationx = "124.09398651" locationy = "39.83882141" qq-locationx = "124.0876039343" qq-locationy = "39.832479627554" logo="http://file.weijingtong.net/uploades/images/map_icon_02.png" data-name="鸭绿江湿地国家级自然保护区" data-type="1" object-id="272"  data-content="" />
                          <input  class="marker" type="hidden" marker-id = "2199" locationx = "124.37154388" locationy = "40.12344742" qq-locationx = "124.36494097719" qq-locationy = "40.117706164329" logo="http://file.weijingtong.net/uploades/images/map_icon_02.png" data-name="抗美援朝纪念馆" data-type="1" object-id="251"  data-content="" />
                          <input  class="marker" type="hidden" marker-id = "2198" locationx = "124.38761139" locationy = "40.13762283" qq-locationx = "124.38098311477" qq-locationy = "40.131992733337" logo="http://file.weijingtong.net/uploades/images/map_icon_02.png" data-name="锦江山公园" data-type="1" object-id="250"  data-content="" />
                          <input  class="marker" type="hidden" marker-id = "2197" locationx = "124.40039825" locationy = "40.12422562" qq-locationx = "124.3937910847" qq-locationy = "40.118498696096" logo="http://file.weijingtong.net/uploades/images/map_icon_02.png" data-name="鸭绿江断桥" data-type="1" object-id="296"  data-content="" />
                          <input  class="marker" type="hidden" marker-id = "2196" locationx = "123.74047089" locationy = "39.76266479" qq-locationx = "123.73404175254" qq-locationy = "39.756382805562" logo="http://file.weijingtong.net/uploades/images/map_icon_02.png" data-name="大鹿岛旅游度假区" data-type="1" object-id="271"  data-content="" />
                          <input  class="marker" type="hidden" marker-id = "2195" locationx = "123.59591675" locationy = "39.88478088" qq-locationx = "123.58950142575" qq-locationy = "39.878460091602" logo="http://file.weijingtong.net/uploades/images/map_icon_02.png" data-name="大孤山古建筑群" data-type="1" object-id="274"  data-content="" />
                        <a href="javascript:void(0)" class="parent-menu bar box box-align"><i class="icons-1"></i>景区导览</a>
          </li>
                <li style="width:33.333333333333%">
                                                    <div class="meun fn-hide">
                                    <p class="text-ellipsis">
                                            <a href="javascript:;" class="son-menu" data-id = "1619" >高速公路口</a>
                                                                                            <input  class="marker" type="hidden" marker-id = "2274" locationx = "123.51238251" locationy = "40.01734924" qq-locationx = "123.50589986185" qq-locationy = "40.011267279541"  logo="http://file.weijingtong.net/uploades/images/map_icon_02.png" data-name="丹大高速西土城出入口"  data-type="4" object-id="0" data-content="丹东、大连方向"/>
                                                <input  class="marker" type="hidden" marker-id = "2274" locationx = "123.51238251" locationy = "40.01734924" qq-locationx = "123.50589986185" qq-locationy = "40.011267279541"  logo="http://file.weijingtong.net/uploades/images/map_icon_05.png" data-name="丹大高速西土城出入口"  data-type="4" object-id="0" data-content="丹东、大连方向"/>
                                                                                            <input  class="marker" type="hidden" marker-id = "2273" locationx = "124.28167725" locationy = "40.07630920" qq-locationx = "124.27510228967" qq-locationy = "40.070573351701"  logo="http://file.weijingtong.net/uploades/images/map_icon_02.png" data-name="丹大高速丹东西出入口"  data-type="4" object-id="0" data-content="附近：浪头机场"/>
                                                <input  class="marker" type="hidden" marker-id = "2273" locationx = "124.28167725" locationy = "40.07630920" qq-locationx = "124.27510228967" qq-locationy = "40.070573351701"  logo="http://file.weijingtong.net/uploades/images/map_icon_05.png" data-name="丹大高速丹东西出入口"  data-type="4" object-id="0" data-content="附近：浪头机场"/>
                                                                                            <input  class="marker" type="hidden" marker-id = "2272" locationx = "123.60069275" locationy = "39.93804932" qq-locationx = "123.5943259721" qq-locationy = "39.93170165968"  logo="http://file.weijingtong.net/uploades/images/map_icon_02.png" data-name="丹大高速大孤山互通出入口"  data-type="4" object-id="0" data-content="附近景区：大孤山、金沙谷"/>
                                                <input  class="marker" type="hidden" marker-id = "2272" locationx = "123.60069275" locationy = "39.93804932" qq-locationx = "123.5943259721" qq-locationy = "39.93170165968"  logo="http://file.weijingtong.net/uploades/images/map_icon_05.png" data-name="丹大高速大孤山互通出入口"  data-type="4" object-id="0" data-content="附近景区：大孤山、金沙谷"/>
                                                                                            <input  class="marker" type="hidden" marker-id = "2271" locationx = "123.92792511" locationy = "40.77979279" qq-locationx = "123.92139064132" qq-locationy = "40.773960281228"  logo="http://file.weijingtong.net/uploades/images/map_icon_02.png" data-name="沈丹高速通远堡互通出入口"  data-type="4" object-id="0" data-content="沈阳丹东方向、"/>
                                                <input  class="marker" type="hidden" marker-id = "2271" locationx = "123.92792511" locationy = "40.77979279" qq-locationx = "123.92139064132" qq-locationy = "40.773960281228"  logo="http://file.weijingtong.net/uploades/images/map_icon_05.png" data-name="沈丹高速通远堡互通出入口"  data-type="4" object-id="0" data-content="沈阳丹东方向、"/>
                                                                                            <input  class="marker" type="hidden" marker-id = "2270" locationx = "124.00337982" locationy = "40.67444992" qq-locationx = "123.99684761972" qq-locationy = "40.668584585388"  logo="http://file.weijingtong.net/uploades/images/map_icon_02.png" data-name="沈丹高速刘家河互通出入口"  data-type="4" object-id="0" data-content="附近景区：奇石峡漂流"/>
                                                <input  class="marker" type="hidden" marker-id = "2270" locationx = "124.00337982" locationy = "40.67444992" qq-locationx = "123.99684761972" qq-locationy = "40.668584585388"  logo="http://file.weijingtong.net/uploades/images/map_icon_05.png" data-name="沈丹高速刘家河互通出入口"  data-type="4" object-id="0" data-content="附近景区：奇石峡漂流"/>
                                                                                            <input  class="marker" type="hidden" marker-id = "2268" locationx = "125.01511383" locationy = "40.97612381" qq-locationx = "125.00859552127" qq-locationy = "40.970147926013"  logo="http://file.weijingtong.net/uploades/images/map_icon_02.png" data-name="鹤大高速牛毛坞互通出入口"  data-type="4" object-id="0" data-content="附近景区：天桥沟、天华山"/>
                                                <input  class="marker" type="hidden" marker-id = "2268" locationx = "125.01511383" locationy = "40.97612381" qq-locationx = "125.00859552127" qq-locationy = "40.970147926013"  logo="http://file.weijingtong.net/uploades/images/map_icon_05.png" data-name="鹤大高速牛毛坞互通出入口"  data-type="4" object-id="0" data-content="附近景区：天桥沟、天华山"/>
                                                                                            <input  class="marker" type="hidden" marker-id = "2266" locationx = "124.87849426" locationy = "40.87692261" qq-locationx = "124.87190532985" qq-locationy = "40.871229113955"  logo="http://file.weijingtong.net/uploades/images/map_icon_02.png" data-name="鹤大高速白石砬子互通出入口"  data-type="4" object-id="0" data-content="距离白石砬子、天罡山最近的出入口"/>
                                                <input  class="marker" type="hidden" marker-id = "2266" locationx = "124.87849426" locationy = "40.87692261" qq-locationx = "124.87190532985" qq-locationy = "40.871229113955"  logo="http://file.weijingtong.net/uploades/images/map_icon_05.png" data-name="鹤大高速白石砬子互通出入口"  data-type="4" object-id="0" data-content="距离白石砬子、天罡山最近的出入口"/>
                                                                                            <input  class="marker" type="hidden" marker-id = "2265" locationx = "125.11192322" locationy = "41.04576492" qq-locationx = "125.10530526455" qq-locationy = "41.040125282833"  logo="http://file.weijingtong.net/uploades/images/map_icon_02.png" data-name="鹤大高速青山沟互通出入口"  data-type="4" object-id="0" data-content="距离青山沟最近的出入口"/>
                                                <input  class="marker" type="hidden" marker-id = "2265" locationx = "125.11192322" locationy = "41.04576492" qq-locationx = "125.10530526455" qq-locationy = "41.040125282833"  logo="http://file.weijingtong.net/uploades/images/map_icon_05.png" data-name="鹤大高速青山沟互通出入口"  data-type="4" object-id="0" data-content="距离青山沟最近的出入口"/>
                                                                                            <input  class="marker" type="hidden" marker-id = "2264" locationx = "124.74696350" locationy = "40.74211502" qq-locationx = "124.74033748635" qq-locationy = "40.736487876742"  logo="http://file.weijingtong.net/uploades/images/map_icon_02.png" data-name="鹤大高速宽甸互通出入口"  data-type="4" object-id="0" data-content="距离宽甸最近的出入口"/>
                                                <input  class="marker" type="hidden" marker-id = "2264" locationx = "124.74696350" locationy = "40.74211502" qq-locationx = "124.74033748635" qq-locationy = "40.736487876742"  logo="http://file.weijingtong.net/uploades/images/map_icon_05.png" data-name="鹤大高速宽甸互通出入口"  data-type="4" object-id="0" data-content="距离宽甸最近的出入口"/>
                                                                                            <input  class="marker" type="hidden" marker-id = "2261" locationx = "124.66419983" locationy = "40.69744492" qq-locationx = "124.65773699952" qq-locationy = "40.691294699037"  logo="http://file.weijingtong.net/uploades/images/map_icon_02.png" data-name="鹤大高速宽甸南互通出入口"  data-type="4" object-id="0" data-content="距离宽甸青椅山最近的高速口<br />附近景区：鸿运谷漂流"/>
                                                <input  class="marker" type="hidden" marker-id = "2261" locationx = "124.66419983" locationy = "40.69744492" qq-locationx = "124.65773699952" qq-locationy = "40.691294699037"  logo="http://file.weijingtong.net/uploades/images/map_icon_05.png" data-name="鹤大高速宽甸南互通出入口"  data-type="4" object-id="0" data-content="距离宽甸青椅山最近的高速口<br />附近景区：鸿运谷漂流"/>
                                                                                            <input  class="marker" type="hidden" marker-id = "2259" locationx = "124.34317780" locationy = "40.17096710" qq-locationx = "124.33677357324" qq-locationy = "40.164733435909"  logo="http://file.weijingtong.net/uploades/images/map_icon_02.png" data-name="鹤大、沈丹高速互通丹东花园高速口"  data-type="2" object-id="0" data-content="距离丹东市内最近的高速口"/>
                                                <input  class="marker" type="hidden" marker-id = "2259" locationx = "124.34317780" locationy = "40.17096710" qq-locationx = "124.33677357324" qq-locationy = "40.164733435909"  logo="http://file.weijingtong.net" data-name="鹤大、沈丹高速互通丹东花园高速口"  data-type="2" object-id="0" data-content="距离丹东市内最近的高速口"/>
                                                                                            <input  class="marker" type="hidden" marker-id = "2258" locationx = "124.38128662" locationy = "40.30804443" qq-locationx = "124.37468555636" qq-locationy = "40.302408718175"  logo="http://file.weijingtong.net/uploades/images/map_icon_02.png" data-name="鹤大高速五龙山互通"  data-type="2" object-id="0" data-content="鹤大高速，国家高速公路网编号为G11，起点在黑龙江省鹤岗市，途经佳木斯、七台河、鸡西、牡丹江、敦化、白山、通化、丹东，终点在辽宁省大连市<br />附近景区：五龙高尔夫滑雪场"/>
                                                <input  class="marker" type="hidden" marker-id = "2258" locationx = "124.38128662" locationy = "40.30804443" qq-locationx = "124.37468555636" qq-locationy = "40.302408718175"  logo="http://file.weijingtong.net" data-name="鹤大高速五龙山互通"  data-type="2" object-id="0" data-content="鹤大高速，国家高速公路网编号为G11，起点在黑龙江省鹤岗市，途经佳木斯、七台河、鸡西、牡丹江、敦化、白山、通化、丹东，终点在辽宁省大连市<br />附近景区：五龙高尔夫滑雪场"/>
                                                                                            <input  class="marker" type="hidden" marker-id = "2257" locationx = "124.41657257" locationy = "40.37227249" qq-locationx = "124.41006050381" qq-locationy = "40.366267007505"  logo="http://file.weijingtong.net/uploades/images/map_icon_02.png" data-name="鹤大高速土城子入口"  data-type="2" object-id="0" data-content="鹤大高速，国家高速公路网编号为G11，起点在黑龙江省鹤岗市，途经佳木斯、七台河、鸡西、牡丹江、敦化、白山、通化、丹东，终点在辽宁省大连市<br />附近景区：东汤温泉"/>
                                                <input  class="marker" type="hidden" marker-id = "2257" locationx = "124.41657257" locationy = "40.37227249" qq-locationx = "124.41006050381" qq-locationy = "40.366267007505"  logo="http://file.weijingtong.net" data-name="鹤大高速土城子入口"  data-type="2" object-id="0" data-content="鹤大高速，国家高速公路网编号为G11，起点在黑龙江省鹤岗市，途经佳木斯、七台河、鸡西、牡丹江、敦化、白山、通化、丹东，终点在辽宁省大连市<br />附近景区：东汤温泉"/>
                                                                                            <input  class="marker" type="hidden" marker-id = "2256" locationx = "124.56117249" locationy = "40.60671997" qq-locationx = "124.55477348577" qq-locationy = "40.600355502271"  logo="http://file.weijingtong.net/uploades/images/map_icon_02.png" data-name="鹤大高速公路毛甸子互通入口"  data-type="2" object-id="0" data-content="鹤大高速，国家高速公路网编号为G11，起点在黑龙江省鹤岗市，途经佳木斯、七台河、鸡西、牡丹江、敦化、白山、通化、丹东，终点在辽宁省大连市"/>
                                                <input  class="marker" type="hidden" marker-id = "2256" locationx = "124.56117249" locationy = "40.60671997" qq-locationx = "124.55477348577" qq-locationy = "40.600355502271"  logo="http://file.weijingtong.net" data-name="鹤大高速公路毛甸子互通入口"  data-type="2" object-id="0" data-content="鹤大高速，国家高速公路网编号为G11，起点在黑龙江省鹤岗市，途经佳木斯、七台河、鸡西、牡丹江、敦化、白山、通化、丹东，终点在辽宁省大连市"/>
                                                                                            <input  class="marker" type="hidden" marker-id = "2255" locationx = "124.34515381" locationy = "40.21367645" qq-locationx = "124.33871388417" qq-locationy = "40.207465246606"  logo="http://file.weijingtong.net/uploades/images/map_icon_02.png" data-name="鹤大高速公路丹东北互通入口"  data-type="2" object-id="0" data-content="鹤大高速，国家高速公路网编号为G11，起点在黑龙江省鹤岗市，途经佳木斯、七台河、鸡西、牡丹江、敦化、白山、通化、丹东，终点在辽宁省大连市"/>
                                                <input  class="marker" type="hidden" marker-id = "2255" locationx = "124.34515381" locationy = "40.21367645" qq-locationx = "124.33871388417" qq-locationy = "40.207465246606"  logo="http://file.weijingtong.net" data-name="鹤大高速公路丹东北互通入口"  data-type="2" object-id="0" data-content="鹤大高速，国家高速公路网编号为G11，起点在黑龙江省鹤岗市，途经佳木斯、七台河、鸡西、牡丹江、敦化、白山、通化、丹东，终点在辽宁省大连市"/>
                                                                                            <input  class="marker" type="hidden" marker-id = "2254" locationx = "124.07901764" locationy = "39.96119690" qq-locationx = "124.07263316057" qq-locationy = "39.954854409815"  logo="http://file.weijingtong.net/uploades/images/map_icon_02.png" data-name="丹大高速公路入口"  data-type="2" object-id="0" data-content="丹东、大连，途径庄河"/>
                                                <input  class="marker" type="hidden" marker-id = "2254" locationx = "124.07901764" locationy = "39.96119690" qq-locationx = "124.07263316057" qq-locationy = "39.954854409815"  logo="http://file.weijingtong.net" data-name="丹大高速公路入口"  data-type="2" object-id="0" data-content="丹东、大连，途径庄河"/>
                                                                                            <input  class="marker" type="hidden" marker-id = "2253" locationx = "124.23812866" locationy = "40.23248672" qq-locationx = "124.23159967501" qq-locationy = "40.226512406425"  logo="http://file.weijingtong.net/uploades/images/map_icon_02.png" data-name="沈丹高速公路入口"  data-type="2" object-id="0" data-content="沈丹高速公路编号G1113，全长222公里，连接沈阳市、本溪市、丹东市三个地级市及沈阳桃仙国际机场。"/>
                                                <input  class="marker" type="hidden" marker-id = "2253" locationx = "124.23812866" locationy = "40.23248672" qq-locationx = "124.23159967501" qq-locationy = "40.226512406425"  logo="http://file.weijingtong.net" data-name="沈丹高速公路入口"  data-type="2" object-id="0" data-content="沈丹高速公路编号G1113，全长222公里，连接沈阳市、本溪市、丹东市三个地级市及沈阳桃仙国际机场。"/>
                                                                                            <input  class="marker" type="hidden" marker-id = "2252" locationx = "123.90714264" locationy = "39.93965149" qq-locationx = "123.90054159514" qq-locationy = "39.934029004888"  logo="http://file.weijingtong.net/uploades/images/map_icon_02.png" data-name="丹大高速公路入口"  data-type="2" object-id="0" data-content="丹东、大连，途径庄河"/>
                                                <input  class="marker" type="hidden" marker-id = "2252" locationx = "123.90714264" locationy = "39.93965149" qq-locationx = "123.90054159514" qq-locationy = "39.934029004888"  logo="http://file.weijingtong.net" data-name="丹大高速公路入口"  data-type="2" object-id="0" data-content="丹东、大连，途径庄河"/>
                                                                                            <input  class="marker" type="hidden" marker-id = "2251" locationx = "124.03892517" locationy = "40.42227173" qq-locationx = "124.03234668779" qq-locationy = "40.416573685066"  logo="http://file.weijingtong.net/uploades/images/map_icon_02.png" data-name="丹阜高速公路入口"  data-type="2" object-id="0" data-content="起点在丹东口岸，途经凤城、本溪、沈阳、新民、黑山至阜新。"/>
                                                <input  class="marker" type="hidden" marker-id = "2251" locationx = "124.03892517" locationy = "40.42227173" qq-locationx = "124.03234668779" qq-locationy = "40.416573685066"  logo="http://file.weijingtong.net" data-name="丹阜高速公路入口"  data-type="2" object-id="0" data-content="起点在丹东口岸，途经凤城、本溪、沈阳、新民、黑山至阜新。"/>
                                                                                    </p><p class="text-ellipsis">
                                            <a href="javascript:;" class="son-menu" data-id = "1619" >火车站</a>
                                                                                            <input  class="marker" type="hidden" marker-id = "2433" locationx = "124.39475250" locationy = "40.13020325" qq-locationx = "124.38812918174" qq-locationy = "40.124537597523"  logo="http://file.weijingtong.net/uploades/images/map_icon_02.png" data-name="丹东站"  data-type="4" object-id="0" data-content="主要发车目的地：<br />普快：<br />齐齐哈尔、北京、满洲里、沈阳、通化<br />快速<br />北京、赤峰、龙井、锦州<br />动车组：<br />沈阳、沈阳北、延吉西<br />高铁<br />上海虹桥、北京南、哈尔滨西、吉林、大连北<br />并可以办理托运业务。<br />具体发车时间及票价，请在底部菜单“出游助手”中的“火车查询”中查看详情"/>
                                                <input  class="marker" type="hidden" marker-id = "2433" locationx = "124.39475250" locationy = "40.13020325" qq-locationx = "124.38812918174" qq-locationy = "40.124537597523"  logo="http://file.weijingtong.net/uploades/images/map_icon_05.png" data-name="丹东站"  data-type="4" object-id="0" data-content="主要发车目的地：<br />普快：<br />齐齐哈尔、北京、满洲里、沈阳、通化<br />快速<br />北京、赤峰、龙井、锦州<br />动车组：<br />沈阳、沈阳北、延吉西<br />高铁<br />上海虹桥、北京南、哈尔滨西、吉林、大连北<br />并可以办理托运业务。<br />具体发车时间及票价，请在底部菜单“出游助手”中的“火车查询”中查看详情"/>
                                                                                            <input  class="marker" type="hidden" marker-id = "2288" locationx = "123.59558105" locationy = "39.94129181" qq-locationx = "123.58920010853" qq-locationy = "39.93498591906"  logo="http://file.weijingtong.net/uploades/images/map_icon_02.png" data-name="丹大高铁大孤山站"  data-type="4" object-id="0" data-content="暂未开放"/>
                                                <input  class="marker" type="hidden" marker-id = "2288" locationx = "123.59558105" locationy = "39.94129181" qq-locationx = "123.58920010853" qq-locationy = "39.93498591906"  logo="http://file.weijingtong.net/uploades/images/map_icon_05.png" data-name="丹大高铁大孤山站"  data-type="4" object-id="0" data-content="暂未开放"/>
                                                                                            <input  class="marker" type="hidden" marker-id = "2287" locationx = "124.29746246" locationy = "40.05903244" qq-locationx = "124.29098730932" qq-locationy = "40.053019714514"  logo="http://file.weijingtong.net/uploades/images/map_icon_02.png" data-name="丹大高铁丹东西站"  data-type="4" object-id="0" data-content="暂未开放"/>
                                                <input  class="marker" type="hidden" marker-id = "2287" locationx = "124.29746246" locationy = "40.05903244" qq-locationx = "124.29098730932" qq-locationy = "40.053019714514"  logo="http://file.weijingtong.net/uploades/images/map_icon_05.png" data-name="丹大高铁丹东西站"  data-type="4" object-id="0" data-content="暂未开放"/>
                                                                                            <input  class="marker" type="hidden" marker-id = "2286" locationx = "124.29142761" locationy = "40.26932144" qq-locationx = "124.28489919746" qq-locationy = "40.263420372856"  logo="http://file.weijingtong.net/uploades/images/map_icon_02.png" data-name="沈丹高铁五龙背东站"  data-type="4" object-id="0" data-content="沈丹高铁五龙背东站"/>
                                                <input  class="marker" type="hidden" marker-id = "2286" locationx = "124.29142761" locationy = "40.26932144" qq-locationx = "124.28489919746" qq-locationy = "40.263420372856"  logo="http://file.weijingtong.net/uploades/images/map_icon_05.png" data-name="沈丹高铁五龙背东站"  data-type="4" object-id="0" data-content="沈丹高铁五龙背东站"/>
                                                                                            <input  class="marker" type="hidden" marker-id = "2284" locationx = "124.13354492" locationy = "40.46681976" qq-locationx = "124.12693354786" qq-locationy = "40.461104208823"  logo="http://file.weijingtong.net/uploades/images/map_icon_02.png" data-name="沈丹高铁凤城东站"  data-type="4" object-id="0" data-content="沈丹高铁凤城东站"/>
                                                <input  class="marker" type="hidden" marker-id = "2284" locationx = "124.13354492" locationy = "40.46681976" qq-locationx = "124.12693354786" qq-locationy = "40.461104208823"  logo="http://file.weijingtong.net/uploades/images/map_icon_05.png" data-name="沈丹高铁凤城东站"  data-type="4" object-id="0" data-content="沈丹高铁凤城东站"/>
                                                                                            <input  class="marker" type="hidden" marker-id = "2283" locationx = "123.92338562" locationy = "40.78471756" qq-locationx = "123.91682511595" qq-locationy = "40.778958848011"  logo="http://file.weijingtong.net/uploades/images/map_icon_02.png" data-name="沈丹高铁通远堡西站"  data-type="4" object-id="0" data-content="丹大高铁大孤山站"/>
                                                <input  class="marker" type="hidden" marker-id = "2283" locationx = "123.92338562" locationy = "40.78471756" qq-locationx = "123.91682511595" qq-locationy = "40.778958848011"  logo="http://file.weijingtong.net/uploades/images/map_icon_05.png" data-name="沈丹高铁通远堡西站"  data-type="4" object-id="0" data-content="丹大高铁大孤山站"/>
                                                                                            <input  class="marker" type="hidden" marker-id = "2277" locationx = "124.28198242" locationy = "40.26552963" qq-locationx = "124.27539873208" qq-locationy = "40.259786363743"  logo="http://file.weijingtong.net/uploades/images/map_icon_02.png" data-name="五龙背站"  data-type="4" object-id="0" data-content="附近景点：五龙背温泉小镇。"/>
                                                <input  class="marker" type="hidden" marker-id = "2277" locationx = "124.28198242" locationy = "40.26552963" qq-locationx = "124.27539873208" qq-locationy = "40.259786363743"  logo="http://file.weijingtong.net/uploades/images/map_icon_05.png" data-name="五龙背站"  data-type="4" object-id="0" data-content="附近景点：五龙背温泉小镇。"/>
                                                                                    </p><p class="text-ellipsis">
                                            <a href="javascript:;" class="son-menu" data-id = "1619" >机场</a>
                                                                                            <input  class="marker" type="hidden" marker-id = "2443" locationx = "124.29286957" locationy = "40.03983307" qq-locationx = "124.28635949122" qq-locationy = "40.033907583378"  logo="http://file.weijingtong.net/uploades/images/map_icon_02.png" data-name="丹东浪头机场"  data-type="4" object-id="0" data-content="主要航班<br />丹东-青岛、青岛-丹东、丹东-北京、北京-丹东、丹东-上海（浦东机场）、上海-丹东（浦东机场）、丹东-上海（虹桥机场）、上海-丹东（虹桥机场）、丹东-深圳、深圳-丹东<br />、丹东-成都、成都-丹东、丹东-哈尔滨、哈尔滨-丹东、丹东—首尔（首尔银川机场）首尔—丹东（首尔银川机场）<br />机场咨询电话：0415-6176500"/>
                                                <input  class="marker" type="hidden" marker-id = "2443" locationx = "124.29286957" locationy = "40.03983307" qq-locationx = "124.28635949122" qq-locationy = "40.033907583378"  logo="http://file.weijingtong.net/uploades/images/map_icon_05.png" data-name="丹东浪头机场"  data-type="4" object-id="0" data-content="主要航班<br />丹东-青岛、青岛-丹东、丹东-北京、北京-丹东、丹东-上海（浦东机场）、上海-丹东（浦东机场）、丹东-上海（虹桥机场）、上海-丹东（虹桥机场）、丹东-深圳、深圳-丹东<br />、丹东-成都、成都-丹东、丹东-哈尔滨、哈尔滨-丹东、丹东—首尔（首尔银川机场）首尔—丹东（首尔银川机场）<br />机场咨询电话：0415-6176500"/>
                                                                                    </p><p class="text-ellipsis">
                                            <a href="javascript:;" class="son-menu" data-id = "1619" >客运站</a>
                                                                                            <input  class="marker" type="hidden" marker-id = "2432" locationx = "124.78534698" locationy = "40.73122787" qq-locationx = "124.77888828969" qq-locationy = "40.725056267262"  logo="http://file.weijingtong.net/uploades/images/map_icon_02.png" data-name="宽甸客运总站"  data-type="4" object-id="0" data-content="主要目的地：丹东、集安、下露河、东港、辽阳、新宾、抚顺、鞍山、凤城、本溪、盘锦、辽阳、牡丹江、通化、恒仁、东港、鸭江、北江、小韭菜沟、三岔子、韭菜沟、腰岭子、杨木杆、小汤石、红石砬、浑江、沿江、振江、杉松、小荒沟、临江<br />详细发车时间及票价可以在底部菜单“出游助手”中的长途客车中查询"/>
                                                <input  class="marker" type="hidden" marker-id = "2432" locationx = "124.78534698" locationy = "40.73122787" qq-locationx = "124.77888828969" qq-locationy = "40.725056267262"  logo="http://file.weijingtong.net/uploades/images/map_icon_05.png" data-name="宽甸客运总站"  data-type="4" object-id="0" data-content="主要目的地：丹东、集安、下露河、东港、辽阳、新宾、抚顺、鞍山、凤城、本溪、盘锦、辽阳、牡丹江、通化、恒仁、东港、鸭江、北江、小韭菜沟、三岔子、韭菜沟、腰岭子、杨木杆、小汤石、红石砬、浑江、沿江、振江、杉松、小荒沟、临江<br />详细发车时间及票价可以在底部菜单“出游助手”中的长途客车中查询"/>
                                                                                            <input  class="marker" type="hidden" marker-id = "2431" locationx = "124.39322662" locationy = "40.13295746" qq-locationx = "124.38660161686" qq-locationy = "40.127303838429"  logo="http://file.weijingtong.net/uploades/images/map_icon_02.png" data-name="丹东客运总站"  data-type="4" object-id="0" data-content="主要目的地： 宽甸 | 大连 | 孤山 | 沈阳 | 本溪 | 岫岩 | 太平湾 | 庄河 | 东汤 | 鞍山 | 通远堡 | 北京 | 海城 | 通化 | 花院 | 瓦房店 | 青堆子 | 东港 | 盘锦 | 合隆 | 白山 | 五四农场 | 抚顺 | 太平沟 | 营口 |<br />详细发车时间及票价可以在底部菜单“出游助手”中的长途客车中查询"/>
                                                <input  class="marker" type="hidden" marker-id = "2431" locationx = "124.39322662" locationy = "40.13295746" qq-locationx = "124.38660161686" qq-locationy = "40.127303838429"  logo="http://file.weijingtong.net/uploades/images/map_icon_05.png" data-name="丹东客运总站"  data-type="4" object-id="0" data-content="主要目的地： 宽甸 | 大连 | 孤山 | 沈阳 | 本溪 | 岫岩 | 太平湾 | 庄河 | 东汤 | 鞍山 | 通远堡 | 北京 | 海城 | 通化 | 花院 | 瓦房店 | 青堆子 | 东港 | 盘锦 | 合隆 | 白山 | 五四农场 | 抚顺 | 太平沟 | 营口 |<br />详细发车时间及票价可以在底部菜单“出游助手”中的长途客车中查询"/>
                                                                                            <input  class="marker" type="hidden" marker-id = "2430" locationx = "124.06588745" locationy = "40.45759201" qq-locationx = "124.05943388045" qq-locationy = "40.451412816146"  logo="http://file.weijingtong.net/uploades/images/map_icon_02.png" data-name="凤城中心客运站"  data-type="4" object-id="0" data-content="发车目的地：爱阳镇、鞍山、宝山镇、北汤村、本溪、大连、大连开发区、丹东、弟兄山镇、东港、东汤镇、海城、桓仁、鸡冠山镇、宽甸<br />具体发车时间及票价，请在底部菜单“出游助手”中长途客车中查询"/>
                                                <input  class="marker" type="hidden" marker-id = "2430" locationx = "124.06588745" locationy = "40.45759201" qq-locationx = "124.05943388045" qq-locationy = "40.451412816146"  logo="http://file.weijingtong.net/uploades/images/map_icon_05.png" data-name="凤城中心客运站"  data-type="4" object-id="0" data-content="发车目的地：爱阳镇、鞍山、宝山镇、北汤村、本溪、大连、大连开发区、丹东、弟兄山镇、东港、东汤镇、海城、桓仁、鸡冠山镇、宽甸<br />具体发车时间及票价，请在底部菜单“出游助手”中长途客车中查询"/>
                                                                                            <input  class="marker" type="hidden" marker-id = "2429" locationx = "124.15345001" locationy = "39.89461899" qq-locationx = "124.14682749283" qq-locationy = "39.888963607676"  logo="http://file.weijingtong.net/uploades/images/map_icon_02.png" data-name="东港客运站"  data-type="4" object-id="0" data-content="发车目的地：青岛、辽阳、鞍山、大连、本溪、五爱、沈阳南塔、西柳、凌海、岫岩、庄河、丹东、红旗<br />详细发车时间及票价可以在底部菜单“出游助手”中的长途客车中查询"/>
                                                <input  class="marker" type="hidden" marker-id = "2429" locationx = "124.15345001" locationy = "39.89461899" qq-locationx = "124.14682749283" qq-locationy = "39.888963607676"  logo="http://file.weijingtong.net/uploades/images/map_icon_05.png" data-name="东港客运站"  data-type="4" object-id="0" data-content="发车目的地：青岛、辽阳、鞍山、大连、本溪、五爱、沈阳南塔、西柳、凌海、岫岩、庄河、丹东、红旗<br />详细发车时间及票价可以在底部菜单“出游助手”中的长途客车中查询"/>
                                                                                    </p><p class="text-ellipsis">
                                            <a href="javascript:;" class="son-menu" data-id = "1619" >海鲜市场</a>
                                                                                            <input  class="marker" type="hidden" marker-id = "2438" locationx = "124.37501526" locationy = "40.12504959" qq-locationx = "124.36839907865" qq-locationy = "40.119351781048"  logo="http://file.weijingtong.net/uploades/images/map_icon_02.png" data-name="诚信水产批发经销处"  data-type="4" object-id="0" data-content="主要经营速冻海鲜，冬季营业"/>
                                                <input  class="marker" type="hidden" marker-id = "2438" locationx = "124.37501526" locationy = "40.12504959" qq-locationx = "124.36839907865" qq-locationy = "40.119351781048"  logo="http://file.weijingtong.net/uploades/images/map_icon_05.png" data-name="诚信水产批发经销处"  data-type="4" object-id="0" data-content="主要经营速冻海鲜，冬季营业"/>
                                                                                            <input  class="marker" type="hidden" marker-id = "2437" locationx = "124.36571503" locationy = "40.10825348" qq-locationx = "124.359141718" qq-locationy = "40.102420945332"  logo="http://file.weijingtong.net/uploades/images/map_icon_02.png" data-name="福春大市场水产厅"  data-type="4" object-id="0" data-content="品种较全，价格便宜"/>
                                                <input  class="marker" type="hidden" marker-id = "2437" locationx = "124.36571503" locationy = "40.10825348" qq-locationx = "124.359141718" qq-locationy = "40.102420945332"  logo="http://file.weijingtong.net/uploades/images/map_icon_05.png" data-name="福春大市场水产厅"  data-type="4" object-id="0" data-content="品种较全，价格便宜"/>
                                                                                            <input  class="marker" type="hidden" marker-id = "2436" locationx = "124.15342712" locationy = "39.88446045" qq-locationx = "124.14679806376" qq-locationy = "39.878803133831"  logo="http://file.weijingtong.net/uploades/images/map_icon_02.png" data-name="东港黄海水产批发市场"  data-type="4" object-id="0" data-content="常年经销梭子蟹，黄蚬子，各种鱼类，朝鲜_海参等，还有杂色蛤等。离港口较近，价格便宜"/>
                                                <input  class="marker" type="hidden" marker-id = "2436" locationx = "124.15342712" locationy = "39.88446045" qq-locationx = "124.14679806376" qq-locationy = "39.878803133831"  logo="http://file.weijingtong.net/uploades/images/map_icon_05.png" data-name="东港黄海水产批发市场"  data-type="4" object-id="0" data-content="常年经销梭子蟹，黄蚬子，各种鱼类，朝鲜_海参等，还有杂色蛤等。离港口较近，价格便宜"/>
                                                                                            <input  class="marker" type="hidden" marker-id = "2435" locationx = "124.38121033" locationy = "40.11685181" qq-locationx = "124.37457556721" qq-locationy = "40.111204581343"  logo="http://file.weijingtong.net/uploades/images/map_icon_02.png" data-name="丹东联青水产批发市场"  data-type="4" object-id="0" data-content="丹东当地买海鲜的好地方，可以给海鲜加冰打氧封箱带走"/>
                                                <input  class="marker" type="hidden" marker-id = "2435" locationx = "124.38121033" locationy = "40.11685181" qq-locationx = "124.37457556721" qq-locationy = "40.111204581343"  logo="http://file.weijingtong.net/uploades/images/map_icon_05.png" data-name="丹东联青水产批发市场"  data-type="4" object-id="0" data-content="丹东当地买海鲜的好地方，可以给海鲜加冰打氧封箱带走"/>
                                                                                            <input  class="marker" type="hidden" marker-id = "2434" locationx = "124.39885712" locationy = "40.14040756" qq-locationx = "124.39225555751" qq-locationy = "40.134703539732"  logo="http://file.weijingtong.net/uploades/images/map_icon_02.png" data-name="四道桥水产批发市场"  data-type="4" object-id="0" data-content="丹东市四道桥水产大厅，是市内最大的水产大市场，在这能买到各种鲜活的海产品。大玻璃池里有活的大龙虾，活海参，活大肥蟹，活鲍鱼，各种干海产品，应有尽有。<br />海鲜质量好，价格小贵"/>
                                                <input  class="marker" type="hidden" marker-id = "2434" locationx = "124.39885712" locationy = "40.14040756" qq-locationx = "124.39225555751" qq-locationy = "40.134703539732"  logo="http://file.weijingtong.net/uploades/images/map_icon_05.png" data-name="四道桥水产批发市场"  data-type="4" object-id="0" data-content="丹东市四道桥水产大厅，是市内最大的水产大市场，在这能买到各种鲜活的海产品。大玻璃池里有活的大龙虾，活海参，活大肥蟹，活鲍鱼，各种干海产品，应有尽有。<br />海鲜质量好，价格小贵"/>
                                                                                    </p><p class="text-ellipsis">
                                            <a href="javascript:;" class="son-menu" data-id = "1619" >码头</a>
                                                                                            <input  class="marker" type="hidden" marker-id = "2441" locationx = "123.87403107" locationy = "39.83763123" qq-locationx = "123.86755455302" qq-locationy = "39.831585923343"  logo="http://file.weijingtong.net/uploades/images/map_icon_02.png" data-name="獐岛码头"  data-type="4" object-id="0" data-content="去獐岛是需要坐船的 而且只能坐船到 但是需要看当时是否涨潮 涨潮是会影响登录的 所以船的时间是根据实际情况来定的 你可以打电话咨询一下0415-7852402　 785177"/>
                                                <input  class="marker" type="hidden" marker-id = "2441" locationx = "123.87403107" locationy = "39.83763123" qq-locationx = "123.86755455302" qq-locationy = "39.831585923343"  logo="http://file.weijingtong.net/uploades/images/map_icon_05.png" data-name="獐岛码头"  data-type="4" object-id="0" data-content="去獐岛是需要坐船的 而且只能坐船到 但是需要看当时是否涨潮 涨潮是会影响登录的 所以船的时间是根据实际情况来定的 你可以打电话咨询一下0415-7852402　 785177"/>
                                                                                            <input  class="marker" type="hidden" marker-id = "2440" locationx = "123.69886017" locationy = "39.81985855" qq-locationx = "123.69239354368" qq-locationy = "39.813818812878"  logo="http://file.weijingtong.net/uploades/images/map_icon_02.png" data-name="大鹿岛码头"  data-type="4" object-id="0" data-content="去岛上的大船每天一班，根据潮水，赶不上就要坐快艇，比较贵"/>
                                                <input  class="marker" type="hidden" marker-id = "2440" locationx = "123.69886017" locationy = "39.81985855" qq-locationx = "123.69239354368" qq-locationy = "39.813818812878"  logo="http://file.weijingtong.net/uploades/images/map_icon_05.png" data-name="大鹿岛码头"  data-type="4" object-id="0" data-content="去岛上的大船每天一班，根据潮水，赶不上就要坐快艇，比较贵"/>
                                                                                    </p><p class="text-ellipsis">
                                            <a href="javascript:;" class="son-menu" data-id = "1619" >港口</a>
                                                                                            <input  class="marker" type="hidden" marker-id = "2446" locationx = "123.87402344" locationy = "39.83762741" qq-locationx = "123.86754697381" qq-locationy = "39.83158195724"  logo="http://file.weijingtong.net/uploades/images/map_icon_02.png" data-name="獐岛港客运站"  data-type="4" object-id="0" data-content="去獐岛是需要坐船的 而且只能坐船到 但是需要看当时是否涨潮 涨潮是会影响登录的 所以船的时间是根据实际情况来定的 你可以打电话咨询一下0415-7852402　 785177"/>
                                                <input  class="marker" type="hidden" marker-id = "2446" locationx = "123.87402344" locationy = "39.83762741" qq-locationx = "123.86754697381" qq-locationy = "39.83158195724"  logo="http://file.weijingtong.net/uploades/images/map_icon_05.png" data-name="獐岛港客运站"  data-type="4" object-id="0" data-content="去獐岛是需要坐船的 而且只能坐船到 但是需要看当时是否涨潮 涨潮是会影响登录的 所以船的时间是根据实际情况来定的 你可以打电话咨询一下0415-7852402　 785177"/>
                                                                                            <input  class="marker" type="hidden" marker-id = "2445" locationx = "123.70350647" locationy = "39.82173157" qq-locationx = "123.69706750092" qq-locationy = "39.815604319579"  logo="http://file.weijingtong.net/uploades/images/map_icon_02.png" data-name="大鹿岛港客运站"  data-type="4" object-id="0" data-content="大鹿岛—坎门  <br />09:20、15:30 09:50、16:00 <br />坎门—大鹿岛<br />10:00、16:10 10:30、16:40 <br />大鹿岛—栈台  <br />08:30、15:00 08:50、15:20 <br />栈台—大鹿岛  <br />09:00、15:30 09:20、15:50"/>
                                                <input  class="marker" type="hidden" marker-id = "2445" locationx = "123.70350647" locationy = "39.82173157" qq-locationx = "123.69706750092" qq-locationy = "39.815604319579"  logo="http://file.weijingtong.net/uploades/images/map_icon_05.png" data-name="大鹿岛港客运站"  data-type="4" object-id="0" data-content="大鹿岛—坎门  <br />09:20、15:30 09:50、16:00 <br />坎门—大鹿岛<br />10:00、16:10 10:30、16:40 <br />大鹿岛—栈台  <br />08:30、15:00 08:50、15:20 <br />栈台—大鹿岛  <br />09:00、15:30 09:20、15:50"/>
                                                                                            <input  class="marker" type="hidden" marker-id = "2444" locationx = "124.16511536" locationy = "39.85322571" qq-locationx = "124.15854121284" qq-locationy = "39.847432567062"  logo="http://file.weijingtong.net/uploades/images/map_icon_02.png" data-name="丹东港国际客运站"  data-type="4" object-id="0" data-content="丹东港集团国际客运公司成立于1998年7月，以接送中国丹东──韩国仁川国际航线的旅客及小件货物为主要业务，是丹东市对外开放的重要窗口。<br />主要航班：<br />丹东港16:0008:00韩国仁川<br />韩国仁川17:0009:00丹东港"/>
                                                <input  class="marker" type="hidden" marker-id = "2444" locationx = "124.16511536" locationy = "39.85322571" qq-locationx = "124.15854121284" qq-locationy = "39.847432567062"  logo="http://file.weijingtong.net/uploades/images/map_icon_05.png" data-name="丹东港国际客运站"  data-type="4" object-id="0" data-content="丹东港集团国际客运公司成立于1998年7月，以接送中国丹东──韩国仁川国际航线的旅客及小件货物为主要业务，是丹东市对外开放的重要窗口。<br />主要航班：<br />丹东港16:0008:00韩国仁川<br />韩国仁川17:0009:00丹东港"/>
                                                                                    </p>                            </div>
                                                <a href="javascript:void(0)" class="parent-menu bar box box-align"><i class="icons-7"></i>服务设施</a>
          </li>
                <li style="width:33.333333333333%">
                                                    <div class="meun fn-hide">
                                    <p class="text-ellipsis">
                                            <a href="javascript:;" class="son-menu" data-id = "1620" >特色饭店</a>
                                                                                            <input  class="marker" type="hidden" marker-id = "4243" locationx = "124.58321381" locationy = "40.26835632" qq-locationx = "124.57679356357" qq-locationy = "40.26211755516"  logo="http://file.weijingtong.net/uploades/images/map_icon_02.png" data-name="老金沟农家院"  data-type="3" object-id="1618" data-content=""/>
                                                <input  class="marker" type="hidden" marker-id = "4243" locationx = "124.58321381" locationy = "40.26835632" qq-locationx = "124.57679356357" qq-locationy = "40.26211755516"  logo="http://file.weijingtong.net/uploades/images/map_icon_11.png" data-name="老金沟农家院"  data-type="3" object-id="1618" data-content=""/>
                                                                                            <input  class="marker" type="hidden" marker-id = "4242" locationx = "124.40182495" locationy = "40.13674927" qq-locationx = "124.39523241708" qq-locationy = "40.131005765151"  logo="http://file.weijingtong.net/uploades/images/map_icon_02.png" data-name="丹东鲜海居海鲜酒店"  data-type="3" object-id="1617" data-content=""/>
                                                <input  class="marker" type="hidden" marker-id = "4242" locationx = "124.40182495" locationy = "40.13674927" qq-locationx = "124.39523241708" qq-locationy = "40.131005765151"  logo="http://file.weijingtong.net/uploades/images/map_icon_11.png" data-name="丹东鲜海居海鲜酒店"  data-type="3" object-id="1617" data-content=""/>
                                                                                            <input  class="marker" type="hidden" marker-id = "2425" locationx = "124.39907074" locationy = "40.13818741" qq-locationx = "124.39246792397" qq-locationy = "40.132480185648"  logo="http://file.weijingtong.net/uploades/images/map_icon_02.png" data-name="水木年滑火锅店"  data-type="3" object-id="1124" data-content=""/>
                                                <input  class="marker" type="hidden" marker-id = "2425" locationx = "124.39907074" locationy = "40.13818741" qq-locationx = "124.39246792397" qq-locationy = "40.132480185648"  logo="http://file.weijingtong.net/uploades/images/map_icon_11.png" data-name="水木年滑火锅店"  data-type="3" object-id="1124" data-content=""/>
                                                                                            <input  class="marker" type="hidden" marker-id = "2424" locationx = "124.40776825" locationy = "40.13914108" qq-locationx = "124.40120841207" qq-locationy = "40.133303665682"  logo="http://file.weijingtong.net/uploades/images/map_icon_02.png" data-name="摩卡轮音乐烤吧"  data-type="3" object-id="1123" data-content=""/>
                                                <input  class="marker" type="hidden" marker-id = "2424" locationx = "124.40776825" locationy = "40.13914108" qq-locationx = "124.40120841207" qq-locationy = "40.133303665682"  logo="http://file.weijingtong.net/uploades/images/map_icon_11.png" data-name="摩卡轮音乐烤吧"  data-type="3" object-id="1123" data-content=""/>
                                                                                            <input  class="marker" type="hidden" marker-id = "2423" locationx = "124.40131378" locationy = "40.13697815" qq-locationx = "124.3947191624" qq-locationy = "40.131241797504"  logo="http://file.weijingtong.net/uploades/images/map_icon_02.png" data-name="万水一方海鲜酒店"  data-type="3" object-id="1122" data-content=""/>
                                                <input  class="marker" type="hidden" marker-id = "2423" locationx = "124.40131378" locationy = "40.13697815" qq-locationx = "124.3947191624" qq-locationy = "40.131241797504"  logo="http://file.weijingtong.net/uploades/images/map_icon_11.png" data-name="万水一方海鲜酒店"  data-type="3" object-id="1122" data-content=""/>
                                                                                            <input  class="marker" type="hidden" marker-id = "2422" locationx = "124.40615845" locationy = "40.13747787" qq-locationx = "124.39958818347" qq-locationy = "40.131667569295"  logo="http://file.weijingtong.net/uploades/images/map_icon_02.png" data-name="北锅之村老菜馆"  data-type="3" object-id="1121" data-content=""/>
                                                <input  class="marker" type="hidden" marker-id = "2422" locationx = "124.40615845" locationy = "40.13747787" qq-locationx = "124.39958818347" qq-locationy = "40.131667569295"  logo="http://file.weijingtong.net/uploades/images/map_icon_11.png" data-name="北锅之村老菜馆"  data-type="3" object-id="1121" data-content=""/>
                                                                                            <input  class="marker" type="hidden" marker-id = "2421" locationx = "124.36589050" locationy = "40.19684982" qq-locationx = "124.35934234896" qq-locationy = "40.191028790023"  logo="http://file.weijingtong.net/uploades/images/map_icon_02.png" data-name="丹东天天炖农家菜"  data-type="3" object-id="1120" data-content=""/>
                                                <input  class="marker" type="hidden" marker-id = "2421" locationx = "124.36589050" locationy = "40.19684982" qq-locationx = "124.35934234896" qq-locationy = "40.191028790023"  logo="http://file.weijingtong.net/uploades/images/map_icon_11.png" data-name="丹东天天炖农家菜"  data-type="3" object-id="1120" data-content=""/>
                                                                                    </p>                            </div>
                                                <a href="javascript:void(0)" class="parent-menu bar box box-align"><i class="icons-1"></i>美食地图</a>
          </li>
          </ul>
  </section>
</article>
    <input  type="hidden" id="destination-250"  data-face="http://file.weijingtong.net/uploades/images/Destination/610/20151116/1447653630_620275.jpg" />
    <input  type="hidden" id="audio-250" data-audio="" data-src="http://file.weijingtong.net" />
    <input  type="hidden" id="destination-251"  data-face="http://file.weijingtong.net/uploades/images/Destination/610/20151116/1447653496_361235.jpg" />
    <input  type="hidden" id="audio-251" data-audio="" data-src="http://file.weijingtong.net" />
    <input  type="hidden" id="destination-254"  data-face="http://file.weijingtong.net/uploades/images/Destination/610/20151116/1447653024_542072.jpg" />
    <input  type="hidden" id="audio-254" data-audio="" data-src="http://file.weijingtong.net" />
    <input  type="hidden" id="destination-271"  data-face="http://file.weijingtong.net/uploades/images/Destination/610/20151116/1447650728_404647.jpg" />
    <input  type="hidden" id="audio-271" data-audio="" data-src="http://file.weijingtong.net" />
    <input  type="hidden" id="destination-272"  data-face="http://file.weijingtong.net/uploades/images/Destination/610/20151116/1447650520_299150.jpg" />
    <input  type="hidden" id="audio-272" data-audio="" data-src="http://file.weijingtong.net" />
    <input  type="hidden" id="destination-273"  data-face="http://file.weijingtong.net/uploades/images/Destination/610/20151116/1447650049_639535.jpg" />
    <input  type="hidden" id="audio-273" data-audio="" data-src="http://file.weijingtong.net" />
    <input  type="hidden" id="destination-274"  data-face="http://file.weijingtong.net/uploades/images/Destination/610/20151116/1447649677_384962.jpg" />
    <input  type="hidden" id="audio-274" data-audio="" data-src="http://file.weijingtong.net" />
    <input  type="hidden" id="destination-275"  data-face="http://file.weijingtong.net/uploades/images/Destination/610/20151116/1447649567_339815.jpg" />
    <input  type="hidden" id="audio-275" data-audio="" data-src="http://file.weijingtong.net" />
    <input  type="hidden" id="destination-276"  data-face="http://file.weijingtong.net/uploades/images/Destination/610/20151116/1447649401_283822.jpg" />
    <input  type="hidden" id="audio-276" data-audio="" data-src="http://file.weijingtong.net" />
    <input  type="hidden" id="destination-277"  data-face="http://file.weijingtong.net/uploades/images/Destination/610/20151116/1447649115_468874.jpg" />
    <input  type="hidden" id="audio-277" data-audio="" data-src="http://file.weijingtong.net" />
    <input  type="hidden" id="destination-280"  data-face="http://file.weijingtong.net/uploades/images/Destination/610/20151116/1447648331_610339.jpg" />
    <input  type="hidden" id="audio-280" data-audio="" data-src="http://file.weijingtong.net" />
    <input  type="hidden" id="destination-281"  data-face="http://file.weijingtong.net/uploades/images/Destination/610/20151116/1447648161_339791.jpg" />
    <input  type="hidden" id="audio-281" data-audio="" data-src="http://file.weijingtong.net" />
    <input  type="hidden" id="destination-282"  data-face="http://file.weijingtong.net/uploades/images/Destination/610/20151116/1447648031_606939.jpg" />
    <input  type="hidden" id="audio-282" data-audio="" data-src="http://file.weijingtong.net" />
    <input  type="hidden" id="destination-283"  data-face="http://file.weijingtong.net/uploades/images/Destination/610/20151116/1447647898_471191.jpg" />
    <input  type="hidden" id="audio-283" data-audio="" data-src="http://file.weijingtong.net" />
    <input  type="hidden" id="destination-285"  data-face="http://file.weijingtong.net/uploades/images/Destination/610/20151116/1447647792_985996.jpg" />
    <input  type="hidden" id="audio-285" data-audio="" data-src="http://file.weijingtong.net" />
    <input  type="hidden" id="destination-286"  data-face="http://file.weijingtong.net/uploades/images/Destination/610/20151116/1447647462_614709.jpg" />
    <input  type="hidden" id="audio-286" data-audio="" data-src="http://file.weijingtong.net" />
    <input  type="hidden" id="destination-287"  data-face="http://file.weijingtong.net/uploades/images/Destination/610/20151116/1447647116_127537.jpg" />
    <input  type="hidden" id="audio-287" data-audio="" data-src="http://file.weijingtong.net" />
    <input  type="hidden" id="destination-291"  data-face="http://file.weijingtong.net/uploades/images/Destination/610/20151116/1447645509_695598.jpg" />
    <input  type="hidden" id="audio-291" data-audio="" data-src="http://file.weijingtong.net" />
    <input  type="hidden" id="destination-292"  data-face="http://file.weijingtong.net/uploades/images/Destination/610/20151116/1447645789_283709.jpg" />
    <input  type="hidden" id="audio-292" data-audio="" data-src="http://file.weijingtong.net" />
    <input  type="hidden" id="destination-293"  data-face="http://file.weijingtong.net/uploades/images/Destination/610/20160526/1464223741_351032.jpg" />
    <input  type="hidden" id="audio-293" data-audio="" data-src="http://file.weijingtong.net" />
    <input  type="hidden" id="destination-296"  data-face="http://file.weijingtong.net/uploades/images/Destination/610/20151116/1447665458_182086.jpg" />
    <input  type="hidden" id="audio-296" data-audio="" data-src="http://file.weijingtong.net" />
    <input  type="hidden" id="destination-297"  data-face="http://file.weijingtong.net/uploades/images/Destination/610/20151117/1447729944_353855.jpg" />
    <input  type="hidden" id="audio-297" data-audio="" data-src="http://file.weijingtong.net" />
    <input  type="hidden" id="destination-299"  data-face="http://file.weijingtong.net/uploades/images/Destination/610/20151117/1447729265_554284.jpg" />
    <input  type="hidden" id="audio-299" data-audio="" data-src="http://file.weijingtong.net" />
    <input  type="hidden" id="destination-304"  data-face="http://file.weijingtong.net/uploades/images/Destination/610/20151117/1447728703_710655.jpg" />
    <input  type="hidden" id="audio-304" data-audio="" data-src="http://file.weijingtong.net" />
    <input  type="hidden" id="destination-306"  data-face="http://file.weijingtong.net/uploades/images/Destination/610/20151117/1447765873_718279.jpg" />
    <input  type="hidden" id="audio-306" data-audio="" data-src="http://file.weijingtong.net" />
    <input  type="hidden" id="destination-307"  data-face="http://file.weijingtong.net/uploades/images/Destination/610/20151120/1447979346_189630.jpg" />
    <input  type="hidden" id="audio-307" data-audio="" data-src="http://file.weijingtong.net" />

<div class="playing">
    <div class="box box-flex">
        <div class="box-flex title" id="playing-name" style="padding:0 10px;line-height:50px;color:#888;"> </div>
        <div class="but" id="playing-close-click">
            <a href="javascript:;"><span class="start" style="background: url(http://i.weijingtong.net/include/images/system/voicealbum/voicea_icon_06.gif) center center no-repeat;background-size: 40px 40px;"></span></a>
        </div>
    </div>
</div>
<audio id="audio" style="position:absolute;left:-9999px;z-index:-1;" ></audio>

<input type="hidden" id="focus-marker-id" value="" />

<script type="text/javascript" src="http://api.map.baidu.com/library/AreaRestriction/1.2/src/AreaRestriction_min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
    //微信分享设置参数
    ;(function(){
        window.dataForWeixin = {
            appId : "wx1ef49f53c35666fd",
            //MsgImg : "http://file.weijingtong.net/uploades/images/map/610/20151117/1447750713_442066.jpg",
            //TLImg : "http://file.weijingtong.net/uploades/images/map/610/20151117/1447750713_442066.jpg",
            MsgImg : "http://nwx.weijingtong.net/include/images/location-logo.png",
            link : "http://pwx.weijingtong.net?m=DestinationMap&c=Index&a=index&clientId=610&id=424&time=1502777730&from=singlemessage&isappinstalled=0&shareCode=201708161123500007503409450",
            shareCode : "201708161123500007503409450",
            relationType : "57",
            relationId : "424",
            title : "丹东旅游地图导览",
            desc : "景点位置、公共设施、特色美食地点，一切尽在掌握！",
        };
        wjt.visitorCount("m=DestinationMap&c=Index&a=index&clientId=610&id=424&time=1502777730&from=singlemessage&isappinstalled=0",wjt.GET['clientId']);
    })();

    //播放音乐
    $('#play-audio-click').click(function(){
        $('#playing-name').html( $('#marker-name').html() );
        $('.playing').removeClass('playing-close').addClass('playing-on');
        $('#audio').attr('src', $('#audio-'+$('#focus-marker-id').val()).attr('data-src'));
        document.getElementById('audio').play();
    });
    //停止播放音乐
    $('#playing-close-click').click(function(){
        $('.playing').removeClass('playing-on').addClass('playing-close');
        document.getElementById('audio').pause();
    });
    document.getElementById('audio').onended = function(){
        $('.playing').removeClass('playing-on').addClass('playing-close');
    }

    var map; // 地图对象

    //在地图上添加标注
    var markerObj = [];
    function add_marker(id,locationx,locationy,qqlocationx,qqlocationy,logo,name,content,type,objectId) {
        var point = new BMap.Point(locationx, locationy);
        //console.log(name);
        var myIcon = new BMap.Icon(logo, new BMap.Size(32,35));//21,26
        var marker = new BMap.Marker(point,{icon:myIcon});  // 创建标注
        var label = new BMap.Label(name,{offset:new BMap.Size(20,-10)});
        marker.setLabel(label);
        map.addOverlay(marker);                     // 将标注添加到地图中
        marker.addEventListener("click", function(){
            //打开弹窗
            $('#image-destination').attr('src','');
            $('#marker-content').html(content);
            $('#marker-name').html(name);
            $('#marker-name-title').html(name);
            $('.alert-view-one').removeClass('fn-hide').addClass('fn-show');
            $('#focus-marker-id').val(objectId);
            //景区地图
            console.log(type);
            //type 1景点
            if(type == 1){
                $('#image-box').show();
                $('#info-box').hide();
                $('#image-destination').attr('src',$('#destination-'+objectId).attr('data-face'));
                $('#view-map').hide();
                $('#view-detail').show().unbind("click").click(function(){
                    window.location.href="http://pwx.weijingtong.net?m=Destination&a=destinationDetail&clientId=610&id="+objectId;
                });
                $('#go-to-here').show().unbind("click").click(function(){
                    getNav(qqlocationx, qqlocationy, name);
                    //window.location.href=$('#destination-'+objectId).attr('data-url');
                })
                $('#view-detail-lang').html('景区详情');

                //是否播放音乐
                if( $('#audio-' + objectId).attr('data-audio') == '1' ){
                    $('#play-audio-click').show();
                }
                else{
                    $('#play-audio-click').hide();
                }
            }
            //type 1景点，2服务设施，3商家，4自定义
            else if(type == 3){
                $('#image-box').hide();
                $('#view-map').hide();
                $('#info-box').show();
                $('#go-to-here').show().unbind("click").click(function(){
                    getNav(qqlocationx, qqlocationy, name);
                })
                $('#view-detail').show().unbind("click").click(function(){
                    window.location.href="http://nwx.weijingtong.net/business/detail?id="+objectId;
                })
                $('#view-detail-lang').html('商家详情');
            }
            //type 1景点，2服务设施，3商家，4自定义
            else if(type == 4 || type == 2){
                $('#image-box').hide();
                $('#info-box').show();
                $('#view-map').hide();
                $('#view-detail').hide();
                $('#go-to-here').show().unbind("click").click(function(){
                    getNav(qqlocationx, qqlocationy, name);
                })
            }

        });
        markerObj[id] = marker;
    }


    //在地图上删除标注
    function remove_marker(id) {
        map.removeOverlay(markerObj[id]);
    }

    //初始化地图-------------------------------------
            var map = new BMap.Map('allmap',{minZoom:2,maxZoom:18});
    var longitudeMap = '124.39492798';
    var latitudeMap = '40.15943146';
    var longitudeClient = '124.38172913';
    var latitudeClient = '40.11229324';

    //初始化中心的位置
    if(longitudeMap != '' && latitudeMap !=''){     //config中的经纬度
        longitude = longitudeMap;
        latitude = latitudeMap;
    }else if(longitudeClient != '' && latitudeClient != ''){ //client中的经纬度
        longitude = longitudeClient;
        latitude = latitudeClient;
    }else{
        longitude = 109.819336;
        latitude = 34.488448;
    }

    
    var default_zoom = '10';
    if( !default_zoom ){
        var default_zoom = 14;
    }

    //map.removeControl(new BMap.NavigationControl()); //隐藏缩放控件
    map.centerAndZoom(new BMap.Point(longitude, latitude), default_zoom);
    map.enableScrollWheelZoom();   //启用滚轮放大缩小
    map.addEventListener("click", function(e){
        //$('#zoomsize').html(e.point.lng + "," + e.point.lat);
        console.log(e.point.lng );
        console.log(e.point.lat );
        return false;
    });

    
    
    //添加标注
    function add_point(Obj){
        add_marker(Obj.attr('marker-id'),Obj.attr('locationx'),Obj.attr('locationy'),Obj.attr('qq-locationx'),Obj.attr('qq-locationy'),Obj.attr('logo'),Obj.attr('data-name'),Obj.attr('data-content'),Obj.attr('data-type'),Obj.attr('object-id'));
    }

    //点击一级菜单
    $('.parent-menu').click(function(){
        $('.parent-menu').removeClass('active');
        if($(this).siblings('.meun').html()){
            //显示景点等
            if($(this).siblings('.meun').hasClass('fn-hide')){
                $('.meun').addClass('fn-hide');
                $(this).siblings('.meun').removeClass('fn-hide');

                /*map.clearOverlays();
                $(this).parent().find('.marker').each(function(index) {
                    add_point($(this));
                });*/
            }else{
                $(this).siblings('.meun').addClass('fn-hide');
                map.clearOverlays();
            }
        }else{
            $('.meun').addClass('fn-hide');
            map.clearOverlays();
            $(this).parent().find('.marker').each(function(index) {
                add_point($(this));
            });
            $(this).addClass('active');
        }
        close_window(); //关闭弹出层

    });
    //点击二级菜单
    $('.son-menu').click(function(){
        $('.parent-menu').removeClass('active');
        map.clearOverlays();
        $(this).parent().find('.marker').each(function(index) {
            add_point($(this));
        });
        $(this).parent().parent().addClass('fn-hide');
        $(this).parent().parent().siblings('.parent-menu').addClass('active');
        close_window();//关闭弹出层
    });

    //画出到这里去的线路
    var driving;
    function getNav(lon, lat, address) {
        wx.openLocation({
            latitude: parseFloat(lat), // 纬度，浮点数，范围为90 ~ -90
            longitude: parseFloat(lon), // 经度，浮点数，范围为180 ~ -180。
            name: address, // 位置名
            address: address, // 地址详情说明
            scale: 10, // 地图缩放级别,整形值,范围从1~28。默认为最大
            infoUrl: '' // 在查看位置界面底部显示的超链接,可点击跳转
        });
        return false;

        var geolocation = new BMap.Geolocation();
        geolocation.getCurrentPosition(function(r){
            if(this.getStatus() == BMAP_STATUS_SUCCESS){
                var mk = new BMap.Marker(r.point);
                map.addOverlay(mk);
                map.panTo(r.point);
                var sContent = "<div>" +
                "<h4>我的位置</h4>" +
                "<div style='border-top:1px solid #d1d1d1;padding-top:5px;'>" +
                "   <table width='100%'>" +
                "       <tr>" +
                "           <td style='color:#4d4d4d;font-size:13px;' width='33%'>"+
                "            维度:" + r.point.lat + "<br/> 经度：" + r.point.lng +
                "       </tr>" +
                "   </table>" +
                "</div>" +
                "</div>";

                var infoWindow_0 = new BMap.InfoWindow(sContent);  // 创建信息窗口对象
                mk.addEventListener("click",function(){
                    this.openInfoWindow(infoWindow_0);
                });
                if(driving) {
                    driving.clearResults();
                }
                var p1 = new BMap.Point(lon,lat);
                driving = new BMap.DrivingRoute(map,
                    {
                        renderOptions:{map: map, autoViewport: false}
                        ,onSearchComplete: function (results){
                            if (driving.getStatus() != BMAP_STATUS_SUCCESS){
                                return ;
                            }
                            var plan = results.getPlan(0);
                            var output = "到"+address+"驾车需要";
                            output += plan.getDuration(true) + "\n";             //获取时间
                            output += "总路程为：" ;
                            output += plan.getDistance(true) + "\n";             //获取距离
                            close_window();
                            alert(output);
                        }
                    }
                );
                driving.search(r.point, p1);
            } else {
                alert('GPS定位失败'+this.getStatus());
            }
        },{enableHighAccuracy: true});
    }

  //关闭弹窗do
  function close_window(){
    $('.alert-view-one').removeClass('fn-show').addClass('fn-hide');
  }
  //关闭弹出框
  $('.alert-view-one').click(function(){
    close_window();
  });
  //阻止冒泡
  $('.alert-view-one .view').click(function(e){
    e.stopPropagation();
  });

  //初始化
  /*$('.marker').each(function(index) {
      add_point($(this));
    });*/

    function get_mylocation(map){
        var geolocation = new BMap.Geolocation();
        geolocation.getCurrentPosition(function(r){
            if(this.getStatus() == BMAP_STATUS_SUCCESS){
                var mk = new BMap.Marker(r.point);
                mk.disableMassClear();
                map.addOverlay(mk);
                map.panTo(r.point);

                var sContent = "<div>" +
                "<h4>我的位置</h4>" +
                "<div style='border-top:1px solid #d1d1d1;padding-top:5px;'>" +
                "   <table width='100%'>" +
                "       <tr>" +
                "           <td style='color:#4d4d4d;font-size:13px;' width='33%'>"+
                "            维度:" + r.point.lat + "<br/> 经度：" + r.point.lng +
                "       </tr>" +
                "   </table>" +
                "</div>" +
                "</div>";

                var infoWindow = new BMap.InfoWindow(sContent);  // 创建信息窗口对象
                mk.addEventListener("click",function(){
                    this.openInfoWindow(infoWindow);
                });

                map.centerAndZoom(r.point, 14);
            } else {
                alert('GPS定位失败'+this.getStatus());
            }
        });
    }

    /**var lon,lat,mk;
    var geolocation = new BMap.Geolocation();
    geolocation.getCurrentPosition(function(r){
        if(this.getStatus() == BMAP_STATUS_SUCCESS){
            $('#my-location-but').parent().parent().show();
            lon = r.point.lng;
            lat = r.point.lat
        } else {
            alert('定位失败');
        }
    },{enableHighAccuracy: false});*/

    $('#my-location-but').click(function(){
        get_mylocation(map);
    });

    setTimeout(function(){
        $('.parent-menu').eq(0).click();
    }, 1500);

    setTimeout(function() {
        //隐藏百度版权等信息
        $('.BMap_cpyCtrl,.anchorBL').hide();
    },200);


});

</script>





</body>
</html>