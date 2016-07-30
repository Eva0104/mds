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

<<<<<<< HEAD
<div class="navbar navbar-static-top">
    <div class="navbar-inner">
        <a class="brand" href="#">MDS</a>
        <ul class="nav">
            <li><a href="home.html"><i class="fa fa-home"></i> 首页</a></li>
            <li><a href="patient-list.html"><i class="fa fa-building"></i> 病人档案</a></li>
            <li><a href="#"><i class="fa fa-stethoscope"></i>  就诊记录</a></li>
            <li><a href="#"><i class="fa fa-bell-o"></i> 复诊提醒</a></li>
            <li><a href="#"><i class="fa fa-bar-chart-o"></i> 数据统计</a></li>
            <li class="dropdown active">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" ><i class="fa fa-cogs"></i> 系统设置 <b class="caret"></b></a>
                <ul class="dropdown-menu">
                    <li><a href=""><i class="fa fa-sitemap"></i> 科室设置</a></li>
                    <li><a href=""><i class="fa fa-medkit"></i> 病种设置</a></li>
                    <li><a href=""><i class="fa fa-bars"></i> 医保类型设置</a></li>
                    <li><a href=""><i class="fa fa-child"></i> 患者状态设置</a></li>
                    <li class="divider"></li>
                    <li><a href="/admin/add"><i class="fa fa-user-md"></i> 账号设置</a></li>
                </ul>
            </li>
        </ul>
        <ul class="nav pull-right">
            <li class="divider-vertical"></li>
            <li><a href="#"><i class="fa fa-cog"></i> 个人设置</a></li>
        </ul>
    </div>
</div>
=======
<jsp:include page="../head.jsp"/>
>>>>>>> 4bbca624d6543b41901b15f0ad4730bdbd076999
<div class="container-fluid">
    <div class="row-fluid">
        <div class="span12">
            <div class="box">
                <div class="box-header">
                    <span class="title"><i class="fa fa-sitemap"></i> 科室列表</span>
                    <ul class="unstyled inline pull-right">
                        <li><a href="/dept/new"><i class="fa fa-plus"></i> 新建</a></li>
                    </ul>
                </div>
                <div class="box-body">
                    <table class="table">
                        <thead>
                        <tr>
                            <th width="200">科室名称</th>
                            <th width="200">负责人</th>
                            <th>#</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${deptList}" var="dept">
                            <tr>
                                <th>${dept.deptname}</th>
                                <th>${dept.deptperson}</th>
                                <th>
                                    <a href="/dept/${dept.id}/edit">修改</a>
                                    <a href="javaScript:;" class="delBtn" data="${dept.id}">删除</a>
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

<script>
    $(function(){

        $(document).delegate(".delBtn","click",function(){
            var id = $(this).attr("data");
            if(confirm("确认删除吗？")){
                $.get("/dept/"+id+"/del/").done(function(data){
                    if(data == "success"){
                        window.location.reload();
                    }
                }).fail(function(){
                    alert("服务器异常!")
                })
            }
        });




    })

</script>

</body>
</html>
