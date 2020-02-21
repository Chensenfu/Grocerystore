package com.mapper;

import com.entity.*;

import java.util.List;

public interface DetailPageMapper {
    List<Imgs> queryImgs();
    List<Img> queryImg();
    List<Shop> queryTuijian();
    Shop queryShop();
    List<PingJia> queryPingjia();
    Integer queryPingjiacount();
}
