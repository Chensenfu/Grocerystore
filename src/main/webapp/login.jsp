<%--
  Created by IntelliJ IDEA.
  User: Asura
  Date: 2020/2/18
  Time: 10:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录</title>

    <style type="text/css">
        .tu {
            background: url("img/tu.jpg") no-repeat;
            background-size: 100% 100%;
        }

        .shouye{
            width: 208px;
            height: 208px;
            border: 0px solid blue;
            float: right;
            margin-right: -452px;
            margin-top: 135px;
            border-radius: 110px;
            cursor:pointer;
        }
        .shouye1{
            width: 208px;
            height: 208px;
            border: 0px solid blue;
            float: left;
            margin-left: -404px;
            margin-top: 135px;
            border-radius: 110px;
            cursor: pointer;
        }
    </style>


    <link href="css/styles.css" rel="stylesheet">
    <link href="css/buttons.css" rel="stylesheet">

    <script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>

    <script type="text/javascript" src="js/denglu-zhuce.js"></script>
    <script type="text/javascript" src="js/deng-update.js"></script>
</head>
<body>
<div class="tu">
    <div class="login-wrap">
        <div class="shouye" onclick="window.location.href='index.jsp'">

        </div>
        <div class="shouye1" onclick="window.location.href='index.jsp'">

        </div>
        <div class="login-html">
            <input id="tab-1" type="radio" name="tab" class="sign-in" checked><label for="tab-1" class="tab">登录</label>
            <input id="tab-2" type="radio" name="tab" class="sign-up"><label for="tab-2" class="tab">注册</label>
            <%--<label class="tab1" style="display: none">忘记密码</label>--%>
            <div class="login-form">
                <div class="sign-in-htm">
                    <div class="group">
                        <label for="user" class="label">账户名/手机号码</label>
                        <label id="tishiname" class="tishi" style="color: #f23149"></label>
                        <input id="user" type="text" class="input" placeholder="请输入账户名/手机号">
                    </div>
                    <div class="group">
                        <label for="pass" class="label">密码</label>
                        <label id="tishipwd" class="tishi" style="color: #f23149"></label>
                        <input id="pass" type="password" class="input" data-type="password" placeholder="请输入密码">
                    </div>
                    <!-- <div class="group">
                      <input id="check" type="checkbox" class="check" checked>
                      <label for="check"><span class="icon"></span> Keep me Signed in</label>
                    </div> -->
                    <div class="group box bg-2">
                        <label id="tishideng" class="tishi" style="color: #f23149"></label>
                        <%--<input id="denglu" type="button" class="button" value="登录">--%>
                        <button id="denglu" type="button" class="button button--nanuk button--round-l button--text-thick button--inverted">
                            <span>登</span><span>录</span><%--<span>账</span><span>户</span>--%>
                        </button>
                    </div>
                    <div class="hr"></div>
                    <div class="foot-lnk">
                        <a>忘记密码？</a>

                    </div>
                </div>
                <form>
                <div class="foot-wang">
                    <span class="tab1">忘记密码</span>
                    <div class="group">
                        <label for="pass" class="label">手机号码</label>
                        <label id="update-tishitel" class="tishi" style="color: #f23149"></label>
                        <input id="update-pass0" type="text" name="tel" class="input" placeholder="请输入手机号码">
                    </div>
                    <div class="group" style="width: 50%">
                        <label for="pass" class="label">验证码</label>
                        <label id="update-tishiyan" class="tishi" style="color: #f23149"></label>
                        <input id="update-pass1" type="yan" name="yanzheng" class="input" data-type="password" placeholder="请输入验证码">
                        <input id="update-btnSendCode1" type="button" class="btn btn-default" style="cursor:pointer;" value="获取验证码" onclick="sendMessage1()" />
                    </div>
                    <div class="group">
                        <label for="pass" class="label">新密码</label>
                        <label id="update-tishipwd1" class="tishi" style="color: #f23149"></label>
                        <input id="update-pass2" type="password" name="password" class="input" data-type="password" placeholder="请输入密码">
                    </div>
                    <div class="group">
                        <label for="pass" class="label">确认密码</label>
                        <label id="update-tishipwd2" class="tishi" style="color: #f23149"></label>
                        <input id="update-pass3" type="password" name="password1" class="input" data-type="password" placeholder="请确认密码">
                    </div>
                    <div class="group">
                        <label id="update-tishizhu" class="tishi" style="color: #f23149"></label>
                        <%--<input id="zhuce" type="button" name="zhuce" class="button" value="注册">--%>
                        <button id="update-zhuce" type="button" class="button button--nanuk button--round-l button--text-thick button--inverted">
                            <span>提</span><span>交</span><%--<span>账</span><span>户</span>--%>
                        </button>
                    </div>
                    <div class="hr"></div>
                    <div class="foot-lnk">
                        <a onclick="window.location.href='login.jsp'">返回登录?</a>
                    </div>
                </div>
                </form>
                <form>
                    <div class="sign-up-htm">
                        <div class="group">
                            <label for="user" class="label">账户名</label>
                            <label id="tishiname1" class="tishi" style="color: #f23149"></label>
                            <input id="user1" type="text" name="username" class="input" placeholder="请输入账户名">
                        </div>
                        <div class="group">
                            <label for="pass" class="label">手机号码</label>
                            <label id="tishitel" class="tishi" style="color: #f23149"></label>
                            <input id="pass0" type="text" name="tel" class="input" placeholder="请输入手机号码">
                        </div>
                        <div class="group" style="width: 50%">
                            <label for="pass" class="label">验证码</label>
                            <label id="tishiyan" class="tishi" style="color: #f23149"></label>
                            <input id="pass1" type="yan" name="yanzheng" class="input" data-type="password" placeholder="请输入验证码">
                            <input id="btnSendCode1" type="button" class="btn btn-default" style="cursor:pointer;" value="获取验证码" onclick="sendMessage1()" />
                        </div>
                        <div class="group">
                            <label for="pass" class="label">密码</label>
                            <label id="tishipwd1" class="tishi" style="color: #f23149"></label>
                            <input id="pass2" type="password" name="password" class="input" data-type="password" placeholder="请输入密码">
                        </div>
                        <div class="group">
                            <label for="pass" class="label">确认密码</label>
                            <label id="tishipwd2" class="tishi" style="color: #f23149"></label>
                            <input id="pass3" type="password" name="password1" class="input" data-type="password" placeholder="请确认密码">
                        </div>
                        <div class="group">
                            <label id="tishizhu" class="tishi" style="color: #f23149"></label>
                            <%--<input id="zhuce" type="button" name="zhuce" class="button" value="注册">--%>
                            <button id="zhuce" type="button" class="button button--nanuk button--round-l button--text-thick button--inverted">
                                <span>注</span><span>册</span><%--<span>账</span><span>户</span>--%>
                            </button>
                        </div>
                        <div class="hr"></div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
