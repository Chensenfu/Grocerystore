package com.service;

import com.entity.*;

import java.util.List;

public interface DetailPageService {
    List<Img> queryImg();
    List<Imgs> queryImgs();
    Shop queryShop();
    List<Shop> queryTuijian();
    List<PingJia> queryPingjia();
    Integer queryPingjiacount();
}
