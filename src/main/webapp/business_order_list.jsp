<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/3/3
  Time: 9:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>全部订单</title>
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/app.js"></script>
    <link rel="stylesheet" type="text/css" href="css/nav-side.css"/>
</head>
<body>
<a href="index.jsp">首页</a>
<div class="left-on">
    <ul>
        <li><a href="user_center.jsp">个人信息</a></li>
        <li><a href="buyer_center.jsp">我是买家</a></li>
        <li><a href="business_center.jsp">我是商家</a></li>
        <li><a href="password_update.jsp">修改密码</a></li>
    </ul>
</div>
<div class="right-on">
    <div class="order-detail">
        <ul>
            <li><a href="business_on_sale.jsp">已上架</a></li>
            <li><a href="business_off_shelf.jsp">已下架</a></li>
            <li><a href="business_product_list.jsp">全部商品</a></li>
            <li><a href="business_renting.jsp">租用中</a></li>
            <li><a href="business_order_list.jsp">全部订单</a></li>
        </ul>
    </div>
</div>
<style type="text/css">
    .order-detail ul,li{
        list-style: none;
    }
    .order-detail ul li a{
        text-decoration: none;
    }
</style>
</body>
</html>
