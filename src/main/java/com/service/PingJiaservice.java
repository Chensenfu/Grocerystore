package com.service;

import com.entity.Order;
import com.entity.PingJia;
import com.entity.Shop;
import com.entity.User;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

public interface PingJiaservice {
    List<Order> query(Integer id);
    Shop queryByid(Integer shopingid);
    Boolean update(Integer orderid);
    Boolean add(PingJia pingJia,Integer id);
}
