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
                    <span class="title">搜索</span>
                </div>
                <div class="box-body search-box">
                    <form action="" class="form-search">
                        <input type="text" placeholder="姓名">
                        <input type="text" placeholder="身份证号">
                        <input type="text" placeholder="电话">
                        <button class="button button-flat-primary button-pill"><i class="fa fa-search"></i> 搜索</button>
                    </form>
                </div>
            </div>


            <div class="box">
                <div class="box-header">
                    <span class="title"><i class="fa fa-building"></i> 患者列表</span>
                    <ul class="unstyled inline pull-right">
                        <li id="addPatient">
                            <button class="btn btn-success"><i class="fa fa-plus"></i> 新建</button>
                        </li>
                    </ul>
                </div>
                <div class="box-body">
                    <table class="table">
                        <thead>
                        <tr>
                            <th width="20">
                                <input type="checkbox" name="" id="">
                            </th>
                            <th width="100">姓名</th>
                            <th width="50">性别</th>
                            <th width="150">电话</th>
                            <th width="200">医保类型</th>
                            <th>地址</th>
                            <th>身份证号码</th>
                            <th width="50">状态</th>
                            <th width="100">创建日期</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${patientsList}" var="patients">
                            <tr>
                                <td>
                                    <input type="checkbox" name="" id="">
                                </td>
                                <td><a href="patient.html">${patients.name}</a></td>
                                <td>${patients.sex}</td>
                                <td>${patients.telphone}</td>
                                <td>${patients.surance.hctname}</td>
                                <td>${patients.address}</td>
                                <td>${patients.card}</td>
                                <td>${patients.state}</td>
                                <td><fmt:formatDate value="${patients.creatime}"/></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>


        </div>


        <div class="modal fade" id="newCustomerModal">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="editCustomer">新增病人</h4>
                    </div>
                    <div class="modal-body">
                        <form id="newForm">

                            <%--<input type="hidden" name="id" id="editId">--%>

                            <div class="form-group">
                                <label>姓名</label>
                                <input type="text" name="name" class="form-control">
                            </div>
                            <div class="form-group">
                                <label>身份证号</label>
                                <input type="text" name="card" class="form-control">
                            </div>
                            <div>
                                <label>请选择性别</label>
                                <select name="sex">
                                    <option value="男">男</option>
                                    <option value="女">女</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>电话</label>
                                <input type="text" name="telphone" class="form-control">

                            </div>
                            <div class="form-group">
                                <label>地址</label>
                                <input type="text" name="address" class="form-control">

                            </div>
                            <div class="form-group">
                                <label>医保类型</label>
                                <select name="surance.id" class="form-control">
                                    <%--<option value=""></option>--%>
                                    <c:forEach items="${suranceList}" var="surance">


                                        <option value="${surance.id}">${surance.hctname}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div>
                                <label>请选择状态</label>
                                <select name="state">
                                    <option value="就诊">就诊</option>
                                    <option value="出院">出院</option>
                                </select>
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
                        <button type="button" class="btn btn-primary" id="saveBtn">保存</button>
                    </div>
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
        $("#addPatient").click(function () {
            $("#newForm")[0].reset();
            $("#newCustomerModal").modal({
                show: true,
                backdrop: 'static',
                keyword: false
            })


        })

        $("#newForm").validate({
            errorElement: "span",
            errorClass: "text-danger",
            rules: {
                name: {
                    required: true,
                    rangelength: [2, 20]
                },
                card:{
                    required: true,
                    rangelength: [18, 18],
                    number: true
                },

                telphone: {
                    required: true,
                    rangelength: [11, 11],

                },
                address: {
                    required: true
                }

            },
            messages: {
                name: {
                    required: "请输入病人姓名",
                    rangelength: "不少于两位"
                },
                card:{
                    required: "请输入身份证号",
                    rangelength: "请输入18位",

                },
                telphone: {
                    required: "请输入电话",
                    rangelength: "请输入11位电话",
                    number: "请输入有效数字"
                },
                address: {
                    required: "请输入地址"
                }
            },
            submitHandler: function (form) {

                $.post("/patient/new", $(form).serialize()).done(function (data) {

                            if (data == "success") {

                                $("#newCustomerModal").modal("hide");


                                history.go();
                                $("#messageDiv").append('<div class="alert alert-success alert-dismissible" role="alert"> ' +
                                        '<button type="button" class="close" data-dismiss="alert" aria-label="Close">' +
                                        '<span aria-hidden="true">&times;</span></button> ' +
                                        '<strong>"+$(form)+"</strong> 添加成功</div>')
                            }


                        })
                        .fail(function () {
                                    alert("请求服务器失败");
                                }
                        );

            }
        })

        $("#saveBtn").click(function () {
            $("#newForm").submit();

        })




    })


</script>

</body>
</html>
