package com.zyc.api.service.impl;

import com.zyc.api.mapper.UserMapper;
import com.zyc.api.mapper.VerifyCodeMapper;
import com.zyc.api.model.User;
import com.zyc.api.model.VerifyCode;
import com.zyc.api.service.UserService;
import com.zyc.api.util.MD5Util;
import com.zyc.api.view.LoginUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.UUID;

/**
 * @author ma
 * @date 2020/10/10
 * @desc
 */
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private VerifyCodeMapper verifyCodeMapper;

    @Override
    public int addUser(LoginUser loginUser) {

//        //判断验证码是否失效,根据手机号查询验证码是否存在，是否失效
//        VerifyCode verifyCode = verifyCodeMapper.selectByPhone(loginUser.getPhone());
//
//        if(verifyCode != null){
//            //判断是否失效,判断时间
//            long expire = verifyCode.getExpireTime().getTime();
//            long current = new Date().getTime();
//            long cul = expire - current;
//            if(cul <= 0){
//                return 0;
//            }
//            cul = 5*60*1000 - cul;
//            if(cul > 0){
//                if(verifyCode.getCode().equals(loginUser.getCode())){
//                    //注册
//                    User user = new User();
//                    user.setId(UUID.randomUUID().toString());
//                    user.setNickname(loginUser.getNickname());
//                    user.setPassword(MD5Util.getMD5ByCul(loginUser.getPassword()));
//                    user.setPhone(loginUser.getPhone());
//                    user.setCreateTime(new Date());
//                    user.setStatus(1);
//                    return userMapper.insertSelective(user);
//                }
//            }
//
//        }
//        return 0;
        //注册
        User user = new User();
        user.setId(UUID.randomUUID().toString());
        user.setNickname(loginUser.getNickname());
        user.setPassword(MD5Util.getMD5ByCul(loginUser.getPassword()));
        user.setPhone(loginUser.getPhone());
        user.setCreateTime(new Date());
        user.setStatus(1);
        return userMapper.insertSelective(user);

    }

    @Override
    public User selectNickName(String nickname) {
        return userMapper.selectNickName(nickname);
    }

    @Override
    public User queryUser(String nickname, String password) {
        return userMapper.queryUser(nickname, password);
    }


}
