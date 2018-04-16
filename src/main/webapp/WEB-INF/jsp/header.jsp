<%--
  Created by IntelliJ IDEA.
  User: xf
  Date: 2018/4/6
  Time: 0:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="top" style="background-color: green">
    <div class="zerogrid" >
        <div class="row">
            <div class="f-left">
                <span><i class="fa fa-map-marker"></i> WUYI UNIVERSITY </span>
                <span><i class="fa fa-phone"></i> 18219114765</span>
                <span><i class="fa fa-envelope"></i> lsw_demail@163.com</span>
            </div>
            <div class="f-right">
                <span>Bees never did hard time sad. - Black</span>
            </div>
        </div>
    </div>
</div>

<!--////////////////////////////////////Header-->
<header>
    <div class="wrap-header zerogrid">
        <div class="row">
            <div id="cssmenu">
                <ul>
                    <li class='active'><a href="${PageContext.request.contextPath}/">首页</a></li>
                    <li><a href="${PageContext.request.contextPath}/searchPage">搜索新闻</a></li>
                    <li><a href="single.html">关于本站</a></li>
                    <li><a href="${PageContext.request.contextPath}/contactMe">联系我</a></li>
                </ul>
            </div>
            <a href='index.html' class="logo"><img src="${PageContext.request.contextPath}/images/mylogo.png" /></a>
        </div>
    </div>
</header>
