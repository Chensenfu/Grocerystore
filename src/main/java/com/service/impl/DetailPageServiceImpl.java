package com.service.impl;

import com.entity.Img;
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
    public List<Img> queryImg() {
        return detailsPageMapper.queryImg();
    }
}
