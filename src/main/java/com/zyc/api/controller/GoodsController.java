package com.zyc.api.controller;

import com.zyc.api.model.Goods;
import com.zyc.api.service.GoodsService;
import com.zyc.api.service.impl.GoodsServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller

public class GoodsController {
    @Autowired
    GoodsService goodsService;
    @RequestMapping("/index")
    public String queryGoods(Model model){
        List<Goods> list = goodsService.queryGoods();
        model.addAttribute("list",list);
        return "goods/index";
    }
}
