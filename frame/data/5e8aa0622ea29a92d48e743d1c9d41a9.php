<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="user-scalable=no" />
        <title><?php echo $data['title']; ?></title>
        <link rel="stylesheet" href="/css/index.css" />
        <link rel="stylesheet" href="/css/swiper.min.css" />
    </head>
    <body>
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
                兴凯湖
            </p>
        </div>
        <div class="map">
            <a href=""><h2>景区地图</h2></a>
        </div>
        <div class="content">
            <ul class="tab">
                <li class="active"><a href="#">简介<i></i></a></li>
                <li><a href="#">交通<i></i></a></li>
                <li><a href="#">印象<i></i></a></li>
            </ul>
            <div id="c_box">
                <div class="desc show desc_s">
                    <?php echo $data['content']; ?>
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
        <script src="/js/jquery191.js"></script>
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
                    var _text = $(this).parents('form').find(':text').val();
                    if(_text!=''){
                        var oLi = '<li>'+_text+'</li>';
                        $(this).closest('.desc').find('ul.d_yx').append(oLi);
                    }
                })
            })
        </script>
    </body>
</html>
