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

<jsp:include page="../head.jsp"/>
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
                                    <a href='javascript:;' rel="${log.id}" class="editLink">修改</a>
                                    <c:choose>
                                        <c:when test="${log.state==true}">
                                            <a href='javascript:;' getUserName="${log.realname}" rel="${log.id}" style="color:red" class="diableLink">禁用</a>
                                        </c:when>

                                        <c:when test="${log.state==false}">
                                            <a href='javascript:;' getUserName="${log.realname}" rel="${log.id}" style="color:green;" class="ableLink">激活</a>
                                        </c:when>
                                    </c:choose>
                                    <%--<a href='javascript:;' rel="${log.id}" class="delLink">禁用</a>--%>
                                        <%--<c:when test="${log.rolename}"></c:when>--%>
                                    <a href='javascript:;' rel="${log.id}" getUserName="${log.realname} "class="delLink">删除</a>
                                </th>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>


        </div>

    </div>


    <div class="modal fade" id="editCustomerModal">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="editCustomer">编辑客户资料</h4>
                </div>
                <div class="modal-body">
                    <form id="editForm">

                        <input type="hidden" name="id" id="editId">

                        <div class="form-group">
                            <label>账户名称</label>
                            <input type="text" name="username" id="editName" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>员工姓名</label>
                            <input type="text" name="realname" id="editRealname" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>电话</label>
                            <input type="text" name="telphone" id="editTelphone" class="form-control">

                        </div>

                        <%--<div class="form-group" id="userList">--%>
                        <%--<label>所属公司</label>--%>
                        <%--<select name="userid" class="form-control">--%>
                        <%--<option value=""></option>--%>
                        <%--<c:forEach items="${userList}" var="user">--%>
                        <%--<option value="${user.id}">${user.id}--${user.name}</option>--%>
                        <%--</c:forEach>--%>
                        <%--</select>--%>
                        <%--</div>--%>

                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-primary" id="editBtn">保存</button>
                </div>
            </div>
        </div>
    </div>
</div>


<%--<script src="http://cdn.staticfile.org/jquery/1.11.1/jquery.min.js"></script>--%>
<%--<script src="/static/js/bootstrap.min.js"></script>--%>
<%--<script src="http://cdn.staticfile.org/twitter-bootstrap/3.0.0/js/bootstrap.min.js"></script>--%>
<%--<script src="/static/plugins/validate/jquery.validate.js"></script>--%>
<%--&lt;%&ndash;<script src="http://cdn.staticfile.org/jquery/1.11.1/jquery.min.js"></script>&ndash;%&gt;--%>
<%--<script src="http://cdn.staticfile.org/twitter-bootstrap/3.0.0/js/bootstrap.min.js"></script>--%>

<script src="/static/js/jquery-1.11.3.min.js"></script>
<script src="/static/js/bootstrap.min.js"></script>
<script src="/static/plugins/validate/jquery.validate.min.js"></script>
<script src="/static/plugins/validate/jquery.validate.js"></script>
<script>


    $(function () {
        //修改数据
        $("#editForm").validate({
            errorElement: "span",
            errorClass: "text-danger",
            rules: {

                username: {
                    required: true,
                    rangelength: [3, 20]
                },
                realname: {
                    required: true,
                    rangelength: [2, 10],

                },
                telphone: {
                    required: true,
                    rangelength: [11, 11],
                    number: true

                }
            },
            messages: {

                username: {
                    required: "请输入账户名",
                    rangelength: "请输入不少于3位的账户"
                },
                realname: {
                    required: "请输入真实姓名",
                    rangelength: "真实姓名不少于2位——10位",

                },
                telphone: {
                    required: "请输入电话",
                    rangelength: "请输入11位电话",
                    number: "请输入数字"

                }
            },
            submitHandler: function (form) {
                $.post("/admin/edit/new", $(form).serialize()).done(function (result) {
                    if (result.state == "success") {
                        $("#editCustomerModal").modal("hide");

                        history.go();
                        $("#messageDiv").append('<div class="alert alert-success alert-dismissible" role="alert"> ' +
                                '<button type="button" class="close" data-dismiss="alert" aria-label="Close">' +
                                '<span aria-hidden="true">&times;</span></button> ' +
                                '<strong>' + result.data.username + '</strong> 修改成功</div>')

                    } else {
                        alert(result.message);
                    }

                }).fail(function () {
                            alert("连接服务器异常")
                        }
                )

            }
        })
        $(document).delegate(".editLink", "click", function (row) {
            var id = $(this).attr("rel");
//            var username = $(this).attr("getUserName");

            $.get("/admin/edit/" + id + ".json").done(function (result) {
                console.log(id)

                if (result.state == "success") {

                    $("#editId").val(result.data.id),
                            $("#editName").val(result.data.username),
                            $("#editRealname").val(result.data.realname),
                            $("#editTelphone").val(result.data.telphone),


                            $("#editCustomerModal").modal({
                                show: true,
                                backdrop: 'static',
                                keyword: false
                            })

                } else {
                    alert(result.data.message);
                }


            }).fail(function () {
                alert("连接服务器异常");
            })

        })
        $("#editBtn").click(function () {
            $("#editForm").submit();

        })
        //删除客户
        $(document).delegate(".delLink", "click", function (row) {

            var id = $(this).attr("rel");
            var username = $(this).attr("getUserName")
            console.log("111111111111")
            if (confirm("确认账号：【" + username + "】删除吗，会删除相关数据")) {
                $.get("/admin/del/" + id).done(function (data) {
                    if (data == "success") {


                        history.go();

                        $("#messageDiv").append('<div class="alert alert-success alert-dismissible" role="alert"> ' +
                                '<button type="button" class="close" data-dismiss="alert" aria-label="Close">' +
                                '<span aria-hidden="true">&times;</span></button> ' +
                                '<strong>账户：【' + username + '】</strong> 删除成功</div>')

                    }

                }).fail(function () {
                    alert("连接服务器异常")
                })
            }

        })
        //禁用客户
        $(document).delegate(".diableLink", "click", function (row) {

            var id = $(this).attr("rel");
            var username = $(this).attr("getUserName");
            console.log("11111111111111");
            if (confirm("确认账号：【" + username + "】禁用吗，会删除相关数据")) {
                $.get("/admin/diable/" + id).done(function (data) {
                    if (data == "success") {


                        history.go();

                        $("#messageDiv").append('<div class="alert alert-success alert-dismissible" role="alert"> ' +
                                '<button type="button" class="close" data-dismiss="alert" aria-label="Close">' +
                                '<span aria-hidden="true">&times;</span></button> ' +
                                '<strong>账户：【' + username + '】</strong> 禁用成功</div>')

                    }

                }).fail(function () {
                    alert("连接服务器异常")
                })
            }

        })
        $(document).delegate(".ableLink", "click", function (row) {

            var id = $(this).attr("rel");
            var username = $(this).attr("getUserName");
            console.log("11111111111111");
            if (confirm("确认账号：【" + username + "】激活吗，会删除相关数据")) {
                $.get("/admin/able/" + id).done(function (data) {
                    if (data == "success") {


                        history.go();

                        $("#messageDiv").append('<div class="alert alert-success alert-dismissible" role="alert"> ' +
                                '<button type="button" class="close" data-dismiss="alert" aria-label="Close">' +
                                '<span aria-hidden="true">&times;</span></button> ' +
                                '<strong>账户：【' + username + '】</strong>激活成功</div>')

                    }

                }).fail(function () {
                    alert("连接服务器异常")
                })
            }

        })
    })
</script>

</body>
</html>
