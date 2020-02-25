package com.service;

import com.entity.*;
import java.util.List;

public interface DetailPageService {
    List<Img> queryImg(Integer id);
    List<Imgs> queryImgs(Integer id);
    Shop queryShop(Integer id);
    List<Shop> queryTuijian(Integer id);
    List<PingJia> queryPingjia(Integer id);
    List<Collect> queryLike();
    Car queryCar(Integer id);
    Boolean add(Integer id,Integer count);
    Boolean addLike(Integer id);
    Boolean delLike(Integer id);
    Boolean updateCount(Integer id,Integer count);
}
