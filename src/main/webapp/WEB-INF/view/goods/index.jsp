<%--
  Created by IntelliJ IDEA.
  User: ma
  Date: 2020/10/8
  Time: 8:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous"> -->

    <!-- 可选的 Bootstrap 主题文件（一般不用引入） -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <title>理想生活上天猫</title>
    <%--模态框--%>
    <style>
        #p2{
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
        #a2{
            margin-left: 50px;
        }
        #right{
            height: 400px;
            width: 350px;
            background-color: white;
            margin-left: 70%;
            position: relative;
            top: 50px;
        }
    </style>

    <style>
        #top{
            height: 40px;
            background-color: #E6E6E6;
            border: 1px solid grey;
        }
        #wel{
            margin-left: 150px;
            position: relative;
            top: 10px;
        }
        a{
            text-decoration: none;
            color: black;
        }
        #come{
            margin-left: 400px;
            position: relative;
            top: 10px;
        }
        #search>img{
            height: 160px;
            width: 250px;
            margin-left: 100px;
        }
        #sear{
            margin-left: 200px;
            height: 40px;
            width: 260px;
            border: 1px solid red;
            font-size: 16px;
        }
        #search>button{
            height: 40px;
            width: 80px;
            background-color: red;
            border: none;
        }
        .carousel-inner img {
            width: 100%;
            height: 100%;
        }
        #life{
            width: 1100px;
            height: 500px;
            display: flex;
            flex-wrap: wrap;
        }
        .left{
            width: 250px;
            height: 500px;
            float: left;
        }
        .left>img{
            width: 250px;
            height: 500px;
        }
        .right{
            width: 800px;
            height: 500px;
            display: flex;
            flex-wrap: wrap;
            margin-bottom: 100px;
        }
        .right>div{
            height: 240px;
            width: 240px;
            margin-left: 5px;
            margin-top: 5px;
        }
        .box>img{
            height: 160px;
            width: 160px;
        }
        .box{
            text-align: center;
        }
        .footer-tmallinfo>a{
            text-decoration: none;
            color: white;
        }
        .footer-otherlink>a{
            text-decoration: none;
            color: white;
        }
    </style>
</head>
<body>
<div id="top">

        <span id="wel">喵，欢迎光临&emsp;
            <c:if test="${sessionScope.user!=null}" >
                <a style="color: darkred">${sessionScope.user.getNickname()}</a>
            </c:if>
            <c:if test="${sessionScope.user==null}">
                <a href="/login/lgPage">请登录</a>&nbsp;
                <a href="/login/toReg">免费注册</a>
            </c:if>

        </span>


    <span id="come">
            <a href="">我的淘宝</a>&emsp;
            <c:if test="${sessionScope.user!=null}">
                 <a href="">
                    <span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span>
                购物车</a>&emsp;
            </c:if>
           <c:if test="${sessionScope.user==null}">

                <%--通过按钮或连接触发模态框--%>
               <a data-toggle="modal" href="#myModal">
                    <span data-toggle="modal" class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span>
                购物车</a>&emsp;
               <!-- 模态框（Modal） -->
               <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                    aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <form method="post" action="/login/lg">
                                    <br>
                                    <p id="p2">密码登录</p>
                                    <input name="nickname" type="text" placeholder="会员名/邮箱/手机号"><br>
                                    <input name="password" type="password" placeholder="请输入密码"><br>
                                    <button>登录</button><br>
                                     <a id="a2">忘记密码</a>&emsp;&emsp;&emsp;<a href="/login/toReg">免费注册</a>
                                </form>
                            </div>
                        </div><!-- /.modal-content -->
                    </div><!-- /.modal -->
                </div>

           </c:if>
            <select name="" id="">
                <option value="">收藏的宝贝</option>
                <option value="">收藏的店铺</option>
            </select>
        </span>
</div>
<div id="search">
    <img src="/image/logo.jpg" alt="">
    <input type="text" name="" id="sear" placeholder="搜索 商品名关键字">
    <button>搜索</button>
</div>


<div id="demo" class="carousel slide" data-ride="carousel">

    <!-- 指示符 -->
    <ul class="carousel-indicators">
        <li data-target="#demo" data-slide-to="0" class="active"></li>
        <li data-target="#demo" data-slide-to="1"></li>
        <li data-target="#demo" data-slide-to="2"></li>
    </ul>

    <!-- 轮播图片 -->
    <div class="carousel-inner">
        <div class="carousel-item active">
            <img src="https://static.runoob.com/images/mix/img_fjords_wide.jpg">
        </div>
        <div class="carousel-item">
            <img src="https://static.runoob.com/images/mix/img_nature_wide.jpg">
        </div>
        <div class="carousel-item">
            <img src="https://static.runoob.com/images/mix/img_mountains_wide.jpg">
        </div>
    </div>

    <!-- 左右切换按钮 -->
    <a class="carousel-control-prev" href="#demo" data-slide="prev">
        <span class="carousel-control-prev-icon"></span>
    </a>
    <a class="carousel-control-next" href="#demo" data-slide="next">
        <span class="carousel-control-next-icon"></span>
    </a>

</div>
<br>
<br>
<h4>◆美丽人生</h4>

<div id="life">
    <div class="left">
        <img src="/image/news_left.jpg" alt="">
    </div>

        <div class="right">
            <c:forEach items="${list}" var="goods">
            <div class="box">
                <img src="${pageContext.request.contextPath }/${goods.goodsPic}" alt=""><br>
                <p>${goods.goodsName}</p>

                <span style="color:red;font-size:20px;">${goods.price}</span>

            </div>
            </c:forEach>
        </div>

</div>

<br><br><br>
<h4>◆居家生活</h4>
<div id="home">
    <div class="left">
        <img src="/image/news_left.jpg" alt="">
    </div>
    <div class="right">
        <div class="box">
            <img src="/image/logo.jpg" alt=""><br>
            毛巾<br>
            <span style="color:red;font-size:20px;">￥66</span>
        </div>
        <div class="box">
            <img src="/image/logo.jpg" alt=""><br>
            毛巾<br>
            <span style="color:red;font-size:20px;">￥66</span>
        </div>
        <div class="box">
            <img src="/image/logo.jpg" alt=""><br>
            毛巾<br>
            <span style="color:red;font-size:20px;">￥66</span>
        </div>
        <div class="box">
            <img src="/image/logo.jpg" alt=""><br>
            毛巾<br>
            <span style="color:red;font-size:20px;">￥66</span>
        </div>
        <div class="box">
            <img src="/image/logo.jpg" alt=""><br>
            毛巾<br>
            <span style="color:red;font-size:20px;">￥66</span>
        </div>
        <div class="box">
            <img src="/image/logo.jpg" alt=""><br>
            毛巾<br>
            <span style="color:red;font-size:20px;">￥66</span>
        </div>
    </div>
</div>

<div class="mui-global-fragment-load" data-fragment="tmbase/mui_footer_link" style="background-color:black;color:white"><p class="footer-tmallinfo">
    <a href="//pages.tmall.com/wow/seller/act/zhaoshangproduce" target="_blank">关于天猫</a>
    <a href="//service.tmall.com/support/tmall/tmallHelp.htm" target="_blank">帮助中心</a>
    <a href="//open.taobao.com" target="_blank">开放平台</a>
    <a href="//job.alibaba.com/zhaopin/index.htm" target="_blank">诚聘英才</a>
    <a href="//consumerservice.taobao.com/contact-us" target="_blank">联系我们</a>
    <a href="//xtao.tmall.com?tracelog=tmallfoot" target="_blank">网站合作</a>
    <a href="//terms.alicdn.com/legal-agreement/terms/suit_bu1_tmall/suit_bu1_tmall201801121425_43176.html" target="_blank">法律声明</a>
    <a href="//terms.alicdn.com/legal-agreement/terms/suit_bu1_tmall/suit_bu1_tmall201801031144_60809.html" target="_blank">隐私权政策</a>
    <a href="http://ipp.alibabagroup.com/" target="_blank">知识产权</a>
    <a href="//jubao.alibaba.com/index.html?site=TMALL" target="_blank">廉正举报</a>
    <a class="footer-fp-rule" style="display:none;" href="//rule.tmall.com/trulecycle.htm" target="_blank">规则意见征集</a>
</p>
    <p class="footer-otherlink">
        <a href="http://www.alibabagroup.com/cn/global/home" target="_blank">阿里巴巴集团</a>|
        <a href="//www.taobao.com" target="_blank">淘宝网</a> |
        <a href="//www.tmall.com/" target="_blank">天猫</a> |
        <a href="//ju.taobao.com/" target="_blank">聚划算</a> |
        <a href="http://www.aliexpress.com/" target="_blank">全球速卖通</a> |
        <a href="http://www.alibaba.com/" target="_blank">阿里巴巴国际交易市场</a>|
        <a href="//www.1688.com/" target="_blank">1688</a> |
        <a href="//www.alimama.com/" target="_blank">阿里妈妈</a> |
        <a href="//www.fliggy.com/" target="_blank">飞猪</a> |
        <a href="http://www.aliyun.com/" target="_blank">阿里云计算</a> |
        <a href="http://www.alios.cn/" target="_blank">AliOS</a> |
        <a href="http://aliqin.cn/" target="_blank">阿里通信</a> |
        <a href="http://www.net.cn/" target="_blank">万网</a> |
        <a href="http://www.autonavi.com/" target="_blank">高德</a> |
        <a href="http://www.uc.cn/" target="_blank">UC</a> |
        <a href="http://www.umeng.com/" target="_blank">友盟</a> |
        <a href="http://www.xiami.com/" target="_blank">虾米</a> |
        <a href="http://www.dingtalk.com/?lwfrom=20150205115110773" target="_blank">钉钉</a> |
        <a href="https://www.alipay.com" target="_blank">支付宝</a> |
        <a href="https://s.alibaba.com?scene=clinks" target="_blank">阿里安全</a>
    </p>
    <div class="footer-copyright">增值电信业务经营许可证：
        <a data-spm-protocol="i" href="http://beian.miit.gov.cn">浙B2-20110446</a>
        <span style="margin-right:65px;">市场名称登记证：工商网市字3301004119号</span>
        <span>出版物网络交易平台服务经营备案证： 新出发浙备字第001号</span>
        <br>
        <span style="margin-right:65px;">互联网违法和不良信息举报电话：0571-81683755 blxxjb@alibaba-inc.com</span>
        <span class="footer-liangxinyao-cert" style="display:none;">
                <br>
                <a href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=44011202000911" target="_blank">
                    <img src="https://img.alicdn.com/tps/TB1_qAKKVXXXXXjapXXXXXXXXXX-20-20.png">粤公网安备 44011202000911号
                </a>
                <a style="margin-right:30px" href="http://www.beian.miit.gov.cn" target="_blank">粤ICP备14088652号-2</a>
                医疗器械经营许可证：<a style="margin-right:30px" href="https://img.alicdn.com/tfs/TB1Gfsnnxn1gK0jSZKPXXXvUXXa-1172-830.png" target="_blank">粤穗食药监械经营许20171161号</a>
                <a style="margin-right:50px" href="https://img.alicdn.com/tfs/TB1Uu.mnAL0gK0jSZFtXXXQCXXa-1171-835.png" target="_blank">食品经营许可证</a>
                互联网药品信息服务资格证：<a href="https://img.alicdn.com/tfs/TB1WcAnnAP2gK0jSZPxXXacQpXa-1185-828.png" target="_blank">（粤）—经营性—2018—0092</a>
                <a style="margin-right:30px" href="http://air.gzaic.gov.cn:88/outsys/commonquery/viewBusinessLicence?uniscid=91440101681325547Y&amp;regno=440106000067508" target="_blank">阿里健康大药房营业执照</a>
                <a href="https://img.alicdn.com/tfs/TB1ZBMonuH2gK0jSZFEXXcqMpXa-1177-835.png" target="_blank">药品经营许可证</a>
                <a href="https://img.alicdn.com/tfs/TB13bUqnxv1gK0jSZFFXXb0sXXa-584-833.png" target="_blank">第二类医疗器械备案凭证</a>
                <a href="http://www.nmpa.gov.cn/WS04/CL2042/" target="_blank">国家药品监督管理局</a>
                <a href="http://www.12315.cn/" target="_blank">全国12315互联网平台</a>
                <a href="http://www.gdnet110.gov.cn/?top_keyword" target="_blank">广东省公安厅</a>
                <a href="https://img.alicdn.com/tfs/TB1jRoqnxD1gK0jSZFKXXcJrVXa-1168-833.png" target="_blank">GSP</a>
                <a href="https://img.alicdn.com/tfs/TB1eWtQnLb2gK0jSZK9XXaEgFXa-926-618.png" target="_blank">二类医疗器械网络销售备案</a>
                <a href="https://img.alicdn.com/tfs/TB1eWtQnLb2gK0jSZK9XXaEgFXa-926-618.png" target="_blank">三类医疗器械网络销售备案</a>
                <a href="https://img.alicdn.com/tfs/TB1or0iAFzqK1RjSZSgXXcpAVXa-650-924.jpg" target="_blank">食品经营备案</a>
                <br>
            </span>
        互联网药品信息服务资质证书编号：<a href="//img.alicdn.com/tps/TB1vi6vPVXXXXbVXVXXXXXXXXXX-927-653.png">浙-（经营性）-2017-0005</a>
        <a href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=33010002000120"><img src="//img.alicdn.com/tps/TB1yEqRPXXXXXXPXpXXXXXXXXXX-20-20.png" style="position:relative;top:5px;vertical-align:baseline;">
            浙公网安备 33010002000120号</a>
        <br>
        <span style="margin-right:65px;">医疗器械网络交易服务第三方平台备案：（浙）网械平台备字[2018]第00002号</span>
        <span style="margin-right:65px;">互联网药品交易服务资格证书：国A20150001</span>
        <br>
        <span style="margin-right:65px;">浙江省网络食品销售第三方平台提供者备案：浙网食A33010002</span>

        <a href="http://jb.ccm.gov.cn/">12318举报</a>
        <b>© 2003-2020 TMALL.COM 版权所有</b>
        <p style="padding-top:10px; display:none;" class="footer-fp-img">
            <a style="margin-right:10px;" target="_blank" href="http://idinfo.zjamr.zj.gov.cn//bscx.do?method=lzxx&amp;id=3301843301840000201049"><img style="width: 30px;height: 30px" src="//img.alicdn.com/tfs/TB1MQX3cBr0gK0jSZFnXXbRRXXa-65-70.gif"></a>
            <a target="_blank" href="http://sq.ccm.gov.cn/ccnt/sczr/service/business/emark/toDetail/CB964ABC7B904B7BA3472DDF700A2D6D"><img src="//img.alicdn.com/tps/i1/TB13mgzHXXXXXbjXVXXzby4IVXX-80-30.jpg"></a>
        </p>
    </div></div>
</body>
</html>
