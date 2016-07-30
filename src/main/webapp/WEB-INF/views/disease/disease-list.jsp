<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" href="http://cdn.staticfile.org/twitter-bootstrap/2.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="http://cdn.staticfile.org/font-awesome/4.1.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="http://cdn.staticfile.org/select2/3.4.8/select2.css">
    <link rel="stylesheet" href="http://cdn.staticfile.org/select2/3.4.8/select2-bootstrap.css">
    <link rel="stylesheet" href="/static/css/style.css">
</head>
<body>
<jsp:include page="../head.jsp"/>
<div class="container-fluid">
    <div class="row-fluid">
        <div class="span12">

            <div class="box">
                <div class="box-header">
                    <span class="title"><i class="fa fa-search"></i> 搜索</span>
                </div>
                <div class="box-body search-box">
                    <form action="" class="form-search">
                        <input type="text" placeholder="疾病名称" name="q_s_like_diseasename" value="${q_s_like_diseasename}">
                        <select id="ks" name="q_i_eq_dept.id">
                            <option value="">请选择科室</option>
                            <c:forEach items="${deptList}" var="dept">
                                <option value="${dept.id}" ${requestScope['q_i_eq_dept.id'] == dept.id ? 'selected' : ''}>${dept.deptname}</option>
                            </c:forEach>
                        </select>
                        <button class="button button-pill button-flat-primary"><i class="fa fa-search"></i> 搜索</button>
                    </form>

                </div>
            </div>


            <div class="box">
                <div class="box-header">
                    <span class="title"><i class="fa fa-medkit"></i> 病种列表</span>
                    <ul class="unstyled inline pull-right">
                        <li><a href="/dis/new"><i class="fa fa-plus"></i> 新建</a></li>
                    </ul>
                </div>
                <div class="box-body">
                    <table class="table">
                        <thead>
                        <tr>
                            <th width="200">疾病名称</th>
                            <th width="200">所属科室</th>
                            <th>#</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${page.items}" var="dis">
                            <tr>
                                <th>${dis.diseasename}</th>
                                <th>${dis.dept.deptname}</th>
                                <th>
                                    <a href="/dis/${dis.id}/edit">修改</a>
                                    <a href="javaScript:;" class="delDis" data="${dis.id}">删除</a>
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
<script src="http://cdn.staticfile.org/select2/3.4.8/select2.min.js"></script>
<script src="/static/plugins/validate/jquery.validate.js"></script>
<script>
    $(function(){
        $("#ks").select2({
            placeholder: "请选择科室",
            width:'200px'
        });

        $(document).delegate(".delDis","click",function(){
            var id = $(this).attr("data");
            if(confirm("确认删除吗？")){
                $.get("/dis/"+id+"/del/").done(function(data){
                    if(data == "success"){
                        window.location.reload();
                    }
                }).fail(function(){
                    alert("服务器异常!")
                })
            }
        });


    });
</script>


</body>
</html>