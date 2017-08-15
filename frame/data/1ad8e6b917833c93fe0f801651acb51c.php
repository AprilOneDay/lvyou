<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
        <link rel="stylesheet" href="/css/index.css" />
        <link rel="stylesheet" href="http://api.map.baidu.com/library/SearchInfoWindow/1.5/src/SearchInfoWindow_min.css" />
        <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=AXWTyFPiM2Ao2PmIyKlUSXYvRG2obctc"></script>
        <script type="text/javascript" src="http://api.map.baidu.com/library/SearchInfoWindow/1.5/src/SearchInfoWindow_min.js"></script>
        <title>根据关键字本地搜索</title>
    </head>

    <body>
        <header class="header">
            <h1>旅游地图导视</h1>
        </header>
        <div style="width: 100%;min-height: 625px;" id="map"></div>
        <div id="tab_box">
            <div class="nav">
                <ul>
                    <li>旅游景区</li>
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
            <div class="nav">
                <ul>
                    <li>服务设施</li>
                    <li>服务设施</li>
                </ul>
            </div>
        </div>
        <!-- <div class="m_info">
            <div class="m_info_t">
                <p class="text">美丽的兴凯湖畔</p>
            </div>
            <div class="m_info_b">
                <ul>
                    <li><a href="#">景点详情</a></li>
                    <li><a href="#">到这里</a></li>
                </ul>
            </div>
        </div> -->
        <footer class="footer">
            <ul>
                <li><i class="icon1"></i>旅游景点</li>
                <li><i class="icon2"></i>特色美食</li>
                <li><i class="icon3"></i>民宿客栈</li>
                <li><i class="icon4"></i>服务设施</li>
            </ul>
        </footer>
<script src="/js/jquery191.js"></script>
<script type="text/javascript">
$(function(){
    $('footer>ul>li').click(function(){
        $(this).toggleClass('active').siblings().removeClass('active');
        $('#tab_box').find('.nav').eq($(this).index()).toggleClass('show').siblings().removeClass('show');
    })

    //关闭弹出框
    $(document).click(function(){
      console.log(11111);
      $('.BMapLib_bubble_content').remove();
    });
    //阻止冒泡
    $('#map').click(function(e){
      e.stopPropagation();
    });

})
</script>
<script type="text/javascript">
    // 百度地图API功能
    var map = new BMap.Map('map');
    var poi = new BMap.Point(113.165099,22.816072);
    map.centerAndZoom(poi, 13);
    map.enableScrollWheelZoom();

    var searchInfoWindow = new Array();
    <?php if($list){ foreach($list as $key => $value){ ?>
    <?php if(!$value['is_more']){ $value['url'] = 'javascript:;';} ?>
    var content = '<div class="m_info_t" style="background:url(<?php echo $value['thumb']; ?>);"><!--<p class="text">美丽的兴凯湖畔</p>--></div></div><div class="m_info_b"><ul><li><a href="<?php echo $value['url']; ?>">景点详情</a></li><li><a href="androidamap://navi?sourceApplication=appname&amp;poiname=fangheng&amp;lat=36.547901&amp;lon=104.258354&amp;dev=1&amp;style=2">到这里</a></li></ul></div>';
    //创建检索信息窗口对象
    searchInfoWindow[<?php echo $key; ?>] = new BMapLib.SearchInfoWindow(map, content, {
            title  : '<?php echo $value['title']; ?>',       //标题
            width  : 290,                   //宽度
            height : 105,                   //高度
            panel  : "panel",               //检索结果面板
            enableAutoPan : true,           //自动平移
            searchTypes   :[
                //BMAPLIB_TAB_SEARCH,   //周边检索
                //BMAPLIB_TAB_TO_HERE,  //到这里去
                //BMAPLIB_TAB_FROM_HERE //从这里出发
            ]
        });
    <?php if($value['background']){ ?>
    var myIcon = new BMap.Icon("<?php echo $value['background']; ?>", new BMap.Size(300,157));
    var marker = new BMap.Marker(new BMap.Point(<?php echo $value['poi']; ?>),{icon:myIcon}); //创建marker对象
    <?php }else{ ?>
    var marker = new BMap.Marker(new BMap.Point(<?php echo $value['poi']; ?>)); //创建marker对象
    <?php } ?>
    marker.addEventListener("click", function(e){
      if($('.BMapLib_SearchInfoWindow').attr('class') == 'undefined' || !$('.BMapLib_SearchInfoWindow').attr('class')){
        console.log($('.BMapLib_SearchInfoWindow').attr('class'));
        searchInfoWindow[<?php echo $key; ?>].open(marker);
      }else{
        $('.BMapLib_SearchInfoWindow').remove();
      }
    })

    map.addOverlay(marker); //在地图中添加marker
    <?php }} ?>

    var scaleControl = new BMap.ScaleControl({anchor:BMAP_ANCHOR_BOTTOM_LEFT});
    scaleControl.setUnit(BMAP_UNIT_IMPERIAL);
    map.addControl(scaleControl);
    var navControl = new BMap.NavigationControl({anchor:BMAP_ANCHOR_TOP_LEFT,type:BMAP_NAVIGATION_CONTROL_LARGE});
    map.addControl(navControl);



</script>
<style type="text/css">  
   .anchorBL{  display:none;  } 
   .BMapLib_SearchInfoWindow{ border: 8px solid #4dbec7; border-radius: 5px; }
   .BMap_bubble_content{  width:100px;  } 
   .BMapLib_bubble_top{ display:; }
   .BMapLib_trans{ display:none; }
   .BMapLib_sendToPhone{ display: none; }
   .BMapLib_bubble_content{ min-height:190px;  }
   .BMapLib_SearchInfoWindow .BMapLib_bubble_content{ padding: 0px; }
   .m_info_b>ul>li>a{ display: block; }
   .BMapLib_SearchInfoWindow .BMapLib_bubble_top{ width: 100%;  height: 2em;line-height: 2em;text-indent: 1em;background: rgba(254,252,252,.5); position: absolute;
    /* older safari/Chrome browsers */
    -webkit-opacity: 0.8;
    /* Netscape and Older than Firefox 0.9 */
    -moz-opacity: 0.8;
    /* Safari 1.x (pre WebKit!) 老式khtml内核的Safari浏览器*/
    -khtml-opacity: 0.8;
    /* IE9 + etc...modern browsers */
    opacity: .8;
    /* IE 4-9 */
    filter:alpha(opacity=80);
    /*This works in IE 8 & 9 too*/
    -ms-filter:progid:DXImageTransform.Microsoft.Alpha(Opacity=50);
    /*IE4-IE9*/
    filter:progid:DXImageTransform.Microsoft.Alpha(Opacity=50);
   }
</style>  
    </body>
</html>