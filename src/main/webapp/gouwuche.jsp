<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2020/2/21
  Time: 18:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>购物车</title>
    <link rel="stylesheet" type="text/css" href="css/daohang.css"/>
    <link rel="stylesheet" type="text/css" href="css/head.css"/>
    <link rel="stylesheet" type="text/css" href="./css/reset.css">
    <link rel="stylesheet" type="text/css" href="./css/carts.css">
    <link rel="stylesheet" type="text/css" href="css/公用-尾部.css"/>
    <style>
        .order_lists .list_amount .amount_box input{
            width: 39px;
            height: 25px;
            line-height: 15px;
            border: 1px solid #aaa;
            color: #343434;
            text-align: center;
            padding: 4px 0;
            background-color: #fff;
            z-index: 2;
            position: absolute;
            left: 18px;
            float: left;
        }
    </style>
    <script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $.getJSON("car/query", function (data) {
                var str = "";
                $(data).each(function () {
                    str += "<ul class=\"order_lists\">\n" +
                        "<li class=\"list_chk\">\n" +
                        "<input type=\"checkbox\" id=\"checkbox_" + this.id + "\" class=\"son_check\">\n" +
                        "<label for=\"checkbox_" + this.id + "\"></label>\n" +
                        "</li>\n" +
                        "<li class=\"list_con\">\n" +
                        "<div class=\"list_img\"><a href='xiangqingye.jsp?id='"+this.id+"><img src='img/" + this.img.img + "'></a></div>\n" +
                        "<div class=\"list_text\"><a href='xiangqingye.jsp?id='"+this.id+">" + this.shop.shopName + "</a></div>\n" +
                        "</li>\n" +
                        "<li class=\"list_info\">\n" +
                        "<p>规格：默认</p>\n" +
                        "<p>尺寸：16*16*3(cm)</p>\n" +
                        "</li>\n" +
                        "<li class=\"list_price\">\n" +
                        "<p class=\"price\">" + this.shop.price + "</p>\n" +
                        "</li>\n" +
                        "<li class=\"list_amount\">\n" +
                        "<div class=\"amount_box\">\n" +
                        "<a href=\"javascript:;\" class=\"reduce reSty\">-</a>\n" +
                        "<input type=\"text\" value=\"1\" class=\"sum\">\n" +
                        "<a href=\"javascript:;\" class=\"plus\">+</a>\n" +
                        "</div>\n" +
                        "</li>\n" +
                        "<li class=\"list_sum\">\n" +
                        "<p class=\"sum_price\">￥" + this.shop.price + "</p>\n" +
                        "</li>\n" +
                        "<li class=\"list_op\">\n" +
                        "<p class=\"del\"><a class=\"delBtn\"><input type='hidden' value='"+this.id+"'>移除商品</a></p>\n" +
                        "</li>\n" +
                        "</ul>";
                })
                $(".order_content").empty().append(str);
                //全局的checkbox选中和未选中的样式
                var $allCheckbox = $('input[type="checkbox"]'),     //全局的全部checkbox
                    $wholeChexbox = $('.whole_check'),
                    $cartBox = $('.cartBox'),                       //每个商铺盒子
                    $shopCheckbox = $('.shopChoice'),               //每个商铺的checkbox
                    $sonCheckBox = $('.son_check');                 //每个商铺下的商品的checkbox
                $allCheckbox.click(function () {
                    if ($(this).is(':checked')) {
                        $(this).next('label').addClass('mark');
                    } else {
                        $(this).next('label').removeClass('mark')
                    }
                });
                //===============================================全局全选与单个商品的关系================================
                $wholeChexbox.click(function () {
                    var $checkboxs = $cartBox.find($('input[type="checkbox"]'));
                    if ($(this).is(':checked')) {
                        $checkboxs.prop("checked", true);
                        $checkboxs.next('label').addClass('mark');
                    } else {
                        $checkboxs.prop("checked", false);
                        $checkboxs.next('label').removeClass('mark');
                    }
                    totalMoney();
                });
                $sonCheckBox.each(function () {
                    $(this).click(function () {
                        if ($(this).is(':checked')) {
                            //判断：所有单个商品是否勾选
                            var len = $sonCheckBox.length;
                            var num = 0;
                            $sonCheckBox.each(function () {
                                if ($(this).is(':checked')) {
                                    num++;
                                }
                            });
                            if (num == len) {
                                $wholeChexbox.prop("checked", true);
                                $wholeChexbox.next('label').addClass('mark');
                            }
                        } else {
                            //单个商品取消勾选，全局全选取消勾选
                            $wholeChexbox.prop("checked", false);
                            $wholeChexbox.next('label').removeClass('mark');
                        }
                    })
                })

                //=======================================每个店铺checkbox与全选checkbox的关系/每个店铺与其下商品样式的变化===================================================

                //店铺有一个未选中，全局全选按钮取消对勾，若店铺全选中，则全局全选按钮打对勾。
                $shopCheckbox.each(function () {
                    $(this).click(function () {
                        if ($(this).is(':checked')) {
                            //判断：店铺全选中，则全局全选按钮打对勾。
                            var len = $shopCheckbox.length;
                            var num = 0;
                            $shopCheckbox.each(function () {
                                if ($(this).is(':checked')) {
                                    num++;
                                }
                            });
                            if (num == len) {
                                $wholeChexbox.prop("checked", true);
                                $wholeChexbox.next('label').addClass('mark');
                            }

                            //店铺下的checkbox选中状态
                            $(this).parents('.cartBox').find('.son_check').prop("checked", true);
                            $(this).parents('.cartBox').find('.son_check').next('label').addClass('mark');
                        } else {
                            //否则，全局全选按钮取消对勾
                            $wholeChexbox.prop("checked", false);
                            $wholeChexbox.next('label').removeClass('mark');

                            //店铺下的checkbox选中状态
                            $(this).parents('.cartBox').find('.son_check').prop("checked", false);
                            $(this).parents('.cartBox').find('.son_check').next('label').removeClass('mark');
                        }
                        totalMoney();
                    });
                });


                //========================================每个店铺checkbox与其下商品的checkbox的关系======================================================

                //店铺$sonChecks有一个未选中，店铺全选按钮取消选中，若全都选中，则全选打对勾
                $cartBox.each(function () {
                    var $this = $(this);
                    var $sonChecks = $this.find('.son_check');
                    $sonChecks.each(function () {
                        $(this).click(function () {
                            if ($(this).is(':checked')) {
                                //判断：如果所有的$sonChecks都选中则店铺全选打对勾！
                                var len = $sonChecks.length;
                                var num = 0;
                                $sonChecks.each(function () {
                                    if ($(this).is(':checked')) {
                                        num++;
                                    }
                                });
                                if (num == len) {
                                    $(this).parents('.cartBox').find('.shopChoice').prop("checked", true);
                                    $(this).parents('.cartBox').find('.shopChoice').next('label').addClass('mark');
                                }

                            } else {
                                //否则，店铺全选取消
                                $(this).parents('.cartBox').find('.shopChoice').prop("checked", false);
                                $(this).parents('.cartBox').find('.shopChoice').next('label').removeClass('mark');
                            }
                            totalMoney();
                        });
                    });
                });


                //=================================================商品数量==============================================
                var $plus = $('.plus'),
                    $reduce = $('.reduce'),
                    $all_sum = $('.sum');
                $plus.click(function () {
                    var $inputVal = $(this).prev('input'),
                        $count = parseInt($inputVal.val()) + 1,
                        $obj = $(this).parents('.amount_box').find('.reduce'),
                        $priceTotalObj = $(this).parents(".order_lists").find(".sum_price"),
                        $price = $(this).parents('.order_lists').find('.price').html(),  //单价
                        $priceTotal = $count * $price;
                    $inputVal.val($count);
                    $priceTotalObj.html('￥' + $priceTotal);
                    if ($inputVal.val() > 1 && $obj.hasClass('reSty')) {
                        $obj.removeClass('reSty');
                    }
                    totalMoney();
                });

                $reduce.click(function () {
                    var $inputVal = $(this).next('input'),
                        $count = parseInt($inputVal.val()) - 1,
                        $priceTotalObj = $(this).parents('.order_lists').find('.sum_price'),
                        $price = $(this).parents('.order_lists').find('.price').html(),  //单价
                        $priceTotal = $count * $price;
                    if ($inputVal.val() > 1) {
                        $inputVal.val($count);
                        $priceTotalObj.html('￥' + $priceTotal);
                    }
                    if ($inputVal.val() == 1 && !$(this).hasClass('reSty')) {
                        $(this).addClass('reSty');
                    }
                    totalMoney();
                });

                $all_sum.keyup(function () {
                    var $count = 0,
                        $priceTotalObj = $(this).parents('.order_lists').find('.sum_price'),
                        $price = $(this).parents('.order_lists').find('.price').html(),  //单价
                        $priceTotal = 0;
                    if ($(this).val() == '') {
                        $(this).val('1');
                    }
                    $(this).val($(this).val().replace(/\D|^0/g, ''));
                    $count = $(this).val();
                    $priceTotal = $count * $price;
                    $(this).attr('value', $count);
                    $priceTotalObj.html('￥' + $priceTotal);
                    totalMoney();
                })
                //======================================移除商品========================================
                var $order_lists = null;
                var $order_content = '';
                var delId = null;
                $('.delBtn').click(function () {
                    $order_lists = $(this).parents('.order_lists');
                    $order_content = $order_lists.parents('.order_content');
                    $('.model_bg').fadeIn(300);
                    $('.my_model').fadeIn(300);
                    delId = $(this).children().val();
                });
                //关闭模态框
                $('.closeModel').click(function () {closeM();});
                $('.dialog-close').click(function () {closeM();});
                function closeM() {$('.model_bg').fadeOut(300);$('.my_model').fadeOut(300);}
                //确定按钮，移除商品
                $('.dialog-sure').click(function () {
                    $.getJSON("car/del", {"delId": delId}, function (data) {});
                    $order_lists.remove();
                    if ($order_content.html().trim() == null || $order_content.html().trim().length == 0) {
                        $order_content.parents('.cartBox').remove();
                    }
                    closeM();
                    $sonCheckBox = $('.son_check');
                    totalMoney();
                })
                function totalMoney() {
                    var total_money = 0;
                    var total_count = 0;
                    var calBtn = $('.calBtn a');
                    $sonCheckBox.each(function () {
                        if ($(this).is(':checked')) {
                            var goods = parseInt($(this).parents('.order_lists').find('.sum_price').html().substring(1));
                            var num = parseInt($(this).parents('.order_lists').find('.sum').val());
                            total_money += goods;
                            total_count += num;
                        }
                    });
                    $('.total_text').html('￥' + total_money);
                    $('.piece_num').html(total_count);
                    if (total_money != 0 && total_count != 0) {
                        if (!calBtn.hasClass('btn_sty')) {
                            calBtn.addClass('btn_sty');
                        }
                    } else {
                        if (calBtn.hasClass('btn_sty')) {
                            calBtn.removeClass('btn_sty');
                        }
                    }
                }
            })
        })
    </script>
</head>
<body>
<!-- 首页头部 -->
<div class="first">
    <div class="headone">
        <span>欢迎来到皆有杂货铺！</span>
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
            <input type="text" name="words" value=""/>
            <input type="button" name="see" value="搜索"/>
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
<section class="cartMain">
    <div class="cartMain_hd">
        <ul class="order_lists cartTop">
            <li class="list_chk">
                <!--所有商品全选-->
                <input type="checkbox" id="all" class="whole_check">
                <label for="all"></label>
                全选
            </li>
            <li class="list_con">商品信息</li>
            <li class="list_info">商品参数</li>
            <li class="list_price">单价</li>
            <li class="list_amount">数量</li>
            <li class="list_sum">金额</li>
            <li class="list_op">操作</li>
        </ul>
    </div>
    <div class="cartBox">
        <div class="order_content">
        </div>
    </div>
    <!--底部-->
    <div class="bar-wrapper">
        <div class="bar-right">
            <div class="piece">已选商品<strong class="piece_num">0</strong>件</div>
            <div class="totalMoney">共计: <strong class="total_text">0.00</strong></div>
            <div class="calBtn"><a href="javascript:;">结算</a></div>
        </div>
    </div>
</section>
<section class="model_bg"></section>
<section class="my_model">
    <p class="title">删除宝贝<span class="closeModel">X</span></p>
    <p>您确认要删除该宝贝吗？</p>
    <div class="opBtn"><a href="javascript:;" class="dialog-sure">确定</a><a href="javascript:;" class="dialog-close">关闭</a></div>
</section>
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
</body>
</html>