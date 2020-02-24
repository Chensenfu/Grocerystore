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

$(function () {


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
            $("#tishiname1").html("用户名不能为空");
        }else if(!reg1.test(name)){
            $("#tishiname1").html("用户名填写格式错误")
        }else{
            $("#tishiname1").html("");
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
    $("#pass2").blur(function () {
        if ($("#pass2").val()==""){
            $("#tishipwd1").html("密码不能为空");
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
        var name = $("#user").val();
        var pwd = $("#pass").val();

        if (name == "" && pwd != ""){
            $("#tishiname").html("");
            $("#tishipwd").html("");
            $("#tishideng").html("用户名不能为空")
        }else if (name != "" && pwd == ""){
            $("#tishiname").html("");
            $("#tishipwd").html("");
            $("#tishideng").html("密码不能为空")
        }else if (name == "" && pwd == ""){
            $("#tishiname").html("");
            $("#tishipwd").html("");
            $("#tishideng").html("用户名和密码不能为空")
        }else {


            $.ajax({
                url: "user/login",
                type: "post",
                data: {"name":name, "pwd":pwd},
                dataType: "json",
                success: function (data) {

                    if(data){
                        $("#user").val("");
                        window.location.href = "index.jsp";
                    }else {
                        $("#tishideng").html("用户名或密码不正确")
                    }


                }
            })
        }
    });









    //注册账号
    $("button[type=button]:last").click(function(){
        var name1 = $("#user1").val();
        var tel = $("#pass0").val();
        var yan =$("#pass1").val();
        var pwd1 = $("#pass2").val();
        var pwd2 = $("#pass3").val();

        if (name1 ==""){
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
            $.getJSON("user/add", $("form").serialize(), function(data){

                if(data){
                    window.location.href="login.jsp";
                }
            })
        }

    });




    $(document).keydown(function (event) {
        if(event.keyCode == "13"){
            $("input[type=button]").click();
        }
    })



})