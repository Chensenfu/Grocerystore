package com.controller;

import com.entity.*;
import com.service.DetailPageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("detail")
@ResponseBody
public class DetailPageController {

    @Autowired
    private DetailPageService detailPageService;
    @RequestMapping("queryImg")
    public List<Img> queryImg(){
        return detailPageService.queryImg();
    }
    @RequestMapping("queryImgs")
    public List<Imgs> queryImgs(){
        return detailPageService.queryImgs();
    }
    @RequestMapping("qureyShop")
    public Shop queryShop(){
        return detailPageService.queryShop();
    }
    @RequestMapping("queryTuijian")
    public List<Shop> queryTuijian(){ return detailPageService.queryTuijian(); }
    @RequestMapping("queryPingjia")
    public List<PingJia> queryPingjia(){ return detailPageService.queryPingjia(); }
    @RequestMapping("queryPingjiacount")
    public Integer queryPingjiacount(){ return detailPageService.queryPingjiacount(); }
}
