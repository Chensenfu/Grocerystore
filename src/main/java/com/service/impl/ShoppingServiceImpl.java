package com.service.impl;

import com.entity.Shopping;
import com.mapper.ShoppingMapper;
import com.service.ShoppingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class ShoppingServiceImpl implements ShoppingService {
    @Autowired
    private ShoppingMapper shoppingMapper;
    @Override
    public List<Shopping> queryAll() {
        return shoppingMapper.queryAll();
    }

    @Override
    public List<Shopping> queryziying() {
        return shoppingMapper.queryziying();
    }

    @Override
    public List<Shopping> queryyanxuan() {
        return shoppingMapper.queryyanxuan();
    }
}
