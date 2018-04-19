<%--
  Created by IntelliJ IDEA.
  User: xf
  Date: 2018/4/7
  Time: 16:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<!--[if lt IE 7 ]><html class="ie ie6" lang="en"> <![endif]-->
<!--[if IE 7 ]><html class="ie ie7" lang="en"> <![endif]-->
<!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--><html lang="en"> <!--<![endif]-->
<head>

    <!-- Basic Page Needs
  ================================================== -->
    <meta charset="utf-8">
    <title>${article.title}</title>
    <meta name="description" content="">


    <!-- Mobile Specific Metas
  ================================================== -->
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    <!-- CSS
  ================================================== -->
    <link rel="stylesheet" href="${PageContext.request.contextPath}/css/zerogrid.css">
    <link rel="stylesheet" href="${PageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="${PageContext.request.contextPath}/css/menu.css">
    <link rel="stylesheet" href="${PageContext.request.contextPath}/css/responsiveslides.css">
    <link href="${PageContext.request.contextPath}/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <script src="${PageContext.request.contextPath}/js/jquery-latest.min.js"></script>
    <script src="${PageContext.request.contextPath}/js/script.js"></script>
    <script src="${PageContext.request.contextPath}/js/jquery183.min.js"></script>
    <script src="${PageContext.request.contextPath}/js/responsiveslides.min.js"></script>
    <script>
        // You can also use "$(window).load(function() {"
        $(function () {
            // Slideshow
            $("#slider").responsiveSlides({
                auto: true,
                pager: false,
                nav: true,
                speed: 500,
                namespace: "callbacks",
                before: function () {
                    $('.events').append("<li>before event fired.</li>");
                },
                after: function () {
                    $('.events').append("<li>after event fired.</li>");
                }
            });
        });
    </script>


    <!--[if lt IE 8]>
    <div style=' clear: both; text-align:center; position: relative;'>
        <a href="http://windows.microsoft.com/en-US/internet-explorer/products/ie/home?ocid=ie6_countdown_bannercode">
            <img src="http://storage.ie6countdown.com/assets/100/images/banners/warning_bar_0000_us.jpg" border="0" height="42" width="820" alt="You are using an outdated browser. For a faster, safer browsing experience, upgrade for free today." />
        </a>
    </div>
    <![endif]-->
    <!--[if lt IE 9]>
    <script src="${PageContext.request.contextPath}/js/html5.js"></script>
    <script src="${PageContext.request.contextPath}/js/css3-mediaqueries.js"></script>
    <![endif]-->

</head>
<body>
<div class="wrap-body">

    <!-- /////////////////////////////////////////Top -->


    <!--////////////////////////////////////Header-->



    <!--////////////////////////////////////Container-->
    <section id="container" class="sub-page">
        <div class="wrap-container zerogrid">
            <div id="main-content" class="col-2-3">
                <div class="wrap-col">
                    <div class="wrap-content">
                        <article>
                            <div class="art-header">


                            </div>
                            <div class="art-content">
                                <h1 style="text-align: center;margin-top: 14px;margin-bottom: 40px;" >${article.title}</h1>
                                ${article.content}
                            </div>
                        </article>
                    </div>
                </div>
            </div>
            <div id="sidebar" class="col-1-3">
                <div class="wrap-col">
                    <div class="wrap-sidebar">
                        <!---- Start Widget ---->
                        <div class="widget wid-about">
                            <div class="wid-header">
                                <h5>About Us</h5>
                            </div>
                            <div class="wid-content">
                                <img src="${PageContext.request.contextPath}/images/1.jpg"/>
                                <p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.</p>
                            </div>
                        </div>
                        <!---- Start Widget ---->
                        <div class="widget wid-post">
                            <div class="wid-header">
                                <h5>Latest Posts</h5>
                            </div>
                            <div class="wid-content">
                                <div class="post">
                                    <a href="#"><img src="${PageContext.request.contextPath}/images/6.jpg"/></a>
                                    <div class="wrapper">
                                        <h5><a href="#">Lorem ipsum dolor</a></h5>
                                        <span>$25 - $26</span>
                                    </div>
                                </div>
                                <div class="post">
                                    <a href="#"><img src="${PageContext.request.contextPath}/images/7.jpg"/></a>
                                    <div class="wrapper">
                                        <h5><a href="#">Lorem ipsum dolor</a></h5>
                                        <span>$25 - $26</span>
                                    </div>
                                </div>
                                <div class="post">
                                    <a href="#"><img src="${PageContext.request.contextPath}/images/8.jpg"/></a>
                                    <div class="wrapper">
                                        <h5><a href="#">Lorem ipsum dolor</a></h5>
                                        <span>$25 - $26</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!---- Start Widget ---->

                    </div>
                </div>
            </div>
        </div>
    </section>

    <!--////////////////////////////////////Footer-->



</div>
</body></html>
