<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/3/2
  Time: 16:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>操作结果</title>
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/app.js"></script>
</head>
<body>

<style type="text/css">
    .pass-reset-success,.register-success,.cart-add-success,.payment-success,.default-success{
        display: none;
    }

</style>
<div id="parent">


<div id="register_success" class="result-con register-success">
    <h1 class="result-title">恭喜您，注册成功！</h1>
    <p class="result-content">
        <a class="link" href="login.jsp">立即去登录</a>
    </p>
</div>
<div id="reset_pass_success" class="result-con pass-reset-success">
    <h1 class="result-title">恭喜您，重置密码成功！</h1>
    <p class="result-content">
        <a class="link" href="login.jsp">立即去登录</a>
    </p>
</div>
<div  class="result-con cart-add-success">
    <h1 class="result-title">您的商品已成功加入购物车</h1>
    <p class="result-content">
        <a class="link" href="./index.html">继续购物</a>
        <a class="link" href="./cart.html">去购物车查看</a>
    </p>
</div>
<div id="payment_success" class="result-con payment-success">
    <h1 class="result-title">您的订单支付成功！</h1>
    <p class="result-content">
        <a class="link my-order" href="buyer_renting.jsp">查看我的订单</a>
    </p>
</div>
<div class="result-con default-success">
    <h1 class="result-title">恭喜您，操作成功</h1>
    <p class="result-content">
        <a class="link" href="./index.html">返回首页</a>
    </p>
</div>
</div>

    <script >
        $(document).ready(function () {
            var _ecit_type=getUrlParam("_ecit_type");
            var _ecit_result=getUrlParam("_ecit_result");
            if(_ecit_type=="reset_pass_success")
            {
                console.log("reset_pass_success");
                $("#reset_pass_success").show();
            }
            else if(_ecit_type=="register_success")
            {
                console.log("register_success");
                $("#register_success").show();
            }
            else if(_ecit_type=="payment_success")
            {
                $("#payment_success").show();
            }
        });



    </script>

</body>
</html>
