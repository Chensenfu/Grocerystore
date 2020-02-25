<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2020/2/19
  Time: 15:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <!--meta-->
    <meta charset="UTF-8">
    <!--meta END-->
    <link rel="stylesheet" type="text/css" href="css/commons.css" />
    <link rel="stylesheet" type="text/css" href="css/daohang.css"/>
    <link rel="stylesheet" type="text/css" href="css/head.css"/>
    <link rel="stylesheet" type="text/css" href="css/fly.css"/>
    <script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="js/xiangqingye.js"></script>
    <script src="js/jquery.fly.min.js"></script>
    <script src="http://libs.useso.com/js/jquery/1.11.0/jquery.min.js" type="text/javascript"></script>
    <script>window.jQuery || document.write('<script src="js/jquery-1.11.0.min.js"><\/script>')</script>
    <script src="http://cdn.bootcss.com/gsap/1.19.0/TweenMax.min.js"></script>
    <script src="http://cdn.bootcss.com/gsap/1.19.0/plugins/ScrollToPlugin.min.js"></script>
    <script type="text/javascript">
        $(function() {
            // 返回顶部，绑定gotop1图标和gotop2文字事件
            $("#gotop1").click(function(e) {
                TweenMax.to(window, 1.5, {scrollTo:0, ease: Expo.easeInOut});
                var huojian = new TimelineLite();
                huojian.to("#gotop1", 1, {rotationY:720, scale:0.6, y:"+=40", ease:  Power4.easeOut})
                    .to("#gotop1", 1, {y:-1000, opacity:0, ease:  Power4.easeOut}, 0.6)
                    .to("#gotop1", 1, {y:0, rotationY:0, opacity:1, scale:1, ease: Expo.easeOut, clearProps: "all"}, "1.4");
            });
            //顶部图片查询
            $.getJSON("detail/queryImg",function (data) {
                var str ="";
                str += "<img id='big' src='img/"+data[0].img+"' width='350' height='350'>";
                str += "<video id=\"video\" src=\"xiaobawang.mp4\" width=\"350\" height=\"350\" controls=\"controls\" style=\"display: none;\"></video>"
                $(".picturebox").empty().append(str)
            });
            //商品详情图片查询
            $.getJSON("detail/queryImgs",function (data) {
                var str ="";
                $(data).each(function () {
                    str += "<img src='img/"+this.img+"'/>";
                })
                $(".imgwrap").empty().append(str)
            });
        });
    </script>
    <title>解忧杂货铺-商品详情</title>
</head>
<body>
<!-- 首页头部 -->
<div class="first">
    <div class="headone">
        <span>欢迎来到解忧杂货铺！</span>
        <a href="登录.html" class="q">
            <h4>请登录</h4>
        </a>
        <a href="注册.html"><span>快速注册</span></a>
    </div>
    <div class="headtwo">
        <a href="我的杂货铺.html">
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
            <input type="text" name="words" id="" value="" />
            <input type="button" name="see" id="" value="搜索" />

        </div>

        <a href="购物车.html" class="aone">购物车</a>
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
                                    <a href="ziying.html">吃货联盟</a>
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
                                    <a href="yanxuan.html">玩家国度</a>
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
                                    <a href="zhuanqu.tml">精品专区</a>
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
                <a class="link" href="index.html">首页</a>
            </li>
            <li class="hdnav-item">
                <a class="link" href="ziying.html">自营</a>

            </li>
            <li class="hdnav-item">
                <a class="link" href="yanxuan.html">严选</a>

            </li>
            <li class="hdnav-item">

                <a class="link" href="zhuanqu.html">专区</a>
            </li>
        </ul>
    </div>
</div>
<!-- 头部导航栏 end -->
<div class="body">
    <div class="lujing">
        <!-- 路径 -->
        <span><a href="index.html">主页</a></span>&gt;
        <span><a href="zhuanqu.html">专区</a></span>
    </div>
    <div class="bodyhead" style="height: 485px;">
        <!-- 头部 -->
        <div class="picview">
            <div class="view"><div class="picturebox"></div></div>
            <div class="change">
                <!-- 图片切换开始 -->
                <ul>
                    <li class="changepic">
                        <img id="small1" src="img/xiaobawang/xiaobawang02.jpg" alt="小霸王游戏机双人手柄电视家用经典插卡" width="45px" height="45px">
                    </li>
                    <li class="changepic">
                        <img id="small2" src="img/xiaobawang/xiaobawang03.jpg" alt="小霸王游戏机双人手柄电视家用经典插卡" width="45px" height="45px">
                    </li>
                    <li class="changepic"  >
                        <video id="small3" src="xiaobawang.mp4" width="45px" height="45px"></video>
                    </li>
                </ul>
                <div class="cb"></div>
            </div><!-- 图片切换结束 -->
        </div>
        <div class="details">
            <div class="title">【九折】 小霸王游戏机双人手柄电视家用经典插卡 </div>
            <div class="msg">
                <div class="price">
                    <div class="text"><span class="newprice">￥78.30</span></div>
                    <div class="text"><span class="oldprice">￥87.00</span></div>
                </div>
                <div class="mmsg">
                    <div class="text">货号：X000001</div>
                    <div class="text">重量：0.000kg</div>
                    <div class="text">已售出：1202</div>
                </div>
            </div>
            <div class="dashline"></div><!-- 分隔线 -->
            <div class="msgs">
                <div class="specifications">
                    <span class="spectitle">规格：</span>
                    <span class="speccontent">
								<a href="#" title="型号：普通版" class="choose" id="putong">
									<span class="size"><span class="ti">型号：普通版</span></span>
								</a>
								<a href="#" title="型号：4K有线版" class="choose" id="jingjie1">
									<span class="size"><span class="ti">型号：4K有线版</span></span>
								</a>
								<a href="#" title="型号：4K无线版" class="choose" id="jingjie2">
									<span class="size"><span class="ti">型号：4K无线版</span></span>
								</a>
							</span>
                </div>
            </div>
            <div class="countmsg">
                <div class="counts">
                    <span style="width:60px;">购买：</span>
                    <span>
								<button class="reduce">-</button>
								<input type="text" class="amount" value="1" />
								<button class="increase">+</button>
							</span>
                    <span>件&nbsp;&nbsp;&nbsp;<span class="inventory">(库存<b class="stock">46</b>件)</span></span>
                    <span class="favor" style="margin-left:10px;">
								<span>
									<a href="#" style="color:#FF6A00" type="add">收藏商品</a>
								</span>
								<span class="hide">
									<a href="#" style="color:#999" type="cancel">取消收藏</a>
								</span>
							</span>
                </div>
            </div>
            <div class="dashline"></div><!-- 分隔线 -->
            <div class="bugmsgs" demo>
                <div class="buyafter box">
                    <img src="img/xiaobawang/xiaobawang01.jpg" class="img" width="180" height="180" style="display: none;">
                    <button type="button" class="addCar button orange addcar">加入购物车</button>
                </div>
                <div class="buynow">
                    <button type="button" class="buys">立即购买</button>
                </div>
                <div class="unbuy">
                    <button class="buys">暂时不能购买</button>
                </div>
                <div class="cb"></div>
            </div>
            <div class="promotion">
                <div class="dashline"></div><!-- 分隔线 -->
                <div class="free">促销商品，优惠多多，快来抢购吧！</div>
            </div>
        </div>
        <div class="recommended">
            <div class="recommend">
                <div class="xiangguang">相关推荐</div>
                <div class="repic">
                    <a href="恶搞小猪.html" title="恶搞小猪礼盒">
                        <img src="img/egaoxiaozhu/01.jpg" alt="恶搞小猪礼盒" />
                    </a>
                </div>
                <div class="repic">
                    <a href="#" title="魔法圣诞树">
                        <img src="img/shengdanshu/01.jpg" alt="魔法圣诞树" />
                    </a>
                </div>
                <div class="repic">
                    <a href="惊喜盒.html" title="惊喜盒">
                        <img src="img/jingxihe/jingxihe01.jpg" alt="惊喜盒" />
                    </a>
                </div>
            </div>
        </div>
        <div class="cb"></div>
    </div>
    <!-- 底部 -->
    <div class="profoot">
        <div class="footleft">
            <div class="service">
                <div>
                    <div class="center">客服中心</div>
                    <div class="service-div">
                        <a class="service-QQ" id="service"><span class="service-img"><img src="img/qqlogo.png"></span>联系客服</a>
                        <div class="centertime">客服在线时间 : 08:30-19:00</div>
                    </div>
                </div>
            </div>
            <div>
                <div class="about-titles">相关分类</div>
                <ul class="about">
                    <li>
                        <dl>
                            <dt><a href="#">自营</a></dt>
                            <dd><a href="#">糖果</a></dd>
                            <dd><a href="#">牛奶</a></dd>
                            <dd><a href="#">零食</a></dd>
                        </dl>
                    </li>
                    <li>
                        <dl>
                            <dt><a href="#">严选</a></dt>
                            <dd><a href="#">恶搞</a></dd>
                            <dd><a href="#">惊喜</a></dd>
                            <dd><a href="#">游戏机</a></dd>
                        </dl>
                    </li>
                    <li>
                        <dl>
                            <dt><a href="#">专区</a></dt>
                            <dd><a href="#">精选吃货</a></dd>
                            <dd><a href="#">精选玩家</a></dd>
                            <dd><a href="#">精选</a></dd>
                        </dl>
                    </li>
                    <li>
                        <dl>
                            <dt><a href="#">敬请期待</a></dt>
                            <dd><a href="#">游戏</a></dd>
                            <dd><a href="#">电影</a></dd>
                            <dd><a href="#">电视</a></dd>
                        </dl>
                    </li>
                    <li>
                        <dl>
                            <dt><a href="#">敬请期待</a></dt>
                            <dd><a href="#">旅行录线</a></dd>
                            <dd><a href="#">旅行计划</a></dd>
                            <dd><a href="#">旅行装备</a></dd>
                        </dl>
                    </li>
                </ul>
            </div>
        </div>
        <div class="footight">
            <div class="changeTitle">
                <span class="xiangqing" class="p">商品详情</span>
                <span class="pingjia" class="p">分享你的故事</span>
            </div>
            <div class="navContent">
                <div id="xiangqing">
                    <div class="detail">
                        <div class="imgwrap">

                        </div>
                    </div>
                </div>
                <div id="pingjia" style="display:none;">
                    <div class="pingjia-head">
                        <a href="#" class="all">全部分享(39)</a>
                        <header class="sha"><span class="share"></span></header>
                    </div>
                    <div class="pingjia-bottom">
                        <div class="bbs">
                            <section>
                                <ul id="postList">
                                    <li>
                                        <div class="touxiang"><img src="img/qqlogo.png"></div>
                                        <h1>五星好评:<span>好用</span></h1>
                                        <p>
                                            <span>型号:普通版</span>
                                            <span>分享时间：2019-12-18</span>
                                        </p>
                                        <div id="star_grade">
                                        </div>
                                    </li>
                                </ul>
                            </section>
                        </div>
                        <div class="post" id="post" style="display: none;">
                            商品型号：<select id="sec">
                            <option>请选择型号</option>
                            <option>普通版</option>
                            <option>4K有线版</option>
                            <option>4K无线版</option>
                        </select>
                            <textarea class="sharecontent"></textarea>
                            <input type="button" class="btn" value="分享">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="htmleaf-container">
            <!-- 右侧小火箭图标返回顶部 -->
            <div id="shangxia2">
							<span id="gotop1">
								<img src="img/huojian.svg" alt="返回顶部小火箭">
							</span>
            </div>
        </div>
    </div>
</div>
<div class="m-sidebar">
    <div class="cart">
        <i id="end"></i>
        <span>购物车</span>
    </div>
</div>
<div id="msg">已成功加入购物车！</div>
</div>
</body>
</html>
<script>
    $(function(){
        $("#small1").click(function() {
            var img = document.getElementById("big");
            img.setAttribute("src", "img/xiaobawang/xiaobawang02.jpg");
        })
        $("#small2").click(function() {
            var img = document.getElementById("big");
            img.setAttribute("src", "img/xiaobawang/xiaobawang03.jpg");
        })
        $("#jingjie2").click(function() {
            $(".newprice").html("￥98");
            $(".oldprice").html("￥107");
        })
        $("#putong").click(function() {
            $(".newprice").html("￥78.3");
            $(".oldprice").html("￥87");
        })
        $("#jingjie1").click(function() {
            $(".newprice").html("￥88");
            $(".oldprice").html("￥97");
        })
        $("#star_grade").markingSystem({
            num: 5,
            havePoint: true,
            haveGrade: true,
            unit: '星',
            grade: 2.5,
            height: 20,
            width: 20,
        })
    })
</script>
