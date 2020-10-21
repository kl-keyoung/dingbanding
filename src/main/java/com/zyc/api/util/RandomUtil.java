package com.zyc.api.util;

import java.util.Date;
import java.util.Random;

/**
 * @author ma
 * @date 2020/9/24
 * @desc
 */
public class RandomUtil {
    /*
    随机获取6位的手机验证码数字
     */
    public static String getPhoneCode(){
        Random random = new Random();
        String code = "";
        for(int i=0;i<6;i++){
            code += random.nextInt(10);
        }
        return code;
    }
    /*
    随机获取6位手机验证码，不包含0
     */
    public static String getPhoneCodeRemoveZero(){
        Random random = new Random();
        String code = "";
        for(int i=0;i<6;i++){
            code += random.nextInt(9) + 1;
        }
        return code;
    }
    /*
    随机获取4位验证码
     */
    public static String getFourCode(){
        Random random = new Random();
        String code = "";
        for(int i=0;i<4;i++){
            code += random.nextInt(10);
        }
        return code;
    }


    public static void main(String[] args) {
        Date date = new Date();
        System.out.println(date);
        date.setTime(date.getTime() + 5 * 60 * 1000);
        System.out.println(date);
    }
}
