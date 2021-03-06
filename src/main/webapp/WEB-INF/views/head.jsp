<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<div class="navbar navbar-static-top">
    <div class="navbar-inner">
        <a class="brand" href="#">MDS</a>
        <ul class="nav">
            <li><a href="/home"><i class="fa fa-home"></i> 首页</a></li>
            <li class="${param.menu == 'patient' ? 'active' : ''}"><a href="/patient/list"><i class="fa fa-building"></i> 病人档案</a></li>
            <li><a href="/visit/list"><i class="fa fa-stethoscope"></i>  就诊记录</a></li>
            <li><a href="#"><i class="fa fa-bell-o"></i> 复诊提醒</a></li>
            <li><a href="#"><i class="fa fa-bar-chart-o"></i> 数据统计</a></li>
            <li class="dropdown active" >
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" ><i class="fa fa-cogs"></i> 系统设置 <b class="caret"></b></a>
                <ul class="dropdown-menu">
                    <li><a href="/dept/set"><i class="fa fa-sitemap"></i> 科室设置</a></li>
                    <li><a href="/dis/set"><i class="fa fa-medkit"></i> 病种设置</a></li>
                    <li><a href="/surance/list"><i class="fa fa-bars"></i> 医保类型设置</a></li>
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
