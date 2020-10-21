<%--
  Created by IntelliJ IDEA.
  User: ma
  Date: 2020/10/8
  Time: 8:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <script src="/js/jquery-3.2.1.js"></script>
    <title>用户注册</title>

    <style>
        html{
            height: 100%;
            width: 100%;
        }
        body{
            background-color: wheat;
            height: 100%;
            width: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        #box{
            background-color: white;
            border-radius: 4%;
            width: 500px;
            height: 600px;
        }
        input{
            width: 240px;
            height: 35px;
            margin-left: 140px;
            margin-top: 20px;
            font-size: 18px;
        }
        p{
            margin-left: 120px;
            font-size: 24px;
        }
        #reg{
            width: 240px;
            height: 35px;
            margin-left: 140px;
            margin-top: 50px;
            background-color: rgb(0, 174, 255);
            border: none;
        }
        span{
            margin-left: 140px;
            color: red;
        }
        #cd{
            height: 35px;
            width: 120px;
        }
        #gt{
            width: 110px;
            height: 35px;
        }
    </style>
</head>
<body>
<div id="box">
    <form action="${pageContext.request.contextPath}/login/reg" method="post" onsubmit="return put()">
        <br>
        <a style="font-size:20px;" href="/login/index">《&nbsp;返回</a>
        <p>注册</p>

        <input name="nickname" type="text"  placeholder="请输入昵称" ><br>
        <span id="sp1"></span><br>
        <input name="password" type="text" placeholder="请输入密码"><br>
        <span id="sp2"></span><br>
        <input name="phone" type="text" placeholder="手机号"><br>
        <span id="sp3"></span><br>
        <input name="code" id="cd" type="text" placeholder="验证码">&emsp;<button id="gt" type="button">获取验证码</button><br>
        <span id="sp4"></span><br>
        <button id="reg">注册</button><br>
        <span style="color:black;">注册即表示同意平台<a target="_blank" href="https://homewh.chaoxing.com/agree/privacyPolicy?appId=900001">《隐私政策》</a></span>
    </form>
</div>

<script>
    var flag1 = false;
    var flag2 = false;
    var flag3 = false;
    var flag4 = false;
    $("input[name='nickname']").focus(function(){
        $('#sp1').text("");
    });
    $("input[name='nickname']").blur(function(){
        //判断昵称长度是否大于0
        var value = $("input[name='nickname']").val();
        if(value.length == 0){
            $('#sp1').text("昵称不能为空");
            flag1 = false;
        }else{
            flag1 = true;
        }
    });
    $("input[name='password']").focus(function(){
        $('#sp2').text("");
    })
    $("input[name='password']").blur(function(){
        //判断昵称长度是否大于0
        var value = $("input[name='password']").val();
        if(value.length < 6 || !isNaN(value)){
            $('#sp2').text("密码长度要大于等于6并且不能是纯数字");
            flag2 = false;
        }else{
            flag2 = true;
        }
    })
    $("input[name='phone']").focus(function(){
        $('#sp3').text("");
    })
    $("input[name='phone']").blur(function(){
        var pattern = /^1[34578]\d{9}$/;
        //判断昵称长度是否大于0
        var value = $("input[name='phone']").val();
        if(!pattern.test(value)){
            $('#sp3').text("手机号格式不正确");
            flag3 = false;
        }else{
            flag3 = true;
        }
    })
    $("input[name='code']").focus(function(){
        $('#sp4').text("");
    })
    $("input[name='code']").blur(function(){
        var pattern = /^1[34578]\d{9}$/;
        //判断昵称长度是否大于0
        var value = $("input[name='code']").val();
        if(value.length != 4 || isNaN(value)){
            $('#sp4').text("验证码输入有误");
            flag4 = false;
        }else{
            flag4 = true;
        }
    });

    var fun;
    $('#gt').click(function(){
        //如果被点击发送ajax请求，倒计时
        var pattern = /^1[34578]\d{9}$/;
        //判断昵称长度是否大于0
        var value = $("input[name='phone']").val();
        if(pattern.test(value)){
            $.ajax({
                url:"/login/sms",
                data:{"phone":value},
                success:function(result){
                    if(result === 1){
                        $('#sp4').text("发送短信失败，稍后再试");
                    }else{
                        cultime();
                        fun = setInterval(cultime,1000);
                        $('#gt').attr("disabled",true);
                    }
                }
            })
        }
    });

    var time = 60;
    //倒计时函数
    function cultime(){
        time -- ;
        $('#gt').text(time + "s后重新获取");
        if(time < 1){
            //可以重新获取验证码
            $('#gt').text("获取验证码");
            clearInterval(fun);
            $('#gt').attr("disabled",false);
            time = 60;
        }
    }

    function put(){
        var nickname = $("input[name='nickname']").val();
        var password = $("input[name='password']").val();
        var phone = $("input[name='phone']").val();
        var code = $("input[name='code']").val();

        if(flag1 && flag2 && flag3 && flag4){
            return true;
            //location.href="/login/reg?nickname=" + nickname;
        }else{
            return false;
        }

    }

    /*用户名ajax校验       $('#nicknameAjax').onblur(function nicknameAjax(){*/

    $("input[name='nickname']").blur(function(){
        var value = $("input[name='nickname']").val();
        if(value!=null){
            $.post({
                url: "${pageContext.request.contextPath}/login/nicknameAjax",
                data: {'nickname':value},
                dataType:"json",
                success: function (data) {
                    // alert(data.toString());
                    if (data.toString()==='ok'){
                        $('#sp1').text("昵称可用");
                    }else {
                        $('#sp1').text("昵称已存在");
                    }

                }
            })
        }

    })

</script>
</body>
</html>
