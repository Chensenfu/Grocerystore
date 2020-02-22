package com.service;

import com.entity.Car;

import java.util.List;

public interface CarService {
    List<Car> queryCar();
    Boolean del(Integer delId);
}
