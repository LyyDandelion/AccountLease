<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/3/3
  Time: 16:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>手游中心</title>
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/app.js"></script>
    <link rel="stylesheet" type="text/css" href="css/nav-side.css" />
</head>
<body>
    手游账号
    <div id="game_center" class="game-center">

    </div>
    <style>
        .game-center
        {
            margin-top: 6%;
            margin-left: 10%;
        }

    </style>
    <script>

        $(document).ready(function () {

            $.ajax({
                url:"/back/category/get_category.do",
                type:"get",
                data:{
                    code:"MOBLIE_GAME"
                },
                success:function (data) {
                    log(data);
                    if(data.success) {
                        var info = data.data;
                        for (var i = 0; i < info.length; i++)
                        {
                            var el=$("<a></a>");
                            var br=$("</br>")
                            el.text(info[i].name);
                            var file=info[i].code.toLowerCase()+".jsp";
                            el.attr("href",file);
                            $("#game_center").append(el);
                            $("#game_center").append(br);

                        }
                    }
                }
            })

        });
    </script>
</body>
</html>
