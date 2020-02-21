package com.service;

import com.entity.Img;
import com.entity.Shopping;

import java.util.List;

public interface DetailPageService {
    List<Img> queryImg();

    public List<Shopping> queryAll(Integer id);
}
