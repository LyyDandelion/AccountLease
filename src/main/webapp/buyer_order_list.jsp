<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>我是买家-所有订单</title>
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/app.js"></script>
    <link rel="stylesheet" type="text/css" href="css/nav-side.css"/>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="keywords" content="Easy Admin Panel Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template,
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design"/>
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

    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/app.js"></script>
    <link rel="stylesheet" type="text/css" href="css/nav-side.css"/>

    <script>
        new WOW().init();
    </script>
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

            <div class="container">

                <div id="list" class="order-list">


                </div>
                <style type="text/css">
                    .order-detail ul,li{
                        list-style: none;
                    }
                    .order-detail ul li a{
                        text-decoration: none;
                    }
                    .order-list, .order-detail{
                        float: left;
                    }
                    .order-list{
                        margin-top: 6%;
                        margin-left: 10%;
                    }
                    .el{
                        margin-top: 5px;
                        border-top-style: solid;
                        border-top-width: 10px;
                        /*border-bottom-style: solid;*/
                        border-color: #7ad87a;
                    }
                    .list-d{
                        margin-top: 1%;
                    }
                </style>

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
            url:"/order/list.do",
            type:"get",
            data:null,
            async:false,
            success:function(data){
                log(data);
                if(data.success)
                {
                    if(data.data.size==0)
                    {
                        var el="<div class='tip-div'>暂无订单!<div>";
                        $("#list").append(el);
                    }
                    for(var i=0;i<data.data.size;i++)
                    {
                        var info=data.data.list[i];
                        var el="<div class='el'><span class='label label-info '>订单号</span><span style='margin-left: 5%'>"+info.orderNo+"</span></br><hr>"+
                            "<div class='list-d'><span class='label label-primary'>商品名</span><span  style='margin-left: 5%'>"+info.orderItemDtoList[0].productName+"</span></br></div>"+
                            "<div class='list-d'><span class='label label-warning'>状态</span><span  style='margin-left: 7%'>"+info.statusDesc+"</span></br></div>"+
                            "<div class='list-d'><span class='label label-danger'>时长</span><span  style='margin-left: 7%'>"+info.orderItemDtoList[0].quantity+'小时'+"</span></br></div>"+
                            "<div class='list-d'><span class='label label-default'>金额</span><span  style='margin-left: 7%'>"+info.orderItemDtoList[0].totalPrice+'元'+"</span></br></div>"+
                            "<div class='list-d'><span class='label label-success'>结束时间</span><span  style='margin-left: 3%'>"+info.closeTime+"</span></br></div><hr></div>"
                        $("#list").append(el);

                        var status=info.status;
                        //添加按钮事件
                        var params = [info.orderNo, status];
                        var btn_op_name;
                        var btn_op_id;
                        var btn_op_name_edit;
                        var btn_edit_id;
                        var flag=false;
                        if (status == "NO_PAY") {
                            btn_op_name = "去支付"
                            btn_op_id=concat_params("to_pay", params);
                            flag=true;
                        }
                        else if (status == "SUCCESS") {
                            btn_op_name = "售后处理"
                            btn_op_id = concat_params("success_sale",params);
                            flag=true;
                        }
                        else if (status == "PAID") {
                            btn_op_name = "取消订单"
                            btn_op_id = concat_params("cancel_order",params);
                            flag=true;
                        }
                        if(flag){
                            var btn_el="<button id='" + btn_op_id + "' style='width:55%;height:35px;margin-left: 15%;' class='btn btn-primary btn_op_name'>" + btn_op_name + "</button>"
                            $("#list").append(btn_el);
                        }

                    }
                }
                else{
                    alert("error:"+JSON.stringify(data));
                    if(data.code=="300")
                    {
                        go_login();
                    }
                }
            },
            error:function(data) {
                //alert("error:"+JSON.stringify(data));
                if(data.code=="300")
                {
                    go_login();
                    log(data);
                }
            }
        });

        /**
         * 拼接字符
         * @param name
         * @param params
         * @param split
         * @returns {*}
         */
        function concat_params(name, params, split) {
            if(split==null)
            {
                split="-";
            }
            var str = name;
            for (var i = 0; i < params.length; i++) {
                str += split;
                str += params[i];
            }
            return  str;
        }


        $("body").on("click", ".btn_op_name", function (data) {
            var params = this.id.split("-");
            var id = params[0];
            var orderNo = params[1];

            if (id == "to_pay")//去支付
            {
                $(location).prop("href","cofirm_order.jsp?orderNo="+orderNo);
                // $.ajax({
                //     url: "/back/product/set_sale_status.do",
                //     type: "post",
                //     data: {
                //         productId: productId,
                //         status: 2
                //     },
                //     success: function (data) {
                //         if (data.success) {
                //             alert("产品已下架");
                //             window.location.reload();
                //         }
                //         else {
                //             alert("error:" + data.msg);
                //         }
                //     }
                // })
            }
            else if (id == "success_sale")//售后
            {
                // var password = prompt("有事请说！");
                alert("todo:待开发")
                // $.ajax({
                //     url: "/back/product/update_password.do",
                //     type: "post",
                //     data: {
                //         productId: productId,
                //         password: password
                //     },
                //     success: function (data) {
                //         log(data);
                //         alert(data.msg)
                //     }
                // })
            }
            else if (id == "cancel_order")//取消订单
            {
                alert("todo:待开发")
                // $.ajax({
                //     url: "/back/product/set_sale_status.do",
                //     type: "post",
                //     data: {
                //         productId: productId,
                //         status: 2
                //     },
                //     success: function (data) {
                //         if (data.success) {
                //             alert("订单已取消，同时商品已下架");
                //             window.location.reload();
                //         }
                //         else {
                //             //todo
                //             alert("error:" + data.msg);
                //         }
                //     }
                // })
            }
            else {
                alert("error");
                //todo
            }

        })


    });

</script>


</body>
</html>





