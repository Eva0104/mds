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
                    <span class="title"><i class="fa fa-bars"></i> 医保类型列表</span>
                    <ul class="unstyled inline pull-right">
                        <li><a href="/surance/newadd"><i class="fa fa-plus"></i> 新建</a></li>
                    </ul>
                </div>
                <div class="box-body">
                    <table class="table">
                        <thead>
                        <tr>
                            <th width="200">医保类型名称</th>
                            <th>#</th>
                        </tr>
                        </thead>
                        <tbody>

                        <c:forEach items="${suranceList}" var="surance">
                            <tr>
                                <th>${surance.hctname}</th>
                                <th>
                                    <a href='javascript:;' rel="${surance.id}" class="editLink">修改</a>
                                    <a href='javascript:;' rel="${surance.id}" getUserName="${surance.hctname} "class="delLink">删除</a>
                                </th>
                            </tr>

                        </c:forEach>


                        </tbody>
                    </table>
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
                                <label>医保类型</label>
                                <input type="text" name="hctname" id="hctname" class="form-control">

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


    <script src="http://cdn.staticfile.org/jquery/1.11.1/jquery.min.js"></script>
    <script src="http://cdn.staticfile.org/twitter-bootstrap/3.0.0/js/bootstrap.min.js"></script>
    <script src="/static/plugins/validate/jquery.validate.js"></script>
    <script>
        $(function () {
            $("#editForm").validate({
                errorElement: "span",
                errorClass: "text-danger",
                rules: {

                    hctname: {
                        required: true,

                        remote: "/surance/validate/hctname"

                    },

                },
                messages: {

                    hctname: {
                        required: "请输入医保类型",
                        remote: "该类型已存在"
                    },


                },
                submitHandler: function (form) {
                    $.post("/surance/edit/new", $(form).serialize()).done(function (result) {
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

                $.get("/surance/edit/" + id + ".json").done(function (result) {
                    console.log(id)

                    if (result.state == "success") {

                        $("#editId").val(result.data.id),
                                $("#hctname").val(result.data.hctname),


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
                    $.get("/surance/del/" + id).done(function (data) {
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

        })


    </script>

</body>
</html>
