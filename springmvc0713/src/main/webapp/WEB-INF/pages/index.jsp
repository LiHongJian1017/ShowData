<%--
  Created by IntelliJ IDEA.
  User: LI
  Date: 2018/7/23
  Time: 19:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script src="http://localhost:8080/springmvc0713/js/echarts.min.js"></script>
    <script src="http://localhost:8080/springmvc0713/js/jquery-3.2.1.min.js"></script>
    <style type="text/css">
        input {
            width: 200px;
            padding:8px;
            background-color: #428bca;
            border-color: #357ebd;
            color: #fff;
            -moz-border-radius: 10px;
            -webkit-border-radius: 10px;
            border-radius: 10px; /* future proofing */
            -khtml-border-radius: 10px; /* for old Konqueror browsers */
            text-align: center;
            vertical-align: middle;
            border: 1px solid transparent;
            font-weight: 900;
            font-size:125%
        }
    </style>
    <title>Title</title>
</head>
<body>
<input type="button" value="视频文章排行"
              onclick="javascrtpt:window.location.href='http://localhost:8080/springmvc0713/videoandarticle.do'"/>
<input type="button" value="地区排行"
       onclick="javascrtpt:window.location.href='http://localhost:8080/springmvc0713/city.do'"/>
<input type="button" value="流量排行"
       onclick="javascrtpt:window.location.href='http://localhost:8080/springmvc0713/traffic.do'"/>
</body>
</html>
