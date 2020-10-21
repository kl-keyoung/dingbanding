package com.zyc.api.view;

import lombok.Data;
import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

/**
 * @author ma
 * @date 2020/10/8
 * @desc 登录对象
 */
@Data
public class LoginUser {

    @NotBlank(message = "昵称不能为空")
    private String nickname;

    @Size(min = 6)
    private String password;

    @Length(max = 4)
    private String code;

    @NotBlank(message = "手机号不能为空")
    @Size(min = 11)
    private String phone;

}
