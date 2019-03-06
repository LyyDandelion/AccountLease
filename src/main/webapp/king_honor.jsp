<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/3/3
  Time: 21:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>王者荣耀</title>
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/app.js"></script>
    <link rel="stylesheet" type="text/css" href="css/nav-side.css"/>
</head>
<body>
<div id="product_list">
    <ul class="display">

    </ul>
</div>
<script>

    $(document).ready(function () {
        var request_info = {
            categoryId: 100035,
            orderBy: "last_update_date-asc"
        };
        $.ajax({
            url: "/product/list.do",
            type: "get",
            data: request_info,
            success: function (data) {
                log(data);
                if (data.success) {
                    var info = data.data;
                    for (var i = 0;i < info.size;i++) {
                        createProduct(info, i);
                    }
                }
                else {
                    alert("error:"+data.msg);
                }

            }
        });
    });

    function createProduct(info, i) {
        var img_url = info.list[i].imageHost + "king_honor.png";
        var product_url="product_detail.jsp?productId="+info.list[i].productId;
        el_li = $("<li></li>");
        var left_a = $("<a></a>");
        var el_img = $("<img></img>");
        var el_list_detail = $("<div></div>");
        var middle_detail = $("<div></div>");
        var right_a = $("<a></a>");
        //链接
        left_a.attr("href", product_url);
        //图片
        el_img.attr("src", img_url);
        el_img.attr("alt", info.list[i].name);
        //详情
        el_list_detail.text(info.list[i].name);
        //参考
        middle_detail.text("租金：" + info.list[i].price + "元/小时")

        //租用
        right_a.text("租用")
        right_a.attr("href", product_url);

        left_a.append(el_img);
        el_li.append(left_a);
        el_li.append(el_list_detail);
        el_li.append(middle_detail).append(right_a)
        $("#product_list ul").append(el_li);
    }
</script>
</body>
</html>
