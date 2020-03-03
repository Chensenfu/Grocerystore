var phoneReg = /(^1[3|4|5|7|8]\d{9}$)|(^09\d{8}$)/;//手机号正则
var count = 60; //间隔函数，1秒执行
var InterValObj1; //timer变量，控制时间
var curCount1;//当前剩余秒数
/*第一*/
function sendMessage1() {
    curCount1 = count;
    var phone = $.trim($('#update-pass0').val());
    if (!phoneReg.test(phone)) {
        $("#update-tishitel").html("请输入正确的手机号");
        return false;
    }
    //设置button效果，开始计时
    $("#update-btnSendCode1").attr("disabled", "true");
    $("#update-btnSendCode1").val( + curCount1 + "秒再获取");
    InterValObj1 = window.setInterval(SetRemainTime1, 1000); //启动计时器，1秒执行一次
    //向后台发送处理数据

}
function SetRemainTime1() {
    if (curCount1 == 0) {
        window.clearInterval(InterValObj1);//停止计时器
        $("#update-btnSendCode1").removeAttr("disabled");//启用按钮
        $("#update-btnSendCode1").val("重新发送");
    }
    else {
        curCount1--;
        $("#update-btnSendCode1").val( + curCount1 + "秒再获取");
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



    //忘记密码
    $(".foot-lnk a").click(function () {
        $(".tab").css("display","none");
        $(".sign-in-htm").css("display","none");
        $(".sign-up-htm").css("display","none");
        $(".foot-wang").css("display","inline-block");
    });

    var tel = /^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\d{8}$/;
    //忘记密码-手机号
    $("#update-pass0").blur(function () {

        var tel1 = $("#update-pass0").val();

        if ($("#update-pass0").val()==""){
            $("#update-tishitel").html("手机号不能为空");
        }else if(!tel.test(tel1)){
            $("#update-tishitel").html("手机号格式不正确");
        }else{
            $("#update-tishitel").html("");
        }
    });
    $("#update-pass0").focus(function () {
        $("#update-tishitel").html("");
        $("#update-tishizhu").html("")
    });

    //忘记密码-密码
    var reg = /^.{6,20}$/;
    $("#update-pass2").blur(function () {
        if ($("#update-pass2").val()==""){
            $("#update-tishipwd1").html("密码不能为空");
        }else if (!reg.test($("#update-pass2").val())){
            $("#update-tishipwd1").html("密码长度必须为6位以上");
        }else{
            $("#update-tishipwd1").html("");
        }
    });
    $("#update-pass2").focus(function () {
        $("#update-tishipwd1").html("");
        $("#update-tishizhu").html("")
    });


    //忘记密码-确认密码
    $("#update-pass3").blur(function () {
        if ($("#update-pass3").val()==""){
            $("#update-tishipwd2").html("确认密码不能为空");
        }else{
            $("#update-tishipwd2").html("");
        }
    });
    $("#update-pass3").focus(function () {
        $("#update-tishipwd2").html("");
        $("#update-tishizhu").html("")
    });


    //点击提交
    $("#update-zhuce").click(function () {
        var tel = $("#update-pass0").val();
        var yan =$("#update-pass1").val();
        var pwd1 = $("#update-pass2").val();
        var pwd2 = $("#update-pass3").val();

        if (tel == ""){
            $(".tishi").html("");
            $("#update-tishizhu").html("手机号不能为空")
        }else if (yan == ""){
            $(".tishi").html("");
            $("#update-tishizhu").html("验证码不能为空")
        }else if (sms != yan){
            $("#update-tishizhu").html("验证码错误！")
        }else if (pwd1 == ""){
            $(".tishi").html("");
            $("#update-tishizhu").html("新密码不能为空")
        }else if (pwd2 == ""){
            $(".tishi").html("");
        }else if (pwd2 != pwd1){
            $("#update-tishizhu").html("密码错误请重新填写")
        }else{
            $.ajax({
                url: "user/updatePwd",
                type: "post",
                data: {"tel":tel,"pwd":pwd1},
                dataType: "json",
                success: function (data) {
                    if (data){

                        window.location.href="login.jsp";
                    }else{
                        $("#tishideng").html("修改失败，请重新修改！")
                    }
                }
            })
        }
    })

    $(document).keydown(function (event) {
        if(event.keyCode == "13"){
            $("button[type=button]").click();
        }
    })

});