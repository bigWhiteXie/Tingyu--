package com.codeXie.controller;

import com.aliyun.dysmsapi20170525.models.SendSmsRequest;
import com.aliyun.dysmsapi20170525.models.SendSmsResponse;
import com.aliyun.teaopenapi.models.Config;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("alphone")
public class AliphoneController {


    private  com.aliyun.dysmsapi20170525.Client client;

    {
        Config config = new Config().setAccessKeyId("LTAI4FjcD4RscpyAGNyCAhjt").setAccessKeySecret("8MqYTcF7asvbRFiOB1lKd39Kri7Jut");
        config.endpoint = "dysmsapi.aliyuncs.com";
        try {
            client = new com.aliyun.dysmsapi20170525.Client(config);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    @RequestMapping("phone")
    @ResponseBody
    public String sendCode(String phonenumber, HttpSession session){
        int code= (int) Math.floor(Math.random()*9000+1000);
        String status = "ok";
        SendSmsRequest sendSmsRequest = new SendSmsRequest()
                .setPhoneNumbers("16602624578")
                .setSignName("ting域主持人平台")
                .setTemplateCode("SMS_184205863")
                .setTemplateParam("{\"code\":\"\"+code+\"\"}");
        try {
            SendSmsResponse response = client.sendSms(sendSmsRequest);
            session.setAttribute("code",code);
        } catch (Exception e) {
            e.printStackTrace();
            status = "error";
        }
        return status;
    }


}
