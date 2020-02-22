package com.mapper;

import com.entity.*;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface DetailPageMapper {
    List<Imgs> queryImgs(@Param("id") Integer id);
    List<Img> queryImg(@Param("id") Integer id);
    List<Shop> queryTuijian(@Param("id") Integer id);
    Shop queryShop(@Param("id") Integer id);
    List<PingJia> queryPingjia(@Param("id") Integer id);
}
