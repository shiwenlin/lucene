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
    <title>zSoccer</title>
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

                                <img src="${PageContext.request.contextPath}/images/slideshow-image1.jpg" />
                            </div>
                            <div class="art-content">
                                <a href="#"><h3 style="font-size: 37px; line-height: 1.5;">Nam libero tempore, cum soluta nobis est </h3></a>
                                <div class="info">Posted on June 22, 2010 in: <a href="#">Event</a></div>
                                <div class="excerpt"><p>Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum exercitation ullamco laboris nisi ut aliquip.</p></div>
                                <p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum.</p>
                                <blockquote><p>Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet vultatup duista.</p></blockquote>
                                <p>Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril.</p>
                                <h2>Heading 1</h2>
                                <p>Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse lorem ipsum dolor sit amet.</p>
                                <h2>Heading 2</h2>
                                <p>Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis. At vero eos et accusam et justo.</p>
                                <h2>Heading 3</h2>
                                <p>Consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum hendrerit in vulputate velit esse molestie.</p>
                                <p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum.</p>
                                <p><code>Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</code></p>
                                <p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>
                                <div class="note">
                                    <ol>
                                        <li>Lorem ipsum</li>
                                        <li>Sit amet vultatup nonumy</li>
                                        <li>Duista sed diam</li>
                                    </ol>
                                    <div class="clear"></div>
                                </div>
                                <p>Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.</p>
                                <p>Consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores.</p>
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
                        <div class="widget wid-gallery">
                            <div class="wid-header">
                                <h5>Gallery</h5>
                            </div>
                            <div class="wid-content">
                                <a href="#"><img src="${PageContext.request.contextPath}/images/6.jpg"></a>
                                <a href="#"><img src="${PageContext.request.contextPath}/images/10.jpg"></a>
                                <a href="#"><img src="${PageContext.request.contextPath}/images/9.jpg"></a>
                                <a href="#"><img src="${PageContext.request.contextPath}/images/8.jpg"></a>
                                <a href="#"><img src="${PageContext.request.contextPath}/images/7.jpg"></a>
                                <a href="#"><img src="${PageContext.request.contextPath}/images/6.jpg"></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!--////////////////////////////////////Footer-->



</div>
</body></html>
