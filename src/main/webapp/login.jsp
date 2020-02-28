<%--
  Created by IntelliJ IDEA.
  User: Asura
  Date: 2020/1/10
  Time: 17:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录</title>

    <style type="text/css">
        .login-form{
            min-height:345px;
            position:relative;
            -webkit-perspective:1000px;
            perspective:1000px;
            -webkit-transform-style:preserve-3d;
            transform-style:preserve-3d;
        }
        body{
            min-width: 1440px;
        }
        .tu {
            background: url("img/tu.jpg") no-repeat;
            background-size: 100% 100%;
        }

    </style>
    <link href="css/default.css" rel="stylesheet">
    <link href="css/normalize.css" rel="stylesheet">
    <link href="css/styles.css" rel="stylesheet">
    <script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript">
        $(function () {
            /*$("#user").blur(function () {
                $("#tishiname").html("用户名不能为空");
        });~`
            $("#pass").blur(function () {
                $("#tishipwd").html("密码不能为空");
            });
            $("#user").focus(function () {
                $("#tishiname").html("");
            });
            $("#pass").focus(function () {
                $("#tishipwd").html("");
            });*/

                //登录-用户名
                $("#user").blur(function () {
                    if ($("#user").val()==""){
                    $("#tishiname").html("用户名不能为空");
                    }else{
                        $("#tishiname").html("");
                    }
                });
                $("#user").focus(function () {

                    $("#tishiname").html("");
                    $("#tishideng").html("")

                });
                //登录-密码
                $("#pass").blur(function () {
                    if ($("#pass").val()==""){
                        $("#tishipwd").html("用户名不能为空");
                    }else{
                        $("#tishipwd").html("");
                    }
                });
                $("#pass").focus(function () {
                    $("#tishipwd").html("");
                    $("#tishideng").html("")
                });

                //注册-用户名
                $("#user1").blur(function () {
                    if ($("#user1").val()==""){
                        $("#tishiname1").html("用户名不能为空");
                    }else{
                        $("#tishiname1").html("");
                    }
                });
                $("#user1").focus(function () {
                    $("#tishiname1").html("");
                    $("#tishizhu").html("")
                });

                //注册-手机号
                $("#pass0").blur(function () {
                    if ($("#pass0").val()==""){
                        $("#tishitel").html("用户名不能为空");
                    }else{
                        $("#tishitel").html("");
                    }
                });
                $("#pass0").focus(function () {
                    $("#tishitel").html("");
                    $("#tishizhu").html("")
                });


                //注册-验证码
                $("#pass1").blur(function () {
                    if ($("#pass1").val()==""){
                        $("#tishiyan").html("用户名不能为空");
                    }else{
                        $("#tishiyan").html("");
                    }
                });
                $("#pass1").focus(function () {
                    $("#tishiyan").html("");
                    $("#tishizhu").html("")
                });


                //注册-密码
                $("#pass2").blur(function () {
                    if ($("#pass2").val()==""){
                        $("#tishipwd1").html("用户名不能为空");
                    }else{
                        $("#tishipwd1").html("");
                    }
                });
                $("#pass2").focus(function () {
                    $("#tishipwd1").html("");
                    $("#tishizhu").html("")
                });


                //注册-确认密码
                $("#pass3").blur(function () {
                    if ($("#pass3").val()==""){
                        $("#tishipwd2").html("用户名不能为空");
                    }else{
                        $("#tishipwd2").html("");
                    }
                });
                $("#pass3").focus(function () {
                    $("#tishipwd2").html("");
                    $("#tishizhu").html("")
                });




            $("input[type=button]:first").click(function () {
                var name = $("#user").val();
                var pwd = $("#pass").val();

                    $.ajax({
                        url: "user/login",
                        type: "post",
                        data: {"name":name, "pwd":pwd},
                        dataType: "json",
                        success: function (data) {
                            if(data){
                                window.location.href = "index.jsp";
                            }else{
                                $("#tishideng").html("用户名或密码错误")
                            }
                        }
                    })

            });

            $("#zhuce").click(function(){
                $.getJSON("user/add", $("form").serialize(), function(data){

                    if(data){
                        window.location.href="login.jsp";
                    }else {
                        $("#zhuce").html("用户名或密码错误")
                    }
                })


            })




            $(document).keydown(function (event) {
                if(event.keyCode == "13"){
                    $("input[type=button]").click();
                }
            })
        })

    </script>

</head>
<body>
<div class="tu">
<div class="login-wrap">
    <div class="login-html">
        <input id="tab-1" type="radio" name="tab" class="sign-in" checked><label for="tab-1" class="tab">登录</label>
        <input id="tab-2" type="radio" name="tab" class="sign-up"><label for="tab-2" class="tab">注册</label>
        <div class="login-form">
            <div class="sign-in-htm">
                <div class="group">
                    <label for="user" class="label">账户名/手机号码</label>
                    <label id="tishiname" class="tishi" style="color: #C06968"></label>
                    <input id="user" type="text" class="input">
                </div>
                <div class="group">
                    <label for="pass" class="label">密码</label>
                    <label id="tishipwd" class="tishi" style="color: #C06968"></label>
                    <input id="pass" type="password" class="input" data-type="password">
                </div>
                <!-- <div class="group">
                  <input id="check" type="checkbox" class="check" checked>
                  <label for="check"><span class="icon"></span> Keep me Signed in</label>
                </div> -->
                <div class="group">
                    <label id="tishideng" class="tishi" style="color: #C06968"></label>
                    <input id="denglu" type="button" class="button" value="登录">
                </div>
                <div class="hr"></div>
                <div class="foot-lnk">
                    <a href="#forgot">忘记密码？</a>
                </div>
            </div>
            <form>
            <div class="sign-up-htm">
                <div class="group">
                    <label for="user" class="label">账户名</label>
                    <label id="tishiname1" class="tishi" style="color: #C06968"></label>
                    <input id="user1" type="text" class="input">
                </div>
                <div class="group">
                    <label for="pass" class="label">手机号码</label>
                    <label id="tishitel" class="tishi" style="color: #C06968"></label>
                    <input id="pass0" type="text" class="input">
                </div>
                <div class="group">
                    <label for="pass" class="label">验证码</label>
                    <label id="tishiyan" class="tishi" style="color: #C06968"></label>
                    <input id="pass1" type="name" class="input" data-type="password">
                </div>
                <div class="group">
                    <label for="pass" class="label">密码</label>
                    <label id="tishipwd1" class="tishi" style="color: #C06968"></label>
                    <input id="pass2" type="password" class="input" data-type="password">
                </div>
                <div class="group">
                    <label for="pass" class="label">确认密码</label>
                    <label id="tishipwd2" class="tishi" style="color: #C06968"></label>
                    <input id="pass3" type="password" class="input" data-type="password">
		        </div>
		        <div class="group">
                    <label id="tishizhu" class="tishi" style="color: #C06968"></label>
                    <input id="zhuce" type="button" class="button" value="注册">
                </div>
                <div class="hr"></div>
                <div class="foot-lnk">
                    <label for="tab-1"><a>已注册,请登录!</a></label>
                </div>
            </div>
            </form>
        </div>
    </div>
</div>
</div>
</body>
</html>
