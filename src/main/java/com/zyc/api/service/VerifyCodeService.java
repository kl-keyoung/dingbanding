package com.zyc.api.service;

import com.zyc.api.model.VerifyCode;

/**
 * @author ma
 * @date 2020/10/9
 * @desc
 */
public interface VerifyCodeService {
    //发送短信
    int sendSms(String phone);

}
