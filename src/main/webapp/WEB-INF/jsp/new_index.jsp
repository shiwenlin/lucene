<%--
  Created by IntelliJ IDEA.
  User: xf
  Date: 2018/3/30
  Time: 12:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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



    <link href="http://mat1.gtimg.com/www/base/base.css" rel="stylesheet" type="text/css">
    <link href="http://mat1.gtimg.com/news/skeetershi/world/css/index.min2.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="//vm.gtimg.cn/c/=/tencentvideo/txp/style/txp_barrage.css?_=1523593955682">

    <link rel="stylesheet" rev="stylesheet" type="text/css" media="screen" href="//qzonestyle.gtimg.cn/open_proj/slot-external.css">
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
    <%@ include file="header.jsp"%>

    <div class="bg-white">
        <div class="zerogrid">
            <!-- Slideshow -->
            <div class="callbacks_container">
                <ul class="rslides" id="slider">
                <c:forEach var="indexList" items="${indexArticle}">
                    <li>
                        <img src="${PageContext.request.contextPath}/${indexList.showPic}" alt="">
                        <div class="caption">
                            <h1>${indexList.title}</h1>
                            <span >${indexList.createTime}</span>
                        </div>
                    </li>

                </c:forEach>
                </ul>
            </div>
            <div class="clear"></div>
        </div>
    </div>

    <!--////////////////////////////////////Container-->
    <section id="container" class="sub-page">
        <div class="wrap-container zerogrid">
            <div id="main-content" class="col-2-3">
                <div class="wrap-col">
                    <div class="wrap-content">


                        <c:forEach var="otherArticle" items="${otherArticle}">
                            <c:if test="${otherArticle.newType ==1}">

                        <div class="Q-tpList" style="z-index: 98;"><div class="Q-tpWrap">
                            <a target="_blank" class="pic" href="//new.qq.com/omn/20180416A0LSHF.html"><img class="picto" src="${otherArticle.imgSrc}" name=""></a>

                            <div class="text">
                            <em class="f14 l24"><a target="_blank" class="linkto" href="//new.qq.com/omn/20180416A0LSHF.html">${otherArticle.title}</a></em>
                                <div >
                                    <div class="info">
                                        <span class="from">${otherArticle.author}</span><span class="keywords" style="display: inline;"><a href="http://news.qq.com/dc_column_article/TagsList.htm?tags=%E5%BE%AE%E4%BF%A1" target="_blank">微信</a></span>
                                    </div>

                                    <div class="btns"><div class="shareBtn" role="button" tabindex="0" aria-haspopup="true" aria-pressed="false" aria-label="分享"><ul class="shareBtn16" id="shares" style="display: none;">
                                        <li class="jiantou">
                                        </li><li class="shareButton" id="share2wb"><a href="javascript:void(0)" class="s_weibo" id="2" role="button" tabindex="0" aria-haspopup="true" aria-pressed="false">
                                        腾讯微博
                                    </a></li>
                                        <li class="shareButton" id="share2qzone"><a href="javascript:void(0)" class="s_qzone" onclick="share2qzone.showPopup(this,'${otherArticle.title}','${otherArticle.url}','${otherArticle.imgSrc}')" role="button" tabindex="0" aria-haspopup="true" aria-pressed="false">QQ空间
                                        </a></li>
                                        <li class="shareButton" id="share2qq"><a href="javascript:void(0)" class="s_qq" onclick="share2qq.showPopup(this,'${otherArticle.title}','${otherArticle.url}','${otherArticle.imgSrc}')" role="button" tabindex="0" aria-haspopup="true" aria-pressed="false">QQ好友
                                        </a></li>
                                        <li id="share2sina" class="shareButton"><a href="javascript:void(0)" class="s_sina" onclick="share2sina('${otherArticle.title}','${otherArticle.url}','${otherArticle.imgSrc}')" role="button" tabindex="0" aria-haspopup="true" aria-pressed="false">新浪微博
                                        </a></li>
                                    </ul></div></div>
                                 </div>
                        </div>
                        </div></div>

                            </c:if>

                        </c:forEach>



                            <%--<article>--%>
                                <%--<div class="col-1-4">--%>
                                    <%--<img style="margin-top: 10px;margin-bottom: 10px;margin-left: 10px" src="${otherArticle.imgSrc}" />--%>
                                <%--</div>--%>
                                <%--<div class="col-3-4">--%>
                                    <%--<div class="art-content">--%>
                                        <%--<a href="#"><h3>${otherArticle.title}</h3></a>--%>
                                        <%--<div class="info">推送于：${otherArticle.spiderDate} </div>--%>
                                        <%--<p></p>--%>
                                        <%--<a class="button button02" href="#">MORE</a>--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                            <%--</article>--%>




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
                                <img src="${PageContext.request.contextPath}/images/15.jpg"/>
                                <p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.</p>
                            </div>
                        </div>
                        <!---- Start Widget ---->
                        <div class="widget wid-post" id="paih" bosszone="sh_rdph">



                                <div class="hd hd2">
                                    <h2 class="subTitle">热度排行</h2>
                                    <span class="fr"><a href="http://news.qq.com/articleList/ranking/#society" target="_blank">更多</a></span>
                                </div>
                                <div class="bd bd2">
                                    <ol class="current">
                                        <li>
                                            <span class="topRank">1</span><a target="_blank" href="http://society.qq.com/a/20180404/000132.htm">全国多地遭“断崖式”降温 局地气温骤降20至28℃</a>
                                        </li>
                                        <li>
                                            <span class="topRank">2</span><a target="_blank" href="http://society.qq.com/a/20180405/000467.htm">陕西15岁智力障碍少年被害 嫌疑人被抓有精神病史</a>
                                        </li>
                                        <li>
                                            <span class="topRank">3</span><a target="_blank" href="http://society.qq.com/a/20180405/001455.htm">黑客侵入上牌系统盗取1500万副号牌 涉及24省份</a>
                                        </li>
                                        <li>
                                            <span>4</span><a target="_blank" href="http://society.qq.com/a/20180404/026278.htm">湖南一盗窃嫌疑人被刑讯逼供致死，派出所副所长一审获刑十年</a>
                                        </li>
                                        <li>
                                            <span>5</span><a target="_blank" href="http://society.qq.com/a/20180404/025457.htm">衡水警方回应“执勤人员抱石头砸人”：已停职并成立调查组</a>
                                        </li>
                                        <li>
                                            <span>6</span><a target="_blank" href="http://society.qq.com/a/20180405/000556.htm">封建迷信殡葬用品花样翻新 “冥府户口本”等证照齐全</a>
                                        </li>
                                    </ol>
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
    <%@ include file="footer.jsp"%>


</div>
</body></html>
