<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2020/2/27
  Time: 15:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>评价中心</title>
    <meta content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0" name="viewport"/>
    <meta content="yes" name="apple-mobile-web-app-capable"/>
    <meta content="black" name="apple-mobile-web-app-status-bar-style"/>
    <meta content="telephone=no" name="format-detection"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/pingjia.css" rel="stylesheet" type="text/css"/>
    <link href="css/fabiao.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" type="text/css" href="css/daohang.css"/>
    <link rel="stylesheet" type="text/css" href="css/head.css"/>
    <link rel="stylesheet" type="text/css" href="css/公用-尾部.css"/>
    <script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>
    <script type="text/javascript">
        $(function () {
            //评价状态切换
            $(".noPub").click(function () {
                $(this).parent().addClass("tab-active");
                $(this).parent().siblings().removeClass("tab-active");
                $("#noPubDiv").addClass("tab-active")
                $("#havePubDiv").removeClass("tab-active")
                $("#showPicDiv").removeClass("tab-active")
                $("#serviceDiv").removeClass("tab-active")
            })
            $(".showPic").click(function () {
                $(this).parent().addClass("tab-active")
                $(this).parent().siblings().removeClass("tab-active");
                $("#noPubDiv").removeClass("tab-active")
                $("#havePubDiv").removeClass("tab-active")
                $("#showPicDiv").addClass("tab-active")
                $("#serviceDiv").removeClass("tab-active")
            })
            $(".havePub").click(function () {
                $(this).parent().addClass("tab-active")
                $(this).parent().siblings().removeClass("tab-active");
                $("#noPubDiv").removeClass("tab-active")
                $("#havePubDiv").addClass("tab-active")
                $("#showPicDiv").removeClass("tab-active")
                $("#serviceDiv").removeClass("tab-active")
            })
            $(".service").click(function () {
                $(this).parent().addClass("tab-active")
                $(this).parent().siblings().removeClass("tab-active");
                $("#noPubDiv").removeClass("tab-active");
                $("#havePubDiv").removeClass("tab-active");
                $("#showPicDiv").removeClass("tab-active");
                $("#serviceDiv").addClass("tab-active");
            })
            $.getJSON("pingjia/countno", function (data) {
                $("#noPub").html(data);
            })
            $.getJSON("pingjia/countis", function (data) {
                $("#havePub").html(data);
            })
            //评价查询
            $.getJSON("pingjia/query", function (data) {
                var str1 = "";
                var str2 = "";
                $(data).each(function () {
                    if (this.state == 4) {
                        str1 += "<div class='tab-item'>\n" +
                            "<a class='aui-flex'>\n" +
                            "<div class='aui-all-list'>\n" +
                            "<img src='img/" + this.img.img + "'>\n" +
                            "</div>\n" +
                            "<div class='aui-flex-box aui-flex-title'>\n" +
                            "<h3>" + this.shop.shopName + "</h3>\n" +
                            "<p>评价+晒单最多送50个爱豆</p>\n" +
                            "<div class='aui-sunburn' onclick='fabiao()'>\n" +
                            "<input type='hidden' class='orderid' value='" + this.id + "'>" +
                            "<input type='hidden' class='shopingid' value='" + this.shop.shopId + "'>" +
                            "<i class='icon icon-sunburn'></i>\n" +
                            "评价晒单\n" +
                            "\n" +
                            "</div>\n" +
                            "</div>\n" +
                            "</a>\n" +
                            "</div>";
                    } else if (this.state == 5) {
                        str2 += "<div class='tab-item'>\n" +
                            "<a class='aui-flex'>\n" +
                            "<div class='aui-all-list'>\n" +
                            "<img src='img/" + this.img.img + "'>\n" +
                            "</div>\n" +
                            "<div class='aui-flex-box aui-flex-title'>\n" +
                            "<h3>" + this.shop.shopName + "</h3>\n" +
                            "<p>" + this.pingJia.content + "</p>\n" +
                            "<div class=\"aui-sunburn aui-sunburn-def\">\n" +
                            "<i class=\"icon icon-sunburn\"></i>\n" +
                            "查看评价\n" +
                            "\n" +
                            "</div>" +
                            "</div>\n" +
                            "</a>\n" +
                            "</div>";
                    }
                })
                if (str1 == "") {
                    $("#noPubDiv").empty().append("<div class=\"tab-item\"><h2>暂无评价</h2></div>");
                } else {
                    $("#noPubDiv").empty().append(str1);
                }
                if (str2 == "") {
                    $("#havePubDiv").empty().append("<div class=\"tab-item\"><h2>暂无评价</h2></div>");
                } else {
                    $("#havePubDiv").empty().append(str2);
                }
            })

            function byIndexLeve(index) {
                var str = "";
                switch (index) {
                    case 0:
                        str = "差评";
                        break;
                    case 1:
                        str = "较差";
                        break;
                    case 2:
                        str = "中等";
                        break;
                    case 3:
                        str = "一般";
                        break;
                    case 4:
                        str = "好评";
                        break;
                }
                return str;
            }

            //  星星数量
            var stars = [
                ['x2.png', 'x1.png', 'x1.png', 'x1.png', 'x1.png'],
                ['x2.png', 'x2.png', 'x1.png', 'x1.png', 'x1.png'],
                ['x2.png', 'x2.png', 'x2.png', 'x1.png', 'x1.png'],
                ['x2.png', 'x2.png', 'x2.png', 'x2.png', 'x1.png'],
                ['x2.png', 'x2.png', 'x2.png', 'x2.png', 'x2.png'],
            ];
            $(".starchick").find("img").hover(function (e) {
                var obj = $(this);
                var index = obj.index();
                if (index < (parseInt($(".starchick").attr("data-default-index")) - 1)) {
                    return;
                }
                var li = obj.closest(".starchick");
                var star_area_index = li.index();
                for (var i = 0; i < 5; i++) {
                    li.find("img").eq(i).attr("src", "img/" + stars[index][i]);//切换每个星星
                }
                $(".level").html(byIndexLeve(index));
            }, function () {
            })
            $(".starchick").hover(function (e) {
            }, function () {
                var index = $(this).attr("data-default-index");//点击后的索引
                index = parseInt(index);
                console.log("index", index);
                $(".level").html(byIndexLeve(index - 1));
                console.log(byIndexLeve(index - 1));
                $(".order-evaluation ul li:eq(0)").find("img").attr("src", "img/x1.png");
                for (var i = 0; i < index; i++) {

                    $(".order-evaluation ul li:eq(0)").find("img").eq(i).attr("src", "img/x2.png");
                }
            })
            $(".starchick").find("img").click(function () {
                var obj = $(this);
                var li = obj.closest("li");
                var star_area_index = li.index();
                var index1 = obj.index();
                li.attr("data-default-index", (parseInt(index1) + 1));
                var index = $(".starchick").attr("data-default-index");//点击后的索引
                index = parseInt(index);
                console.log("index", index);
                $(".level").html(byIndexLeve(index - 1));
                console.log(byIndexLeve(index - 1));
                $(".order-evaluation ul li:eq(0)").find("img").attr("src", "img/x1.png");
                for (var i = 0; i < index; i++) {
                    $(".order-evaluation ul li:eq(0)").find("img").eq(i).attr("src", "img/x2.png");
                }

            });
            //印象
            $(".order-evaluation-check").click(function () {
                if ($(this).hasClass('checked')) {
                    //当前为选中状态，需要取消
                    $(this).removeClass('checked');
                } else {
                    //当前未选中，需要增加选中
                    $(this).addClass('checked');
                }
            });
        })

        //评价字数限制
        function words_deal() {
            var curLength = $("#TextArea1").val().length;
            if (curLength > 140) {
                var num = $("#TextArea1").val().substr(0, 140);
                $("#TextArea1").val(num);
                alert("超过字数限制，多出的字将被截断！");
            } else {
                $("#textCount").text(140 - $("#TextArea1").val().length);
            }
        }

        function fabiao() {
            $(".service").parent().show();
            $(".service").parent().addClass("tab-active")
            $(".service").parent().siblings().removeClass("tab-active");
            $("#noPubDiv").removeClass("tab-active");
            $("#havePubDiv").removeClass("tab-active");
            $("#showPicDiv").removeClass("tab-active");
            $("#serviceDiv").addClass("tab-active");
            var shopingid = $(".orderid").val();
            $.getJSON("pingjia/queryByid", {"shopingid": shopingid}, function (data) {
                $(".orderName").html("给“" + data.shopName + "”的评价");
            })
        }

        function add() {
            var orderid = $(".orderid").val();
            var shopingid = $(".shopingid").val();
            $.getJSON("pingjia/update", {"orderid": orderid}, function (data) {
            })
            var content = $("#TextArea1").val();
            if (content == "") {
                alert("请填写评价内容！")
            } else {
                $.ajax({
                    url: "pingjia/add",
                    type: "post",
                    data: {"id": shopingid, "content": content},
                    dataType: "json",
                    success: function (data) {
                        if (data) {
                            $("#order_evaluate_modal").html("感谢您的评价！么么哒(* ￣3)(ε￣ *)").show().delay(3000).hide(500);
                        } else {
                            alert("评价失败！")
                        }
                    }
                })
            }
        }

        //退出登录
        function exit() {
            if (confirm("确认退出吗？")) {
                $.getJSON("exit/exits", function (data) {
                    if (data) {
                        window.location.reload();
                    }
                })
            }
        }

        //判断个人中心
        function gomycenter() {
            var username = $(".headone").find(".username").length;
            if (username == 0) {
                if (confirm("请先登录！")) {
                    window.location.href = "login.jsp";
                }
            }
        }

        //判断购物车
        function gomycar() {
            var username = $(".headone").find(".username").length;
            if (username == 0) {
                if (confirm("请先登录！")) {
                    window.location.href = "login.jsp";
                }
            }
        }
    </script>
</head>
<body>
<section class="aui-flexView">
    <section class="aui-scrollView">
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
        <div class="aui-m-slider">
            <div class="m-slider" data-ydui-slider>
                <div class="slider-wrapper">
                    <div class="slider-item">
                        <a>
                            <img src="images/banner-002.png">
                        </a>
                    </div>
                </div>
                <div class="slider-pagination"></div>
            </div>
        </div>
        <div class="aui-tab-mar">
            <div class="aui-tab" data-ydui-tab>
                <ul class="tab-nav">
                    <li class="tab-nav-item tab-active">
                        <a class="noPub">
                            <span>待评价</span>
                            <span id="noPub">0</span>
                        </a>
                    </li>
                    <li class="tab-nav-item">
                        <a class="showPic">
                            <span>晒图单</span>
                            <span>0</span>
                        </a>
                    </li>
                    <li class="tab-nav-item">
                        <a class="havePub">
                            <span>已评价</span>
                            <span id="havePub">0</span>
                        </a>
                    </li>
                    <li class="tab-nav-item" style="display: none">
                        <a class="service">
                            <span>服务评价</span>
                        </a>
                    </li>
                </ul>
                <div class="tab-panel">
                    <div class="tab-panel-item tab-active" id="noPubDiv"></div>
                    <div class="tab-panel-item" id="showPicDiv">
                        <div class="tab-item">
                            <%--<a href="javascript:;" class="aui-flex">
                                <div class="aui-all-list">
                                    <img src="images/icon-page-021.png" alt="">
                                </div>
                                <div class="aui-flex-box aui-flex-title">
                                    <h3>小米8SE全面屏智能手机4GB+64GB灰色全网通4G双卡双待小米8SE全面屏智能手机4GB</h3>
                                    <p>评价+晒单最多送50个爱豆</p>
                                    <div class="aui-sunburn">
                                        <i class="icon icon-sunburn"></i>
                                        添加晒单

                                    </div>
                                </div>
                            </a>--%><h2>暂无图片评价！</h2>
                        </div>
                    </div>
                    <div class="tab-panel-item" id="havePubDiv"></div>
                    <div class="tab-panel-item" id="serviceDiv">
                        <div class="order-evaluation clearfix">
                            <h4 class="orderName"></h4>
                            <p>请严肃认真对待此次评价哦！您的评价对我们真的真的非常重要！</p>
                            <div class="block">
                                <ul>
                                    <li data-default-index="0" class="starchick">
				<span>
					<img src="img/x1.png">
					<img src="img/x1.png">
					<img src="img/x1.png">
					<img src="img/x1.png">
					<img src="img/x1.png">
				</span>
                                        <em class="level"></em>
                                    </li>
                                </ul>
                            </div>
                            <div class="order-evaluation-text">
                                本次交易，乖，摸摸头 给您留下了什么印象呢？
                            </div>
                            <div class="order-evaluation-checkbox">
                                <ul class="clearfix">
                                    <li class="order-evaluation-check" data-impression="1">东西完美<i
                                            class="iconfont icon-checked"></i></li>
                                    <li class="order-evaluation-check" data-impression="2">发货快<i
                                            class="iconfont icon-checked"></i></li>
                                    <li class="order-evaluation-check" data-impression="3">效果明显<i
                                            class="iconfont icon-checked"></i></li>
                                    <li class="order-evaluation-check" data-impression="4">实物准确<i
                                            class="iconfont icon-checked"></i></li>
                                    <li class="order-evaluation-check" data-impression="5">质量很高<i
                                            class="iconfont icon-checked"></i></li>
                                    <li class="order-evaluation-check" data-impression="6">没有瑕疵<i
                                            class="iconfont icon-checked"></i></li>
                                </ul>
                            </div>
                            <div class="order-evaluation-textarea">
                                <textarea name="content" id="TextArea1" onKeyUp="words_deal();"></textarea>
                                <span>还可以输入<em id="textCount">140</em>个字</span>
                            </div>
                            <a href="javascript:add()" id="order_evaluation">评价完成</a>
                        </div>
                        <div id="order_evaluate_modal" class="dmlei_tishi_info"></div>
                    </div>
                </div>
            </div>
        </div>
        <!-- 尾部 -->
        <div class="gongyong-footsum">
            <div class="gongyong-footzong">
                <ul class="gongyong-footdul">
                    <li>
                        <img src="img/21.png">
                        <p class="gongyong-p">严筛精选 品质保证</p><br>
                        <p class="gongyong-q">用心为您挑选产品</p>
                    </li>
                    <li>
                        <img src="img/22.png">
                        <p class="gongyong-p">特产100%原产地直采</p><br>
                        <p class="gongyong-q">确保产品的原汁原味</p>
                    </li>
                    <li>
                        <img src="img/23.png">
                        <p class="gongyong-p">售后无忧</p><br>
                        <p class="gongyong-q">7天免费退换货</p>
                    </li>
                    <li>
                        <img src="img/24.png">
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
                    <dd><span class="gongyong-footimg1"><img src="img/denglu.png"></span></dd>
                </dl>
                <div class="gongyong-foot-last">
                    <dl>
                        <dt><strong>关注我们</strong></dt>
                        <li><span class="gongyong-footimg2"><img src="img/erweima.png"></span></li>
                    </dl>
                </div>
            </div>
        </div>
        <div class="gongyong-foottwo">
            <p class="gongyong-footp1"> 粤ICP备14021738号-1&nbsp;&nbsp;粤工商备P191810000024 </p>
            <p class="gongyong-footp2">Copyright &copy; 东莞市长勋电子商务有限公司 2013-现在 版权所有 </p>
        </div>
        <!-- 尾部结束 -->
    </section>
</section>
</body>
</html>
