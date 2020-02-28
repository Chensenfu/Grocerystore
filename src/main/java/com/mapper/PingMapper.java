package com.mapper;

import com.entity.Order;
import com.entity.PingJia;
import com.entity.Shop;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface PingMapper {
    List<Order> query(@Param("id")Integer id);
    Shop queryByid(@Param("shopingid") Integer shopingid);
    Integer update(@Param("orderid") Integer orderid);
    Integer add(@Param("pingJia")PingJia pingJia,@Param("id") Integer id);
    Integer countno();
    Integer countis();
}
