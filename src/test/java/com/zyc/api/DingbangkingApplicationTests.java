package com.zyc.api;

import com.zyc.api.mapper.VerifyCodeMapper;
import com.zyc.api.model.Goods;
import com.zyc.api.model.Teacher;
import com.zyc.api.model.VerifyCode;
import com.zyc.api.service.impl.GoodsServiceImpl;
import com.zyc.api.service.impl.TeacherServiceImpl;
import com.zyc.api.view.LoginUser;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@SpringBootTest

class DingbangkingApplicationTests {
    @Autowired
    TeacherServiceImpl teacherServiceImpl;
    @Autowired
    GoodsServiceImpl goodsServiceImpl;
    @Test
    public void test2(){
        List<Teacher> list = new ArrayList<>();
        for (int i = 0; i < 50 ; i++) {  //想要多少条数据，设置i就可以
            Teacher teacher = new Teacher();
            int q = i+1;
            teacher.setId(q);
            String a= "张三";
            String a1= a+i;
            teacher.setName(a);
            int b= 20;
            teacher.setAge(b);
            list.add(teacher);
        }
        teacherServiceImpl.saveTeacher(list);
    }

    @Test
    public void test1(){
        List<Goods> list = new ArrayList<>();
        for (int i = 0; i < 12 ; i++) {  //想要多少条数据，设置i就可以
            Goods goods = new Goods();
            int q = i+1;
            goods.setId(q);
            int p = i+1;
            goods.setShopId(p);
            goods.setShopName("天猫旗舰店"+i);
            goods.setGoodsName("华为 HUAWEI Mate S 臻享版"+i);
            goods.setGoodsDesc("这里是商品详情"+i);
            BigDecimal price = new BigDecimal(20);
            goods.setPrice(price);
            goods.setGoodsPic("image/products/c_000"+i+".jpg");
            goods.setGoodsType("手机数码");
            goods.setStore(2000);//库存
            goods.setGoodsSpecs("这里是产品规格");
            goods.setGoodsSell(10000);//销量
            goods.setProductAddress("上海");
            Date date = new Date();
            Timestamp timeStamp = new Timestamp(date.getTime());
            goods.setCreateTime(timeStamp);
            list.add(goods);
        }
        goodsServiceImpl.batchInsert(list);
    }
}
