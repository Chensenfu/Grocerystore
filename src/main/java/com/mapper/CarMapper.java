package com.mapper;

import com.entity.Car;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CarMapper {
    List<Car> queryCar();
    Integer del(@Param("delId") Integer delId);
}
