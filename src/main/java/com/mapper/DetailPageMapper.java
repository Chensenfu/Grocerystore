package com.mapper;

import com.entity.Img;
import com.entity.Imgs;
import com.entity.Shop;
import com.entity.Video;

import java.util.List;

public interface DetailPageMapper {
    List<Imgs> queryImgs();
    List<Img> queryImg();
    Shop queryShop();
}
