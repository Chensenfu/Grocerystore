<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2020/2/28
  Time: 13:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>首页</title>

    <link rel="stylesheet" type="text/css" href="css/head.css" />
    <link rel="stylesheet" type="text/css" href="css/daohang.css" />
    <link rel="stylesheet" type="text/css" href="css/lunbo.css" />
    <link rel="stylesheet" type="text/css" href="css/tongyong.css" />
    <link rel="stylesheet" type="text/css" href="css/公用-尾部.css"/>
    <link rel="stylesheet" type="text/css" href="css/normalize.css" />
    <!--CSS RESET-->
    <link href="css/jquery.easy_slides.css" rel="stylesheet" type="text/css" />
    <link href="css/kf.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        /* 小火箭css */
        #gotop1 {
            width: 80px;
            position: fixed;
            bottom: 30px;
            cursor: pointer;
            z-index: 99998;
            right: 50%;
            margin-right: -620px;
        }
        /* 小火箭悬停特效 */
        #gotop1:hover {
            animation: rubberBand 1s;
        }

        @keyframes rubberBand {
            from {
                transform: scale3d(1, 1, 1);
            }

            30% {
                transform: scale3d(1.25, 0.75, 1);
            }

            40% {
                transform: scale3d(0.75, 1.25, 1);
            }

            50% {
                transform: scale3d(1.15, 0.85, 1);
            }

            65% {
                transform: scale3d(.95, 1.05, 1);
            }

            75% {
                transform: scale3d(1.05, .95, 1);
            }

            to {
                transform: scale3d(1, 1, 1);
            }
        }
    </style>
    <script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
    <script src="http://libs.useso.com/js/jquery/1.11.0/jquery.min.js" type="text/javascript"></script>
    <script>window.jQuery || document.write('<script src="js/jquery-1.11.0.min.js"><\/script>')</script>
    <script src="http://cdn.bootcss.com/gsap/1.19.0/TweenMax.min.js"></script>
    <script src="js/jq22.js"></script>
    <script src="http://cdn.bootcss.com/gsap/1.19.0/plugins/ScrollToPlugin.min.js"></script>

    <script src="http://cdn.bootcss.com/jquery/1.11.0/jquery.min.js" type="text/javascript"></script>
    <script>
        window.jQuery || document.write('<script src="js/jquery-1.11.0.min.js"><\/script>')
    </script>
    <script src="js/jquery.easy_slides.js"></script>
    <script type="text/javascript">
        $(function() {
            $("#gotop1").click(function(e) {
                TweenMax.to(window, 1.5, {scrollTo:0, ease: Expo.easeInOut});
                var huojian = new TimelineLite();
                huojian.to("#gotop1", 1, {rotationY:720, scale:0.6, y:"+=40", ease:  Power4.easeOut})
                    .to("#gotop1", 1, {y:-1000, opacity:0, ease:  Power4.easeOut}, 0.6)
                    .to("#gotop1", 1, {y:0, rotationY:0, opacity:1, scale:1, ease: Expo.easeOut, clearProps: "all"}, "1.4");
            })
            //查询自营商品
            $.getJSON("shopping/queryziying",function (data) {

                var str ="";
                $(data).each(function () {
                    str +=  "<div class=\"pic-wrapper\">" +
                        "<a href=\"xiangqingye.jsp?id="+this.shopId+"\" class=\"goods-item\">" +
                        "<img class=\"pic\" src=\"img/"+this.img.img+"\" alt=\"\">" +
                        "<p class=\"goods-name\">"+this.shopName+"</p>" +
                        "<div class=\"price-wrapper\">"+"￥"+this.price+"</div>" +
                        "</a>"+
                        "</div>"
                })
                $("#shen ").empty().append(str);
            })
            $.getJSON("shopping/queryyanxuan",function (data) {
                var even ="";
                $(data).each(function () {
                    even +="<div class=\"pic-wrapper\">" +
                        "<a href=\"xiangqingye.jsp?id="+this.shoopId+"\" class=\"goods-item\">" +
                        "<img class=\"pic\" src=\"img/"+this.img.img+"\" alt=\"\">" +
                        "<p class=\"goods-name\">"+this.shopName+"</p>" +
                        "<div class=\"price-wrapper\">"+"￥"+this.price+"</div>" +
                        "</a>" +
                        "</div>"
                })
                $("#she").empty().append(even);
            })
        })
        $(document).ready(function() {
            $('.slider_one_big_picture').EasySlides({
                'autoplay': true,
                'stepbystep': false,
                'show': 5,
                'loop': true
            })
            $('.slider_one_big_2').EasySlides({
                'autoplay': false,
                'stepbystep': true,
                'show': 5,
                'loop': true
            })
            $('.slider_circle_10').EasySlides({
                'autoplay': true,
                'show': 13
            })
            $('.slider_four_in_line').EasySlides({
                'autoplay': true,
                'show': 9
            })
            $('.slider_clock').EasySlides({
                'autoplay': true,
                'stepbystep': false,
                'show': 15
            })



        })
        //退出登录
        function exit(){
            if(confirm("确认退出吗？")){
                $.getJSON("exit/exit",function(data){
                    if (data){
                        window.location.reload();
                    }
                })
            }
        }
        function gomycenter() {
            var username =$(".headone").find(".username").length;
            if (username==0){
                if (confirm("请先登录！")){
                    window.location.href="login.jsp";
                }
            }
        }
        function gomycar() {
            var username =$(".headone").find(".username").length;
            if (username==0){
                if (confirm("请先登录！")){
                    window.location.href="login.jsp";
                }
            }
        }

    </script>
</head>
<body>
<!-- 首页头部 -->
<!-- 首页头部 -->
<div class="first">
    <div class="headone">
        <span>欢迎来到皆有杂货铺！</span>
        <c:if test="${username == null}">
            <a href="login.jsp" class="q">
                <h4>请登录</h4>
            </a>
        </c:if>
        <c:if test="${username != null}">
            欢迎：<span>${username}</span>&nbsp;&nbsp;<a href="javascript:exit()">退出登录</a>
        </c:if>
        <a href="login.jsp"><span>快速注册</span></a>
    </div>
    <div class="headtwo">
        <a href="javascript:gomycenter()">
            <h5>我的杂货铺</h5>
        </a>&nbsp;&nbsp;&nbsp;
        <span>客服热线：<h4>4008-916-999</h4></span>&nbsp;&nbsp;
        <span>杂货铺承诺&nbsp;&nbsp;&nbsp;产品体验&nbsp;&nbsp;&nbsp;厂家资源&nbsp;&nbsp;&nbsp;帮助中心</span>
    </div>
</div>


<form action="" method="post">
    <div class="firstone">
        <img src="img/logo1.jpg" class="imgone">
        <div class="inputone">
            <input type="text" name="words" onclick="window.location.href='findshop.jsp'"/>
            <input type="button" name="see"  value="搜索" />

        </div>

        <a href="javascript:gomycar()" class="aone">购物车</a>
    </div>
</form>

<!-- 头部导航栏 -->
<div class="hdnav">
    <div class="hdnav-inner">
        <ul class="hdnav-list">

            <li class="hdnav-item hdnav-list-menu">
                <a class="link" href="#"><i class="hdnav-menu-icon"></i>全部分类</a>
                <div class="nav-down">
                    <div class="nav-box-hot">
                        <ul class="nav-hot-list">
                            <li class="nav-list" name="nav_show" data-id="nav_li_hover2">
                                <div class="hover-list">
                                    <a href="ziying.jsp">吃货联盟</a>
                                </div>
                                <div id="nav_li_hover2" class="nav-box-show">
                                    <div class="item-box">
                                        <div class="item-list">
                                            <ul>
                                                <li><a href="#">大白兔牛奶糖</a></li>
                                                <li><a href="#">琥珀小米锅巴</a></li>
                                                <li><a href="#">一根葱干吃面</a></li>
                                                <li><a href="#">砂拉豆</a></li>
                                                <li><a href="##">李子园</a></li>
                                                <li><a href="#">小当家 </a></li>
                                                <li><a href="#">乐吸管糖</a></li>
                                                <li><a href="#">牛羊配</a></li>
                                                <li><a href="#">香烟糖果</a></li>
                                                <li><a href="#">麦小呆大辣片</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li class="nav-list" name="nav_show" data-id="nav_li_hover2">
                                <div class="hover-list">
                                    <a href="yanxuan.jsp">玩家国度</a>
                                </div>
                                <div id="nav_li_hover2" class="nav-box-show">

                                    <div class="item-box">
                                        <div class="item-list">
                                            <ul>
                                                <li><a href="#">挑棍子游戏棒</a></li>
                                                <li><a href="#">多头积木笔</a></li>
                                                <li><a href="恶搞小猪.html">恶搞粉小猪</a></li>
                                                <li><a href="#">溜溜球</a></li>
                                                <li><a href="#">游戏王卡牌</a></li>
                                                <li><a href="#">魔法圣诞树</a></li>
                                                <li><a href="惊喜盒.html">惊喜盒</a></li>
                                                <li><a href="#">四驱车</a></li>
                                                <li><a href="#">弹珠</a></li>
                                                <li><a href="#">GBA掌机</a></li>
                                                <li><a href="#">麦小呆大辣片</a></li>
                                                <li><a href="#">乐吸管糖</a></li>
                                                <li><a href="#">大白兔</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li class="nav-list" name="nav_show" data-id="nav_li_hover2">
                                <div class="hover-list">
                                    <a href="zhuanqu.jsp">精品专区</a>
                                </div>
                                <div id="nav_li_hover2" class="nav-box-show">

                                    <div class="item-box">
                                        <div class="item-list">
                                            <ul>
                                                <li><a href="恶搞小猪.html">恶搞粉小猪</a></li>
                                                <li><a href="惊喜盒.html">惊喜盒</a></li>
                                                <li><a href="#">魔法圣诞树</a></li>
                                                <li><a href="小霸王.html">小霸王游戏机</a></li>
                                                <li><a href="#">琥珀小米锅巴</a></li>
                                                <li><a href="#">一根葱干吃面</a></li>
                                                <li><a href="#">砂拉豆</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li class="nav-list" name="nav_show" data-id="nav_li_hover2">
                                <div class="hover-list">
                                    <a href="敬请期待.html">敬请期待</a>
                                </div>
                                <div id="nav_li_hover2" class="nav-box-show">
                                    <div class="item-box">
                                        <div class="item-list">
                                            <ul>
                                                <li><a href="#">钱包</a></li>
                                                <li><a href="#">单肩包</a></li>
                                                <li><a href="#">双肩包</a></li>
                                                <li><a href="#">腰带腕表</a></li>
                                                <li><a href="#">拖鞋</a></li>
                                                <li><a href="#">旅行箱</a></li>
                                                <li><a href="#">耳环/项链</a></li>
                                                <li><a href="#">鞋配</a></li>
                                                <li><a href="#">水桶包</a></li>
                                                <li><a href="#">手拿包</a></li>
                                                <li><a href="#">手提包</a></li>
                                                <li><a href="#">眼镜/墨镜</a></li>
                                                <li><a href="#">围巾/方巾</a></li>
                                                <li><a href="#">女鞋</a></li>
                                                <li><a href="#">帽子/手套</a></li>
                                                <li><a href="#">男鞋</a></li>
                                                <li><a href="#">男装</a></li>
                                                <li><a href="#">男/女士内裤</a></li>
                                                <li><a href="#">女装</a></li>
                                                <li><a href="#">女士内衣</a></li>
                                                <li><a href="#">手链/手镯</a></li>
                                                <li><a href="#">短袜/裤袜</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li class="nav-list" name="nav_show" data-id="nav_li_hover2">
                                <div class="hover-list">
                                    <a href="敬请期待.html">敬请期待</a>
                                </div>
                                <div id="nav_li_hover2" class="nav-box-show">
                                    <div class="item-box">
                                        <div class="item-list">
                                            <ul>
                                                <li><a href="#">眼罩</a></li>
                                                <li><a href="#">雨伞</a></li>
                                                <li><a href="#">汽车养护</a></li>
                                                <li><a href="#">户外/运动</a></li>
                                                <li><a href="#">家饰</a></li>
                                                <li><a href="#">家具家装</a></li>
                                                <li><a href="#">烹饪锅具</a></li>
                                                <li><a href="#">镜子</a></li>
                                                <li><a href="#">餐厨清洁</a></li>
                                                <li><a href="#">衣物清洁</a></li>
                                                <li><a href="#">宠物生活</a></li>
                                                <li><a href="#">鞋类保养</a></li>
                                                <li><a href="#">口腔护理</a></li>
                                                <li><a href="#">女性护理</a></li>
                                                <li><a href="#">家庭/个人清洁</a></li>
                                                <li><a href="#">头梳/发饰</a></li>
                                                <li><a href="#">水具杯壶</a></li>
                                                <li><a href="#">香皂</a></li>
                                                <li><a href="#">收纳日用</a></li>
                                                <li><a href="#">凉晒除味</a></li>
                                                <li><a href="#">电源插</a></li>
                                                <li><a href="#">餐具刀具</a></li>
                                                <li><a href="#">地毯</a></li>
                                                <li><a href="#">纸巾</a></li>
                                                <li><a href="#">湿巾</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li class="nav-list" name="nav_show" data-id="nav_li_hover2">
                                <div class="hover-list">
                                    <a href="敬请期待.html">敬请期待</a>
                                </div>
                                <div id="nav_li_hover2" class="nav-box-show">

                                    <div class="item-box">
                                        <div class="item-list">
                                            <ul>
                                                <li><a href="#">粮油米面</a></li>
                                                <li><a href="#">奶粉/麦片</a></li>
                                                <li><a href="#">糖果</a></li>
                                                <li><a href="#">茶叶</a></li>
                                                <li><a href="#">代用茶</a></li>
                                                <li><a href="#">蜂蜜</a></li>
                                                <li><a href="#">面包糕点</a></li>
                                                <li><a href="#">酱料</a></li>
                                                <li><a href="#">咖啡</a></li>
                                                <li><a href="#">酒水</a></li>
                                                <li><a href="#">休闲零食</a></li>
                                                <li><a href="#">饮品</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li class="nav-list" name="nav_show" data-id="nav_li_hover2">
                                <div class="hover-list">
                                    <a href="敬请期待.html">敬请期待</a>
                                </div>
                                <div id="nav_li_hover2" class="nav-box-show">
                                    <div class="item-box">
                                        <div class="item-list">
                                            <ul>
                                                <li><a href="#">皮肤护理</a></li>
                                                <li><a href="#">儿童玩具</a></li>
                                                <li><a href="#">妈咪用品</a></li>
                                                <li><a href="#">奶瓶/配件</a></li>
                                                <li><a href="#">儿童保温杯</a></li>
                                                <li><a href="#">儿童服饰</a></li>
                                                <li><a href="#">围兜</a></li>
                                                <li><a href="#">洗护</a></li>
                                                <li><a href="#">纸尿裤</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li class="nav-list" name="nav_show" data-id="nav_li_hover2">
                                <div class="hover-list">
                                    <a href="敬请期待.html">敬请期待</a>
                                </div>
                                <div id="nav_li_hover2" class="nav-box-show">
                                    <div class="item-box">
                                        <div class="item-list">
                                            <ul>
                                                <li><a href="#">枕头抱枕</a></li>
                                                <li><a href="#">被芯</a></li>
                                                <li><a href="#">床上单品</a></li>
                                                <li><a href="#">毛巾</a></li>
                                                <li><a href="#">浴巾</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li class="nav-list" name="nav_show" data-id="nav_li_hover2">
                                <div class="hover-list">
                                    <a href="敬请期待.html">敬请期待</a>
                                </div>
                                <div id="nav_li_hover2" class="nav-box-show">
                                    <div class="item-box">
                                        <div class="item-list">
                                            <ul>
                                                <li><a href="#">喷剂</a></li>
                                                <li><a href="#">膏药</a></li>
                                                <li><a href="#">营养补充剂</a></li>
                                                <li><a href="#">胶囊</a></li>
                                                <li><a href="#">护理理疗</a></li>
                                                <li><a href="#">压片糖果含片</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </li>
            <li class="hdnav-item active">
                <a class="link" href="index.jsp">首页</a>
            </li>
            <li class="hdnav-item">
                <a class="link" href="ziying.jsp">自营</a>

            </li>
            <li class="hdnav-item">
                <a class="link" href="yanxuan.jsp">严选</a>

            </li>
            <li class="hdnav-item">

                <a class="link" href="zhuanqu.jsp">专区</a>
            </li>
        </ul>
    </div>
</div>
<!-- 头部导航栏 end -->
<!-- 轮播图 -->
<div class="viewport">
    <input type="radio" name="slider" id="pic1" checked>
    <input type="radio" name="slider" id="pic2">
    <input type="radio" name="slider" id="pic3">
    <div class="wrap">
        <img src="img/1556444890_f87.jpg" alt="">
        <img src="img/1577505150_ef4.jpg" alt="">
        <img src="img/1556445116_60r.jpg" alt="">


    </div>
    <div class="page">
        <label for="pic1"></label>
        <label for="pic2"></label>
        <label for="pic3"></label>
    </div>
</div>
<!-- 轮播图end -->
<!--人气推荐 -->
<div class="htmleaf-container">
    <div class="htmleaf-content">

        <div>
            <p class="renqi">人气推荐 </p>
        </div>
        <!-- <h2>4 in line</h2> -->
        <div class="slider slider_four_in_line">
            <div>
                <div class="goods-item-inner">
                    <img class="picc" src="img/hupo.jpg" alt="">
                    <p class="price">￥17.80</p>
                    <p class="goods-name">琥珀小锅巴</p>
                </div>
            </div>
            <div>
                <div class="goods-item-inner">
                    <img class="picc" src="img/⁮xiaozhu1.jpg" alt="">
                    <p class="price">￥25.00</p>
                    <p class="goods-name">恶搞粉小猪</p>
                </div>

            </div>
            <div>
                <div class="goods-item-inner">
                    <img class="picc" src="img/dabaitu.jpg" alt="">
                    <p class="price">￥19.90</p>
                    <p class="goods-name">大白兔牛奶糖</p>
                </div>
            </div>
            <div>
                <div class="goods-item-inner">
                    <img class="picc" src="img/xiaodangjia.jpg" alt="">
                    <p class="price">￥22.80</p>
                    <p class="goods-name">小当家 一箱*24</p>
                </div>
            </div>
            <div>
                <div class="goods-item-inner">
                    <img class="picc" src="img/maixiaodai.jpg" alt="">
                    <p class="price">￥19.80</p>
                    <p class="goods-name">麦小呆大辣片</p>
                </div>
            </div>
            <div>
                <div class="goods-item-inner">
                    <img class="picc" src="img/youyouqiu.jpg" alt="">
                    <p class="price">￥25.00</p>
                    <p class="goods-name">溜溜球youyou球</p>
                </div>
            </div>
            <div>
                <div class="goods-item-inner">
                    <img class="picc" src="img/shengdanshu.jpg" alt="">
                    <p class="price">￥30.00</p>
                    <p class="goods-name">魔法圣诞树</p>
                </div>
            </div>
            <div>
                <div class="goods-item-inner">
                    <img class="picc" src="img/jingxihe.jpg" alt="">
                    <p class="price">￥128.00</p>
                    <p class="goods-name">jinxihe</p>
                </div>
            </div>
            <div>
                <div class="goods-item-inner">
                    <img class="picc" src="img/xiaomiguoba.jpg" alt="">
                    <p class="price">￥9.90</p>
                    <p class="goods-name">小米锅巴虾条美食 25克*20包</p>
                </div>
            </div>
            <!-- <div class="next_button"></div>
            <div class="prev_button"></div> -->
        </div>
    </div>
</div>



<!--人气推荐 end-->

<div class="b">


    <!-- <div class="itemwrap"> -->
    <!-- 为尔自营 -->
    <div class="ziying">
        <div class="ziyinga">
            <p class="cc">自营</p>
        </div>
        <div class="ziyingb" id="shen">
            <!-- <div class="inner goods-list"> -->





        </div>
        <!-- </div> -->

    </div>




    <!-- 为尔自营 end -->




    <div class="ziying">
        <div class="ziyinga">
            <p class="cc">严选</p>
        </div>
        <div class="ccc">


            <div class="ziyingb" id="she">
                <!-- <div class="inner goods-list"> -->

            </div>
        </div>


    </div>




</div>

<!-- 为尔严选 end -->
<!-- 尾部 -->
<div class="gongyong-footsum">
    <div class="gongyong-footzong">
        <ul class="gongyong-footdul">
            <li>
                <img src="img/21.png" >
                <p class="gongyong-p">严筛精选 品质保证</p><br>
                <p class="gongyong-q">用心为您挑选产品</p>
            </li>
            <li>
                <img src="img/22.png" >
                <p class="gongyong-p">特产100%原产地直采</p><br>
                <p class="gongyong-q">确保产品的原汁原味</p>
            </li>
            <li>
                <img src="img/23.png" >
                <p class="gongyong-p">售后无忧</p><br>
                <p class="gongyong-q">7天免费退换货</p>
            </li>
            <li>
                <img src="img/24.png" >
                <p class="gongyong-p">多仓直发，极速配送</p><br>
                <p class="gongyong-q">收货时间更快速，用心为您服务</p>
            </li>
        </ul>
    </div>
</div>
<div class="gongyong-foot">
    <div class="gongyong-footone">
        <dl>
            <dt><strong>购物保障</strong></dt>
            <dd><a href="#">自营商品退换货总则</a></dd>
            <dd><a href="#">严选商品退货总则</a></dd>
            <dd><a href="#">退换货流程</a></dd>
            <dd><a href="#">服务承诺</a></dd>
        </dl>
        <dl>
            <dt><strong>新手上路</strong></dt>
            <dd><a href="#">支付方式</a></dd>
            <dd><a href="#">注意事项</a></dd>
        </dl>
        <dl>
            <dt><strong>物流配送</strong></dt>
            <dd><a href="#">验货与签收</a></dd>
            <dd><a href="#">换货规范</a></dd>
        </dl>
        <dl>
            <dt><strong>关于我们</strong></dt>
            <dd><a href="#">联系我们</a></dd>
            <dd><a href="#">诚聘英才</a></dd>
            <dd><a href="#">服务协议</a></dd>
        </dl>
        <dl>
            <dt><strong>营业执照</strong></dt>
            <dd><span class="gongyong-footimg1"><img src="img/denglu.png" ></span></dd>
        </dl>
        <div class="gongyong-foot-last">
            <dl>
                <dt><strong>关注我们</strong></dt>
                <li><span class="gongyong-footimg2"><img src="img/erweima.png" ></span></li>
            </dl>
        </div>
    </div>
</div>
<div class="gongyong-foottwo">
    <p class="gongyong-footp1"> 粤ICP备14021738号-1&nbsp;&nbsp;粤工商备P191810000024 </p>
    <p class="gongyong-footp2">Copyright &copy; 东莞市长勋电子商务有限公司 2013-现在 版权所有 </p>
</div>
<!-- 尾部结束 -->
<div class="htmleaf-container">
    <!-- 右侧小火箭图标返回顶部 -->
    <div id="shangxia2">
					<span id="gotop1">
						<img src="img/huojian.svg" alt="返回顶部小火箭">
                        <!-- <img src="img/rocked.png" alt="返回顶部小火箭"> -->
					</span>
    </div>
</div>
<div class="main-im">
    <div id="open_im" class="open-im">
        &nbsp;
    </div>
    <div class="im_main" id="im_main">
        <div id="close_im" class="close-im">
            <a href="javascript:void(0);" title="点击关闭">&nbsp;</a>
        </div>
        <a href="http://wpa.qq.com/msgrd?v=3&uin=984180458&site=qq&menu=yes" target="_blank" class="im-qq qq-a" title="在线QQ客服">
            <div class="qq-container">
            </div>
            <div class="qq-hover-c">
                <img class="img-qq" src="images/qq.png">
            </div>
            <span> QQ在线咨询</span> </a>
        <div class="im-tel">
            <div>
                售前咨询热线
            </div>
            <div class="tel-num">
                400-123-45678
            </div>
            <div>
                售后咨询热线
            </div>
            <div class="tel-num">
                010-12345678
            </div>
        </div>
        <div class="im-footer" style="position:relative">
            <div class="weixing-container">
                <div class="weixing-show">
                    <div class="weixing-txt">
                        微信扫一扫<br>
                        关注jQuery插件库
                    </div>
                    <img class="weixing-ma" src="images/weixing-ma.jpg">
                    <div class="weixing-sanjiao">
                    </div>
                    <div class="weixing-sanjiao-big">
                    </div>
                </div>
            </div>
            <div class="go-top">
                <a href="javascript:;" title="返回顶部"></a>
            </div>
            <div style="clear:both">
            </div>
        </div>
    </div>
</div>

</body>
</html>
