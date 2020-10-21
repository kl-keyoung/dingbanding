package com.zyc.api.service;

import com.zyc.api.model.Goods;

import java.util.List;

public interface GoodsService {
    int batchInsert (List<Goods> list);
    //首页展示商品
    List<Goods> queryGoods();
}
