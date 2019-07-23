<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: P7XXTMX-G
  Date: 2019/7/9
  Time: 16:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" import="java.util.*" language="java" %>
<%String path=request.getContextPath(); %>
<html>
<head>
    <title>Title</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="utf-8">
    <meta name="keywords" content="" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!-- bootstrap-css -->
    <link href="<%=path%>/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
    <!--// bootstrap-css -->
    <!-- css -->
    <link rel="stylesheet" href="<%=path%>/css/style.css" type="text/css" media="all" />
    <!--// css -->
    <link rel="stylesheet" href="<%=path%>/css/lightbox.css">
    <link rel="stylesheet" href="<%=path%>/css/owl.carousel.css" type="text/css" media="all">
    <link href="<%=path%>/css/owl.theme.css" rel="stylesheet">
    <!-- font-awesome icons -->
    <link href="<%=path%>/css/font-awesome.css" rel="stylesheet">
    <!-- //font-awesome icons -->
    <!-- font -->
    <link href="http://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i" rel="stylesheet">
    <link href="http://fonts.googleapis.com/css?family=Catamaran:100,200,300,400,500,600,700,800,900" rel="stylesheet">
    <!-- //font -->
    <script src="<%=path%>/js/jquery-1.11.1.min.js"></script>
    <script src="<%=path%>/js/bootstrap.js"></script>
    <script type="text/javascript">
        jQuery(document).ready(function($) {
            $(".scroll").click(function(event){
                event.preventDefault();
                $('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
            });
        });
    </script>
    <script>
        $(document).ready(function() {
            $("#owl-demo").owlCarousel({

                autoPlay: 3000, //Set AutoPlay to 3 seconds
                autoPlay:true,
                items : 4,
                itemsDesktop : [640,5],
                itemsDesktopSmall : [414,4]

            });

        });
    </script>

    <script type="text/javascript">
        function rankingToShopDetail(aab101){
            var form = document.getElementById("rank-to-shop-form")
            form.action = "/emp/shopinfoFindById.html?aab101=" + aab101;
            form.submit()
        }
    </script>

    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <![endif]-->
</head>
<body>
<%@ include file="navigate.jsp" %>
<form method="post" id="rank-to-shop-form"></form>
<div class="news" id="news">
    <div class="container">
        <div class="w3-welcome-heading">
            <h3>${title}</h3>
        </div>
        <div class="agile-news-grids">
            <div class="agile-news-grid">
                <c:forEach items="${rows }" var="ins" varStatus="vs">
                    <div class="col-md-6 agile-news-left">
                        <div class="col-md-6 news-left-img" style="background: url(<%=path%>/${ins.aab113 }) no-repeat 0px 0px;background-size: cover;min-height: 200px;">

                        </div>
                        <div class="col-md-6 news-grid-info-bottom">
                            <div class="news-left-top-text">
                                <a href="#" onclick="rankingToShopDetail('${ins.aab101 }')" data-toggle="modal" data-target="#myModal"><br>${ins.aab104 }<br><br></a>
                            </div>
                            <c:if test="${!empty ins.popularity }">
                                <div class="news-grid-info-bottom-text">
                                    <p>人气值：${ins.popularity }</p>
                                </div>
                            </c:if>
                            <div class="news-grid-info-bottom-text">
                                <p>地址：${ins.aab106 }</p>
                            </div>
                            <div class="news-grid-info-bottom-text">
                                <p>评分：${ins.aab111 }</p>
                            </div>
                            <div class="news-grid-info-bottom-text">
                                <p>联系电话：${ins.aab107 }</p>
                            </div>
                        </div>
                        <div class="clearfix"> </div>
                    </div>
                </c:forEach>

                <div class="clearfix"> </div>
            </div>
        </div>
    </div>
</div>
<div class="news" id="news">
    <div class="container">
        <div class="w3-welcome-heading">
            <h3>${title2}</h3>
        </div>
        <div class="agile-news-grids">
            <div class="agile-news-grid">
                <c:forEach items="${rows2 }" var="ins" varStatus="vs">
                    <div class="col-md-6 agile-news-left">
                        <div class="col-md-6 news-left-img" style="background: url(<%=path%>/${ins.aab113 }) no-repeat 0px 0px;background-size: cover;min-height: 200px;">

                        </div>
                        <div class="col-md-6 news-grid-info-bottom">
                            <div class="news-left-top-text">
                                <a href="#" onclick="rankingToShopDetail('${ins.aab101 }')" data-toggle="modal" data-target="#myModal"><br>${ins.aab104 }<br><br></a>
                            </div>
                            <c:if test="${!empty ins.popularity }">
                                <div class="news-grid-info-bottom-text">
                                    <p>人气值：${ins.popularity }</p>
                                </div>
                            </c:if>
                            <div class="news-grid-info-bottom-text">
                                <p>地址：${ins.aab106 }</p>
                            </div>
                            <div class="news-grid-info-bottom-text">
                                <p>评分：${ins.aab111 }</p>
                            </div>
                            <div class="news-grid-info-bottom-text">
                                <p>联系电话：${ins.aab107 }</p>
                            </div>
                        </div>
                        <div class="clearfix"> </div>
                    </div>
                </c:forEach>

                <div class="clearfix"> </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
