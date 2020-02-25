package com.controller;

import com.entity.*;
import com.service.DetailPageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("detail")
@ResponseBody
public class DetailPageController {

    @Autowired
    private DetailPageService detailPageService;
    @RequestMapping("queryImg")
    public List<Img> queryImg(@RequestParam("id")Integer id){
        return detailPageService.queryImg(id);
    }
    @RequestMapping("queryImgs")
    public List<Imgs> queryImgs(@RequestParam("id")Integer id){
        return detailPageService.queryImgs(id);
    }
    @RequestMapping("qureyShop")
    public Shop queryShop(@RequestParam("id")Integer id){
        return detailPageService.queryShop(id);
    }
    @RequestMapping("queryTuijian")
    public List<Shop> queryTuijian(@RequestParam("id")Integer id){ return detailPageService.queryTuijian(id); }
    @RequestMapping("queryPingjia")
    public List<PingJia> queryPingjia(@RequestParam("id")Integer id){ return detailPageService.queryPingjia(id); }
    @RequestMapping("queryLike")
    public List<Collect> queryLike(){return detailPageService.queryLike();}
    @RequestMapping("queryCar")
    public Car queryCar(@RequestParam("id")Integer id){return detailPageService.queryCar(id);}
    @RequestMapping("add")
    public Boolean add(@RequestParam("id")Integer id,@RequestParam("count")Integer count){
        return detailPageService.add(id,count);
    }
    @RequestMapping("addLike")
    public Boolean addLike(@RequestParam("id")Integer id){
        return detailPageService.addLike(id);
    }
    @RequestMapping("delLike")
    public Boolean delLike(@RequestParam("id")Integer id){
        return detailPageService.delLike(id);
    }
    @RequestMapping("updateCount")
    public Boolean updateCount(@RequestParam("id")Integer id,@RequestParam("count")Integer count){
        return detailPageService.updateCount(id,count);
    }
}
