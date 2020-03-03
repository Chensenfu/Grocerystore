package com.controller;

import com.aliyuncs.dysmsapi.model.v20170525.SendSmsResponse;
import com.aliyuncs.exceptions.ClientException;
import com.service.impl.SendMessageUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;


@Controller
@RequestMapping("message")
public class SmsController {

    //创建验证码
    public static String smsCode(){
        String random=(int)((Math.random()*9+1)*100000)+"";
        System.out.print("random验证码:"+random);
        return random;
    }

    @ResponseBody
    @RequestMapping("sendMsg")
    public String sendMsg(@RequestParam("phoneNumber") String phoneNumber,
                          HttpServletRequest request) throws ClientException, InterruptedException {
//      String phoneNumber = request.getParameter("phoneNumber");//获取前端传送过来的电话号码
        String randomNum = smsCode();//随机生成6位数的验证码
        String jsonContent = "{\"code\":\"" + randomNum + "\"}";//这里的code对应在阿里大于创建短信模板时的${code}
        Map<String, String> paramMap = new HashMap<>();
        paramMap.put("phoneNumber", phoneNumber);
        paramMap.put("msgSign", "解忧杂货铺");//阿里大于创建短信签名的签名名称
        paramMap.put("templateCode", "SMS_184620860");//阿里大于创建短信模板的模版名称
        paramMap.put("jsonContent", jsonContent);
        SendSmsResponse sendSmsResponse = SendMessageUtils.sendSms(paramMap); //阿里大于发送机制
        System.out.println("短信接口返回的数据----------------");
        System.out.println("Code=" + sendSmsResponse.getCode());
        System.out.println("Message=" + sendSmsResponse.getMessage());
        System.out.println("RequestId=" + sendSmsResponse.getRequestId());
        System.out.println("BizId=" + sendSmsResponse.getBizId());

        Thread.sleep(3000L);

        if(sendSmsResponse.getCode() != null && sendSmsResponse.getCode().equals("OK")) {
            System.out.println(paramMap);
            System.out.println("短信验正码发送成功！");
        }else {
            System.out.println(sendSmsResponse.getCode()+" 短信发送失败！");
        }
        return randomNum;

    }




}
