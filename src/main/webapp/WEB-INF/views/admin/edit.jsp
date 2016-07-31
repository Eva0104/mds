<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" href="http://cdn.staticfile.org/twitter-bootstrap/2.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="http://cdn.staticfile.org/font-awesome/4.1.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="/static/css/style.css">
</head>
<body>

<jsp:include page="../head.jsp">
    <jsp:param name="admin" value="patient"/>
</jsp:include>
<div class="container-fluid">
    <div class="row-fluid">
        <div class="span12">

            <div class="box">
                <div class="box-header">
                    <span class="title"><i class="fa fa-sitemap"></i> 账号信息列表</span>
                    <%--<ul class="unstyled inline pull-right">--%>
                        <%--<li><a href="/dept/new"><i class="fa fa-plus"></i> 新建</a></li>--%>
                    <%--</ul>--%>
                </div>
                <div class="box-body">
                    <table class="table">
                        <thead>
                        <tr>
                            <th width="200">账户名</th>
                            <th width="200">员工姓名</th>
                            <th width="200">电话</th>
                            <th width="200">最后登录时间</th>
                            <th width="200">最后登录IP</th>
                            <th>#</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${userList}" var="log">
                            <tr>
                                <th>${log.username}</th>
                                <th>${log.realname}</th>

                                <th>${log.telphone}</th>
                                <%--<th><fmt:formatDate value="${log.logintime}" pattern="y-M-d H:m"/></th>--%>
                                <th><fmt:formatDate value="${log.logintime}" pattern="yyyy-MM-dd HH:mm"/></th>
                                <%--<th>${log.logintime}</th>--%>
                                <th>${log.loginip}</th>
                                <th>
                                    <a href="/admin/${log.id}/edit">修改</a>
                                    <a href="/admin/${log.id}/disable">禁用</a>
                                    <a href="/admin/${log.id}/del">删除</a>
                                </th>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>


        </div>

    </div>
</div>



<script src="http://cdn.staticfile.org/jquery/1.11.1/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/twitter-bootstrap/3.0.0/js/bootstrap.min.js"></script>

</body>
</html>
