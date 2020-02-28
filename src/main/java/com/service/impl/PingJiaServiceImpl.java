package com.service.impl;

import com.entity.Order;
import com.entity.PingJia;
import com.entity.Shop;
import com.mapper.PingMapper;
import com.service.PingJiaservice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class PingJiaServiceImpl implements PingJiaservice {

    @Autowired
    private PingMapper pingJiaMapper;
    @Override
    public List<Order> query(Integer id) {
        return pingJiaMapper.query(id);
    }

    @Override
    public Shop queryByid(Integer shopingid) {
        return pingJiaMapper.queryByid(shopingid);
    }

    @Override
    public Boolean update(Integer orderid) {
        return pingJiaMapper.update(orderid)==1;
    }

    @Override
    public Boolean add(PingJia pingJia, Integer id) {
        return pingJiaMapper.add(pingJia,id)==1;
    }
}
