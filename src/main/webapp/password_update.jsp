<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/3/2
  Time: 22:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>更新密码</title>
    <script src="js/app.js"></script>
    <script src="js/jquery-3.3.1.min.js"></script>
    <link rel="stylesheet" type="text/css" href="css/nav-side.css" />
</head>
<body>
    <div class="left-on">
        <ul>
            <li><a href="user_center.jsp">个人信息</a></li>
            <li><a href="buyer_center.jsp">我是买家</a></li>
            <li><a href="business_center.jsp">我是商家</a></li>
            <li><a href="password_update.jsp">修改密码</a></li>
        </ul>
    </div>
    <div class="right-on">
        <div id="password_info">
            <a id="tip"></a></br>
            <a>原密码：</a><input type="password" id="passwordOld"/></br>
            <a>新密码：</a><input type="password" id="passwordNew"/></br>
            <a>确认密码：</a><input type="password" id="passwordConfirm"/></br>
            <input type="button" id="doUpdate" value="确认修改">
        </div>
    </div>
    <script>
        $(document).ready(function () {
            $("#doUpdate").click(function () {
                var pass_info={
                    passwordOld:$("#passwordOld").val(),
                    passwordNew:$("#passwordNew").val(),
                    passwordConfirm:$("#passwordConfirm").val()
                }
                if(pass_info.passwordNew===pass_info.passwordConfirm)
                {
                    $.ajax({
                       url:"/user/reset_password.do",
                       type:"post",
                       data:pass_info,
                       success:function (data) {
                           log(data);
                           if(data.success)
                           {
                                alert(data.msg);
                                $(location).prop("href","user_center.jsp");

                           }
                           else{
                               $("#tip").text(data.msg);
                           }

                       }
                    });
                }
                else
                {
                    $("#tip").text("两次密码不同");
                }
            });
        })
    </script>
</body>
</html>
