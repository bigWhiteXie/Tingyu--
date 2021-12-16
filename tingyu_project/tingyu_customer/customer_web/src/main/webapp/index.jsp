<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/9/17 0017
  Time: 上午 9:07
  To change this template use File | Settings | File Templates.
--%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    //http://localhost:8080/01_sxtoa_war_exploded/
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="https://cdn.bootcss.com/Swiper/4.5.0/css/swiper.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/index.css">
    <link rel="stylesheet" href="css/base.css">
    <link rel="stylesheet" href="css/about.css">
    <script src="https://cdn.bootcss.com/jquery/3.4.0/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/Swiper/4.5.0/js/swiper.min.js"></script>
    <%--引入EasyUI的资源--%>
    <link rel="stylesheet" type="text/css" href="static/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="static/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="static/demo.css">
    <script type="text/javascript" src="static/js/jquery.min.js"></script>
    <script type="text/javascript" src="static/js/jquery.easyui.min.js"></script>
    <title>Document</title>
    <%--声明js代码域--%>
    <script type="text/javascript">
        /*************登录功能实现******************************/
        $(function () {
            //给登录按钮添加单击事件
            $("#userLogin").click(function () {
                //显示用户登录的对话框
               $("#userLoginDialog").dialog('open');
            })
            //给登录按钮添加单击事件
            $("#btn").click(function () {
                $.post("http://localhost:8080/manager/married/personLogin", $("#loginFm").serialize(),function (data) {
                   if(data){
                       $.messager.alert("提示","登录成功","info");
                       $("#userLoginDialog").dialog('close');
                       $("#loginSpan").html("<a>"+data.pname+"</a>&nbsp;&nbsp;&nbsp;&nbsp;<a>退出</a>")
                   }else{
                       $.messager.alert("提示","账号或密码错误","info");

                   }
                })

            })
        })
    </script>
</head>
<body>
<%--声明用户登录对话框--%>
<div id="userLoginDialog" title="用户登录" class="easyui-dialog" style="width:400px;height: 300px;" data-options="closed:true,modal:true,border:'thin'">
        <form id="loginFm" method="post">
            <table cellpadding="10px" style="margin: auto;height: 180px;margin-top: 30px;">
                <tr>
                    <td>用户名:</td>
                    <td>
                        <input class="easyui-textbox" name="pname" prompt="请输入用户名" style="width:200px">
                    </td>
                </tr>
                <tr>
                    <td>密码:</td>
                    <td>
                        <input id="pass" class="easyui-passwordbox" name="ppwd" prompt="请输入密码" style="width:200px">
                    </td>
                </tr>
                <tr>
                    <td>
                        <a id="btn" href="javascript:void(0)" class="easyui-linkbutton">点击登录</a>
                    </td>
                    <td align="right">
                        <input class="easyui-checkbox" name="fruit" value="Apple" label="记住密码" labelPosition="after">
                    </td>
                </tr>
            </table>
        </form>
</div>
<!-- 顶部导航布局开始 -->
<div>
    <div class="nav_login">
        <div class="juzhong">
            <p>Ting域主持人欢迎您！ 客服：18812345678</p>
            <p class="p_login"> <span id="loginSpan"><a id="userLogin" href="javascript:void(0)"> 登录 </a></span> |<a href="register.jsp">注册</a></p>
        </div>
    </div>
    <div class="nav_logo">
        <div class="juzhong">
            <img src="./img/logo.jpg" alt="">
        </div>
    </div>
    <div class="nav_img">
        <img src="img/02.jpg" alt="">
    </div>
    <div class="nav_label">
        <div class="juzhong">
            <ui>
                <li class="active"> <a href="#">首页</a> </li>
                <li> <a href="#">主持人</a> </li>
                <li> <a href="#">加入我们</a> </li>
                <li> <a href="#">关于我们</a> </li>
            </ui>
        </div>
    </div>
</div>
<!-- 顶部导航布局结束 -->
<!--     搜索部分开始 -->
<div class="search_box">
    <div class="search_content">
        <div class="search_select">
            <span>典礼日期</span>
            <select name="" id="">
                <option value=""></option>
            </select>
        </div>
        <div class="search_select">
            <span>时间</span>
            <select name="" id="">
                <option value=""></option>
            </select>
        </div>
        <div class="search_select">
            <span>仪式风格</span>
            <select name="" id="">
                <option value=""></option>
            </select>
        </div>
        <div class="select_btn">
            搜索主持人
        </div>
    </div>
    <!-- 搜索部分结束-->
    <!-- 热门推荐开始 -->
    <div class="hot_box">
        <div class="hot_title">
            <div class="every_day">
                <img src="img/圆角矩形 4.png" alt="">
            </div>
            <div class="every_day_title">
                <img src="img/火.png" alt="">
                <img src="img/每日推荐.png" alt="">
            </div>
            <div class="watch_all">
                查看所有主持人>>
            </div>
        </div>
        <div class="hot_content">
            <ul>
                <li>
                    <div class="hot_content_img">
                        <a href='details.jsp'><img src="img/hot1.png" alt=""></a>
                    </div>
                    <div class="tuijian">
                        <a href='details.jsp'><img src="img/1.png" alt=""></a>
                    </div>
                    <div class="tuijian">
                        <img src="img/星推荐.png" alt="">
                    </div>
                    <div class="hot_content_dec">
                        <p class="hot_content_name">张骏</p>
                        <p class="hot_content_price">主持价格：41000元</p>
                    </div>

                </li>
                <li>
                    <div class="hot_content_img">
                        <img src="img/hot2.png" alt="">
                    </div>
                    <div class="tuijian">
                        <img src="img/1.png" alt="">
                    </div>
                    <div class="tuijian">
                        <img src="img/星推荐.png" alt="">
                    </div>
                    <div class="hot_content_dec">
                        <p class="hot_content_name">张骏</p>
                        <p class="hot_content_price">主持价格：4000元</p>
                    </div>

                </li>
                <li>
                    <div class="hot_content_img">
                        <img src="img/hot3.png" alt="">
                    </div>
                    <div class="tuijian">
                        <img src="img/1.png" alt="">
                    </div>
                    <div class="tuijian">
                        <img src="img/星推荐.png" alt="">
                    </div>
                    <div class="hot_content_dec">
                        <p class="hot_content_name">张骏</p>
                        <p class="hot_content_price">主持价格：4000元</p>
                    </div>

                </li>
                <li>
                    <div class="hot_content_img">
                        <img src="img/hot4.png" alt="">
                    </div>
                    <div class="tuijian">
                        <img src="img/1.png" alt="">
                    </div>
                    <div class="tuijian">
                        <img src="img/星推荐.png" alt="">
                    </div>
                    <div class="hot_content_dec">
                        <p class="hot_content_name">张骏</p>
                        <p class="hot_content_price">主持价格：4000元</p>
                    </div>

                </li>
                <li>
                    <div class="hot_content_img">
                        <img src="img/hot5.png" alt="">
                    </div>
                    <div class="tuijian">
                        <img src="img/1.png" alt="">
                    </div>
                    <div class="tuijian">
                        <img src="img/星推荐.png" alt="">
                    </div>
                    <div class="hot_content_dec">
                        <p class="hot_content_name">张骏</p>
                        <p class="hot_content_price">主持价格：4000元</p>
                    </div>

                </li>
                <li>
                    <div class="hot_content_img">
                        <img src="img/hot6.png" alt="">
                    </div>
                    <div class="tuijian">
                        <img src="img/1.png" alt="">
                    </div>
                    <div class="tuijian">
                        <img src="img/星推荐.png" alt="">
                    </div>
                    <div class="hot_content_dec">
                        <p class="hot_content_name">张骏</p>
                        <p class="hot_content_price">主持价格：4000元</p>
                    </div>

                </li>
                <li>
                    <div class="hot_content_img">
                        <img src="img/hot7.png" alt="">
                    </div>
                    <div class="tuijian">
                        <img src="img/1.png" alt="">
                    </div>
                    <div class="tuijian">
                        <img src="img/星推荐.png" alt="">
                    </div>
                    <div class="hot_content_dec">
                        <p class="hot_content_name">张骏</p>
                        <p class="hot_content_price">主持价格：4000元</p>
                    </div>

                </li>
                <li>
                    <div class="hot_content_img">
                        <img src="img/hot8.png" alt="">
                    </div>
                    <div class="tuijian">
                        <img src="img/1.png" alt="">
                    </div>
                    <div class="tuijian">
                        <img src="img/星推荐.png" alt="">
                    </div>
                    <div class="hot_content_dec">
                        <p class="hot_content_name">张骏</p>
                        <p class="hot_content_price">主持价格：4000元</p>
                    </div>

                </li>
                <li>
                    <div class="hot_content_img">
                        <img src="img/hot9.png" alt="">
                    </div>
                    <div class="tuijian">
                        <img src="img/1.png" alt="">
                    </div>
                    <div class="tuijian">
                        <img src="img/星推荐.png" alt="">
                    </div>
                    <div class="hot_content_dec">
                        <p class="hot_content_name">张骏</p>
                        <p class="hot_content_price">主持价格：4000元</p>
                    </div>

                </li>
                <li>
                    <div class="hot_content_img">
                        <img src="img/hot10.png" alt="">
                    </div>
                    <div class="tuijian">
                        <img src="img/1.png" alt="">
                    </div>
                    <div class="tuijian">
                        <img src="img/星推荐.png" alt="">
                    </div>
                    <div class="hot_content_dec">
                        <p class="hot_content_name">张骏</p>
                        <p class="hot_content_price">主持价格：4000元</p>
                    </div>

                </li>
                <li>
                    <div class="hot_content_img">
                        <img src="img/hot1.png" alt="">
                    </div>
                    <div class="tuijian">
                        <img src="img/1.png" alt="">
                    </div>
                    <div class="tuijian">
                        <img src="img/星推荐.png" alt="">
                    </div>
                    <div class="hot_content_dec">
                        <p class="hot_content_name">张骏</p>
                        <p class="hot_content_price">主持价格：4000元</p>
                    </div>

                </li>
                <li>
                    <div class="hot_content_img">
                        <img src="img/hot2.png" alt="">
                    </div>
                    <div class="tuijian">
                        <img src="img/1.png" alt="">
                    </div>
                    <div class="tuijian">
                        <img src="img/星推荐.png" alt="">
                    </div>
                    <div class="hot_content_dec">
                        <p class="hot_content_name">张骏</p>
                        <p class="hot_content_price">主持价格：4000元</p>
                    </div>

                </li>
                <li>
                    <div class="hot_content_img">
                        <img src="img/hot3.png" alt="">
                    </div>
                    <div class="tuijian">
                        <img src="img/1.png" alt="">
                    </div>
                    <div class="tuijian">
                        <img src="img/星推荐.png" alt="">
                    </div>
                    <div class="hot_content_dec">
                        <p class="hot_content_name">张骏</p>
                        <p class="hot_content_price">主持价格：4000元</p>
                    </div>

                </li>
                <li>
                    <div class="hot_content_img">
                        <img src="img/hot4.png" alt="">
                    </div>
                    <div class="tuijian">
                        <img src="img/1.png" alt="">
                    </div>
                    <div class="tuijian">
                        <img src="img/星推荐.png" alt="">
                    </div>
                    <div class="hot_content_dec">
                        <p class="hot_content_name">张骏</p>
                        <p class="hot_content_price">主持价格：4000元</p>
                    </div>

                </li>
                <li>
                    <div class="hot_content_img">
                        <img src="img/hot5.png" alt="">
                    </div>
                    <div class="tuijian">
                        <a href='主持人详情.html'></a><img src="img/1.png" alt="">
                    </div>
                    <div class="tuijian">
                        <img src="img/星推荐.png" alt="">
                    </div>
                    <div class="hot_content_dec">
                        <p class="hot_content_name">张骏</p>
                        <p class="hot_content_price">主持价格：4000元</p>
                    </div>

                </li>
                <li>
                    <div class="hot_content_img">
                        <img src="img/hot6.png" alt="">
                    </div>
                    <div class="tuijian">
                        <img src="img/1.png" alt="">
                    </div>
                    <div class="tuijian">
                        <img src="img/星推荐.png" alt="">
                    </div>
                    <div class="hot_content_dec">
                        <p class="hot_content_name">张骏</p>
                        <p class="hot_content_price">主持价格：4000元</p>
                    </div>

                </li>
                <li>
                    <div class="hot_content_img">
                        <img src="img/hot7.png" alt="">
                    </div>
                    <div class="tuijian">
                        <img src="img/1.png" alt="">
                    </div>
                    <div class="tuijian">
                        <img src="img/星推荐.png" alt="">
                    </div>
                    <div class="hot_content_dec">
                        <p class="hot_content_name">张骏</p>
                        <p class="hot_content_price">主持价格：4000元</p>
                    </div>

                </li>
                <li>
                    <div class="hot_content_img">
                        <img src="img/hot8.png" alt="">
                    </div>
                    <div class="tuijian">
                        <img src="img/1.png" alt="">
                    </div>
                    <div class="tuijian">
                        <img src="img/星推荐.png" alt="">
                    </div>
                    <div class="hot_content_dec">
                        <p class="hot_content_name">张骏</p>
                        <p class="hot_content_price">主持价格：4000元</p>
                    </div>

                </li>
                <li>
                    <div class="hot_content_img">
                        <img src="img/hot9.png" alt="">
                    </div>
                    <div class="tuijian">
                        <img src="img/1.png" alt="">
                    </div>
                    <div class="tuijian">
                        <img src="img/星推荐.png" alt="">
                    </div>
                    <div class="hot_content_dec">
                        <p class="hot_content_name">张骏</p>
                        <p class="hot_content_price">主持价格：4000元</p>
                    </div>

                </li>
                <li>
                    <div class="hot_content_img">
                        <img src="img/hot10.png" alt="">
                    </div>
                    <div class="tuijian">
                        <img src="img/1.png" alt="">
                    </div>
                    <div class="tuijian">
                        <img src="img/星推荐.png" alt="">
                    </div>
                    <div class="hot_content_dec">
                        <p class="hot_content_name">张骏</p>
                        <p class="hot_content_price">主持价格：4000元</p>
                    </div>
                </li>
            </ul>
        </div>

    </div>


    <!-- 热门推荐结束 -->
    <div class="advantage_box">
        <div class="hot_title">
            <div class="every_day">
                <img src="img/圆角矩形 4.png" alt="">
            </div>
            <div class="every_day_title">
                <img src="img/thumb-up-line.png" alt="">
                <img src="img/我们的优势-1.png" alt="">
            </div>
            <div class="watch_all">
            </div>
        </div>
        <div class="swiper-container" id="banner">
            <div class="swiper-wrapper">
                <div class="swiper-slide">
                    <div class="lunbo">
                        <p>和谐的团队氛围</p>
                        <img src="img/图层 23 拷贝.png">
                    </div>
                </div>
                <div class="swiper-slide">
                    <div class="lunbo">
                        <p>和谐的团队氛围</p>
                        <img src="img/图层 23 拷贝.png">
                    </div>
                </div>
                <div class="swiper-slide">
                    <div class="lunbo">
                        <p>和谐的团队氛围</p>
                        <img src="img/图层 23 拷贝.png">
                    </div>
                </div>
                <div class="swiper-slide">
                    <div class="lunbo">
                        <p>和谐的团队氛围</p>
                        <img src="img/图层 23 拷贝.png">
                    </div>
                </div>

            </div>
        </div>
    </div>

    <!-- 合作伙伴开始 -->
    <div class="friend_box">
        <div class="hot_title">
            <div class="every_day">
                <img src="img/圆角矩形 4.png" alt="">
            </div>
            <div class="every_day_title">
                <img src="img/合作.png" alt="">
                <img src="img/合作伙伴.png" alt="">
            </div>
            <div class="watch_all">

            </div>
        </div>
        <div class="friend_content">
            <ul>
                <li>
                    <img src="img/网站1.png" alt="">
                </li>
                <li>
                    <img src="img/网站2.jpg" alt="">
                </li>
                <li>
                    <img src="img/网站3.png" alt="">
                </li>
                <li>
                    <img src="img/网站4.jpg" alt="">
                </li>
                <li>
                    <img src="img/网站5.png" alt="">
                </li>
                <li>
                    <img src="img/网站6.png" alt="">
                </li>
                <li>
                    <img src="img/网站7.png" alt="">
                </li>
                <li>
                    <img src="img/首页_03.jpg" alt="">
                </li>
                <li>
                    <img src="img/网站9.jpg" alt="">
                </li>
                <li>
                    <img src="img/网站8.jpg" alt="">
                </li>
                <li>
                    <img src="img/网站10.jpg" alt="">
                </li>
                <li>
                    <img src="img/网站11.jpg" alt="">
                </li>
                <li>
                    <img src="img/网站12.jpg" alt="">
                </li>
                <li>
                    <img src="img/网站13.png" alt="">
                </li>
            </ul>



        </div>
    </div>
    <!-- 合作伙伴结束 -->



    <!-- 底部开始 -->
    <div class='footer'>
        <div class='footer_warp'>
            <div class='footer_left'>
                <p class='footer_left_top'>联系我们</p>
                <p class='footer_left_content'>公司地址：北京市长安街天安门1号 / 监督电话：18812345678</p>
                <p class='footer_left_bottom'>copyright2016-2019 版权归Ting域主持人所有 </p>
            </div>
            <div class='footer_right'>
                <div class='QR_left'>
                    <img src="img/QR_04.png" alt="">
                    <div class='QR_left_img'>
                        <img src="img/QR_03.png" alt="">
                    </div>
                    <p>官方服务号</p>
                </div>
                <div class='QR_left'>
                    <img src="img/QR_02.png" alt="">
                    <div class='QR_left_img'>
                        <img src="img/QR_01.png" alt="">
                    </div>
                    <p>官方服务号</p>
                </div>
            </div>
        </div>
    </div>
    <!-- 底部结束 -->
    <!-- 固定定位导航布局开始 -->
    <div class="QR_right">
        <div class='QR_right_top'>
            <!-- <img src="img/QR_small.png" alt=""> -->
            <img src="img/QR_small.png" alt="">
            <div class='QR_box'>
                <div class='QR_box_content'>
                    <img src="img/QR_right.png" alt="">
                    <p class='QR_box_content_font'>关注官方二维码接受订单通知</p>
                </div>
                <div class='QR_box_triangle'>
                    <img src="img/sanjiao.png" alt="">
                </div>
            </div>
        </div>
        <a href="#">
            <div class='QR_right_bottom'>
                <img src="img/jiantou.png" alt="">
            </div>
        </a>
    </div>

    <!-- 固定定位导航布局结束 -->
</body>



<script type="text/javascript">
    // 轮播图
    $(function () {
        var mySwiper = new Swiper("#banner", {
            loop: true,
            loopedSlides: 5,
            slidesPerView: 'auto',
            autoplay: true,
            centeredSlides: true,
            initialSlide: 2,
            watchSlidesProgress: true,
            pagination: {
                el: '.banner_page',
                clickable: true,
            },
            on: {
                progress: function (progress) {
                    for (i = 0; i < this.slides.length; i++) {
                        var slide = this.slides.eq(i);
                        var slideProgress = this.slides[i].progress;
                        if (Math.abs(slideProgress) > 1) {
                            var modify = (Math.abs(slideProgress) - 1) * 0.4 + 1;
                        }
                        translate = slideProgress * modify * 318 + 'px';
                        scale = 1 - Math.abs(slideProgress) / 5;
                        zIndex = 999 - Math.abs(Math.round(10 * slideProgress));
                        slide.transform('translateX(' + translate + ') scale(' + scale + ')');
                        slide.css('zIndex', zIndex);
                        slide.css('opacity', 1);
                        if (Math.abs(slideProgress) > 3) {
                            slide.css('opacity', 0);
                        }
                    }
                },
                setTransition: function (transition) {
                    for (var i = 0; i < this.slides.length; i++) {
                        var slide = this.slides.eq(i)
                        slide.transition(transition);
                    }

                }
            }
        })
    })

</script>
<script> $(".nav_label li").click(function () {
    $(this).siblings('li').removeClass('active');
    $(this).addClass('active');
})</script>
</html>
