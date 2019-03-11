<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>商品详情</title>
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

    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/app.js"></script>
    <link rel="stylesheet" type="text/css" href="css/nav-side.css"/>

    <script>
        new WOW().init();
    </script>

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
                                    <li><a id="user_center" href="#"><i class="fa fa-user"></i>个人中心</a></li>
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
            <div class="graphs">
                <div class="widget_middle">

                    <div class="col-md-2 widget_middle_left"></div>
                    <div class="col-md-4 widget_middle_left">
                        <div class="widget_middle_left_slider">
                            <div class="main-grid1-grids">
                                <img id="img_detail"  width="100%" height="100%">
                            </div>

                        </div>
                    </div>
                    <div class="col-md-4 widget_middle_left">
                        <div class="stats-info stats-info1">
                            <div class="panel-heading">
                                <h4 class="panel-title" id="name">标题</h4>
                            </div>
                            <div class="panel-body panel-body2">
                                <ul class="list-unstyled">
                                    <li>价格信息：<div class="text-success pull-right" ><span id="price"></span>元/小时</div></li>
                                    <li>详情：<div class="text-success pull-right" id="detail"></div></li>
                                    <li>区服：<div class="text-success pull-right" id="system"></div></li>
                                </ul>
                            </div>

                        </div>
                        <div style="margin-top: 10%">
                            <button style="width: 100%" class="btn btn-warning" id="do_rent">去租用</button>
                        </div>
                    </div>

                    <div class="clearfix"> </div>

                    <script type="text/javascript" src="js/jquery.flexisel.js"></script>
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
    $(document).ready(function(){
        var username = sessionStorage.getItem("username");
        if (username == null) {
            go_login();
        }
        else {
            $("#user_tip").text(username);
        }


        var  request_info={
            productId:getUrlParam("productId")
        }
        $.ajax({
            url:"/product/detail.do",
            type:"get",
            data:request_info,
            success:function (data) {
                log(data);
                if(data.success)
                {
                    var info=data.data;
                    $("#name").text(info.name);
                    $("#price").text(info.price);
                    $("#detail").text(info.detail);
                    var  host=info.imageHost;
                    var subImages=info.subImages;
                    var url=host+subImages;
                    $("#img_detail").attr("src",url);
                    if(info.mine)
                    {

                        $("#do_rent").hide();
                    }
                    else{
                        $("#do_rent").attr("product_id",info.productId);
                    }
                    $.ajax({
                        url:"/back/category/get_category_info_by_id.do",
                        type:"get",
                        data:{
                            categoryId:info.categoryId
                        },
                        success:function (data) {
                            if(data.success)
                            {
                                $("#system").text(data.data.name);
                            }
                        }
                    })
                    $("#do_rent").click(function () {
                        // $("#do_rent").attr("href","build_order.jsp?productId="+data.data.productId);
                        $(location).prop("href","build_order.jsp?productId="+$("#do_rent").attr("product_id"));
                    })
                }
                else{
                    alert("error:"+data.msg);
                    if(data.code==300)
                    {
                        go_login();
                    }
                }

            },
            error:function (data) {
            }
        });




    });
</script>

</body>
</html>


