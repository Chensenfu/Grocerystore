var phoneReg = /(^1[3|4|5|7|8]\d{9}$)|(^09\d{8}$)/;//手机号正则
var count = 60; //间隔函数，1秒执行
var InterValObj1; //timer变量，控制时间
var curCount1;//当前剩余秒数
/*第一*/
function sendMessage1() {
    curCount1 = count;
    var phone = $.trim($('#pass0').val());
    if (!phoneReg.test(phone)) {
        $("#tishitel").html("请输入正确的手机号");
        return false;
    }
    //设置button效果，开始计时
    $("#btnSendCode1").attr("disabled", "true");
    $("#btnSendCode1").val( + curCount1 + "秒再获取");
    InterValObj1 = window.setInterval(SetRemainTime1, 1000); //启动计时器，1秒执行一次
    //向后台发送处理数据

}
function SetRemainTime1() {
    if (curCount1 == 0) {
        window.clearInterval(InterValObj1);//停止计时器
        $("#btnSendCode1").removeAttr("disabled");//启用按钮
        $("#btnSendCode1").val("重新发送");
    }
    else {
        curCount1--;
        $("#btnSendCode1").val( + curCount1 + "秒再获取");
    }
}


var InterValObj; //timer变量，控制时间
var count = 60; //间隔函数，1秒执行
var curCount;//当前剩余秒数
function sendMessage() {
    curCount = count;
    $(".btn").attr("disabled", "true");
    $(".btn").val(curCount + "秒后可重新发送");
    InterValObj = window.setInterval(SetRemainTime, 1000); //启动计时器，1秒执行一次请求后台发送验证码 TODO
}
//timer处理函数
function SetRemainTime() {
    if (curCount == 0) {
        window.clearInterval(InterValObj);//停止计时器
        $(".btn").removeAttr("disabled");//启用按钮
        $(".btn").val("重新发送验证码");
    } else {
        curCount--;
        $(".btn").val(curCount + "秒后可重新发送");
    }
}

var sms = "";
$(function () {


    $("#tab-1").click(function () {
        $("#user1").val("");
        $("#pass0").val("");
        $("#pass1").val("");
        $("#pass2").val("");
        $("#pass3").val("");
        $(".tishi").html("");
    });

    $("#tab-2").click(function () {
        $("#user").val("");
        $("#pass").val("");
        $(".tishi").html("");
    });

    $(".btn").click(function() {
        var phone = $("input[name=tel]").val();
        if (phone != "") {
            $.ajax({
                url : "message/sendMsg",  //发送请求
                type : "post",
                data:{"phoneNumber":phone},
                success : function(data) {
                    sms = data;
                }
            });
        } else {
            /*$("#tishiyan").html("请输入手机号");*/
            return false;
        }
    });

    /*$("#zhuce").click(function() {
        var code = $("input[name=yanzheng]").val();
        if (code == "") {
            $("#tishideng").html("请输入验证码！")
        } else {
            if (sms != code) {
                $("#tishideng").html("注册失败，验证码错误！")
            } else {
                window.location.href = "login.jsp";
            }

        }

    });*/

    /*$("#user").blur(function () {
        $("#tishiname").html("用户名不能为空");
    });
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
            $("#tishipwd").html("密码不能为空");
        }else{
            $("#tishipwd").html("");
        }
    });
    $("#pass").focus(function () {
        $("#tishipwd").html("");
        $("#tishideng").html("")
    });


    var reg1 =/^.{1,10}$/;
    //注册-用户名
    $("#user1").blur(function () {
        //用户名正则校验   长度为1-10的所有字符
        var name = $("#user1").val();

        if ($("#user1").val()==""){
            $("#tishiname1").html("账户名不能为空");
        }else if(!reg1.test(name)){
            $("#tishiname1").html("账户名填写格式错误")
        }else{
            $("#tishiname1").html("");
            $.getJSON("user/chaxiangtong",{"tel":"","username":name},function (data) {
                if (data==1){
                    $("#tishiname1").html("该账户名已注册，请重新输入");
                }

            })
        }
    });
    $("#user1").focus(function () {
        $("#tishiname1").html("");
        $("#tishizhu").html("")
    });

    var tel = /^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\d{8}$/;

    //注册-手机号
    $("#pass0").blur(function () {

        var tel1 = $("#pass0").val();

        if ($("#pass0").val()==""){
            $("#tishitel").html("手机号不能为空");
        }else if(!tel.test(tel1)){
            $("#tishitel").html("手机号格式不正确");
        }else if ($("#pass0")==user.tel){
            $("#tishitel").html("该手机号已注册，请重新输入手机号！");
        }else{
            $("#tishitel").html("");
            $.getJSON("user/chaxiangtong",{"tel":tel1,"username":""},function (data) {
                if (data==2){
                    $("#tishitel").html("该手机号已注册，请重新输入");
                }

            })
        }
    });
    $("#pass0").focus(function () {
        $("#tishitel").html("");
        $("#tishizhu").html("")
    });


    /*//注册-验证码
    $("#pass1").blur(function () {
        if ($("#pass1").val()==""){
            $("#tishiyan").html("验证码不能为空");
        }else{
            $("#tishiyan").html("");
        }
    });
    $("#pass1").focus(function () {
        $("#tishiyan").html("");
        $("#tishizhu").html("")
    });*/


    //注册-密码
    var reg = /^.{6,20}$/;
    $("#pass2").blur(function () {
        if ($("#pass2").val()==""){
            $("#tishipwd1").html("密码不能为空");
        }else if (!reg.test($("#pass2").val())){
            $("#tishipwd1").html("密码长度必须为6位以上");
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
            $("#tishipwd2").html("确认密码不能为空");
        }else{
            $("#tishipwd2").html("");
        }
    });
    $("#pass3").focus(function () {
        $("#tishipwd2").html("");
        $("#tishizhu").html("")
    });



    //登录&校验
    $("button[type=button]:first").click(function () {
        var username = $("#user").val();
        var pwd = $("#pass").val();

        if (username == "" && pwd != ""){
            $("#tishiname").html("");
            $("#tishipwd").html("");
            $("#tishideng").html("账户名/手机号不能为空不能为空")
        }else if (username != "" && pwd == ""){
            $("#tishiname").html("");
            $("#tishipwd").html("");
            $("#tishideng").html("密码不能为空")
        }else if (username == "" && pwd == ""){
            $("#tishiname").html("");
            $("#tishipwd").html("");
            $("#tishideng").html("用户名和密码不能为空")
        }else {
            $.ajax({
                url: "user/login",
                type: "post",
                data: {"username":username, "pwd":pwd},
                dataType: "json",
                success: function (data) {
                    if (data==1){
                        $("#tishideng").html("登录失败，该用户不存在");
                        confirm("您没有注册，请点击注册账号")
                    }else if (data==2){
                        $("#tishideng").html("登录失败，密码错误")
                    }else if (data==3){
                        $("#tishideng").html("登录失败，账户已冻结")
                    }else{
                        $("#user").val("");
                        window.location.href = "index.jsp";
                    }

                    /*if(data){
                        $("#user").val("");
                        window.location.href = "index.jsp";
                    }else {
                        $("#tishideng").html("用户名或密码不正确")
                    }*/


                }
            })
        }
    });


    //注册账号
    $("button[type=button]:last").click(function(){
        var username = $("#user1").val();
        var tel = $("#pass0").val();
        var yan =$("#pass1").val();
        var pwd1 = $("#pass2").val();
        var pwd2 = $("#pass3").val();

        if (username ==""){
            $("#tishiname1").html("");
            $("#tishitel").html("");
            $("#tishipwd1").html("");
            $("#tishipwd2").html("");
            $("#tishizhu").html("用户名不能为空")
        }else if (tel ==""){
            $("#tishiname1").html("");
            $("#tishitel").html("");
            $("#tishipwd1").html("");
            $("#tishipwd2").html("");
            $("#tishizhu").html("手机号不能为空")
        }else if (yan == ""){
            $("#tishiname1").html("");
            $("#tishitel").html("");
            $("#tishipwd1").html("");
            $("#tishipwd2").html("");
            $("#tishizhu").html("验证码不能为空")
        }else if (sms != yan){
            $("#tishizhu").html("注册失败，验证码错误！")
        }else if (pwd1 ==""){
            $("#tishiname1").html("");
            $("#tishitel").html("");
            $("#tishipwd1").html("");
            $("#tishipwd2").html("");
            $("#tishizhu").html("密码不能为空")
        }else if (pwd2 ==""){
            $("#tishiname1").html("");
            $("#tishitel").html("");
            $("#tishipwd1").html("");
            $("#tishipwd2").html("");
            $("#tishizhu").html("确认密码不能为空")
        }else if (pwd2 != pwd1){
            $("#tishiname1").html("");
            $("#tishitel").html("");
            $("#tishipwd1").html("");
            $("#tishipwd2").html("");
            $("#tishizhu").html("密码错误请重新填写")
        }else {
            $.ajax({
                url: "user/add",
                type: "post",
                data: $("form").serialize(),
                dataType: "json",
                success: function (data) {
                    if (data){

                        window.location.href="login.jsp";
                    }else{
                        $("#tishideng").html("注册失败，请重新注册！")
                    }
                }
            })

            /*$.getJSON("user/add", $("form").serialize(), function(data){

                if(data){
                    window.location.href="login.jsp";
                }
            })*/
        }

    });


    $(document).keydown(function (event) {
        if(event.keyCode == "13"){
            $("button[type=button]").click();
        }
    })
    
});



