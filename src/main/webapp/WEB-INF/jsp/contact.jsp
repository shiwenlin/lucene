<%--
  Created by IntelliJ IDEA.
  User: xf
  Date: 2018/4/6
  Time: 0:01
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



    <!--////////////////////////////////////Header-->
    <%@ include file="header.jsp"%>



    <!--////////////////////////////////////Container-->
    <section id="container">
        <div class="zerogrid">
            <div class="wrap-container clearfix">
                <div id="main-content">
                    <div class="wrap-box"><!--Start Box-->
                        <div class="row">
                            <div class="col-2-3">
                                <div class="wrap-col">
                                    <div class="contact">
                                        <div class="contact-header">
                                            <h5>Contact Form</h5>
                                        </div>
                                        <div id="contact_form">
                                            <form name="form1" id="ff" method="post" action="contact.php">
                                                <label class="row">
                                                    <div class="col-1-2">
                                                        <div class="wrap-col">
                                                            <input type="text" name="name" id="name" placeholder="Enter name" required="required" />
                                                        </div>
                                                    </div>
                                                    <div class="col-1-2">
                                                        <div class="wrap-col">
                                                            <input type="email" name="email" id="email" placeholder="Enter email" required="required" />
                                                        </div>
                                                    </div>
                                                </label>

                                                <label class="row">
                                                    <div class="wrap-col">
													<textarea name="message" id="message" class="form-control" rows="4" cols="25" required="required"
                                                              placeholder="Message"></textarea>
                                                    </div>
                                                </label>
                                                <center><input class="sendButton" type="submit" name="submitcontact" value="Submit"></center>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-1-3">
                                <div class="wrap-col">
                                    <div class="contact-header">
                                        <h5>Contact Info</h5>
                                    </div>
                                    <div style="background: #fff; padding: 20px; box-shadow: 2px 2px 5px 0px rgba(0,0,0,0.3);">
                                        <span>SED UT PERSPICIATIS UNDE OMNIS ISTE NATUS ERROR SIT VOLUPTATEM ACCUSANTIUM DOLOREMQUE.</span>
                                        <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque la udantium, totam rem aperiam, eaque ipsa quae ab illo inventore quasi. Nemo enim ipsam voluptatem quia.</p>
                                        <p>JL.Kemacetan timur no.23. block.Q3<br>
                                            Jakarta-Indonesia</p>
                                        <p>+6221 888 888 90 <br>
                                            +6221 888 88891</p>
                                        <p>info@yourdomain.com</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!--////////////////////////////////////Footer-->
    <%@ include file="footer.jsp"%>




    <!-- Google Map -->
    <script>
        $('.maps').click(function () {
            $('.maps iframe').css("pointer-events", "auto");
        });

        $( ".maps" ).mouseleave(function() {
            $('.maps iframe').css("pointer-events", "none");
        });
    </script>

</div>
</body></html>
