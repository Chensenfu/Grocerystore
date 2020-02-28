<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2020/2/28
  Time: 13:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>自营</title>
    <!-- <link rel="stylesheet" type="text/css" href="css/renqi.css"/> -->
    <link rel="stylesheet" type="text/css" href="css/tongyong.css"/>
    <link rel="stylesheet" type="text/css" href="css/daohang.css"/>
    <link rel="stylesheet" type="text/css" href="css/head.css"/>
    <link rel="stylesheet" type="text/css" href="css/公用-尾部.css"/>

    <style type="text/css">
        /* 小火箭css */
        #gotop1 {
            width: 80px;
            position: fixed;
            bottom: 90px;
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
    <script src="http://cdn.bootcss.com/gsap/1.19.0/plugins/ScrollToPlugin.min.js"></script>
    <script type="text/javascript">
        /* 选择你喜欢的速度类型，复制下面的某段代码即可。不明处请咨询：qpjk.cc */
        $(function() {
            // 返回顶部，绑定gotop1图标和gotop2文字事件
            $("#gotop1").click(function(e) {
                TweenMax.to(window, 1.5, {scrollTo:0, ease: Expo.easeInOut});
                var huojian = new TimelineLite();
                huojian.to("#gotop1", 1, {rotationY:720, scale:0.6, y:"+=40", ease:  Power4.easeOut})
                    .to("#gotop1", 1, {y:-1000, opacity:0, ease:  Power4.easeOut}, 0.6)
                    .to("#gotop1", 1, {y:0, rotationY:0, opacity:1, scale:1, ease: Expo.easeOut, clearProps: "all"}, "1.4");
            });
        });
        $.getJSON("shopping/queryziying",function (data) {

            var str ="";
            $(data).each(function () {
                str +=  "<div class=\"pic-wrapper\">" +
                    "<a href=\"xiangqingye.jsp?id="+this.shopId+"\" class=\"goods-item\">" +
                    "<img class=\"pis\" src=\"img/"+this.img.img+"\" alt=\"\">" +
                    "<p class=\"goods-name\">"+this.shopName+"</p>" +
                    "<div class=\"price-wrapper\">"+"￥"+this.price+"</div>" +
                    "<p class=\"zi\">" + (this.shoppingTyp.typeId==1?"自营":"严选") + "</p>"+
                    "</a>"+
                    "</div>"
            })
            $("#sss ").empty().append(str);
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
            <input type="text" name="words"  value="" onclick="window.location.href='findshop.jsp'" />
            <input type="button" name="see"  value="搜索" />

        </div>

        <a href="gouwuche.jsp" class="aone">购物车</a>
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


<div class="b">

    <div class="ziying">
        <div class="ziyinga">
            <p class="cc">自营</p>
        </div>
        <div class="ziyingb" id="sss">
            <!-- <div class="inner goods-list"> -->
            <div class="pic-wrapper">
                <a href="#" class="goods-item">
                    <img class="pis" src="img/lexiguan.jpg" alt="">
                    <p class="goods-name">cc乐吸管糖棒棒 一袋</p>
                    <div class="price-wrapper">￥2.80</div>
                    <p class="zi">自营</p>
                </a>
            </div>
            <div class="pic-wrapper">
                <a href="#" class="goods-item">

                    <img class="pis" src="img/liziyuan.jpg" alt="">
                    <p class="goods-name">李子园 10瓶装</p>
                    <div class="price-wrapper">￥21.00</div>
                    <p class="zi">自营</p>
                </a>
            </div>
            <div class="pic-wrapper">
                <a href="#" class="goods-item">

                    <img class="pis" src="img/xiaobawang1.jpg" alt="">
                    <p class="goods-name">小当家 一箱*24</p>
                    <div class="price-wrapper">￥22.80</div>
                    <p class="zi">自营</p>
                </a>
            </div>
            <div class="pic-wrapper">
                <a href="#" class="goods-item">

                    <img class="pis" src="img/shaladou.png" alt="">
                    <p class="goods-name">砂拉豆砂拉豆</p>
                    <div class="price-wrapper">￥9.88</div>
                    <p class="zi">自营</p>
                </a>
            </div>
            <div class="pic-wrapper">
                <a href="#" class="goods-item">
                    <img class="pis" src="img/xiaomiguoba.jpg alt="">
                    <p class="goods-name">小米锅巴虾条美食 25克*20包</p>
                    <div class="price-wrapper">￥9.90</div>
                    <p class="zi">自营</p>

                </a>
            </div>
            <div class="pic-wrapper">
                <a href="#" class="goods-item">
                    <img class="pis" src="img/xiangyan.jpg" alt="">
                    <p class="goods-name">香烟糖果</p>
                    <div class="price-wrapper">￥12.80</div>
                    <p class="zi">自营</p>
                </a>
            </div>

            <div class="pic-wrapper">
                <a href="#" class="goods-item">
                    <img class="pis" src="img/hupo.jpg" alt="">
                    <p class="goods-name">琥珀小锅巴</p>
                    <div class="price-wrapper">￥17.80</div>
                    <p class="zi">自营</p>
                </a>
            </div>
            <div class="pic-wrapper">
                <a href="#" class="goods-item">
                    <img class="pis" src="img/maixiaodai.jpg" alt="">
                    <p class="goods-name">麦小呆大辣片</p>
                    <div class="price-wrapper">￥19.80</div>
                    <p class="zi">自营</p>
                </a>
            </div>
            <div class="pic-wrapper">
                <a href="#" class="goods-item">
                    <img class="pis" src="img/dabaitu.jpg" alt="">
                    <p class="goods-name">大白兔牛奶糖</p>
                    <div class="price-wrapper">￥19.90</div>
                    <p class="zi">自营</p>
                </a>
            </div>
            <div class="pic-wrapper">
                <a href="#" class="goods-item">
                    <img class="pis" src="img/yigencong.png" alt="">
                    <p class="goods-name">一根葱干吃面</p>
                    <div class="price-wrapper">￥26.38</div>
                    <p class="zi">自营</p>
                </a>
            </div>
            <div class="pic-wrapper">
                <a href="#" class="goods-item">

                    <img class="pis" src="img/maixiaodai.jpg" alt="">
                    <p class="goods-name">麦小呆大辣片 </p>
                    <div class="price-wrapper">￥19.80</div>
                    <p class="zi">自营</p>
                </a>
            </div>



        </div>
        <!-- </div> -->

    </div>
</div>



<!-- 为尔自营 end -->
<div id="123">


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
</div>

<div class="htmleaf-container">
    <!-- 右侧小火箭图标返回顶部 -->
    <div id="shangxia2">
					<span id="gotop1">
						<img src="img/huojian.svg" alt="返回顶部小火箭">
                        <!-- <img src="img/rocked.png" alt="返回顶部小火箭"> -->
					</span>
    </div>
</div>
</body>
</html>
