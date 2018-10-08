<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%--<%--%>
    <%--String path = request.getContextPath();--%>
    <%--String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";--%>
<%--%>--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <%--<base href="<%=basePath%>">--%>

    <title>添加用户</title>

    <script type="text/javascript">
        function addUser(){
            var form = document.forms[0];
            form.action = "${pageContext.request.contextPath}/saveTest.do";
            form.method="post";
            form.submit();
        }
    </script>
        <script type="text/javascript">
            function ca(){
                var form = document.forms[0];
                form.action = "${pageContext.request.contextPath}/chaxun.do";
                form.method="post";
                form.submit();
            }
        </script>

</head>

<body>
<%--<h1><%=path%>添加用户<%=basePath%></h1>--%>
<form action="" name="userForm">
    type：<input type="text" id="type" name="type">
    id：<input type="text" id="id" name="id">
    cishu：<input type="text" id="cishu" name="cishu">
    <input type="button" value="添加" onclick="addUser()">
    <input type="button" value="查询" onclick="chaxun()">
</form>
</body>
</html>