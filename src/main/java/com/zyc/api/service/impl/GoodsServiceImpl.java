package com.zyc.api.service.impl;

import com.zyc.api.mapper.GoodsMapper;
import com.zyc.api.model.Goods;
import com.zyc.api.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class GoodsServiceImpl implements GoodsService {
    @Autowired
    GoodsMapper goodsMapper;
    @Override
    public int batchInsert(List<Goods> list) {
        goodsMapper.batchInsert(list);
        return 0;
    }

    @Override
    public List<Goods> queryGoods() {
        return goodsMapper.queryGoods();
    }
}
