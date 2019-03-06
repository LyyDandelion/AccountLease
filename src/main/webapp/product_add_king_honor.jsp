<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/3/5
  Time: 15:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>王者荣耀</title>

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
            <div class="col-md-2">

            </div>
            <div class="col-md-6">
                <div class="dropdown">
                    <button id="btn_sys" class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                        系统
                        <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                        <li><a id="android_qq" href="#">安卓QQ</a></li>
                        <li><a id="ios_qq" href="#">苹果QQ</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-2">

            </div>

        </div>
        <div class="row">
            <div class="col-md-2">

            </div>
            <div class="col-md-6">

                <form id="formData">
                    图片：<input type="file" name="upload_file" id="main_img"/>
                </form>
            </div>
        </div>
        <div class="row">
            <div class="col-md-2">

            </div>
            <div class="col-md-6">
                标题：<input type="text" id="name"/>

            </div>
        </div>
        <div class="row">
            <div class="col-md-2">

            </div>
            <div class="col-md-6">
                价格：<input type="number" id="price" >

            </div>
        </div>
        <div class="row">
            <div class="col-md-2">

            </div>
            <div class="col-md-6">
                账号：<input type="text" id="account" >

            </div>
        </div>
        <div class="row">
            <div class="col-md-2">

            </div>
            <div class="col-md-6">
                密码：<input type="text" id="password" >

            </div>
        </div>
        <div class="row">
            <div class="col-md-2">

            </div>
            <div class="col-md-6">
                详细：<input type="text" id="detail" >

            </div>
        </div>
        <div class="row">
            <div class="col-md-2">

            </div>
            <div class="col-md-6">
                <button id="btn_ok" type="button" class="btn btn-primary">确定</button>

            </div>
        </div>
        <script>
            $(document).ready(function () {
                var productId = getUrlParam("productId");
                if (productId != null)
                {
                    $.ajax({
                        url:"/back/product/detail.do",
                        type:"get",
                        data:{
                            productId:productId
                        },
                        success:function (data) {
                            log(data);
                            if(data.success)
                            {
                                var info=data.data;
                                //todo 存在值，则进行更新产品操作
                                $("#name").val(info.name);
                                $("#price").val(info.price);
                                $("#account").val(info.account);
                                $("#password").val(info.password);
                                $("#detail").val(info.detail);
                                $("#btn_sys").val("系统ID："+info.categoryId)
                            }
                        }

                    })
                }
                $("#android_qq").click(function () {
                    $("#btn_sys").text($("#android_qq").text()).attr("code","ANDROID_QQ");
                })
                $("#ios_qq").click(function () {
                    $("#btn_sys").text($("#ios_qq").text()).attr("code","IOS_QQ");
                })

                $("#btn_ok").click(function () {
                    var formData=new FormData($("#formData")[0])
                    $.ajax({
                        url:"/back/product/upload.do",
                        type:"post",
                        // contentType:"multipart/form-data",
                        data:formData,
                        async:false,
                        contentType: false,
                        processData: false,
                        success:function(data) {
                            log(data);
                            if(data.success)
                                $("#main_img").attr("mainImage",data.data.uri);
                        }

                    })

                    //获取分类id
                    $.ajax({
                        url:"/back/category/get_category_info.do",
                        type:"get",
                        async:false,
                        data:{
                            code:$("#btn_sys").attr("code")
                        },
                        success:function(data){
                            log(data);
                            if(data.success)
                                $("#btn_sys").attr("categoryId",data.data.categoryId);
                        }
                    })
                    var status;
                    if(productId!=null)
                    {
                        status=2;
                    }
                    else
                    {
                        status=1;
                    }

                    var product_info={
                        productId:productId,
                        categoryId:$("#btn_sys").attr("categoryId"),
                        name:$("#name").val(),
                        mainImage:$("#main_img").attr("mainImage"),
                        detail:$("#detail").val(),
                        account:$("#account").val(),
                        password:$("#password").val(),
                        price:$("#price").val(),
                        status:status
                    }
                    $.ajax({
                        url:"/back/product/save.do",
                        type:"post",
                        data:product_info,
                        async:false,
                        success:function(data)
                        {
                            if(data.success)
                            {
                                alert(data.msg);
                                $(location).prop("href","business_center.jsp");
                            }
                        }
                    });

                });
            });

        </script>
    </div>
</body>
</html>
