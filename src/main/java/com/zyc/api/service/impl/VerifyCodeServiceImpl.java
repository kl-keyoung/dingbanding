package com.zyc.api.service.impl;

import com.aliyuncs.dysmsapi.model.v20170525.SendSmsResponse;
import com.aliyuncs.exceptions.ClientException;
import com.zyc.api.mapper.VerifyCodeMapper;
import com.zyc.api.model.VerifyCode;
import com.zyc.api.service.VerifyCodeService;
import com.zyc.api.util.RandomUtil;
import com.zyc.api.util.SmsDemo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;

/**
 * @author ma
 * @date 2020/10/9
 * @desc
 */
@Service
public class VerifyCodeServiceImpl implements VerifyCodeService {

    @Autowired
    private VerifyCodeMapper verifyCodeMapper;

    @Override
    public int sendSms(String phone) {
        String code = RandomUtil.getFourCode();
        try {
            SendSmsResponse response = SmsDemo.sendSms(phone, code);
            if(response.getCode().equals("OK")){
                //短信发送成功，将验证码信息存入数据库
                VerifyCode verifyCode = new VerifyCode();
                verifyCode.setPhone(phone);
                verifyCode.setCode(code);
                Date date = new Date();
                verifyCode.setCreateTime(date);
                long time = date.getTime() + 5*60*1000;
                Date date1 = new Date();
                date1.setTime(time);
                verifyCode.setExpireTime(date1);
                verifyCodeMapper.insertSelective(verifyCode);
                return 0;
            }
        } catch (ClientException e) {
            e.printStackTrace();
        }
        return 1;
    }


}
