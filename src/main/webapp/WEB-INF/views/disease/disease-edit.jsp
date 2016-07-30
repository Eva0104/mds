<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
<jsp:include page="../head.jsp"/>
<div class="container-fluid">
    <div class="row-fluid">
        <div class="span12">

            <div class="box">
                <div class="box-header">
            <span class="title">
              <i class="fa fa-plus"></i>
              <a href="dept-list.html"> 病种列表</a>  /  修改病种
            </span>
                </div>
                <div class="box-body form">
                    <form action="" method="post">
                        <label>病种名称</label>
                        <input type="text" name="diseasename" value="${disease.diseasename}">
                        <label>所属科室</label>
                        <select name="dept.id">
                            <c:forEach items="${deptList}" var="dept">
                                <option value="${dept.id}" ${dept.id == disease.dept.id ? 'selected':''}>${dept.deptname}</option>
                            </c:forEach>
                        </select>
                        <div class="form-actions">
                            <button class="button button-flat-action button-pill">保存</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>



<script src="http://cdn.staticfile.org/jquery/1.11.1/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/twitter-bootstrap/3.0.0/js/bootstrap.min.js"></script>

</body>
</html>

