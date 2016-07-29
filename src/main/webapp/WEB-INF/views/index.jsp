<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>AdminLTE 2 | Log in</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.6 -->
    <link rel="stylesheet" href="/static/bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="/static/plugins/fontawesome/css/font-awesome.min.css">

    <link rel="stylesheet" href="/static/dist/css/AdminLTE.min.css">
    <!-- AdminLTE Skins. We have chosen the skin-blue for this starter
          page. However, you can choose any other skin. Make sure you
          apply the skin class to the body tag so the changes take effect.
    -->
    <link rel="stylesheet" href="/static/dist/css/skins/skin-blue.min.css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>

    <style>

        /*body{*/
            /*background-image: url(/static/imags/37936.jpg);*/
            /*background-repeat: repeat-x;*/
        /*}*/




    </style>


    <![endif]-->
</head>
<%--style="background-image:url(/static/imags/37936.jpg)"--%>
<body class="hold-transition login-page"
      style="background-image:url(/static/imags/logins3.png)"
     >

<div class="login-box"  >
    <div class="login-logo" style="color:black;margin-left: -50px;margin-top: 150px " >

        <a href="../../index2.html" style="color:transparent" >一帆CRM</a>
    </div>
    <!-- /.login-logo -->
    <div class="login-box-body"  style="margin-top: 30px;border-radius: 3%; ">
        <c:choose>
            <c:when test="${message.state=='success'}">
                <div class="alert alert-success">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span arial-hidden="true">&times;</span>
                    </button>
                    ${message.message}
                </div>
            </c:when>
            <c:when test="${message.state=='error'}">
                <div class="alert alert-danger">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span arial-hidden="true">&times;</span>
                    </button>
                    ${message.message}
                </div>
            </c:when>
        </c:choose>

        <p class="login-box-msg">欢迎登录客户管理系统</p>

        <form action="/" method="post">
            <div class="form-group has-feedback">
                <input type="test" class="form-control" name="username"  autofocus placeholder="账户名" style="border-radius: 3%;">
                <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input type="password" class="form-control" name="password" placeholder="密码" style="border-radius: 3%;">
                <span class="glyphicon glyphicon-lock form-control-feedback"></span>
            </div>

            <div class="row">
                <div class="col-xs-8">
                    <div class="checkbox icheck">
                        <label>
                            <input type="checkbox"> 记住我
                        </label>
                    </div>
                </div>
                <!-- /.col -->
                <div class="col-xs-4">
                    <button type="submit" class="btn btn-primary btn-block btn-flat">登录</button>
                </div>
                <!-- /.col -->
            </div>
        </form>

        <%--<div class="social-auth-links text-center">--%>
        <%--<p>- OR -</p>--%>
        <%--<a href="#" class="btn btn-block btn-social btn-facebook btn-flat"><i class="fa fa-facebook"></i> Sign in using--%>
        <%--Facebook</a>--%>
        <%--<a href="#" class="btn btn-block btn-social btn-google btn-flat"><i class="fa fa-google-plus"></i> Sign in using--%>
        <%--Google+</a>--%>
        <%--</div>--%>
        <!-- /.social-auth-links -->

        <a href="#">忘记密码</a><br>
        <%--<a href="register.html" class="text-center">Register a new membership</a>--%>

    </div>
    <!-- /.login-box-body -->
</div>
<!-- /.login-box -->

<!-- jQuery 2.2.3 -->
<script src="/static/plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="/static/bootstrap/js/bootstrap.min.js"></script>
<!-- iCheck -->
<script src="/static/plugins/iCheck/icheck.min.js"></script>
<script>
    $(function () {
        $('input').iCheck({
            checkboxClass: 'icheckbox_square-blue',
            radioClass: 'iradio_square-blue',
            increaseArea: '20%' // optional
        });
    });
</script>
</body>
</html>
