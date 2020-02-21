package com.mapper;

import com.entity.Img;
import com.entity.Shopping;

import java.util.List;

public interface DetailPageMapper {
    List<Img> queryImg();

    public List<Shopping> queryAll(Integer id);
}
