package com.service;

import com.entity.*;

import java.util.List;

public interface DetailPageService {
    List<Img> queryImg(Integer id);
    List<Imgs> queryImgs(Integer id);
    Shop queryShop(Integer id);
    List<Shop> queryTuijian(Integer id);
    List<PingJia> queryPingjia(Integer id);
}
