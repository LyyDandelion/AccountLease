<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>订单确认</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

    <script type="application/x-javascript"> addEventListener("load", function () {
        setTimeout(hideURLbar, 0);
    }, false);

    function hideURLbar() {
        window.scrollTo(0, 1);
    } </script>


    <link rel="stylesheet" type="text/css" href="css/nav-side.css"/>
    <!-- Bootstrap Core JavaScript -->

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
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/app.js"></script>
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
            <div class="container">


                <div id="detail_info" class="row">
                    <div class="col-md-2"></div>
                    <div id="detail_img" class="col-md-2">
                        <img id="main_image">
                    </div>
                    <div id="detail_word" class="col-md-4" style="width: 20%;">
                        <span id="name" style="color: red;"></span>
                    </div>
                    <div class="col-md-2"></div>
                </div>
                <div class="row">
                    <div class="col-md-2"></div>
                    <div class="col-md-6">
                        <hr>
                    </div>
                </div>
                <div id="price_info" class="row">
                    <div class="col-md-2"></div>
                    <div class="col-md-2">
                        <label class="label label-info">商品：</label>
                    </div>
                    <div class="col-md-2"><label id="title_name" style="color:orangered;"></label></div>
                </div>
                <div class="row">
                    <div class="col-md-2"></div>
                    <div class="col-md-6">
                        <hr>
                    </div>
                </div>
                <div id="time_info" class="row">
                    <div class="col-md-2"></div>
                    <div class="col-md-2">
                        <span class="label label-info">应付金额：</span>
                    </div>
                    <div class="col-md-2">
                        <div class="number">
                            <label id="price" style="color:orangered;" ></label>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-2"></div>
                    <div class="col-md-6">
                        <hr>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4"></div>
                    <div class="col-md-4">
                        <button class="btn btn-primary" style="width: 50%;" id="pay">确定并支付
                        </button>
                    </div>
                    <div class="col-md-4"></div>
                </div>
            </div>
        </div>
    </div>
    <!--footer section start-->
    <footer>
        <p>Copyright &copy; 2019.毕业设计.ecit_lyy</p>
    </footer>
    <!--footer section end-->

    <!-- Button trigger modal -->

    <div class="modal fade" id="myModal" style="width: 22%;margin-left: 33%;"   aria-labelledby="myModalLabel">
        <div class="modal-content">
        <div class="row modal-header">
            <div class="col-md-12">
                <label id="tip_pay" style="text-align: center"></label>
            </div>
        </div>
        <div class="row modal-body">
            <div class="col-md-12" >
                <img id="qr_img"/>
            </div>
        </div>
        </div>

    </div>

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
        var productId = sessionStorage.getItem("productId");
        var quantity = sessionStorage.getItem("quantity");
        var pay_info = {
            productId: productId,
            quantity: quantity
        }
        $.ajax({
            url: "/order/create_order.do",
            type: "post",
            data: pay_info,
            success: function (data) {
                log(data);
                if (data.success) {
                    var info = data.data;
                    $("#title_name").text(info.orderItemDtoList[0].productName);
                    $("#price").text(info.payment + " 元");
                    $("#type").text(info.paymentTypeDesc);
                    var request_pay = {
                        orderNo: info.orderNo
                    }
                    $("#pay").click(function () {
                        $.ajax({
                            url: "/order/pay.do",
                            type: "post",
                            data: request_pay,
                            success: function (data) {
                                log(data)
                                if (data.success) {
                                    $("#tip_pay").text("订单号："+request_pay.orderNo+" 扫下方二维码完成支付");

                                    $("#qr_img").attr("src",data.data.qrUrl);

                                    $("#pay").attr("data-toggle","modal").attr("data-target","#myModal");
                                    // data-toggle="modal" data-target="#myModal"

                                }
                                else{
                                    $("#pay").attr("data-toggle","").attr("data-target","");
                                    alert("fail:"+data.msg);
                                    $(location).prop("href","build_order.jsp");
                                }
                            },
                            error: function (data) {
                                alert("error:"+data.msg);

                            }
                        })
                    });
                    setInterval(function () {
                        $.ajax({
                            url: "/order/query_order_pay_status.do",
                            type: "get",
                            data: request_pay,
                            async:false,
                            success: function (data) {
                                if(data.success)
                                {
                                    var info=data.data;
                                    if(info){
                                        // debugger;
                                        //更新信息
                                        $.ajax({
                                            url:"/order/update_order_info.do",
                                            data:request_pay,
                                            type:"post",
                                            async:false,
                                            success:function(data)
                                            {
                                                log(data);
                                                alert("支付成功!将跳转至订单租用页面查看订单信息");
                                                $(location).prop("href","buyer_renting.jsp");
                                            }
                                        });
                                        // $(location).prop("href","result.jsp?_ecit_type=payment_success");
                                    }
                                }
                            }
                        })
                    }, 1000);

                }
                else {
                    log(data);
                }
            },
            error: function (data) {
                log(data);
            }
        });


    });

</script>

</body>
</html>

