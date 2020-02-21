package com.controller;

import com.entity.Img;
import com.entity.Shopping;
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

    public List<Shopping> queryAll(Integer id){
        return detailPageService.queryAll(id);
    }
}
