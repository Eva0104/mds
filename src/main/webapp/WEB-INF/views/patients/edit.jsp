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
    <%--<form id="newForm">--%>
    <div class="row-fluid">
        <div class="span12">

            <div class="box">
                <div class="box-header">
            <span class="title">
              <i class="fa fa-info"></i>
              <a href="/patient/list"> 患者列表</a>  /  患者基本信息
            </span>
                    <%--<ul class="unstyled inline pull-right">--%>
                    <%--<li><a href="new-patient.html"><i class="fa fa-edit"></i> 修改</a></li>--%>
                    <%--<li><a href="new-patient.html"><i class="fa fa-times"></i> 删除</a></li>--%>
                    <%--</ul>--%>
                </div>



                <div class="box-body">
                    <table class="table">
                        <tbody>
                        <form id="newForm">
                            <input type="hidden" name="id" value="${patients.id}">
                            <input type="hidden" name="creatime" value="${patients.creatime}">
                            <input type="hidden" name="surance.id" value="${patients.surance.id}">
                            <tr>
                                <td width="100"><strong>姓名</strong></td>
                                <td width="300"><input name="name" value="${patients.name}"></td>
                                <td width="100"><strong>性别</strong></td>
                                <td width="300">

                                    <c:choose>
                                        <c:when test="${patients.sex=='男'}">
                                            <select name="sex">
                                                <option value="男">男</option>
                                                <option value="女">女</option>
                                            </select>
                                        </c:when>
                                        <c:when test="${patients.sex=='女'}">
                                            <select name="sex">
                                                <option value="女">女</option>
                                                <option value="男">男</option>
                                            </select>
                                        </c:when>
                                    </c:choose>
                                    <%--<option  value="男">男</option>--%>
                                    <%--<option value="女">女</option>--%>
                                </td>
                                <td width="100"><strong>年龄</strong></td>
                                <td width=""><input name="age" value="${patients.age}"></td>
                            </tr>
                            <tr>
                                <td><strong>身份证号</strong></td>
                                <td><input name="card" value="${patients.card}"></td>
                                <td><strong>联系电话</strong></td>
                                <td><input name="telphone" value="${patients.telphone}"></td>
                                <td><strong>医保类型</strong></td>
                                <td><c:choose>
                                    <c:when test="${patients.state=='就诊'}">
                                        <select name="state">
                                            <option value="就诊">就诊</option>
                                            <option value="出院">出院</option>
                                        </select>
                                    </c:when>
                                    <c:when test="${patients.state=='出院'}">
                                        <select name="state">
                                            <option value="出院">出院</option>
                                            <option value="就诊">就诊</option>
                                        </select>
                                    </c:when>
                                </c:choose></td>
                            </tr>
                            <tr>
                                <td><strong>地址</strong></td>
                                <td colspan="5"><input name="address" value="${patients.address}"></td>
                            </tr>
                            <tr>
                                <td colspan="6"><strong>过敏史</strong></td>
                            </tr>
                            <tr>
                                <td colspan="6">
                                    <input readonly="readonly" value="${patients.allergy}">
                                    <br/>
                                    <textarea name="allergy" value="${patients.address}"
                                              style="width:200px; height:50px;"></textarea>
                                    <%--<input name="name"  style="height:100px;width: 100%" value="${patients.address}">--%>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="6"><strong>备注</strong></td>
                            </tr>
                            <tr>
                                <td colspan="6">
                                    <input readonly="readonly" value="${patients.note}">
                                    <br/>
                                    <textarea name="name" value="${patients.note}"
                                              style="width:200px; height:50px;"></textarea>
                                    <%--<input name="name"  style="height:100px;width: 100%" value="${patients.address}">--%>
                                </td>
                            </tr>
                        </form>

                        </tbody>


                    </table>
                    <div class="form-actions">
                        <button id="saveBtn" class="button button-flat-action button-pill">保存</button>
                    </div>

                </div>
            </div>
            <!-- box end -->

            <!-- box end -->
        </div>

    </div>

    <%--</form>--%>

</div>


<script src="http://cdn.staticfile.org/jquery/1.11.1/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/twitter-bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="/static/plugins/validate/jquery.validate.js"></script>
<script src="/static/js/jquery.twbsPagination.min.js"></script>
<script>
    $(function () {


        $("#newForm").validate({
            errorElement: "span",
            errorClass: "text-danger",
            rules: {
                name: {
                    required: true,
                    rangelength: [2, 20]
                },
                age: {
                    required: true,
                    number: true
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

                allergy: {
                    required: true
                },
                note: {
                    required: true
                }

            },
            messages: {
                name: {
                    required: "请输入病人姓名",
                    rangelength: "不少于两位"
                },
                age: {
                    required: "请输入年龄",
                    number: "请输入有效数字"
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

                allergy: {
                    required: "请输入过敏史如果没有请填  无"
                },
                note: {
                    required: "请输入备注如果没有请填  无"
                }
            },
            submitHandler: function (form) {


                $.post("/patient/new", $(form).serialize()).done(function (data) {

                            if (data == "success") {

                                $("#newCustomerModal").modal("hide");


                                window.location.href="/patient/list"
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
