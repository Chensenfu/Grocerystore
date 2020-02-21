package com.controller;

import com.entity.Car;
import com.service.CarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("car")
@ResponseBody
public class CarController {

    @Autowired
    private CarService carService;
    @RequestMapping("query")
    public List<Car> query(){
        return carService.queryCar();
    }
}
