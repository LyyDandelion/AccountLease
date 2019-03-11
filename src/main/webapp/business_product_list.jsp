<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>全部商品</title>
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/app.js"></script>
    <link rel="stylesheet" type="text/css" href="css/nav-side.css"/>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"/>
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
                <div id="div_list">

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
            url: "/back/product/get_list.do",
            type: "get",
            success: function (data) {
                log(data)
                if (data.success) {
                    if(data.data.size==0)
                    {
                        var el="<div class='tip-div'>暂无商品!<div>";
                        $("#div_list").append(el);
                    }
                    var info = data.data;
                    for (var i = 0; i < info.size; i++) {
                        var status = info.list[i].status;
                        var subtitle = info.list[i].subtitle;
                        var name=info.list[i].name;
                        var imageHost = info.list[i].imageHost;
                        var mainImage = info.list[i].mainImage;
                        var img_url = imageHost + mainImage;
                        var productId = info.list[i].productId;
                        var params = [productId, status];
                        var btn_op_name;
                        var btn_op_id;
                        var btn_op_name_edit;
                        var btn_edit_id;

                        if (status == 1) {
                            btn_op_name = "下架"
                            btn_op_id=concat_params("set_off_shelf", params);
                            btn_op_name_edit = "改密"
                            btn_edit_id = concat_params("up_pass",params);
                        }
                        else if (status == 2) {
                            btn_op_name = "上架"
                            btn_op_id = concat_params("set_on_sale",params);
                            btn_op_name_edit = "编辑"
                            btn_edit_id = concat_params("edit",params);
                        }
                        else if (status == 4) {
                            btn_op_name = "取消订单"
                            btn_op_id = concat_params("cancel_order",params);
                            btn_op_name_edit = "发送提示"
                            btn_edit_id = concat_params("send_tip",params);
                        }

                        var status_desc=null;
                        $.ajax({
                            url:"/back/sysCode/get_sys_code_view.do",
                            type:"get",
                            data:{
                                code:"ECIT.PRODUCT_STATUS"
                            },
                            async:false,
                            success:function (data) {
                                // debugger;
                                if(data.success)
                                {

                                        var info=data.data;
                                        for(var i=0;i<info.size;i++)
                                        {
                                            if(info.list[i].value==status)
                                            {
                                                status_desc= info.list[i].meaning;
                                                break;
                                            }
                                        }

                                }
                                else{
                                    return data;
                                }

                            }
                        })
                        var el = "<div class=\"row\">\n" +
                            "            <div class=\"col-md-2\"></div>\n" +
                            "            <div class=\"col-md-8\" style=\"border-bottom-style: solid;border-bottom-color: #5cb85c\"></div>\n" +
                            "        </div>\n" +
                            "        <div class=\"row\">\n" +
                            "            <div class=\"col-md-2\"></div>\n" +
                            "            <div class=\"col-md-4\"><span class='productId' value='" + productId + "'>商品ID" + productId + "</span></div>\n" +
                            "            <div class=\"col-md-2\">状态：" + status_desc + "</div>\n" +
                            "        </div>\n" +
                            "        <div class=\"row\">\n" +
                            "            <div class=\"col-md-2\"></div>\n" +
                            "            <div class=\"col-md-8\" style=\"border-bottom-style: solid;border-bottom-color: #5cb85c\"></div>\n" +
                            "        </div>\n" +
                            "        <div class=\"row\">\n" +
                            "            <div class=\"col-md-2\"></div>\n" +
                            "            <div class=\"col-md-3\"><img class='img-thumbnail' src='" + img_url + "'/></div>" +
                            "            <div class=\"col-md-4\">" + name + "</div>\n" +
                            "        </div>\n";
                        var op_div = "        <div class=\"row\" style=\"margin-bottom:1%;\">\n" +
                            "            <div class=\"col-md-4\"></div>\n" +
                            "            <div class=\"col-md-3\">\n" +
                            "\n" +
                            "                <button id='" + btn_op_id + "' style=\"width:55%;height:35px\" class=\"btn btn-primary btn_op_name\">" + btn_op_name + "</button>\n" +
                            "            </div>\n" +
                            "            <div class=\"col-md-3\">\n" +
                            "                <button id='" + btn_edit_id + "' style=\"width:55%;height:35px\" class=\"btn btn-warning btn_op_name\">" + btn_op_name_edit + "</button>\n" +
                            "            </div>\n" +
                            "            <div class=\"col-md-2\"></div>\n" +
                            "        </div>";

                        $("#div_list").append(el).append(op_div);
                    }
                }
            }
        })
        $("body").on("click", ".btn_op_name", function (data) {
            var params = this.id.split("-");
            var id = params[0];
            var productId = params[1];

            if (id == "set_off_shelf")//下架
            {
                $.ajax({
                    url: "/back/product/set_sale_status.do",
                    type: "post",
                    data: {
                        productId: productId,
                        status: 2
                    },
                    success: function (data) {
                        if (data.success) {
                            alert("产品已下架");
                            window.location.reload();
                        }
                        else {
                            alert("error:" + data.msg);
                        }
                    }
                })
            }
            else if (id == "up_pass")//改密
            {
                var password = prompt("请输入新密码");

                $.ajax({
                    url: "/back/product/update_password.do",
                    type: "post",
                    data: {
                        productId: productId,
                        password: password
                    },
                    success: function (data) {
                        log(data);
                        alert(data.msg)
                    }
                })
            }
            else if (id == "set_on_sale") //上架
            {

                $.ajax({
                    url: "/back/product/set_sale_status.do",
                    type: "post",
                    data: {
                        productId: productId,
                        status: 1
                    },
                    success: function (data) {
                        if (data.success) {
                            alert("产品已上架");
                            window.location.reload();
                        }
                        else {
                            alert("error:" + data.msg);
                        }
                    }
                })
            }
            else if (id == "edit")//编辑
            {
                $(location).prop("href", "product_add_king_honor.jsp?productId="+productId);
            }
            else if (id == "cancel_order")//取消订单
            {
                $.ajax({
                    url: "/back/product/set_sale_status.do",
                    type: "post",
                    data: {
                        productId: productId,
                        status: 2
                    },
                    success: function (data) {
                        if (data.success) {
                            alert("订单已取消，同时商品已下架");
                            window.location.reload();
                        }
                        else {
                            //todo
                            alert("error:" + data.msg);
                        }
                    }
                })
            } else if (id == "send_tip")//发送提示
            {
                //todo
            }
            else {
                alert("error");
                //todo
            }

        })

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
    });

</script>

</body>
</html>


