<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="user-scalable=no" />
        <title><?php echo $data['title']; ?></title>
        <link rel="stylesheet" href="/css/index.css" />
        <link rel="stylesheet" href="/css/swiper.min.css" />
        <script src="/js/jquery191.js"></script>
        <script src="http://res.wx.qq.com/open/js/jweixin-1.2.0.js"></script>
        <script type="text/javascript">
            wx.config({
                debug: true, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
                appId: '<?php echo $wx['appId']; ?>', // 必填，公众号的唯一标识
                timestamp: <?php echo $wx['timestamp']; ?>, // 必填，生成签名的时间戳
                nonceStr: '<?php echo $wx['nonceStr']; ?>', // 必填，生成签名的随机串
                signature: '<?php echo $wx['signature']; ?>',// 必填，签名，见附录1
                jsApiList: [openLocation] // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
            });
        </script>
    </head>
    <body>
        <input type="hidden" name="id" value="<?php echo $id; ?>">
        <div class="swiper-container">
            <div class="swiper-wrapper">
                <?php if($data['album']){ foreach($data['album'] as $value){ ?>
                    <div class="swiper-slide" style="background-image: url(<?php echo $value['url']; ?>)"></div>
                <?php }} ?>
            </div>
            <!-- Add Pagination -->
            <div class="swiper-pagination"></div>
            <!-- Add Arrows -->
            <!--<div class="swiper-button-next"></div>
            <div class="swiper-button-prev"></div>-->
            <p class="h_text">
                <?php echo $data['title']; ?>
            </p>
        </div>
        <div class="map">
            <a href="javascript:;" onclick="getNav(<?php echo $data['lng']},{{$data['lat']; ?>,<?php echo $data['address']; ?>)">
                <h2><?php if($data['address']){ ?><?php echo $data['address']; ?><?php }else{ ?>景区地址<?php } ?></h2>
            </a>
        </div>
        <div class="content">
            <ul class="tab">
                <li class="active"><a href="#">简介<i></i></a></li>
                <li><a href="<?php echo url('show_map',array('id'=>$id)); ?>">导览<i></i></a></li>
                <li><a href="#">交通<i></i></a></li>
                <li><a href="#">留言区<i></i></a></li>
            </ul>
            <div id="c_box">
                <div class="desc show desc_s">
                    <?php echo $data['content']; ?>
                </div>
                <div class="desc">
                </div>
                <div class="desc">
                    <?php echo $data['traffic']; ?>
                </div>
                <div class="desc">
                    <ul class="d_yx clearfix">
                        <?php if($data['comment']){ foreach($data['comment'] as $value){ ?>
                        <li><?php echo $value; ?></li>
                        <?php }} ?>
                    </ul>   
                    <form action="#" method="post" id="dis_sub">
                        <input type="text" />
                        <input type="button" value="发送" id="add_yx"/>
                    </form>
            </div>
            
        </div>
        </div>
        <script src="/js/swiper.min.js"></script>
        <script>
            var swiper = new Swiper('.swiper-container', {
                pagination: '.swiper-pagination',
                nextButton: '.swiper-button-next',
                prevButton: '.swiper-button-prev',
                paginationClickable: true,
                spaceBetween: 30,
                centeredSlides: true,
                autoplay: 2500,
                autoplayDisableOnInteraction: false
            });
        </script>
        <script>
            $(function(){
                $('.tab >li').click(function(){
                    $(this).addClass('active').siblings().removeClass('active');
                    $('#c_box').find('.desc').eq($(this).index()).addClass('show').siblings().removeClass('show')
                });
                
                $('#add_yx').click(function(){
                    var id = $('input[name=id]').val();
                    var _text = $(this).parents('form').find(':text').val();
                    $.post('/frame/index.php?c=spot&a=add_comment',{id:id,content:_text},function(result){
                        alert(result.msg);
                        /*if(result.status){
                            var oLi = '<li>'+_text+'</li>';
                            $(this).find('ul.d_yx').append(oLi);
                        }*/
                    },'json');
                    
                })
            })
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
            }
        </script>
    </body>
</html>
