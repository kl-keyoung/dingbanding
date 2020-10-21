package com.zyc.api.service;

import com.zyc.api.model.User;
import com.zyc.api.view.LoginUser;
import org.apache.ibatis.annotations.Param;

/**
 * @author ma
 * @date 2020/10/10
 * @desc
 */
public interface UserService {
    //int addUser(User user,String code);
    int addUser(LoginUser loginUser);
    //根据昵称查询用户
    User selectNickName(@Param("nickname")String nickname);
    //登录验证
    User queryUser(String nickname,String password);
}
