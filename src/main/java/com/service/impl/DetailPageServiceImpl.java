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
    public List<Img> queryImg(Integer id) {
        return detailsPageMapper.queryImg(id);
    }

    @Override
    public List<Imgs> queryImgs(Integer id) {
        return detailsPageMapper.queryImgs(id);
    }

    @Override
    public Shop queryShop(Integer id) {
        return detailsPageMapper.queryShop(id);
    }

    @Override
    public List<Shop> queryTuijian(Integer id) {
        return detailsPageMapper.queryTuijian(id);
    }

    @Override
    public List<PingJia> queryPingjia(Integer id) {
        return detailsPageMapper.queryPingjia(id);
    }
}
