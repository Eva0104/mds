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
    <jsp:param name="menu" value="patient"/>
</jsp:include>
<div class="container-fluid">
    <div class="row-fluid">
        <div class="span12">

            <div class="box">
                <div class="box-header">
                    <span class="title">搜索</span>
                </div>

                <div class="box-body search-box">
                    <form method="get" class="form-inline">
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="姓名" name="q_s_like_name_or_pinyin"
                                   value="${q_s_like_name_or_pinyin}">
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="身份证号" name="q_s_like_card"
                                   value="${q_s_like_card}">
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="电话" name="q_s_like_telphone"
                                   value="${q_s_like_telphone}">
                        </div>
                        <button class="button button-flat-primary button-pill"><i class="fa fa-search"></i> 搜索
                        </button>
                    </form>
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
                                    <input type="checkbox" >
                                </th>
                                <th width="100">姓名</th>
                                <th width="50">性别</th>
                                <th width="150">电话</th>
                                <th width="200">医保类型</th>
                                <th>地址</th>
                                <th>身份证号码</th>
                                <th width="50">状态</th>
                                <th width="100">创建日期</th>
                                <th></th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${page.items}" var="patients">
                                <tr>
                                    <td>
                                        <input type="checkbox" >
                                    </td>
                                    <td ><a href="/patient/${patients.id}/view">${patients.name}</a></td>
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
                                    <label>年龄</label>
                                    <input type="text" name="age" class="form-control">

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
                                    <div>
                                        <label>过敏史</label>
                                        <textarea name="allergy"  rows="10" class="form-control"></textarea>
                                        <%--<input type="text" name="allergy" class="span12">--%>
                                    </div>
                                    <div>
                                        <label>备注</label>
                                        <textarea name="note"  rows="10" class="form-control"></textarea>
                                        <%--<input type="text" name="note" class="span12">--%>
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
    <script src="/static/js/jquery.twbsPagination.min.js"></script>
    <script>
        $(function () {
            $("#page").twbsPagination({
                totalPages:${page.totalPages},
                visiblePages: 10,
                first: '首页',
                prev: '上一页',
                next: '下一页',
                last: '末页',
                href: '?p={{number}}&q_s_like_name_or_pinyin=${q_s_like_name_or_pinyin}&q_s_like_card=${q_s_like_card}&q_s_like_telphone=${q_s_like_telphone}'
            });


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
                    card: {
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
                    },
                    age: {
                        required: true,
                        number: true
                    },
                    allergy:{
                        required: true
                    },
                    note:{
                        required: true
                    }

                },
                messages: {
                    name: {
                        required: "请输入病人姓名",
                        rangelength: "不少于两位"
                    },
                    card: {
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
                    },
                    age: {
                        required: "请输入年龄",
                        number: "请输入有效数字"
                    },
                    allergy:{
                        required: "请输入过敏史如果没有请填  无"
                    },
                    note:{
                        required: "请输入备注如果没有请填  无"
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
