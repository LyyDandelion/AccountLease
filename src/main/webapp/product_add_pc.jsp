<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/3/3
  Time: 16:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>出租-端游中心</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="keywords" content="手游账号 网游账号 视频VIP 共享出租 价格实惠"/>
    <script type="application/x-javascript"> addEventListener("load", function () {
        setTimeout(hideURLbar, 0);
    }, false);

    function hideURLbar() {
        window.scrollTo(0, 1);
    } </script>
    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel='stylesheet' type='text/css'/>
    <!-- Custom CSS -->
    <link href="css/style.css" rel='stylesheet' type='text/css'/>
    <!-- Graph CSS -->
    <link href="css/font-awesome.css" rel="stylesheet">
    <!-- jQuery -->
    <!-- lined-icons -->
    <link rel="stylesheet" href="css/icon-font.min.css" type='text/css'/>
    <!-- //lined-icons -->
    <!-- chart -->
    <script src="js/Chart.js"></script>
    <!-- //chart -->
    <!--animate-->
    <link href="css/animate.css" rel="stylesheet" type="text/css" media="all">
    <script src="js/wow.min.js"></script>
    <script>
        new WOW().init();
    </script>
    <!--//end-animate-->
    <!----webfonts--->
    <link href='http://fonts.googleapis.com/css?family=Cabin:400,400italic,500,500italic,600,600italic,700,700italic'
          rel='stylesheet' type='text/css'>
    <!---//webfonts--->
    <!-- Meters graphs -->
    <!-- <script src="js/jquery-1.10.2.min.js"></script>-->
    <!-- Placed js at the end of the document so the pages load faster -->

    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/app.js"></script>
    <link rel="stylesheet" type="text/css" href="css/nav-side.css"/>
</head>

<body class="sticky-header left-side-collapsed">
<section>
    <!-- left side start-->
    <div class="left-side sticky-left-side">

        <!--logo and iconic logo start-->
        <div class="logo">
            <h1><a href="index.jsp">账号 <span>出租</span></a></h1>
        </div>
        <div class="logo-icon text-center">
            <a href="index.jsp"><i class="lnr lnr-home"></i> </a>
        </div>

        <!--logo and iconic logo end-->
        <div class="left-side-inner">

            <!--sidebar nav start-->
            <ul class="nav nav-pills nav-stacked custom-nav">
                <li class="active"><a href="index.jsp"><i class="fa fa-desktop"></i><span>首页</span></a></li>
                <li class="menu-list">
                    <a href="#"><i class="glyphicon glyphicon-user"></i>
                        <span>个人中心</span></a>
                    <ul class="sub-menu-list">
                        <li><a href="user_center.jsp">个人信息</a></li>
                        <li><a href="password_update.jsp">修改密码</a></li>
                    </ul>
                </li>
                <li class="menu-list"><a href="#"><i class="glyphicon glyphicon-leaf"></i> <span>出租商品</span></a>
                    <ul class="sub-menu-list">
                        <li><a href="product_add_mobile.jsp">手游账号</a></li>
                        <li><a href="product_add_pc.jsp">端游账号</a></li>
                        <li><a href="product_add_vip.jsp">视频账号</a></li>

                    </ul>
                </li>
                <li class="menu-list"><a href="#"><i class="glyphicon glyphicon-send"></i> <span>租号</span></a>
                    <ul class="sub-menu-list">
                        <li><a href="mobile_game_center.jsp">手游账号</a></li>
                        <li><a href="pc_game_center.jsp">端游账号</a></li>
                        <li><a href="vip_video_center.jsp">视频账号</a></li>
                    </ul>
                </li>
                <li class="menu-list"><a href="#"><i class="glyphicon glyphicon-shopping-cart"></i>
                    <span>买家角色</span></a>
                    <ul class="sub-menu-list">
                        <li><a href="buyer_order_list.jsp">所有订单</a></li>
                        <li><a href="buyer_no_pay.jsp">待付款</a></li>
                        <li><a href="buyer_renting.jsp">租用中</a></li>
                        <li><a href="#">退款中</a></li>
                        <li><a href="#">售后</a></li>
                    </ul>
                </li>
                <li class="menu-list"><a href="#"><i class="glyphicon glyphicon-grain"></i> <span>商家角色</span></a>
                    <ul class="sub-menu-list">
                        <li><a href="business_product_list.jsp">全部商品</a></li>
                        <li><a href="business_on_sale.jsp">已上架</a></li>
                        <li><a href="business_off_shelf.jsp">已下架</a></li>
                        <li><a href="business_order_list.jsp">全部订单</a></li>
                        <li><a href="business_renting.jsp">租用中</a></li>
                    </ul>
                </li>
            </ul>
            <!--sidebar nav end-->
        </div>
    </div>
    <!-- left side end-->

    <!-- main content start-->
    <div class="main-content main-content2">
        <!-- header-starts -->
        <div class="header-section">

            <!--toggle button start-->
            <a class="toggle-btn  menu-collapsed"><i class="fa fa-bars"></i></a>
            <!--toggle button end-->

            <!--notification menu start -->
            <div class="menu-right">
                <div class="user-panel-top">
                    <div class="profile_details" style="width: 12%;">
                        <ul>
                            <li class="dropdown profile_details_drop">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                                    <div class="profile_img">
                                        <span style="background:url(images/head.png) no-repeat center"> </span>
                                        <div class="user-name">
                                            <p id="user_tip"><span></span></p>
                                        </div>
                                        <i class="lnr lnr-chevron-down"></i>
                                        <i class="lnr lnr-chevron-up"></i>
                                        <div class="clearfix"></div>
                                    </div>
                                </a>
                                <ul class="dropdown-menu drp-mnu">
                                    <li><a href="password_update.jsp"><i class="fa fa-cog"></i>修改密码</a></li>
                                    <li><a id="user_center" href="user_center.jsp"><i class="fa fa-user"></i>个人中心</a></li>
                                    <li><a id="logout" onclick="go_login();" href="#"><i class="fa fa-sign-out"></i> 退出</a>
                                    </li>
                                </ul>
                            </li>
                            <div class="clearfix"></div>
                        </ul>
                    </div>

                    <div class="clearfix"></div>
                </div>
            </div>
            <!--notification menu end -->
        </div>
        <!--notification menu end -->

        <!-- //header-ends -->
        <div id="page-wrapper">
            <div class="graphs">
                <div class="widgets_top">
                    <div class="col_3">
                        <div class="col-md-3 widget widget1" id="">
                            <div class="r3_counter_box">
                                <a href="#"><img src="http://image.ecit.com/lol.jpg"/></a>
                                <div class="stats">
                                    <h5>45688 <span>件商品</span></h5>
                                    <div class="grow">
                                        <p>英雄联盟</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 widget widget1">
                            <div class="r3_counter_box">
                                <img src="http://image.ecit.com/pubg.jpg"/>
                                <div class="stats">
                                    <h5>5055 <span>件商品</span></h5>
                                    <div class="grow grow1">
                                        <p>绝地求生</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 widget widget1">
                            <div class="r3_counter_box">
                                <img src="http://image.ecit.com/human_fall.png"/>
                                <div class="stats">
                                    <h5>702 <span>件商品</span></h5>
                                    <div class="grow grow3">
                                        <p>人类一败涂地</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 widget">
                            <div class="r3_counter_box">
                                <img src="http://image.ecit.com/overwatch.jpg"/>
                                <div class="stats">
                                    <h5>370 <span>件商品</span></h5>
                                    <div class="grow grow2">
                                        <p>守望先锋</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--footer section start-->
    <footer>
        <p>Copyright &copy; 2019.毕业设计.ecit_lyy</p>
    </footer>
    <!--footer section end-->
</section>

<script src="js/jquery.nicescroll.js"></script>
<script src="js/scripts.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="js/bootstrap.min.js"></script>
<script>

    $(document).ready(function () {
        var username = sessionStorage.getItem("username");
        if (username == null) {
            go_login();
        }
        else {
            $("#user_tip").text(username);
        }
        $.ajax({
            url: "/back/category/get_category.do",
            type: "get",
            data: {
                code: "MOBLIE_GAME"
            },
            success: function (data) {
                log(data);
                if (data.success) {
                    var info = data.data;
                    for (var i = 0; i < info.length; i++) {
                        var el = $("<a></a>");
                        var br = $("</br>")
                        el.text(info[i].name);
                        var file = info[i].code.toLowerCase() + ".jsp";
                        el.attr("href", file);
                        $("#game_center").append(el);
                        $("#game_center").append(br);
                    }
                }
            }
        })

    });

</script>

</body>
</html>
