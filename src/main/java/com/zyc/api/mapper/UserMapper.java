package com.zyc.api.mapper;

import com.zyc.api.model.User;
import com.zyc.api.view.LoginUser;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface UserMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);

    //注册
    int addUser(LoginUser loginUser);
    //根据昵称查询用户
    User selectNickName(String nickname);
    //登录验证
    User queryUser(String nickname,String password);
}