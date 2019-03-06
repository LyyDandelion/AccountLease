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
    <title>订单确认</title>
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/app.js"></script>
    <link rel="stylesheet" type="text/css" href="css/nav-side.css"/>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"/>
</head>
<body>
<div class="container">


    <div id="title_info" class="row">
        <div class="col-md-3"></div>
        <div id="detail_word" class="col-md-4">
            <label id="title_name"></label>
        </div>
        <div class="col-md-4"></div>
    </div>
    <div id="price_info" class="row">
        <div class="col-md-3"></div>
        <div class="col-md-4">
            <label id="price"></label>
        </div>
    </div>
    <div id="payment_type_info" class="row">
        <div class="col-md-3"></div>
        <div class="col-md-2">
            <span class="label label-info" id="type"></span>
        </div>
        <div class="col-md-2">
        </div>
    </div>
    <div class="row">
        <div class="col-md-4"></div>
        <div class="col-md-4">
            <button class="btn btn-primary" id="pay">付款</button>
        </div>
        <div class="col-md-4"></div>
    </div>

    <div class="row">
        <div class="col-md-4"></div>
        <div class="col-md-4">
            <label id="tip_pay"></label>
        </div>
    </div>
    <div class="row">
        <div class="col-md-4"></div>
        <div class="col-md-4" id="qr_img">
        </div>
    </div>
</div>


<script>
    $(document).ready(function () {
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
                if (data.success) {
                    var info = data.data;
                    $("#title_name").text(info.orderItemDtoList[0].productName);
                    $("#price").text("应付金额：" + info.payment + "元");
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
                                    var el = $("<img></img>");
                                    $("#tip_pay").text("订单号："+request_pay.orderNo+" 扫下方二维码完成支付");
                                    el.attr("src", data.data.qrUrl);
                                    $("#qr_img").append(el);
                                }
                            },
                            error: function (data) {
                                log(data)
                            }
                        })
                    });
                    setInterval(function () {
                        $.ajax({
                            url: "/order/query_order_pay_status.do",
                            type: "get",
                            data: request_pay,
                            success: function (data) {
                                if(data.success)
                                {
                                    var info=data.data;
                                    if(info){
                                        //更新信息
                                        $.ajax({
                                            url:"/order/update_order_info.do",
                                            data:request_pay,
                                            success:function(data)
                                            {
                                                log(data);
                                                alert("支付成功");
                                            }
                                        });
                                        $(location).prop("href","result.jsp?_ecit_type=payment_success");
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
