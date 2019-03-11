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
    <meta name="keywords" content="Motorola web design"/>
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
                        <li><a href="#">手游账号</a></li>
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
                        <li><a href="#">所有订单</a></li>
                        <li><a href="#">待付款</a></li>
                        <li><a href="#">租用中</a></li>
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
                <div class="sign-up">

                    <a id="tip"></a>
                    <div class="sign-u">
                        <div class="sign-up1" style="margin-top: 1%;">
                            <h4 class="label label-info" style="color: #FFFFFF;">区服:</h4>
                        </div>
                        <div class="sign-up2">
                            <form>
                                <div class="dropdown">
                                    <button id="btn_sys" class="btn btn-default dropdown-toggle" type="button"
                                            id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true"
                                            aria-expanded="true">
                                        系统
                                        <span class="caret"></span>
                                    </button>
                                    <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                                        <li><a id="android_qq" href="#">安卓QQ</a></li>
                                        <li><a id="ios_qq" href="#">苹果QQ</a></li>
                                    </ul>
                                </div>
                            </form>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <div><hr></div>

                    <div class="sign-u">
                        <div class="sign-up1" >
                            <h4 class="label label-info" style="color: #FFFFFF;">图片:</h4>
                        </div>
                        <div class="sign-up2">
                            <form id="formData">
                                <input type="file" name="upload_file" id="sub_images"/>
                            </form>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <div><hr></div>
                    <div class="sign-u">
                        <div class="sign-up1" style="margin-top: 4%;">
                            <h4 class="label label-info" style="color: #FFFFFF;">标题:</h4>
                        </div>
                        <div class="sign-up2">
                            <form>
                                <input type="text" id="name"/>
                            </form>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <div><hr></div>

                    <div class="sign-u">
                        <div class="sign-up1" style="margin-top: 1%;">
                            <h4 class="label label-info" style="color: #FFFFFF;">价格:</h4>
                        </div>
                        <div class="sign-up2">
                            <form>
                                <input type="number" id="price">
                            </form>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <div><hr></div>
                    <div class="sign-u">
                        <div class="sign-up1" style="margin-top:4%;">
                            <h4 class="label label-info" style="color: #FFFFFF;">账号:</h4>
                        </div>
                        <div class="sign-up2">
                            <form>
                                <input type="text" id="account">
                            </form>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <div><hr></div>
                    <div class="sign-u">
                        <div class="sign-up1" style="margin-top:4%;">
                            <h4 class="label label-info" style="color: #FFFFFF;">密码:</h4>
                        </div>
                        <div class="sign-up2">
                            <form>
                                <input type="text" id="password">
                            </form>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <div><hr></div>
                    <div class="sign-u">
                        <div class="sign-up1" style="margin-top:2%;">
                            <h4 class="label label-info" style="color: #FFFFFF;">详细:</h4>
                        </div>
                        <div class="sign-up2">
                            <form>
                                <textarea id="detail" style="width: 100%;"></textarea>
                            </form>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <div><hr></div>
                    <div class="sign-u">
                        <div class="sign-up1">

                        </div>
                        <div class="sign-up2">
                            <form>
                                <button id="btn_ok" style="width: 100%;" type="button" class="btn btn-primary">确定</button>
                            </form>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <div><hr></div>
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
        var productId = getUrlParam("productId");
        if (productId != null) {
            $.ajax({
                url: "/back/product/detail.do",
                type: "get",
                data: {
                    productId: productId
                },
                success: function (data) {
                    log(data);
                    if (data.success) {
                        var info = data.data;
                        //todo 存在值，则进行更新产品操作
                        $("#name").val(info.name);
                        $("#price").val(info.price);
                        $("#account").val(info.account);
                        $("#password").val(info.password);
                        $("#detail").val(info.detail);
                        $("#btn_sys").val("系统ID：" + info.categoryId)
                    }
                    else
                    {
                        if(data.code==300)
                        {
                            go_login();
                        }
                    }
                }

            })
        }
        $("#android_qq").click(function () {
            $("#btn_sys").text($("#android_qq").text()).attr("code", "ANDROID_QQ");
        })
        $("#ios_qq").click(function () {
            $("#btn_sys").text($("#ios_qq").text()).attr("code", "IOS_QQ");
        })

        $("#btn_ok").click(function () {
            var formData = new FormData($("#formData")[0])
            $.ajax({
                url: "/back/product/upload.do",
                type: "post",
                // contentType:"multipart/form-data",
                data: formData,
                async: false,
                contentType: false,
                processData: false,
                success: function (data) {
                    log(data);
                    if (data.success){
                        $("#sub_images").attr("subImages", data.data.uri);
                    }
                    else
                    {
                        if(data.code==300)
                        {
                            go_login();
                        }
                    }
                }

            })

            //获取分类id
            $.ajax({
                url: "/back/category/get_category_info.do",
                type: "get",
                async: false,
                data: {
                    code: $("#btn_sys").attr("code")
                },
                success: function (data) {
                    log(data);
                    if (data.success)
                        $("#btn_sys").attr("categoryId", data.data.categoryId);
                }
            })
            var status;
            if (productId != null) {
                status = 2;
            }
            else {
                status = 1;
            }

            var product_info = {
                productId: productId,
                categoryId: $("#btn_sys").attr("categoryId"),
                name: $("#name").val(),
                subImages: $("#sub_images").attr("subImages"),
                detail: $("#detail").val(),
                account: $("#account").val(),
                password: $("#password").val(),
                price: $("#price").val(),
                status: status,
                mainImage:"king_honor.png"
            }
            $.ajax({
                url: "/back/product/save.do",
                type: "post",
                data: product_info,
                async: false,
                success: function (data) {
                    if (data.success) {
                        alert(data.msg);
                        $(location).prop("href", "business_product_list.jsp");
                    }
                }
            });

        });
    });

</script>
</body>
</html>


<body>

</body>
</html>
