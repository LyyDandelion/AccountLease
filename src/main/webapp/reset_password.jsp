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
    <script src="js/app.js"></script>
    <link rel="stylesheet" type="text/css" href="css/nav-side.css"/>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"/>
</head>
<body>

        <div  id="div_username" class="div-all"  >
            <div style="margin-bottom: 1%;"  ><span id="error" class="label label-danger" ></span></div>
            <div  style="margin-bottom: 5%"><input type="text" id="username" class="pa-input" placeholder="请输入用户名"/></div>
            <div ><button  id="next"  style="width: 30%;" class="btn btn-danger" >下一步</button></div>
        </div>
        <div  id="div_answer" class="div-all" >
            <div style="margin-bottom: 1%;"><span id="answer_error" class="label label-danger"></span></div>
            <div  style="margin-bottom: 1%"><span id="tip_question" class="label label-info"></span></div>
            <div style="margin-bottom: 5%"><input type="text" id="answer" class="pa-input" placeholder="请输入答案"/></div>
            <div ><button  style="width: 30%;" class="btn btn-danger" id="next_again">下一步</button></div>
        </div>
        <div  id="div_new_pass" class="div-all" >
            <div style="margin-bottom: 5%"><input type="text" class="pa-input" id="passwordNew" placeholder="新密码"/></div>
            <div > <button style="width: 30%;" class="btn btn-success" id="submit">提交</button></div>
        </div>


    <style type="text/css">
        .div-all{
            margin-left: 34%;
            margin-top: 11%;
        }
        .pa-input{
            font-size: 1.5em;border-radius: 5px;
        }

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


