<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/3/2
  Time: 14:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册</title>
    <script src="js/jquery-3.3.1.min.js"></script>
</head>
<body>
    <div id="div_register">
        <a id="tip"></a>
        <input id="username" placeholder="用户名" type="text" >
        <input id="password" placeholder="密码" type="password" >
        <input id="email" placeholder="邮箱" type="email" >
        <input id="phone" placeholder="电话" type="tel" >
        <input id="question" placeholder="问题" type="text" >
        <input id="answer" placeholder="答案" type="text" >
        <input id="doRegister" type="button" value="注册">
    </div>
    <script >
        $(document).ready(function () {
            $("#doRegister").click(function () {
                var register_info={
                    username:$("#username").val(),
                    password:$("#password").val(),
                    email:$("#email").val(),
                    phone:$("#phone").val(),
                    question:$("#question").val(),
                    answer:$("#answer").val(),
                };
                if(register_info.username=="")
                {
                    $("#tip").text("用户名不能为空");
                }
                else if(register_info.password=="")
                {
                    $("#tip").text("密码不能为空");
                }
                else if(register_info.question=="")
                {
                    $("#tip").text("问题不能为空");
                }
                else if(register_info.answer=="")
                {
                    $("#tip").text("答案不能为空");
                }
                else{
                    $.ajax({
                        url:"/user/register.do",
                        type:"post",
                        async:false,
                        data:register_info,
                        success:function (data) {
                            console.log("data:"+JSON.stringify(data));
                            if(data.success)
                            {
                                $(location).prop('href', 'result.jsp?_ecit_type=register_success&_ecit_result=success');

                            }
                            else
                            {
                                //alert("error:"+JSON.stringify(data));
                                $("#tip").text(data.msg);
                            }
                        },
                        error:function (data) {
                            //alert("error");
                            $("#tip").text(data.msg);
                        }
                    });
                }


            });
        });

    </script>
</body>
</html>
