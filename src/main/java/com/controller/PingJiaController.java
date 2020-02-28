package com.controller;

import com.entity.Order;
import com.entity.PingJia;
import com.entity.Shop;
import com.entity.User;
import com.service.PingJiaservice;
import org.aspectj.weaver.ast.Or;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("pingjia")
@ResponseBody
public class PingJiaController {

    @Autowired
    private PingJiaservice pingJiaservice;
    @RequestMapping("query")
    public List<Order> query(HttpServletRequest request){
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        return pingJiaservice.query(user.getId());
    }
    @RequestMapping("queryByid")
    public Shop queryByid(@RequestParam("shopingid")Integer shopingid){
        return pingJiaservice.queryByid(shopingid);
    }
    @RequestMapping("update")
    public Boolean update(@RequestParam("orderid")Integer orderid){
        return pingJiaservice.update(orderid);
    }
    @RequestMapping("add")
    public Boolean add(PingJia pingJia,HttpServletRequest request){
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        return pingJiaservice.add(pingJia,user.getId());
    }
}
