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
    <title>在线新闻</title>
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
    <link rel="stylesheet" href="http://mat1.gtimg.com/news/vv/styles/news-video.css">
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

            $("#loadmore").click(function () {
                var start = $("#pagesize").val();
                console.log(start);

                $.ajax({
                    type: "POST",
                    url: "/loadmore",
                    data: "start=" + start,
                    success: function(r){
                        if(r.code === 200){

                            var newArr = r.result;

                            for(var i = 0;i<newArr.length;i++){


                                if (newArr[i].newType==1){
                                    var newDiv = document.createElement("div");
                                    newDiv.setAttribute("style","z-index: 98;margin-bottom: 5px;");
                                    $(".wrap-content")[0].insertBefore(newDiv,$(".wrap-content").children()[start]);
                                    newDiv.setAttribute("class","Q-tpList");
                                    newDiv.innerHTML = "<div class=\"Q-tpWrap\">\n" +
                                        "                            <a target=\"_blank\" class=\"pic\" href='"+newArr[i].url+"'><img class=\"picto\" src='"+newArr[i].imgSrc+"' name=\"\"></a>\n" +
                                        "\n" +
                                        "                            <div class=\"text\">\n" +
                                        "                            <em class=\"f14 l24\"><a target=\"_blank\" class=\"linkto\" href='"+newArr[i].url+"'>"+newArr[i].title+"</a></em>\n" +
                                        "                                <div >\n" +
                                        "                                    <div class=\"info\" style=\"margin-top: 75px;\">\n" +
                                        "                                        <span >"+newArr[i].author+"</span>&nbsp;&nbsp;&nbsp;&nbsp;\n" +
                                        "                                        <span class=\"keywords\" style=\"display: inline;\">\n" +
                                        "                                                "+newArr[i].keywords +"  \n" +
                                        "                                        </span>\n" +
                                        "                                    </div>\n" +
                                        "\n" +
                                        "                                    <div class=\"info\" style=\"margin-top: 0px;\">\n" +
                                        "                                        <hr style=\"height:1px;border:none;border-top:1px dashed #0066CC;\"/>\n" +
                                        "                                    </div>\n" +
                                        "\n" +
                                        "                                 </div>\n" +
                                        "                        </div>\n" +
                                        "                        </div>"


                                }else{
                                    var newDiv = document.createElement("div");
                                    newDiv.setAttribute("style","z-index: 96;margin-bottom: 5px;");
                                    $(".wrap-content")[0].insertBefore(newDiv,$(".wrap-content").children()[start]);
                                    newDiv.setAttribute("class","Q-pList");
                                    newDiv.innerHTML ="<div class=\"content\">\n" +
                                        "                                        <em><a target=\"_blank\" style=\"font-size: 18px;margin-bottom: 5px;\" class=\"linkto\" href='"+newArr[i].url+"'>"+newArr[i].title+"</a></em>\n" +
                                        "\n" +
                                        "                                        <ul>\n" +
                                        "                                            <li class=\"pic\"><a target=\"_blank\" href=\"\"><img src='"+newArr[i].imgSrc+"' name=\"\"></a></li>\n" +
                                        "                                            <li class=\"pic\"><a target=\"_blank\" href=\"\"><img src='"+newArr[i].imgSrc2+"' name=\"\"></a></li>\n" +
                                        "                                            <li class=\"pic\"><a target=\"_blank\" href=\"\"><img src='"+newArr[i].imgSrc3+"' name=\"\"></a></li>\n" +
                                        "                                        </ul>\n" +
                                        "\n" +
                                        "                                        <div >\n" +
                                        "                                            <div class=\"info\" style=\"margin-top: 5px;\">\n" +
                                        "                                                <span class=\"from\">"+newArr[i].author+"</span>\n" +
                                        "                                                &nbsp;&nbsp;&nbsp;&nbsp;\n" +
                                        "                                                <span class=\"keywords\" style=\"display: inline;\">"+newArr[i].keywords+"</span>\n" +
                                        "                                            </div>\n" +
                                        "\n" +
                                        "                                            <div class=\"info\" style=\"margin-top: 0px;\">\n" +
                                        "                                                <hr style=\"height:1px;border:none;border-top:1px dashed #0066CC;\"/>\n" +
                                        "                                            </div>\n" +
                                        "\n" +
                                        "                                        </div>\n" +
                                        "\n" +
                                        "\n" +
                                        "                                    </div>";

                                }

                                start++;

                            }


                            $("#pagesize").val(start);

                        }else{
                            alert("加载数据失败，请刷新页面后重试");
                        }
                    }
                });

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
                    <input type="hidden" id="pagesize" value="10"/>
                    <div class="wrap-content">


                        <c:forEach var="otherArticle" items="${otherArticle}">
                            <c:if test="${otherArticle.newType ==1}">

                        <div class="Q-tpList" style="z-index: 98;margin-bottom: 5px;">
                            <div class="Q-tpWrap">
                            <a target="_blank" class="pic" href="${pageContext.request.contextPath}/detail/${otherArticle.id}"><img class="picto" src="${otherArticle.imgSrc}" name=""></a>

                            <div class="text">
                            <em class="f14 l24"><a target="_blank" class="linkto" href="${pageContext.request.contextPath}/detail/${otherArticle.id}">${otherArticle.title}</a></em>
                                <div >
                                    <div class="info" style="margin-top: 75px;">
                                        <span >${otherArticle.author}</span>&nbsp;&nbsp;&nbsp;&nbsp;
                                        <span class="keywords" style="display: inline;">
                                                ${otherArticle.keywords}
                                        </span>
                                    </div>

                                    <div class="info" style="margin-top: 0px;">
                                        <hr style="height:1px;border:none;border-top:1px dashed #0066CC;"/>
                                    </div>

                                 </div>
                        </div>
                        </div></div>

                            </c:if>

                            <c:if test="${otherArticle.newType ==0}">
                                <div class="Q-pList" style="z-index: 96;">
                                    <div class="content">
                                        <em><a target="_blank" style="font-size: 18px;margin-bottom: 5px;" class="linkto" href="${pageContext.request.contextPath}/detail/${otherArticle.id}">${otherArticle.title}</a></em>

                                        <ul>
                                            <li class="pic"><a target="_blank" href="${pageContext.request.contextPath}/detail/${otherArticle.id}"><img src="${otherArticle.imgSrc}" name=""></a></li>
                                            <li class="pic"><a target="_blank" href="${pageContext.request.contextPath}/detail/${otherArticle.id}"><img src="${otherArticle.imgSrc2}" name=""></a></li>
                                            <li class="pic"><a target="_blank" href="${pageContext.request.contextPath}/detail/${otherArticle.id}"><img src="${otherArticle.imgSrc3}" name=""></a></li>
                                        </ul>

                                        <div >
                                            <div class="info" style="margin-top: 5px;">
                                                <span class="from">${otherArticle.author}</span>
                                                &nbsp;&nbsp;&nbsp;&nbsp;
                                                <span class="keywords" style="display: inline;">${otherArticle.keywords}</span>
                                            </div>

                                            <div class="info" style="margin-top: 0px;">
                                                <hr style="height:1px;border:none;border-top:1px dashed #0066CC;"/>
                                            </div>

                                        </div>


                                    </div>

                                </div>
                            </c:if>

                        </c:forEach>


                        <div style="height: 36px;font-size: large;text-align: center;background-color: gainsboro;">
                            <a  href="javascript:;" id="loadmore"  title="点击查看更多"  class="more">点击查看更多</a>
                        </div>


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
                                        <c:forEach var="title" items="${titles}" varStatus="st">
                                            <c:if test="${st.count < 4}">
                                                <li>
                                                    <span class="topRank">${st.count}</span><a target="_blank" href="${title.url}">${title.title}</a>
                                                </li>
                                            </c:if>
                                            <c:if test="${st.count >= 4}">
                                                <li>
                                                    <span >${st.count}</span><a target="_blank" href="${title.url}">${title.title}</a>
                                                </li>
                                            </c:if>

                                         </c:forEach>

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
