package com.controller;

import com.entity.Shopping;
import com.service.ShoppingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
@Controller
@RequestMapping("shopping")
@ResponseBody
public class ShoppingController {
    @Autowired
    private ShoppingService shoppingService;
    @RequestMapping("queryAll")
    public List<Shopping> queryAll(){
        return shoppingService.queryAll();
    }
    @RequestMapping("queryziying")
    public List<Shopping> queryziying(){
        return shoppingService.queryziying();
    }
    @RequestMapping("queryyanxuan")
    public List<Shopping> queryyanxuan(){
        return shoppingService.queryyanxuan();
    }
    @RequestMapping("querymohu")
    public List<Shopping> querymohu(@RequestParam("shopName") String shopName){
        return shoppingService.querymohu(shopName);
    }
}
