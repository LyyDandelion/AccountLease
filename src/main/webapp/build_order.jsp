<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/3/4
  Time: 8:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>商品租用</title>
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/app.js"></script>
    <link rel="stylesheet" type="text/css" href="css/nav-side.css"/>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"/>
</head>
<body>
<div class="container">


<div id="detail_info" class="row">
    <div class="col-md-2"></div>
    <div id="detail_img" class="col-md-2">
        <img src="http://image.ecit.com/king_honor.png">
    </div>
    <div id="detail_word" class="col-md-4">
        <label>testfdhasisod-fdsadsio</label>
    </div>
    <div class="col-md-2"></div>
</div>
<div id="price_info" class="row">
    <div class="col-md-2"></div>
    <div class="col-md-6">
        <label id="price"></label>
    </div>
</div>
<div id="time_info" class="row">
    <div class="col-md-2"></div>
    <div  class="col-md-2">
        <span class="label label-info">租用时长（小时）：</span>
    </div>
    <div class="col-md-2">
        <div class="number">
            <input id="quantity" type="number"  value="2" max="50" min="1"/>
        </div>
    </div>
</div>
    <div class="row">
        <div class="col-md-4"></div>
        <div class="col-md-4">
            <button class="btn btn-primary" id="pay">去付款</button>
        </div>
        <div class="col-md-4"></div>
    </div>
</div>


<script>
    $(document).ready(function(){
        var  request_info={
            productId:getUrlParam("productId")
        }
        $.ajax({
            url:"/product/detail.do",
            type:"get",
            data:request_info,
            success:function (data) {
                // $("#detail_word").append(JSON.stringify(data));
                $("#price").text("价格："+data.data.price+"元/小时");
                $("#pay").attr("href","href=pay.jsp");
            },
            error:function (data) {

            }
        });

        //去付款
        $("#pay").click(function () {
            // var pay_info={
            //     quantity:$("#quantity").val(),
            //     productId:getUrlParam("productId")
            // }

            localStorage.setItem("quantity",$("#quantity").val());
            localStorage.setItem("productId",getUrlParam("productId"));
            $(location).prop("href","cofirm_order.jsp");

            $.ajax({
                url:""
            })
        });
    });

</script>

</body>
</html>
