package com.zyc.api.mapper;

import com.zyc.api.model.Goods;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface GoodsMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Goods record);

    int insertSelective(Goods record);

    Goods selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Goods record);

    int updateByPrimaryKey(Goods record);
    //批量插入goods表中的数据
    int batchInsert (List<Goods> list);
    //首页展示数据
    List<Goods> queryGoods();
}