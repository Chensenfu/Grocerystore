<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2020/2/25
  Time: 13:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>商品</title>
    <link rel="stylesheet" type="text/css" href="css/daohang.css"/>
    <link rel="stylesheet" type="text/css" href="css/head.css"/>
    <link rel="stylesheet" type="text/css" href="css/tongyong.css"/>
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
</head>
<body>
<div class="first">
    <div class="headone">
        <span>欢迎来到皆有杂货铺！</span>
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
            <input type="text" name="words"  value="" />
            <input type="button" name="see"  value="搜索" />

        </div>

        <a href="javascript:gomycar()" class="aone">购物车</a>
    </div>
</form>
<div class="ziying">
    <div class="ccc">
        <div class="ziyingb" id="vare">
            <!-- <div class="inner goods-list"> -->
        </div>
    </div>
</div>

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



<div class="htmleaf-container">
    <!-- 右侧小火箭图标返回顶部 -->
    <div id="shangxia2">
					<span id="gotop1">
						<img src="img/huojian.svg" alt="返回顶部小火箭">
                        <!-- <img src="img/rocked.png" alt="返回顶部小火箭"> -->
					</span>
    </div>
</div>
<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
<%--<script src="http://libs.useso.com/js/jquery/1.11.0/jquery.min.js" type="text/javascript"></script>--%>
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
        })
        $("input[name=see]").click(function () {
            var shopName = $("input[name=words]").val();
            $.getJSON("shopping/querymohu",{"shopName":shopName},function (data) {
                if (data==""||data==null){
                    alert("商品不存在")
                } else {
                    var str ="";
                    $(data).each(function () {
                        str +=  "<div class=\"pic-wrapper\">" +
                            "<a href=\"xiangqingye.jsp?id="+this.shopId+"\" class=\"goods-item\">" +
                            "<img class=\"pis\" src=\"img/"+this.img.img+"\" alt=\"\">" +
                            "<p class=\"goods-name\">"+this.shopName+"</p>" +
                            "<div class=\"price-wrapper\">"+"￥"+this.price+"</div>" +
                            "</a>"+
                            "</div>"
                    })
                    $("#vare").empty().append(str);
                }

            })
        })
    })
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
</body>
</html>
