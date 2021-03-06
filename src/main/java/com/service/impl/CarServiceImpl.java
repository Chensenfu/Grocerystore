package com.service.impl;

import com.entity.Car;
import com.mapper.CarMapper;
import com.service.CarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class CarServiceImpl implements CarService {

    @Autowired
    private CarMapper carMapper;
    @Override
    public List<Car> queryCar(Integer id) {
        return carMapper.queryCar(id);
    }

    @Override
    public Boolean del(Integer delId) {
        return carMapper.del(delId)==1;
    }
}
