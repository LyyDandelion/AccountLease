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
    <title>商品详情</title>
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/app.js"></script>
    <link rel="stylesheet" type="text/css" href="css/nav-side.css"/>
</head>
<body>
    <div id="detail_img">

    </div>
    <div id="detail_info">

    </div>
    <a id="do_rent">去租它</a>

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
                  $("#detail_info").append(JSON.stringify(data));
                  $("#do_rent").attr("href","build_order.jsp?productId="+data.data.productId);
                },
                error:function (data) {
                    
                }
            })
        });
    </script>

</body>
</html>
