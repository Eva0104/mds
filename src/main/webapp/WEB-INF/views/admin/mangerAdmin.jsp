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

<div class="navbar navbar-static-top">
    <div class="navbar-inner">
        <a class="brand" href="#">凯盛医疗</a>
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
<div class="container-fluid">
    <div class="row-fluid">
        <div class="span12">

            <div class="box">
                <div class="box-header">
            <span class="title">
              <i class="fa fa-plus"></i>
              <a href="dept-list.html"> 系统账户列表</a>  /  新增账号
            </span>
                </div>
                <div class="box-body form">
                    <form id="saveForm">
                        <label>员工姓名</label>
                        <input type="text" name="realname">
                        <label>账号 <span class="muted">(用于登录系统)</span></label>
                        <input type="text" name="username">
                        <label>密码 <span class="muted">(默认123456)</span></label>
                        <input type="password" name="password" value="123456">
                        <label>联系电话</label>
                        <input type="text" name="telphone">
                        <label>请选择角色</label>
                        <select name="rolename" id="">
                            <option value="管理员">管理员</option>
                            <option value="普通员工">普通员工</option>
                        </select>


                    </form>
                    <div class="form-actions">
                        <button id="saveBtn" class="button button-flat-action button-pill">保存</button>
                    </div>
                </div>
            </div>


        </div>

    </div>
</div>


<script src="/static/js/jquery-1.11.3.min.js"></script>
<script src="/static/js/bootstrap.min.js"></script>
<script src="/static/plugins/validate/jquery.validate.min.js"></script>


<script>
    $(function () {
        $("#saveForm").validate({
            errorElement: "span",
            errorClass: "text-danger",
            rules: {
                realname: {
                    required: true,
                    rangelength: [2, 20]
                },
                username: {
                    required: true,
                    rangelength: [3, 20],
                    remote: "/admin/validate/username"
                },
                password: {
                    required: true,
                    rangelength: [6, 18],

                },
                telphone:{
                    required: true,
                    rangelength: [11, 11],
                    number:true
                },



                rolename: {
                    required: true,

                },
            },
            messages: {
                realname: {
                    required: "请输入真实姓名",
                    rangelength: "真实姓名长度2~20位"
                },
                username: {
                    required: "请添加账号",
                    rangelength: "用户名的长度3~20位",
                    remote: "账号已存在",
                },
                password: {
                    required: "请输入新密码",
                    rangelength: "密码长度6~18位"
                },
                telphone: {
                    required: "请输入确认电话",
                    rangelength: "电话的长度11位",
                    number:"请输入数字"
                },


                rolename: {
                    required: "请输入级别",

                },
            },
            submitHandler: function (form) {
                $.post("/admin/new", $(form).serialize())
                        .done(function (data) {
                            if (data == "success") {
                               window.location.href="/home"

                            }


                        })
                        .fail(function () {
                                    alert("请求服务器失败");
                                }
                        );

            }
        })

        $("#saveBtn").click(function () {
            $("#saveForm").submit();

        })

    })
</script>

</body>
</html>

