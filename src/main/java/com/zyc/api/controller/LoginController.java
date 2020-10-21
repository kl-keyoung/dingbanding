package com.zyc.api.controller;

import com.aliyuncs.dysmsapi.model.v20170525.SendSmsResponse;
import com.aliyuncs.exceptions.ClientException;
import com.zyc.api.model.User;
import com.zyc.api.service.UserService;
import com.zyc.api.service.VerifyCodeService;
import com.zyc.api.util.RandomUtil;
import com.zyc.api.util.SmsDemo;
import com.zyc.api.view.LoginUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.UUID;

/**
 * @author ma
 * @date 2020/10/8
 * @desc
 */
@Controller
@RequestMapping("/login")
public class LoginController {
    @Autowired
    private VerifyCodeService verifyCodeService;
    @Autowired
    private UserService userService;


    //用户名是否存在校验
    @ResponseBody
    @RequestMapping("/nicknameAjax")
    public String nickname(@RequestParam("nickname") String nickname){
        User user = userService.selectNickName(nickname);
        String msg = "";
        if(user!=null){
            msg = "false";
        }else {
            msg = "ok";
        }
        return msg;
    }

    @RequestMapping("/reg")
//    @Validated
    public String toRegister(@Validated LoginUser loginUser, BindingResult bindingResult){
        //如果不用JSR303,要去service层写判断的业务逻辑
    //尽量添加JSR303验证
        if(bindingResult.hasErrors()){
            System.out.println(bindingResult.getAllErrors());
        }
        int i = userService.addUser(loginUser);
        if(i > 0){
            return "redirect:/login/index";
        }
        return "redirect:/login/toReg";
    }

    /*
    Model
    ModelMap
    HttpServeltRequest
     */
    @RequestMapping("/lg")
    public String toLogin(String nickname,String password,Model model,HttpSession session){
        User user = userService.queryUser(nickname, password);
        session.setAttribute("user",user);
        if(user!=null){
            return "redirect:/login/index";
        }else {
            return "redirect:/login/lgPage";
        }

    }
    @RequestMapping("/lgPage")
    public String toLgPage(){
        return "login/login";
    }

    @RequestMapping("/toReg")
    public String toRegPage(){
        return "login/register";
    }

    @ResponseBody
    @RequestMapping("/sms")
    public int sendSms(String phone){
        return verifyCodeService.sendSms(phone);
    }

    @RequestMapping("/index")
    public String toIndex(){
        return "goods/index";
    }

}
