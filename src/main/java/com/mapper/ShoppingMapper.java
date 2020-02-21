package com.mapper;

import com.entity.Shopping;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ShoppingMapper {

    public List<Shopping> queryAll();
}
