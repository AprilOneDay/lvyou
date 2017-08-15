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
})
</script>
<script type="text/javascript">
    // 百度地图API功能
    var map = new BMap.Map('map');
    var poi = new BMap.Point(113.165099,22.816072);
    map.centerAndZoom(poi, 13);
    map.enableScrollWheelZoom();


    <?php if($list){ foreach($list as $value){ ?>
    <?php if(!$value['is_more']){ $value['url'] = 'javascript:;';} ?>
    var content = '<a href="<?php echo $value['url']; ?>"><div class="m_info_t" style="background:url(<?php echo $value['thumb']; ?>);"><p class="text">美丽的兴凯湖畔</p></div></div><div class="m_info_b"></div>';
    //创建检索信息窗口对象
    var searchInfoWindow = null;
    searchInfoWindow = new BMapLib.SearchInfoWindow(map, content, {
            title  : '<?php echo $value['title']; ?>',       //标题
            width  : 290,                   //宽度
            height : 105,                   //高度
            panel  : "panel",               //检索结果面板
            enableAutoPan : true,           //自动平移
            searchTypes   :[
                //BMAPLIB_TAB_SEARCH,   //周边检索
                BMAPLIB_TAB_TO_HERE,  //到这里去
                BMAPLIB_TAB_FROM_HERE //从这里出发
            ]
        });
    <?php if($value['background']){ ?>
    var myIcon = new BMap.Icon("<?php echo $value['background']; ?>", new BMap.Size(300,157));
    var marker = new BMap.Marker(new BMap.Point(<?php echo $value['poi']; ?>),{icon:myIcon}); //创建marker对象
    <?php }else{ ?>
    var marker = new BMap.Marker(new BMap.Point(<?php echo $value['poi']; ?>)); //创建marker对象
    <?php } ?>
    marker.addEventListener("click", function(e){
        searchInfoWindow.open(marker);
    })

    map.addOverlay(marker); //在地图中添加marker
    <?php }} ?>

    var scaleControl = new BMap.ScaleControl({anchor:BMAP_ANCHOR_BOTTOM_LEFT});
    scaleControl.setUnit(BMAP_UNIT_IMPERIAL);
    map.addControl(scaleControl);
    var navControl = new BMap.NavigationControl({anchor:BMAP_ANCHOR_TOP_LEFT,type:BMAP_NAVIGATION_CONTROL_LARGE});
    map.addControl(navControl);

</script>
<!-- <script type="text/javascript">
//创建和初始化地图函数：
function initMap(){
  createMap();//创建地图
  setMapEvent();//设置地图事件
  addMapControl();//向地图添加控件
  addMapOverlay();//向地图添加覆盖物
}
function createMap(){ 
  map = new BMap.Map("map"); 
  map.centerAndZoom(new BMap.Point(113.165099,22.816072),13);
}

function setMapEvent(){
  map.enableScrollWheelZoom();
  map.enableKeyboard();
  map.enableDragging();
  map.enableDoubleClickZoom()
}

function addClickHandler(target,window){
  target.addEventListener("click",function(){
    target.openInfoWindow(window);
  });
}

function addMapOverlay(){
        


  var markers = [
    {content:"可以加图片么",title:"测试文字",imageOffset: {width:-46,height:-21},position:{lat:22.79635,lng:113.15705}},
    {content:"我的备注",title:"我的标记",imageOffset: {width:0,height:3},position:{lat:22.79635,lng:113.15705}},
    {content:"啊啊啊啊<img src='/images/bg1.png'/>",title:"测试2 ",imageOffset: {width:-46,height:-21},position:{lat:22.83819,lng:113.131467}}
  ];
  for(var index = 0; index < markers.length; index++ ){
    var point = new BMap.Point(markers[index].position.lng,markers[index].position.lat);
    var marker = new BMap.Marker(point,{icon:new BMap.Icon("http://api.map.baidu.com/lbsapi/createmap/images/icon.png",new BMap.Size(20,25),{
      imageOffset: new BMap.Size(markers[index].imageOffset.width,markers[index].imageOffset.height)
    })});
    var label = new BMap.Label(markers[index].title,{offset: new BMap.Size(25,5)});
    var opts = {
      width: 200,
      height : 105,              //高度
      title: markers[index].title,
      panel  : "panel",         //检索结果面板
      enableMessage: true,
      searchTypes   :[
                //BMAPLIB_TAB_SEARCH,   //周边检索
                BMAPLIB_TAB_TO_HERE,  //到这里去
                //BMAPLIB_TAB_FROM_HERE //从这里出发
            ]
    };
    var infoWindow = new BMap.InfoWindow(markers[index].content,opts);
    marker.setLabel(label);
    addClickHandler(marker,infoWindow);
    map.addOverlay(marker);
  };
}

//向地图添加控件
function addMapControl(){
  var scaleControl = new BMap.ScaleControl({anchor:BMAP_ANCHOR_BOTTOM_LEFT});
  scaleControl.setUnit(BMAP_UNIT_IMPERIAL);
  map.addControl(scaleControl);
  var navControl = new BMap.NavigationControl({anchor:BMAP_ANCHOR_TOP_LEFT,type:BMAP_NAVIGATION_CONTROL_LARGE});
  map.addControl(navControl);
}

var map;
initMap();
</script> -->
<style type="text/css">  
   .anchorBL{  display:none;  } 
   .BMap_bubble_content{  width:100px;  } 
   .BMapLib_bubble_top{ display: none; }
</style>  
    </body>
</html>