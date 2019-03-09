<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/3/2
  Time: 14:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>Sign Up</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="Easy Admin Panel Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template,
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel='stylesheet' type='text/css' />
    <!-- Custom CSS -->
    <link href="css/style.css" rel='stylesheet' type='text/css' />
    <!-- Graph CSS -->
    <link href="css/font-awesome.css" rel="stylesheet">
    <!-- jQuery -->
    <!-- lined-icons -->
    <link rel="stylesheet" href="css/icon-font.min.css" type='text/css' />
    <!-- //lined-icons -->
    <!-- chart -->
    <script src="js/Chart.js"></script>
    <!-- //chart -->
    <!--animate-->
    <link href="css/animate.css" rel="stylesheet" type="text/css" media="all">
    <script src="js/wow.min.js"></script>
    <script>
        new WOW().init();
    </script>
    <!--//end-animate-->
    <!----webfonts--->
    <link href='http://fonts.googleapis.com/css?family=Cabin:400,400italic,500,500italic,600,600italic,700,700italic' rel='stylesheet' type='text/css'>
    <!---//webfonts--->
    <!-- Meters graphs -->
    <script src="js/jquery-1.10.2.min.js"></script>
    <!-- Placed js at the end of the document so the pages load faster -->

</head>

<body class="sign-in-up">
<section>
    <div id="page-wrapper" class="sign-in-wrapper">
        <div class="graphs">
            <div class="sign-up">
                <h3>Register Here</h3>
                <p class="creating">Having hands on experience in creating innovative designs,I do offer design
                    solutions which harness.</p>
                <h5>Personal Information</h5>
                <div class="sign-u">
                    <div class="sign-up1">
                        <h4>First Name* :</h4>
                    </div>
                    <div class="sign-up2">
                        <form>
                            <input type="text" placeholder=" " required=" "/>
                        </form>
                    </div>
                    <div class="clearfix"> </div>
                </div>
                <div class="sign-u">
                    <div class="sign-up1">
                        <h4>Last Name* :</h4>
                    </div>
                    <div class="sign-up2">
                        <form>
                            <input type="text" placeholder=" " required=" "/>
                        </form>
                    </div>
                    <div class="clearfix"> </div>
                </div>
                <div class="sign-u">
                    <div class="sign-up1">
                        <h4>Email Address* :</h4>
                    </div>
                    <div class="sign-up2">
                        <form>
                            <input type="text" placeholder=" " required=" "/>
                        </form>
                    </div>
                    <div class="clearfix"> </div>
                </div>
                <h6>Login Information</h6>
                <div class="sign-u">
                    <div class="sign-up1">
                        <h4>Password* :</h4>
                    </div>
                    <div class="sign-up2">
                        <form>
                            <input type="password" placeholder=" " required=" "/>
                        </form>
                    </div>
                    <div class="clearfix"> </div>
                </div>
                <div class="sign-u">
                    <div class="sign-up1">
                        <h4>Confirm Password* :</h4>
                    </div>
                    <div class="sign-up2">
                        <form>
                            <input type="password" placeholder=" " required=" "/>
                        </form>
                    </div>
                    <div class="clearfix"> </div>
                </div>
                <div class="sub_home">
                    <div class="sub_home_left">
                        <form>
                            <input type="submit" value="Submit">
                        </form>
                    </div>
                    <div class="sub_home_right">
                        <p>Go Back to <a href="index.html">Home</a></p>
                    </div>
                    <div class="clearfix"> </div>
                </div>
            </div>
        </div>
    </div>
    <!--footer section start-->
    <footer>
        <p>Copyright &copy; 2015.Company name All rights reserved.<a target="_blank" href="http://sc.chinaz.com/moban/">&#x7F51;&#x9875;&#x6A21;&#x677F;</a></p>
    </footer>
    <!--footer section end-->
</section>

<script src="js/jquery.nicescroll.js"></script>
<script src="js/scripts.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="js/bootstrap.min.js"></script>
</body>
</html>

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
