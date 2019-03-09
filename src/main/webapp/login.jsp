<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>登录</title>
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


    <script src="js/jquery-3.3.1.min.js"></script>
</head>
<body class="sign-in-up">

<section>
    <div id="page-wrapper" class="sign-in-wrapper">
        <div class="graphs">
            <div class="sign-in-form">
                <div class="sign-in-form-top">
                    <p><span>登录到</span> <a href="index.jsp">系统</a></p>
                </div>
                <div class="signin">
                    <div class="signin-rit">
								<span class="checkbox1">
									 <label class="checkbox"><input type="checkbox" name="checkbox" checked="">忘记密码 ?</label>
								</span>
                        <p><a href="reset_password.jsp">点击这里</a> </p>
                        <div id="tip" class="clearfix"> </div>
                    </div>
                    <form>
                        <div class="log-input">
                            <div class="log-input-left">
                                <input type="text" class="user" id="username" value="用户名" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'username:';}"/>
                            </div>
                            <span class="checkbox2">
									 <label class="checkbox"><input type="checkbox" name="checkbox" checked=""><i> </i></label>
								</span>
                            <div class="clearfix"> </div>
                        </div>
                        <div class="log-input">
                            <div class="log-input-left">
                                <input type="password" class="lock" id="password" value="password" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'password:';}"/>
                            </div>
                            <span class="checkbox2">
									 <label class="checkbox"><input type="checkbox" name="checkbox" checked=""><i> </i></label>
								</span>
                            <div class="clearfix"> </div>
                        </div>
                        <input style="width: 89%" class="btn btn-primary btn-lg" type="button" id="doLogin" value="登录">
                    </form>
                </div>
                <div class="new_people">
                    <h4>新用户</h4>
                    <p></p>
                    <a href="register.jsp">免费注册</a>
                </div>
            </div>
        </div>
    </div>
    <!--footer section start-->
    <footer>
        <p>Copyright &copy; 2019.毕业设计.ecit_lyy</p>
    </footer>
    <!--footer section end-->
</section>


<script src="js/jquery.nicescroll.js"></script>
<script src="js/scripts.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="js/bootstrap.min.js"></script>
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
                                sessionStorage.setItem("username",username);
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



