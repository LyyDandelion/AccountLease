<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/3/2
  Time: 15:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>找回密码</title>
    <script src="js/jquery-3.3.1.min.js"></script>
</head>
<body>
    <div id="div_username" >
        <a id="error"></a>
        <input type="text" id="username" name="username" placeholder="请输入用户名"/>
        <input type="button" id="next" value="下一步"/>
    </div>
    <div id="div_answer">
        <a id="answer_error"></a>
        <a id="tip_question"></a>
        <input type="text" id="answer" placeholder="请输入答案"/>
        <input type="button" id="next_again" value="下一步"/>
    </div>
    <div id="div_new_pass">
        <input type="text" id="passwordNew" placeholder="新密码"/>
        <input type="button" value="提交" id="submit">
    </div>

    <style type="text/css">
        #div_answer{
            display: none;
        }
        #div_new_pass{
            display: none;
        }
    </style>
<script>
    $(document).ready(function () {

        $("#next").click(function () {
            var username=$("#username").val();
            console.log("username:"+username)
            var data={
                username:username
            }
            $.ajax({
                url:"/user/forget_get_question.do",
                data:data,
                type:"POST",
                async:false,
                success:function (data) {
                    console.log("data:"+JSON.stringify(data));
                    if(data.success)
                    {
                        $("#div_username").hide();
                        $("#div_answer").show();
                        var question=data.msg;
                        $("#tip_question").text("你的密码提示问题是："+question);
                        $("#next_again").click(function () {
                            var answer=$("#answer").val();
                            $.ajax({
                                url:"/user/forget_check_answer.do",
                                type:"POST",
                                async:false,
                                data:{
                                    "question":question,
                                    "username":username,
                                    "answer":answer
                                },
                                success:function (data) {
                                    if(data.success)
                                    {
                                        $("#div_answer").hide();
                                        $("#div_new_pass").show();
                                        var forgetToken=data.msg;
                                        $("#submit").click(function () {
                                            var passwordNew=$("#passwordNew").val();
                                            $.ajax({
                                                url:"/user/forget_reset_password.do",
                                                type:"POST",
                                                async:false,
                                                data:{
                                                    "passwordNew":passwordNew,
                                                    "username":username,
                                                    "forgetToken":forgetToken
                                                },
                                                success:function (data) {
                                                    if(data.success)
                                                    {
                                                        $(location).prop('href', 'result.jsp?_ecit_type=reset_pass_success&_ecit_result=success');

                                                    }
                                                    else{
                                                        alert("error:"+JSON.stringify(data));
                                                    }
                                                },
                                                error:function (data) {
                                                    alert("error");
                                                }

                                            })
                                        });

                                    }
                                    else
                                    {
                                        $("#answer_error").text(data.msg)
                                    }
                                },
                                error:function (data) {

                                }
                            });

                        });

                    }
                    else{
                        $("#error").text(data.msg);
                    }
                },
                error:function (data) {
                    alert("error");
                }
            })
        });


    })
</script>


</body>

</html>


