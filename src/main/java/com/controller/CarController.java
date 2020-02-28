package com.controller;

import com.entity.Car;
import com.entity.User;
import com.service.CarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("car")
@ResponseBody
public class CarController {

    @Autowired
    private CarService carService;
    @RequestMapping("query")
    public List<Car> query(HttpServletRequest request){
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        return carService.queryCar(user.getId());
    }
    @RequestMapping("del")
    public Boolean del(@RequestParam("delId") Integer delId){
        return carService.del(delId);
    }
}
