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
            <span class="title">
              <i class="fa fa-info"></i>
              <a href="/patient/list"> 患者列表</a>  /  患者基本信息
            </span>
                    <ul class="unstyled inline pull-right">
                        <li><a href="/patient/edit/${patients.id}"><i class="fa fa-edit"></i> 修改</a></li>
                        <li><a href="/patient/del/${patients.id}"><i class="fa fa-times"></i> 删除</a></li>
                    </ul>
                </div>
                <div class="box-body">
                    <table class="table">
                        <tbody>
                        <tr>
                            <td width="100"><strong>姓名</strong></td>
                            <td width="300">${patients.name}</td>
                            <td width="100"><strong>性别</strong></td>
                            <td width="300">${patients.sex}</td>
                            <td width="100"><strong>年龄</strong></td>
                            <td width="">${patients.age}</td>
                        </tr>
                        <tr>
                            <td><strong>身份证号</strong></td>
                            <td>${patients.card}</td>
                            <td><strong>联系电话</strong></td>
                            <td>${patients.telphone}</td>
                            <td><strong>医保类型</strong></td>
                            <td>${patients.surance.hctname}</td>
                        </tr>
                        <tr>
                            <td><strong>地址</strong></td>
                            <td colspan="5">${patients.address}</td>
                        </tr>
                        <tr>
                            <td colspan="6"><strong>过敏史</strong></td>
                        </tr>
                        <tr>
                            <td colspan="6">
                                ${patients.allergy}
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6"><strong>备注</strong></td>
                        </tr>
                        <tr>
                            <td colspan="6"> ${patients.note}</td>
                        </tr>
                        </tbody>

                    </table>
                </div>
            </div>
            <!-- box end -->
            <div class="box">
                <div class="box-header">
                    <span class="title"><i class="fa fa-stethoscope"></i> 就诊记录</span>
                </div>
                <div class="box-body">
                    <table class="table">
                        <thead>
                        <tr>
                            <th width="100">日期</th>
                            <th width="150">科室</th>
                            <th width="200">病种</th>
                            <th>初步诊断</th>
                            <th width="50"></th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>2014-07-02</td>
                            <td>内科</td>
                            <td>流感</td>
                            <td>流行性感冒</td>
                            <td>
                                <a href="">详情</a>
                            </td>
                        </tr>
                        </tbody>
                    </table>

                </div>
            </div>
            <!-- box end -->
        </div>

    </div>
</div>

<script src="http://cdn.staticfile.org/jquery/1.11.1/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/twitter-bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="/static/plugins/validate/jquery.validate.js"></script>
<script src="/static/js/jquery.twbsPagination.min.js"></script>
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
