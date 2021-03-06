<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
        <link rel="stylesheet" href="/css/index.css" />
        <link rel="stylesheet" href="http://api.map.baidu.com/library/SearchInfoWindow/1.5/src/SearchInfoWindow_min.css" />
        <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=AXWTyFPiM2Ao2PmIyKlUSXYvRG2obctc"></script>
        <script type="text/javascript" src="http://api.map.baidu.com/library/SearchInfoWindow/1.5/src/SearchInfoWindow_min.js"></script>
        <title>旅游地图导视</title>
    </head>

    <body>
        <header class="header">
            <h1>旅游地图导视</h1>
        </header>
        <div style="width: 100%;min-height: 625px;" id="map"></div>
        <div id="tab_box">
            <div class="nav">
                <ul>
                    <li><a href="/frame/index.php?type=2">旅游景区</a></li>
                    <li><a href="/frame/index.php?type=1">旅游景点</a></li>
                </ul>
            </div>
        </div>
        <footer class="footer">
            <ul>
                <li><i class="icon1"></i>旅游景点</li>
                <li><a href="/frame/index.php?type=3"><i class="icon2"></i>特色美食</a></li>
                <li><a href="/frame/index.php?type=4"><i class="icon3"></i>民宿客栈</a></li>
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
    <?php if(!$value['is_more']){ $value['url'] = 'javascript:;';}else{ $value['url'] = '/frame/index.php?c=spot&id='.$value['id'];} ?>
    var content = '<div class="m_info_t" style="background:url(<?php echo $value['thumb']; ?>);"><!--<p class="text">美丽的兴凯湖畔</p>--></div></div><div class="m_info_b"><ul><li><a href="<?php echo $value['url']; ?>"><?php if($type == 2){ ?>景区<?php }else{ ?>景点<?php } ?>详情</a></li><li><a href="androidamap://navi?sourceApplication=appname&amp;poiname=fangheng&amp;lat=36.547901&amp;lon=104.258354&amp;dev=1&amp;style=2">到这里</a></li></ul></div>';
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
</script>
<style type="text/css">
    a:link{ text-decoration: none; }
    a:visited{ color: #000; } 
    .footer a{ color: #fff; } 
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