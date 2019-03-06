<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/3/2
  Time: 21:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改个人信息</title>
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/app.js"></script>
    <link rel="stylesheet" type="text/css" href="css/nav-side.css" />
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
    <div id="user_info">
        <a >用户名:</a><a id="username"></a></br>
        <a>电话：</a><input type="text" id="phone"/></br>
        <a>邮箱：</a><input type="text" id="email"/></br>
        <a>问题：</a><input type="text" id="question"/></br>
        <a>答案：</a><input type="text" id="answer"/></br>
        <input type="button" value="提交" id="submit"></br>
    </div>
</div>
    <script>
        $(document).ready(function () {

           $("#username").text(localStorage.getItem("username"));

            $.ajax({
                url:"/user/get_user_info.do",
                type:"post",
                success:function (data) {
                    console.log("data"+JSON.stringify(data))
                    if(data.success)
                    {
                        var info=data.data;
                        $("#phone").val(info.phone);
                        $("#email").val(info.email);
                        $("#question").val(info.question);
                        $("#answer").val(info.answer);
                    }
                    else
                    {
                        alert("error:"+JSON.stringify(data));
                    }
                }
            })

           $("#submit").click(function () {
               var update_info={
                   phone:$("#phone").val(),
                   email:$("#email").val(),
                   question:$("#question").val(),
                   answer:$("#answer").val()
               }
               $.ajax({
                    url:"/user/update_information.do",
                    type:"post",
                    data:update_info,
                    success:function (data) {
                        console.log("data:"+JSON.stringify(data));
                        alert(data.msg);
                        $(location).prop("href","user_center.jsp");
                    }
               });
           }); 
        });
    </script>
</body>
</html>
