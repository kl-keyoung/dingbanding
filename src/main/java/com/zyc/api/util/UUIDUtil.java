package com.zyc.api.util;

import java.math.BigDecimal;
import java.util.UUID;

/**
 * @author ma
 * @date 2020/9/22
 * @desc
 */
public class UUIDUtil {
    //生成32位的uuid
    public static String getUuid(){
        return UUID.randomUUID().toString().replace("-","");
    }

    public static void main(String[] args) {
//        System.out.println(getUuid().length());
//        System.out.println(getUuid());
        // mysql中 decimal  对应  java中bigDecimal
        BigDecimal c = new BigDecimal(1);
        BigDecimal d = new BigDecimal(2);
        BigDecimal f = c.divide(new BigDecimal(10));
        BigDecimal g = d.divide(new BigDecimal(10));
        double a = 0.1;
        double b = 0.2;
        System.out.println(a+b);
        System.out.println(f);
        System.out.println(g);
        System.out.println(f.add(g));
    }
}
