package com.service;

import com.entity.Shopping;

import java.util.List;

public interface ShoppingService {

    public List<Shopping> queryAll();
    public List<Shopping> queryziying();
    public List<Shopping> queryyanxuan();
    public List<Shopping> querymohu(String shopName);
}
