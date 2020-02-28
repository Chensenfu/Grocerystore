<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2020/2/19
  Time: 15:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="css/commons.css"/>
    <link rel="stylesheet" type="text/css" href="css/daohang.css"/>
    <link rel="stylesheet" type="text/css" href="css/head.css"/>
    <link rel="stylesheet" type="text/css" href="css/fly.css"/>
    <script src="js/jquery-1.11.0.min.js" type="text/javascript"></script>
    <script src="js/xiangqingye.js" type="text/javascript"></script>
    <script src="js/jquery.fly.min.js" type="text/javascript"></script>
    <script src="js/goTop.js" type="text/javascript"></script>
    <script type="text/javascript">
        $.fn.toggle = function (fn, fn2) {
            var args = arguments, guid = fn.guid || $.guid++, i = 0,
                toggle = function (event) {
                    var lastToggle = ($._data(this, "lastToggle" + fn.guid) || 0) % i;
                    $._data(this, "lastToggle" + fn.guid, lastToggle + 1);
                    event.preventDefault();
                    return args[lastToggle].apply(this, arguments) || false;
                };
            toggle.guid = guid;
            while (i < args.length) {
                args[i++].guid = guid;
            }
            return this.click(toggle);
        };
        $(function () {
            var id = getUrlParam("id");
            //顶部图片查询
            $.getJSON("detail/queryImg", {"id": id}, function (data) {
                var str = "";
                str += "<img id='big' src='img/" + data[0].img + "' width='350' height='350'>";
                if (data[0].videos.videos != "") {
                    str += "<video id='video' src='img/" + data[0].videos.videos + "' width='350' height='350' controls='controls' style='display: none;'></video>"
                }
                $(".picturebox").empty().append(str);
                if (data[0].videos.videos != "") {
                    $("#small3").append("<video src='img/" + data[0].videos.videos + "' width='45px' height='45px'></video>");
                }
                $("#small3").click(function () {
                    $("#big").hide();
                    $("#video").show();
                })
            });
            //商品详情图片查询
            $.getJSON("detail/queryImgs", {"id": id}, function (data) {
                var str = "";
                $(data).each(function () {
                    str += "<img src='img/" + this.img + "'/>";
                })
                $(".imgwrap").empty().append(str);
                $("#small1").append("<img src='img/" + data[1].img + "' width='45px' height='45px'>");
                $("#small2").append("<img src='img/" + data[2].img + "' width='45px' height='45px'>");
                $("#small1").click(function () {
                    var img = document.getElementById("big");
                    img.setAttribute("src", "img/" + data[1].img + "");
                    $("#big").show();
                    $("#video").hide();
                })
                $("#small2").click(function () {
                    var img = document.getElementById("big");
                    img.setAttribute("src", "img/" + data[2].img + "");
                    $("#big").show();
                    $("#video").hide();
                })
            });
            //商品查询
            $.getJSON("detail/qureyShop", {"id": id}, function (data) {
                $(".title").html(data.shopName);
                $(".newprice").html("￥" + data.price);
                $(".oldprice").html("￥" + (data.price + data.price * 0.3));
                $(".mmsg").append("<div class='text'>货号：" + data.sdetail.number + "</div>\n" +
                    "<div class='text'>重量：" + data.sdetail.weight + "</div>\n" +
                    "<div class='text'>已售出：" + data.sdetail.sales + "</div>");
                $(".stock").html(data.sdetail.inventory);
                if (data.sdetail.inventory > 0) {
                    $(".buyafter").show();
                    $(".buynow").show();
                    $(".unbuy").hide();
                } else {
                    $(".buyafter").hide();
                    $(".buynow").hide();
                    $(".unbuy").show();
                }
                if (data.typeId == 1) {
                    $(".lujing").append("<span><a href='index.html'>主页</a></span>&gt;\n" +
                        "<span><a href='ziying.html'>自营</a></span>")
                } else if (data.typeId == 2) {
                    $(".lujing").append("<span><a href='index.html'>主页</a></span>&gt;\n" +
                        "<span><a href='yanxuan.html'>严选</a></span>")
                } else if (data.typeId == 3) {
                    $(".lujing").append("<span><a href='index.html'>主页</a></span>&gt;\n" +
                        "<span><a href='zhuanqu.html'>专区</a></span>")
                }
            });
            //相关推荐
            $.getJSON("detail/queryTuijian", {"id": id}, function (data) {
                var str = "";
                str += "<div class='xiangguang'>相关推荐</div>"
                $(data).each(function () {
                    str += "<div class='repic'>\n" +
                        "<a href='xiangqingye.jsp?id='" + this.shopId + " title='" + this.shopName + "'>\n" +
                        "<img src='img/" + this.img.img + "' alt='" + this.shopName + "'/>\n" +
                        "</a>\n" +
                        "</div>"
                })
                $(".recommend").empty().append(str);
            })
            //评价查询
            $.getJSON("detail/queryPingjia", {"id": id}, function (data) {
                $(".pingjia-head").append("<a class='all'>全部分享(" + data.length + ")</a>\n" +
                    "<header class='sha'><span class='share'></span></header>")
                var str = "";
                $(data).each(function () {
                    str += "<li>\n" +
                        "<div class='touxiang'><img src='img/qqlogo.png'></div>\n" +
                        "<h1>" + this.user.name + ":<span>" + this.content + "</span></h1>\n" +
                        "<p>\n" +
                        "<span>型号:默认</span>\n" +
                        "<span>分享时间：" + this.createdate + "</span>\n" +
                        "</p>\n" +
                        "<div class='star_grade'>\n" +
                        "</div>\n" +
                        "</li>";
                })
                $("#postList").empty().append(str);
                $(".star_grade").markingSystem({
                    num: 5,
                    havePoint: true,
                    haveGrade: true,
                    unit: '星',
                    grade: 4.5,
                    height: 20,
                    width: 20,
                })
            })
            //判断购物车有无此商品
            $.getJSON("detail/queryCar", {"id": id}, function (data) {
                if (data[0] == "") {
                    //加入购物车
                    $(".addcar").click(function () {
                        var count = $(".amount").val();
                        $.ajax({
                            url: "detail/add",
                            type: "post",
                            data: {"id": id, "count": count},
                            dataType: "json",
                            success: function (data) {
                            }
                        })
                    })
                } else {//修改购物车商品数量
                    $(".addcar").click(function () {
                        var count = $(".amount").val();
                        $.ajax({
                            url: "detail/updateCount",
                            type: "post",
                            data: {"id": id, "count": count},
                            dataType: "json",
                            success: function (data) {
                            }
                        })
                    })
                }
            })
            //判断是否收藏
            $.getJSON("detail/queryLike", function (data) {
                if (data[0].shopId == id) {
                    $("a[type=add]").hide();
                    $("a[type=cancel]").show();
                } else if (data[0].shopId != id || data.shopId == null) {
                    $("a[type=cancel]").hide();
                    $("a[type=add]").show();
                }
            })
            //收藏商品
            $("a[type=add]").click(function () {
                $("a[type=add]").hide();
                $("a[type=cancel]").show();
                $.ajax({
                    url: "detail/addLike",
                    type: "post",
                    data: {"id": id},
                    dataType: "json",
                    success: function (data) {
                        if (data) {
                            alert("添加收藏成功！");
                        } else {
                            alert("添加收藏失败！");
                        }
                    }
                })
            })
            //取消收藏
            $("a[type=cancel]").click(function () {
                $("a[type=cancel]").hide();
                $("a[type=add]").show();
                $.ajax({
                    url: "detail/delLike",
                    type: "post",
                    data: {"id": id},
                    dataType: "json",
                    success: function (data) {
                        if (data) {
                            alert("取消收藏成功！");
                        } else {
                            alert("取消收藏失败！");
                        }
                    }
                })
            })
            //相关分类
            $(".dl").toggle(function () {
                    $(this).find(".dd").slideDown("slow");
                },
                function () {
                    $(this).find(".dd").slideUp("fast");
                }
            )
            new GoTop({
                hide: true,//当页面不滚动时 是否隐藏 默认false
                url: 'img/huojian.png',//图片路径 默认我们提供base64的图片
                state: '',//出现的位置 默认是 下方 提供 center bottom参数
                height: '50px',//高 默认40px
                width: '50px',//宽 默认40px
                scrollTop: 500,//滚到什么位置出现 px
                time: 500,//返回顶部多长时间 ms 默认500ms
                aimation: 'animated bounceInDown',//出场动画 默认show（没有出场动画） 这个可以自定义
                toTop: '',//滚到顶部触发事件
                toShow: '',//出场时触发事件
                toHide: function () {
                    $('h1').html('我消失了');
                    setTimeout(function () {
                        $('h1').html('');
                    }, 1000)
                },//隐藏触发事件
                go: ""//点击返回顶部触发事件
            });
        })

        //获取地址栏参数,可以是中文参数
        function getUrlParam(key) {
            // 获取参数
            var url = window.location.search;
            // 正则筛选地址栏
            var reg = new RegExp("(^|&)" + key + "=([^&]*)(&|$)");
            // 匹配目标参数
            var result = url.substr(1).match(reg);
            //返回参数值
            return result ? decodeURIComponent(result[2]) : null;
        }
        //退出登录
        function exit(){
            if(confirm("确认退出吗？")){
                $.getJSON("exit/exits",function(data){
                    if (data){
                        window.location.reload();
                    }
                })
            }
        }
        //判断个人中心
        function gomycenter() {
            var username =$(".headone").find(".username").length;
           if (username==0){
               if (confirm("请先登录！")){
                   window.location.href="login.jsp";
               }
           }
        }
        //判断购物车
        function gomycar() {
            var username =$(".headone").find(".username").length;
           if (username==0){
               if (confirm("请先登录！")){
                   window.location.href="login.jsp";
               }
           }
        }
    </script>
    <title>解忧杂货铺-商品详情</title>
</head>
<body>
<!-- 首页头部 -->
<div class="first">
    <div class="headone">
        <span>欢迎来到解忧杂货铺！</span>
        <c:if test="${user.username == null}">
            <a href="login.jsp" class="q">
                <h4>请登录</h4>
            </a>
        </c:if>
        <c:if test="${user.username != null}">
        欢迎：<span class="username">${user.username}</span>&nbsp;&nbsp;<a href="javascript:exit()">退出登录</a>
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
            <input type="button" name="see" value="搜索"/>
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
                                                <li><a href="#">李子园</a></li>
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
    <div class="lujing"><!-- 路径 --></div>
    <div class="bodyhead" style="height: 485px;">
        <!-- 头部 -->
        <div class="picview">
            <div class="view">
                <div class="picturebox"></div>
            </div>
            <div class="change">
                <!-- 图片切换开始 -->
                <ul>
                    <li class="changepic" id="small1"></li>
                    <li class="changepic" id="small2"></li>
                    <li class="changepic" id="small3"></li>
                </ul>
                <div class="cb"></div>
            </div><!-- 图片切换结束 -->
        </div>
        <div class="details">
            <div class='title'></div>
            <div class="msg">
                <div class="price">
                    <div class="text"><span class="newprice"></span></div>
                    <div class="text"><span class="oldprice"></span></div>
                </div>
                <div class="mmsg"></div>
            </div>
            <div class="dashline"></div><!-- 分隔线 -->
            <div class="msgs">
                <div class="specifications">
                    <span class="spectitle">规格：</span>
                    <span class="speccontent">
								<a title="型号：默认" class="choose" id="putong">
									<span class="size"><span class="ti">型号：默认</span></span>
								</a>
								<%--<a href="#" title="型号：4K有线版" class="choose" id="jingjie1">
									<span class="size"><span class="ti">型号：4K有线版</span></span>
								</a>
								<a href="#" title="型号：4K无线版" class="choose" id="jingjie2">
									<span class="size"><span class="ti">型号：4K无线版</span></span>
								</a>--%>
							</span>
                </div>
            </div>
            <div class="countmsg">
                <div class="counts">
                    <span style="width:60px;">购买：</span>
                    <span>
                        <button class="reduce">-</button>
                        <input type="text" class="amount" value="1"/>
                        <button class="increase">+</button>
                    </span>
                    <span>件&nbsp;&nbsp;&nbsp;<span class="inventory">(库存<b class="stock"></b>件)</span></span>
                    <span class="favor" style="margin-left:10px;">
                        <span style="cursor:pointer;">
                            <a style="color:#FF6A00" type="add">收藏商品</a>
                        </span>
                        <span style="cursor:pointer;">
                            <a style="color:#999" type="cancel">取消收藏</a>
                        </span>
                    </span>
                </div>
            </div>
            <div class="dashline"></div><!-- 分隔线 -->
            <div class="bugmsgs" demo>
                <div class="buyafter box">
                    <img src="img/car.jpg" class="img" width="180" height="180"
                         style="display: none;">
                    <button type="button" class="addCar button orange addcar">加入购物车</button>
                </div>
                <div class="buynow">
                    <button type="button" class="buys">立即购买</button>
                </div>
                <div class="unbuy" style="display: none">
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
                        <dl class="dl">
                            <dt class="dt"><a href="ziying.html">自营</a></dt>
                            <dd class="dd"><a href="#">糖果</a></dd>
                            <dd class="dd"><a href="#">牛奶</a></dd>
                            <dd class="dd"><a href="#">零食</a></dd>
                        </dl>
                    </li>
                    <li>
                        <dl class="dl">
                            <dt class="dt"><a href="yanxuan.html">严选</a></dt>
                            <dd class="dd"><a href="#">恶搞</a></dd>
                            <dd class="dd"><a href="#">惊喜</a></dd>
                            <dd class="dd"><a href="#">游戏机</a></dd>
                        </dl>
                    </li>
                    <li>
                        <dl class="dl">
                            <dt class="dt"><a href="zhuanqu.html">专区</a></dt>
                            <dd class="dd"><a href="#">精选吃货</a></dd>
                            <dd class="dd"><a href="#">精选玩家</a></dd>
                            <dd class="dd"><a href="#">精选</a></dd>
                        </dl>
                    </li>
                    <li>
                        <dl class="dl">
                            <dt class="dt"><a href="#">敬请期待</a></dt>
                            <dd class="dd"><a href="#">游戏</a></dd>
                            <dd class="dd"><a href="#">电影</a></dd>
                            <dd class="dd"><a href="#">电视</a></dd>
                        </dl>
                    </li>
                    <li>
                        <dl class="dl">
                            <dt class="dt"><a href="#">敬请期待</a></dt>
                            <dd class="dd"><a href="#">旅行录线</a></dd>
                            <dd class="dd"><a href="#">旅行计划</a></dd>
                            <dd class="dd"><a href="#">旅行装备</a></dd>
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
                            //商品详情图片查询
                        </div>
                    </div>
                </div>
                <div id="pingjia" style="display:none;">
                    <div class="pingjia-head">
                    </div>
                    <div class="pingjia-bottom">
                        <div class="bbs">
                            <section>
                                <ul id="postList">
                                </ul>
                            </section>
                        </div>
                    </div>
                </div>
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
