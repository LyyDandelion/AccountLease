<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/3/2
  Time: 14:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录</title>
    <script src="js/jquery-3.3.1.min.js"></script>
</head>
<body>
        <div id="div_login">
            <a id="tip"></a>
            <input type="text" id="username" placeholder="用户名"/>
            <input type="password" id="password"  placeholder="密码"/>
            <input type="button" id="doLogin"  value="登录">
        </div>

        <a href="reset_password.jsp">忘记密码</a>
        <a href="register.jsp">免费注册</a>
        <script>
            $(document).ready(function () {

                $("#doLogin").click(function () {
                    var username=$("#username").val();
                    var password=$("#password").val();
                    var loginInfo={
                        username:username,
                        password:password
                    }
                    $.ajax({
                        url:"/user/login.do",
                        type:"post",
                        async:false,
                        data:loginInfo,
                        success:function (data) {
                            if(data.success)
                            {
                                localStorage.setItem("username",username);
                                $(location).prop('href', 'index.jsp');
                            }
                            else
                            {
                                $("#tip").text(data.msg);
                            }
                        },
                        error:function (data) {
                            alert("error"+JSON.stringify(data));
                        }
                    });
                })

            });

        </script>


</body>
</html>

