<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/3/3
  Time: 21:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>王者荣耀</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="Easy Admin Panel Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template,
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel='stylesheet' type='text/css' />
    <!-- Custom CSS -->
    <link href="css/style.css" rel='stylesheet' type='text/css' />
    <!-- Graph CSS -->
    <link href="css/font-awesome.css" rel="stylesheet">
    <!-- jQuery -->
    <!-- lined-icons -->
    <link rel="stylesheet" href="css/icon-font.min.css" type='text/css' />
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
    <!--<link href='http://fonts.useso.com/css?family=Cabin:400,400italic,500,500italic,600,600italic,700,700italic' rel='stylesheet' type='text/css'>-->
    <!---//webfonts--->
    <!-- Meters graphs -->
    <!--<script src="js/jquery-1.10.2.min.js"></script> -->
    <!-- Placed js at the end of the document so the pages load faster -->

    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/app.js"></script>
    <link rel="stylesheet" type="text/css" href="css/nav-side.css"/>
</head>

<body class="sticky-header left-side-collapsed"  >
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
                        <li><a href="#">端游账号</a></li>
                        <li><a href="#">视频账号</a></li>

                    </ul>
                </li>
                <li class="menu-list"><a href="#"><i class="glyphicon glyphicon-send"></i> <span>租号</span></a>
                    <ul class="sub-menu-list">
                        <li><a href="mobile_game_center.jsp">手游账号</a></li>
                        <li><a href="#">端游账号</a></li>
                        <li><a href="#">视频账号</a></li>
                    </ul>
                </li>
                <li class="menu-list"><a href="#"><i class="glyphicon glyphicon-shopping-cart"></i>
                    <span>买家角色</span></a>
                    <ul class="sub-menu-list">
                        <li><a href="buyer_order_list.jsp">所有订单</a></li>
                        <li><a href="#">待付款</a></li>
                        <li><a href="buyer_renting.jsp">租用中</a></li>
                        <li><a href="#">退款中</a></li>
                        <li><a href="#">售后</a></li>
                    </ul>
                </li>
                <li class="menu-list"><a href="#"><i class="glyphicon glyphicon-grain"></i> <span>商家角色</span></a>
                    <ul class="sub-menu-list">
                        <li><a href="business_product_list.jsp">全部商品</a></li>
                        <li><a href="#">已上架</a></li>
                        <li><a href="#">已下架</a></li>
                        <li><a href="#">全部订单</a></li>
                        <li><a href="#">租用中</a></li>
                    </ul>
                </li>
            </ul>
            <!--sidebar nav end-->
        </div>
    </div>
    <!-- left side end-->

    <!-- main content start-->
    <div class="main-content main-content6">
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
        <!-- //header-ends -->
        <div id="page-wrapper">
            <div class="graphs" >
                <h3 class="blank1">王者荣耀</h3>
                <div id="div_list" class="bs-example5" data-example-id="default-media">
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
        var request_info = {
            categoryId: 100035,
            orderBy: "last_update_date-asc"
        };
        $.ajax({
            url: "/product/list.do",
            type: "get",
            data: request_info,
            success: function (data) {
                log(data);
                if (data.success) {
                    var info = data.data;
                    for (var i = 0;i < info.size;i++) {
                        build_product(info,i);
                    }
                }
                else {
                    alert("error:"+data.msg);
                }

            }
        });

        $("body").on("click", ".btn_op_name", function (data) {
            var param = this.id;
            // var productId = params[0];
            // var productId = params[1];
            $(location).prop("href","product_detail.jsp?productId="+this.id);
        });


        function build_product(info,i){
            var status = info.list[i].status;
            var subtitle = info.list[i].subtitle;
            var name=info.list[i].name;
            var imageHost = info.list[i].imageHost;
            var mainImage = info.list[i].mainImage;
            var img_url = imageHost + mainImage;
            var productId = info.list[i].productId;
            var price=info.list[i].price;
            var params = [productId];

            var el="<div class=\"media\">\n" +
                "                        <div class=\"media-left img-class\">\n" +
                "                            <a href='product_detail.jsp?productId="+productId+"'>\n" +
                "                                <img  class=\"media-object game-img\" data-src=\"holder.js/64x64\" alt=\"64x64\" src=\"http://image.ecit.com/king_honor.png\" data-holder-rendered=\"true\" style=\"width: 64px; height: 64px;\">\n" +
                "                            </a>\n" +
                "                        </div>\n" +
                "                        <div class=\"media-body\" style=\"width: 60%;\">\n" +
                "                            <h4 class=\"media-heading\" id=\"name\">"+name+"</h4>\n" +
                "                            <span class=\"product-detail\" >明细</span>\n" +
                "                        </div>\n" +
                "                        <div class=\"media-body\" style=\"width: 10%;\"></div>"+
                "                        <div class=\"media-body\" style=\"width: 23%;\">\n" +
                "                            <h4 class=\"media-heading\"  id=\"name1\">租金</h4>\n" +
                "                            <span class=\"product-detail\" style='color:orangered;font-size:1.5em;'>"+price+"元/小时</span>\n" +
                "                        </div>\n" +
                "                        <div class=\"media-right\">\n" +
                "                            <div>\n" +
                "                                <button id='"+productId+"' class=\"btn btn-info btn_op_name\">租用</button>\n" +
                "                            </div>\n" +
                "                        </div>\n" +
                "                        <div class=\"clearfix\"> </div>\n" +
                "                        <div><hr></div>\n" +
                "                    </div>";
            $("#div_list").append(el);

        }

    });



</script>
</body>
</html>


