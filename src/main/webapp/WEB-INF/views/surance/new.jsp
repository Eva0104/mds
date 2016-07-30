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
                <div class="container-fluid">
                    <div class="modal" id="editCustomerModal">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                            aria-hidden="true">&times;</span></button>
                                    <h4 class="modal-title" id="editCustomer">添加医保类型</h4>
                                </div>
                                <div class="modal-body">
                                    <form id="editForm">

                                        <input type="hidden" name="id" id="editId">

                                        <%--<div class="form-group" type="diable">--%>
                                            <%--<label>账户名称</label>--%>
                                            <%--<input type="text" name="username" id="editName" class="form-control">--%>
                                        <%--</div>--%>
                                        <%--<div class="form-group">--%>
                                            <%--<label>员工姓名</label>--%>
                                            <%--<input type="text" name="realname" id="editRealname" class="form-control">--%>
                                        <%--</div>--%>
                                        <div class="form-group">
                                            <label>医保名称</label>
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
            </div>


        </div>


    </div>


    <script src="http://cdn.staticfile.org/jquery/1.11.1/jquery.min.js"></script>
    <script src="http://cdn.staticfile.org/twitter-bootstrap/3.0.0/js/bootstrap.min.js"></script>
    <script src="/static/plugins/validate/jquery.validate.min.js"></script>
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
                        remote:"该类型已存在"
                    },

                },
                submitHandler: function (form) {
                    $.post("/surance/add", $(form).serialize()).done(function (result) {
                        if (result.state == "success") {
                            window.location.href = "/surance/list";

//                            history.go();
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

                $("#editBtn").click(function () {
                    $("#editForm").submit();

                })




        })


    </script>

</body>
</html>
