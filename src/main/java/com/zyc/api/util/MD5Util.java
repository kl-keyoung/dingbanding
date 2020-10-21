package com.zyc.api.util;

import org.springframework.util.DigestUtils;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * @author ma
 * @date 2020/9/22
 * @desc MD5加密
 */
public class MD5Util {
    /*
        MessageDigest是为我们提供信息摘要算法的一个工具类(MD5、SHA)
        BigInteger:不可变的任意精度的整数
     */
    //普通加密，可能会少一位
    public static String getMD5(String pwd) {
        try {
            //1、创建一个信息摘要对象
            MessageDigest messageDigest = MessageDigest.getInstance("MD5");
            //2\根据传参更新摘要
            messageDigest.update(pwd.getBytes());
            //3\对其进行最后更新得到结果值
            byte[] by = messageDigest.digest();
            //4、把结果转换为字符串输出

            BigInteger big = new BigInteger(1,by);
            return big.toString(16);
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        return null;
    }
    //生成固定长度MD5加密结果，对加密结果判读补零
    public static String getMD5ByCul(String pwd){
        pwd = "ding#" + pwd;
        try {
            //1、创建一个信息摘要对象
            MessageDigest messageDigest = MessageDigest.getInstance("MD5");
            //2\根据传参更新摘要
            messageDigest.update(pwd.getBytes());
            //3\对其进行最后更新得到结果值
            byte[] by = messageDigest.digest();
            int c;
            StringBuffer stringBuffer = new StringBuffer("");
            //4\for循环遍历得到的结果,对遍历的结果+256，判断是否小于16进行补0操作
            for(int i = 0;i < by.length;i++){
                c = by[i];
                if(c < 0){
                    c += 256;
                }
                if(c < 16){
                    stringBuffer.append(0);
                }
                stringBuffer.append(Integer.toHexString(c));
            }
            return stringBuffer.toString();

        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        return null;
    }
    //通过jar包的方式直接调用
    public static String getMD5ByJar(String pwd){
        //直接用MD5调用加密方法
        byte[] res = DigestUtils.md5Digest(pwd.getBytes());
        BigInteger big = new BigInteger(1,res);
        return big.toString(16);
    }

    public static void main(String[] args) {
        System.out.println(getMD5("123456"));
        System.out.println(getMD5ByCul("123456"));
        System.out.println(getMD5ByJar("123456"));
    }
}
