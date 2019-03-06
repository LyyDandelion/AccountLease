<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/3/2
  Time: 21:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>个人中心</title>
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
        </div>
        <input type="button" id="updateUserInfo" value="编辑"></input>
    </div>
    <script>
        $(document).ready(function () {
           var username=sessionStorage.getItem("username");
           if(username!=null)
           {
               $.ajax({
                   url:"/user/get_user_info.do",
                   type:"post",
                   success:function (data) {
                        debug();
                       console.log("data"+JSON.stringify(data))
                       if(data.success)
                       {
                           var info=data.data;
                           var br="</br>";
                           $("#user_info").append("用户名："+info.username+br+
                           "电话&nbsp："+info.phone+br+"邮箱&nbsp："+info.email
                           +br+"问题："+info.question+br+"答案："+info.answer
                           );

                       }
                       else
                       {
                           alert("error:"+JSON.stringify(data));
                       }
                   }
               })
           }
           else
           {
               alert("error");
           }

           $("#updateUserInfo").click(function () {
               $(location).prop("href","user_info_update.jsp");
           });
        });
    </script>
</body>
</html>
