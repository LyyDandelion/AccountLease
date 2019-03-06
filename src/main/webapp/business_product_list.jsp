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
                    var info=data.data;
                    for(var i=0;i<info.size;i++)
                    {
                        var status=info.list[i].status;
                        var subtitle=info.list[i].subtitle
                        var imageHost=info.list[i].imageHost;
                        var mainImage=info.list[i].mainImage;
                        var img_url=imageHost+mainImage;
                        var productId=info.list[i].productId;
                        if(status==1)
                        {
                            btn_op_name="下架"
                            btn_op_id="set_off_shelf";
                            btn_op_name_edit="改密"
                            btn_edit_id="up_pass"
                        }
                        else if(status==2){
                            btn_op_name="上架"
                            btn_op_id="set_on_sale";
                            btn_op_name_edit="编辑"
                            btn_edit_id="edit"
                        }
                         else if(status==4)
                        {
                            btn_op_name="取消订单"
                            btn_op_id="cancel_order";
                            btn_op_name_edit="发送提示"
                            btn_edit_id="send_tip"
                        }

                        var el="<div class=\"row\">\n" +
                            "            <div class=\"col-md-2\"></div>\n" +
                            "            <div class=\"col-md-8\" style=\"border-bottom-style: solid;border-bottom-color: #5cb85c\"></div>\n" +
                            "        </div>\n" +
                            "        <div class=\"row\">\n" +
                            "            <div class=\"col-md-2\"></div>\n" +
                            "            <div class=\"col-md-4\"><span id='productId' value='"+productId+"'>商品ID"+productId+"</span></div>\n" +
                            "            <div class=\"col-md-2\">状态："+status+"</div>\n" +
                            "        </div>\n" +
                            "        <div class=\"row\">\n" +
                            "            <div class=\"col-md-2\"></div>\n" +
                            "            <div class=\"col-md-8\" style=\"border-bottom-style: solid;border-bottom-color: #5cb85c\"></div>\n" +
                            "        </div>\n" +
                            "        <div class=\"row\">\n" +
                            "            <div class=\"col-md-2\"></div>\n" +
                            "            <div class=\"col-md-3\"><img class='img-thumbnail' src='"+img_url+"'/></div>" +
                            "            <div class=\"col-md-4\">"+subtitle+"</div>\n" +
                            "        </div>\n" ;
                        var op_div= "        <div class=\"row\">\n" +
                            "            <div class=\"col-md-4\"></div>\n" +
                            "            <div class=\"col-md-3\">\n" +
                            "\n" +
                            "                <button id='"+btn_op_id+"' class=\"btn btn-primary btn_op_name\">"+btn_op_name+"</button>\n" +
                            "            </div>\n" +
                            "            <div class=\"col-md-3\">\n" +
                            "                <button id='"+btn_edit_id+"' class=\"btn btn-info btn_edit\">"+btn_op_name_edit+"</button>\n" +
                            "            </div>\n" +
                            "            <div class=\"col-md-2\"></div>\n" +
                            "        </div>";

                        $("#div_list").append(el).append(op_div);
                    }
                }
            }
        })
        $("body").on("click",".btn_op_name",function (data) {
            var id= $(".btn_op_name").attr("id");

            if(id=="set_off_shelf")//下架
            {
                $.ajax({
                    url:"/back/product/set_sale_status.do",
                    type:"post",
                    data:{
                        productId:$("#productId").attr("value"),
                        status:2
                    },
                    success :function(data) {
                        if(data.success)
                        {
                            alert("产品已下架");
                            window.location.reload();
                        }
                        else
                        {
                            alert("error:"+data.msg);
                        }
                    }
                })
            }
            else if(id=="up_pass")//改密

            {

            }
            else if(id=="set_on_sale") //上架
            {
                $.ajax({
                    url:"/back/product/set_sale_status.do",
                    type:"post",
                    data:{
                        productId:$("#productId").attr("value"),
                        status:1
                    },
                    success :function(data) {
                        if(data.success)
                        {
                            alert("产品已上架");
                            window.location.reload();
                        }
                        else
                        {
                            alert("error:"+data.msg);
                        }
                    }
                })
            }
            else if(id=="edit")//编辑
            {

            }
            else if(id=="cancel_order")//取消订单
            {

            }else if(id=="send_tip")//发送提示
            {

            }
            else{
                alert("error");
            }

        })












    });

</script>
</body>
</html>
