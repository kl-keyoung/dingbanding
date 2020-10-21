package com.zyc.api.mapper;

import com.zyc.api.model.BuyCar;

public interface BuyCarMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(BuyCar record);

    int insertSelective(BuyCar record);

    BuyCar selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(BuyCar record);

    int updateByPrimaryKey(BuyCar record);
}