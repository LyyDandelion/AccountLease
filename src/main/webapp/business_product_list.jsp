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
    <title>全部商品</title>
    <link rel="stylesheet" type="text/css" href="css/nav-side.css"/>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css"/>
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/app.js"></script>
    <script src="js/bootstrap.js"></script>
</head>
<body>
<div class="container">
    <div class="row">
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
    </div>
    <div id="div_list">

    </div>


</div>

<div class="pass_">

</div>

<style type="text/css">
    .order-detail ul, li {
        list-style: none;
    }

    .order-detail ul li a {
        text-decoration: none;
    }

</style>
<script>

    $(document).ready(function () {
        $.ajax({
            url: "/back/product/get_list.do",
            type: "get",
            success: function (data) {
                log(data)
                if (data.success) {
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

                        var el = "<div class=\"row\">\n" +
                            "            <div class=\"col-md-2\"></div>\n" +
                            "            <div class=\"col-md-8\" style=\"border-bottom-style: solid;border-bottom-color: #5cb85c\"></div>\n" +
                            "        </div>\n" +
                            "        <div class=\"row\">\n" +
                            "            <div class=\"col-md-2\"></div>\n" +
                            "            <div class=\"col-md-4\"><span class='productId' value='" + productId + "'>商品ID" + productId + "</span></div>\n" +
                            "            <div class=\"col-md-2\">状态：" + status + "</div>\n" +
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
                        var op_div = "        <div class=\"row\">\n" +
                            "            <div class=\"col-md-4\"></div>\n" +
                            "            <div class=\"col-md-3\">\n" +
                            "\n" +
                            "                <button id='" + btn_op_id + "' class=\"btn btn-primary btn_op_name\">" + btn_op_name + "</button>\n" +
                            "            </div>\n" +
                            "            <div class=\"col-md-3\">\n" +
                            "                <button id='" + btn_edit_id + "' class=\"btn btn-info btn_op_name\">" + btn_op_name_edit + "</button>\n" +
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
