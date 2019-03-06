<%@ page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>首页</title>
        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/app.js"></script>
        <link rel="stylesheet" type="text/css" href="css/nav-side.css" />
    </head>
<body>

    <a id="user_tip"></a>
    <a id="login" href="login.jsp">登录</a>
    <a id="register" href="register.jsp">注册</a>
    <a id="logout" href="#">退出</a>
    <a id="user_center" href="#">我的</a>
    <a id="add_product" href="#">出租我的商品</a>
    <div class="left-on">
        <ul>
            <li><a href="mobile_game_center.jsp">手游</a></li>
            <li><a href="#">端游</a></li>
            <li><a href="#">视频</a></li>
        </ul>
    </div>
    <style type="text/css">
        #logout{
            display: none;
        }
    </style>
    <script>
        $(document).ready(function () {

           var username=localStorage.getItem("username");
            console.log("username",username);
           if(username!=null)
           {
             $("#login").hide();
             $("#register").hide();
             $("#user_tip").text("欢迎！"+username);
             $("#logout").show();
           }
           $("#logout").click(function () {
               $.ajax({
                   url:"/user/logout.do",
                   type:"post",
                   success:function (data) {
                       if(data.success)
                       {
                            localStorage.removeItem("username");
                            $(location).prop("href","index.jsp");
                            // $(location).prop("href","login.jsp");
                       }
                       else
                       {
                            alert("error:"+JSON.stringify(data));
                       }
                   }
               })
           });
           $("#user_center").click(function () {

               if (username == null)
               {
                   $(location).prop("href","login.jsp");
               }
               else{
                   console.log("进入个人中心");
                   $(location).prop("href","user_center.jsp");
               }
           });
            $("#add_product").click(function () {
                if(username==null)
                {
                    $(location).prop("href","login.jsp");
                }
                else
                {
                    console.log("新建商品");
                    $(location).prop("href","product_add.jsp");
                }
            });
        });
        

    </script>

</body>
</html>
