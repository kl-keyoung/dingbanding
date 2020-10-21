<%--
  Created by IntelliJ IDEA.
  User: ma
  Date: 2020/10/12
  Time: 8:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>理想生活</title>
    <style>
        #logo{
            height: 150px;
        }
        #logo>a>img{
            height: 150px;
        }
        #box{
            height: 500px;
            background-image: url("/image/bg.png");
        }
        #right{
            height: 400px;
            width: 350px;
            background-color: white;
            margin-left: 70%;
            position: relative;
            top: 50px;
        }
        p{
            margin-left: 40%;
        }
        input{
            height: 35px;
            width: 240px;
            margin-left: 50px;
            margin-bottom: 20px;
            font-size: 18px;
        }
        button{
            height: 35px;
            width: 250px;
            margin-left: 50px;
            margin-bottom: 20px;
            background-color: red;
            border: none;
        }
        a{
            margin-left: 50px;
        }
    </style>
</head>
<body>
<div id="logo">
    <a href="/login/index"><img src="/image/logo.jpg" alt="图片丢失"></a>
</div>
<div id="box">
    <div id="right">
        <form method="post" action="/login/lg">
        <br>
        <p>密码登录</p>
        <input name="nickname" type="text" placeholder="会员名/邮箱/手机号"><br>
        <input name="password" type="password" placeholder="请输入密码"><br>
        <button>登录</button><br>
        <a id="forget">忘记密码</a>&emsp;&emsp;&emsp;<a href="/login/toReg">免费注册</a>
        </form>
    </div>
</div>

<script></script>
</body>
</html>