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
    <title>我是买家-所有订单</title>
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
            <li><a>待付款</a></li>
            <li><a href="buyer_renting.jsp">租用中</a></li>
            <li><a>退款中</a></li>
            <li><a>售后</a></li>
            <li><a href="buyer_order_list.jsp">所有订单</a></li>
        </ul>
    </div>
    <div id="list" class="order-list">


    </div>
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
</style>
<script>
    $(document).ready(function () {
        $.ajax({
            url:"/order/list.do",
            type:"get",
            data:null,
            success:function(data){
                log(data);
                if(data.success)
                {
                    for(var i=0;i<data.data.size;i++)
                    {
                        var info=data.data.list[i];
                        var el="<div class='el'><a>订单号：</a>"+info.orderNo+"</br><hr>"+
                            "<a>商品名:</a>"+info.orderItemDtoList[0].productName+"</br>"+
                            "<a>图片:</a>"+info.orderItemDtoList[0].productImage+"</br>"+
                            "<a>状态：</a>"+info.statusDesc+"</br>"+
                            "<a>时长：</a>"+info.orderItemDtoList[0].quantity+"</br>"+
                            "<a>金额：</a>"+info.orderItemDtoList[0].totalPrice+"</br>"+
                            "<a>结束时间：</a>"+info.closeTime+"</br><hr></div>"
                        $("#list").append(el);
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


    });
</script>
</body>
</html>
