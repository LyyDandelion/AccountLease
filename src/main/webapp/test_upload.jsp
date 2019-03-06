<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/3/4
  Time: 19:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <form action="/back/product/upload.do" method="post" enctype="multipart/form-data">
        <input type="file" name="upload_file">
        <input type="submit" value="up">
    </form>
</body>
</html>
