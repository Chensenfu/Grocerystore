package com.service.impl;

import com.entity.*;
import com.mapper.DetailPageMapper;
import com.service.DetailPageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class DetailPageServiceImpl implements DetailPageService {

    @Autowired
    private DetailPageMapper detailsPageMapper;

    @Override
    public List<Img> queryImg() {
        return detailsPageMapper.queryImg();
    }

    @Override
    public List<Imgs> queryImgs() {
        return detailsPageMapper.queryImgs();
    }

    @Override
    public Shop queryShop() {
        return detailsPageMapper.queryShop();
    }

    @Override
    public List<Shop> queryTuijian() {
        return detailsPageMapper.queryTuijian();
    }

    @Override
    public List<PingJia> queryPingjia() {
        return detailsPageMapper.queryPingjia();
    }

    @Override
    public Integer queryPingjiacount() {
        return detailsPageMapper.queryPingjiacount();
    }
}
