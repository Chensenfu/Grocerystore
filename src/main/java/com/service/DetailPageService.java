package com.service;

import com.entity.Img;
import com.entity.Imgs;

import java.util.List;

public interface DetailPageService {
    List<Img> queryImg();
    List<Imgs> queryImgs();
}
