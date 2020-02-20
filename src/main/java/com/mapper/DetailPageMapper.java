package com.mapper;

import com.entity.Img;
import com.entity.Imgs;

import java.util.List;

public interface DetailPageMapper {
    List<Imgs> queryImgs();
    List<Img> queryImg();
}
