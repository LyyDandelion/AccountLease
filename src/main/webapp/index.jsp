<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>首页</title>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

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
    <!--//end-animate-->
    <!----webfonts--->
    <link href='http://fonts.googleapis.com/css?family=Cabin:400,400italic,500,500italic,600,600italic,700,700italic'
          rel='stylesheet' type='text/css'>
    <!---//webfonts--->
    <!-- Meters graphs -->
    <script src="js/jquery-1.10.2.min.js"></script>
    <!-- Placed js at the end of the document so the pages load faster -->

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
                <li class="active">
                    <a href="index.jsp"><i class="fa fa-desktop"></i>
                    <span>首页</span></a>
                </li>
                <li class="menu-list">
                    <a href="#"><i class="glyphicon glyphicon-user"></i>
                        <span>个人中心</span></a>
                    <ul class="sub-menu-list">
                        <li><a href="user_center.jsp">个人信息</a></li>
                        <li><a href="password_update.jsp">修改密码</a></li>
                    </ul>
                </li>
                <li class="menu-list"><a href="#">
                    <i class="glyphicon glyphicon-leaf"></i>
                    <span>出租商品</span></a>
                    <ul class="sub-menu-list">
                        <li><a href="product_add_mobile.jsp">手游账号</a></li>
                        <li><a href="product_add_pc.jsp">端游账号</a></li>
                        <li><a href="product_add_vip.jsp">视频账号</a></li>

                    </ul>
                </li>
                <li class="menu-list">
                    <a href="#"><i class="glyphicon glyphicon-send"></i>
                        <span>租号</span>
                    </a>
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
    <div class="main-content">
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
                                    <li><a id="logout" href="#"><i class="fa fa-sign-out"></i> 退出</a></li>
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
                <div class="col_3">
                    <div class="col-md-3 widget widget1">
                        <div class="r3_counter_box">
                            <i class="fa fa-mail-forward"></i>
                            <div class="stats">
                                <h5>45 <span>%</span></h5>
                                <div class="grow">
                                    <p>增长量</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 widget widget1">
                        <div class="r3_counter_box">
                            <i class="fa fa-users"></i>
                            <div class="stats">
                                <h5>50 <span>%</span></h5>
                                <div class="grow grow1">
                                    <p>新用户量</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 widget widget1">
                        <div class="r3_counter_box">
                            <i class="fa fa-eye"></i>
                            <div class="stats">
                                <h5>70 <span>%</span></h5>
                                <div class="grow grow3">
                                    <p>访问量</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 widget">
                        <div class="r3_counter_box">
                            <i class="fa fa-usd"></i>
                            <div class="stats">
                                <h5>70 <span>%</span></h5>
                                <div class="grow grow2">
                                    <p>收益</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>

                <!-- switches -->
                <div class="switches">
                    <div class="col-4">
                        <div class="col-md-4 switch-right">
                            <div class="switch-right-grid">
                                <div class="switch-right-grid1">
                                    <h3>今日统计</h3>
                                    <p>销售业务实况.</p>
                                    <ul>
                                        <li>收入: ￥4000 元</li>
                                        <li>销量: 200 件</li>
                                        <li>上个小时销售额: ￥340 元</li>
                                    </ul>
                                </div>
                            </div>
                            <div class="sparkline">
                                <canvas id="line" height="150" width="480"
                                        style="width: 480px; height: 150px;"></canvas>
                                <script>
                                    var lineChartData = {
                                        labels: ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Mon"],
                                        datasets: [
                                            {
                                                fillColor: "#fff",
                                                strokeColor: "#F44336",
                                                pointColor: "#fbfbfb",
                                                pointStrokeColor: "#F44336",
                                                data: [20, 35, 45, 30, 10, 65, 40]
                                            }
                                        ]

                                    };
                                    new Chart(document.getElementById("line").getContext("2d")).Line(lineChartData);
                                </script>
                            </div>
                        </div>
                        <div class="col-md-4 switch-right">
                            <div class="switch-right-grid">
                                <div class="switch-right-grid1">
                                    <h3>月度统计</h3>
                                    <p>销售业务实况.</p>
                                    <ul>
                                        <li>收入: ￥50000 元</li>
                                        <li>销量: 4000 件</li>
                                        <li>上月收入: ￥24340 元</li>
                                    </ul>
                                </div>
                            </div>
                            <div class="sparkline">
                                <canvas id="bar" height="150" width="480" style="width: 480px; height: 150px;"></canvas>
                                <script>
                                    var barChartData = {
                                        labels: ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Mon", "Tue", "Wed", "Thu"],
                                        datasets: [
                                            {
                                                fillColor: "#8BC34A",
                                                strokeColor: "#8BC34A",
                                                data: [25, 40, 50, 65, 55, 30, 20, 10, 6, 4]
                                            },
                                            {
                                                fillColor: "#8BC34A",
                                                strokeColor: "#8BC34A",
                                                data: [30, 45, 55, 70, 40, 25, 15, 8, 5, 2]
                                            }
                                        ]

                                    };
                                    new Chart(document.getElementById("bar").getContext("2d")).Bar(barChartData);
                                </script>
                            </div>
                        </div>
                        <div class="col-md-4 switch-right">
                            <div class="switch-right-grid">
                                <div class="switch-right-grid1">
                                    <h3>本年统计</h3>
                                    <p>销售实况.</p>
                                    <ul>
                                        <li>收入: ￥800000 元</li>
                                        <li>销量: 8,000 件</li>
                                        <li>上一年收入: ￥75,434 元</li>
                                    </ul>
                                </div>
                            </div>
                            <div class="sparkline">
                                <!--graph-->
                                <link rel="stylesheet" href="css/graph.css">
                                <script src="js/jquery.flot.min.js"></script>
                                <!--//graph-->
                                <script>
                                    $(document).ready(function () {

                                        // Graph Data ##############################################
                                        var graphData = [{
                                            // Returning Visits
                                            data: [[4, 4500], [5, 3500], [6, 6550], [7, 7600], [8, 4500], [9, 3500], [10, 6550],],
                                            color: '#FFCA28',
                                            points: {radius: 7, fillColor: '#fff'}
                                        }
                                        ];

                                        // Lines Graph #############################################
                                        $.plot($('#graph-lines'), graphData, {
                                            series: {
                                                points: {
                                                    show: true,
                                                    radius: 1
                                                },
                                                lines: {
                                                    show: true
                                                },
                                                shadowSize: 0
                                            },
                                            grid: {
                                                color: '#fff',
                                                borderColor: 'transparent',
                                                borderWidth: 10,
                                                hoverable: true
                                            },
                                            xaxis: {
                                                tickColor: 'transparent',
                                                tickDecimals: false
                                            },
                                            yaxis: {
                                                tickSize: 1200
                                            }
                                        });

                                        // Graph Toggle ############################################
                                        $('#graph-bars').hide();

                                        $('#lines').on('click', function (e) {
                                            $('#bars').removeClass('active');
                                            $('#graph-bars').fadeOut();
                                            $(this).addClass('active');
                                            $('#graph-lines').fadeIn();
                                            e.preventDefault();
                                        });

                                        $('#bars').on('click', function (e) {
                                            $('#lines').removeClass('active');
                                            $('#graph-lines').fadeOut();
                                            $(this).addClass('active');
                                            $('#graph-bars').fadeIn().removeClass('hidden');
                                            e.preventDefault();
                                        });

                                    });
                                </script>
                                <div id="graph-wrapper">
                                    <div class="graph-container">
                                        <div id="graph-lines"></div>
                                        <div id="graph-bars"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
                <!-- //switches -->
                <div class="col_1">
                    <div class="col-md-4 span_8">
                        <div class="activity_box">
                            <h3>收件箱</h3>
                            <div class="scrollbar scrollbar1" id="style-3">
                                <div class="activity-row">
                                    <div class="col-xs-3 activity-img"><img src='images/han_xin.jpg' class="img-responsive"
                                                                            alt=""/></div>
                                    <div class="col-xs-7 activity-desc">
                                        <h5><a href="#">韩 信</a></h5>
                                        <p>国士无双.</p>
                                    </div>
                                    <div class="col-xs-2 activity-desc1"><h6>13:40 PM</h6></div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="activity-row">
                                    <div class="col-xs-3 activity-img"><img src='images/li_bai.jpg' class="img-responsive"
                                                                            alt=""/></div>
                                    <div class="col-xs-7 activity-desc">
                                        <h5><a href="#">李 白</a></h5>
                                        <p>旅途永无止境.</p>
                                    </div>
                                    <div class="col-xs-2 activity-desc1"><h6>13:40 PM</h6></div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="activity-row">
                                    <div class="col-xs-3 activity-img"><img src='images/sun_wu_kong.jpg' class="img-responsive"
                                                                            alt=""/></div>
                                    <div class="col-xs-7 activity-desc">
                                        <h5><a href="#">孙 悟 空</a></h5>
                                        <p>有妖气.</p>
                                    </div>
                                    <div class="col-xs-2 activity-desc1"><h6>13:40 PM</h6></div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="activity-row">
                                    <div class="col-xs-3 activity-img"><img src='images/lu_ban.jpg' class="img-responsive"
                                                                            alt=""/></div>
                                    <div class="col-xs-7 activity-desc">
                                        <h5><a href="#">鲁 班</a></h5>
                                        <p>来打我呀！</p>
                                    </div>
                                    <div class="col-xs-2 activity-desc1"><h6>13:40 PM</h6></div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 span_8">
                        <div class="activity_box activity_box1">
                            <h3>聊天</h3>
                            <div class="scrollbar" id="style-4">
                                <div class="activity-row activity-row1">
                                    <div class="col-xs-3 activity-img"><img src='images/lu_ban.jpg' class="img-responsive"
                                                                            alt=""/><span>10:00 PM</span></div>
                                    <div class="col-xs-5 activity-img1">
                                        <div class="activity-desc-sub">
                                            <h5>鲁班七号</h5>
                                            <p>来抓我呀!</p>
                                        </div>
                                    </div>
                                    <div class="col-xs-4 activity-desc1"></div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="activity-row activity-row1">
                                    <div class="col-xs-2 activity-desc1"></div>
                                    <div class="col-xs-7 activity-img2">
                                        <div class="activity-desc-sub1">
                                            <h5>李白</h5>
                                            <p>过来,保证不欺负你!</p>
                                        </div>
                                    </div>
                                    <div class="col-xs-3 activity-img"><img src='images/li_bai.jpg' class="img-responsive"
                                                                            alt=""/><span>10:02 PM</span></div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="activity-row activity-row1">
                                    <div class="col-xs-3 activity-img"><img src='images/sun_wu_kong.jpg' class="img-responsive"
                                                                            alt=""/><span>10:00 PM</span></div>
                                    <div class="col-xs-5 activity-img1">
                                        <div class="activity-desc-sub">
                                            <h5>孙悟空</h5>
                                            <p>一棍子的事情</p>
                                        </div>
                                    </div>
                                    <div class="col-xs-4 activity-desc1"></div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="activity-row activity-row1">
                                    <div class="col-xs-2 activity-desc1"></div>
                                    <div class="col-xs-7 activity-img2">
                                        <div class="activity-desc-sub1">
                                            <h5>李白</h5>
                                            <p>我的酒壶被这小子怼坏了</p>
                                        </div>
                                    </div>
                                    <div class="col-xs-3 activity-img"><img src='images/li_bai.jpg' class="img-responsive"
                                                                            alt=""/><span>10:02 PM</span></div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                            <form>
                                <input type="text" value="" onfocus="this.value = '';"
                                       onblur="if (this.value == '') {this.value = '回复';}" required="">
                                <input type="submit" value="发送" required=""/>
                            </form>
                        </div>
                    </div>
                    <div class="col-md-4 span_8">
                        <div class="activity_box activity_box2">
                            <h3>待办事项</h3>
                            <div class="scrollbar" id="style-2">
                                <div class="activity-row activity-row1">
                                    <div class="single-bottom">
                                        <ul>
                                            <li>
                                                <input type="checkbox" id="brand" value="">
                                                <label for="brand"><span></span> 李白邀你去洞庭湖游玩.</label>
                                            </li>
                                            <li>
                                                <input type="checkbox" id="brand1" value="">
                                                <label for="brand1"><span></span> 《三体》仅看了21%，离目标还远.</label>
                                            </li>
                                            <li>
                                                <input type="checkbox" id="brand2" value="">
                                                <label for="brand2"><span></span> 2月14号，女友生日.</label>
                                            </li>
                                            <li>
                                                <input type="checkbox" id="brand9" value="">
                                                <label for="brand9"><span></span> 有15个订单需要您处理.</label>
                                            </li>
                                            <li>
                                                <input type="checkbox" id="brand8" value="">
                                                <label for="brand8"><span></span> 103件商品需要审核.</label>
                                            </li>
                                            <li>
                                                <input type="checkbox" id="brand7" value="">
                                                <label for="brand7"><span></span> 本周销售报表未导出.</label>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <form>
                                <input type="text" value="" onfocus="this.value = '';"
                                       onblur="if (this.value == '') {this.value = '';}" required="">
                                <input type="submit" value="提交" required=""/>
                            </form>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <div class="clearfix"></div>

                </div>
            </div>
            <!--body wrapper start-->
        </div>
        <!--body wrapper end-->
    </div>
    <!--footer section start-->
    <footer>
        <p>Copyright &copy; 2019.毕业设计.ecit_lyy</p>
    </footer>
    <!--footer section end-->

    <!-- main content end-->
</section>

<script src="js/jquery.nicescroll.js"></script>
<script src="js/scripts.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="js/bootstrap.min.js"></script>

<script>
    $(document).ready(function () {
        var username = sessionStorage.getItem("username");
        console.log("username", username);
        if (username == null) {
            $(location).prop("href", "login.jsp");
        }
        else {
            $("#user_tip").text(username);
        }
        $("#logout").click(function () {
            $.ajax({
                url: "/user/logout.do",
                type: "post",
                success: function (data) {
                    if (data.success) {
                        sessionStorage.removeItem("username");
                        $(location).prop("href", "login.jsp");
                    }
                    else {
                        alert("error:" + JSON.stringify(data));
                    }
                }
            })
        });
        $("#user_center").click(function () {

            if (username == null) {
                $(location).prop("href", "login.jsp");
            }
            else {
                console.log("进入个人中心");
                $(location).prop("href", "user_center.jsp");
            }
        });
        $("#add_product").click(function () {
            if (username == null) {
                $(location).prop("href", "login.jsp");
            }
            else {
                console.log("新建商品");
                $(location).prop("href", "product_add.jsp");
            }
        });
    });


</script>
</body>
</html>

