<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: P7XXTMX-G
  Date: 2019/7/12
  Time: 11:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Document Title -->
    <title>BizBlog</title>

    <!-- Favicon -->
    <link rel="shortcut icon" type="image/png" href="dw_assets/images/favicon.png">

    <!--==== Google Fonts ====-->
    <link href="https://fonts.googleapis.com/css?family=Quicksand:300,400,500%7CSpectral:400,400i,500,600,700" rel="stylesheet">

    <!-- CSS Files -->

    <!--==== Bootstrap css file ====-->
    <link rel="stylesheet" href="dw_assets/css/bootstrap.min.css">

    <!--==== Font-Awesome css file ====-->
    <link rel="stylesheet" href="dw_assets/css/font-awesome.min.css">

    <!--==== Animate CSS ====-->
    <link rel="stylesheet" href="dw_assets/plugins/animate/animate.min.css">

    <!--==== Owl Carousel ====-->
    <link rel="stylesheet" href="dw_assets/plugins/owl-carousel/owl.carousel.min.css">

    <!--==== Magnific Popup ====-->
    <link rel="stylesheet" href="dw_assets/plugins/magnific-popup/magnific-popup.css">

    <!--==== Style css file ====-->
    <link rel="stylesheet" href="dw_assets/css/style.css">

    <!--==== Responsive css file ====-->
    <link rel="stylesheet" href="dw_assets/css/responsive.css">

    <!--==== Custom css file ====-->
    <link rel="stylesheet" href="dw_assets/css/custom.css">
</head>
<body>
<%@ include file="navigate.jsp" %>
<!-- Preloader -->
<div class="preloader">
    <div class="preload-img">
        <div class="spinnerBounce">
            <div class="double-bounce1"></div>
            <div class="double-bounce2"></div>
        </div>
    </div>
</div>
<!-- End of Preloader -->

<!-- Nav Search Box -->
<div class="nav-search-box">
    <form>
        <div class="input-group">
            <input type="text" class="form-control" placeholder="eg. feel the love and …">
            <span class="b-line"></span>
            <span class="b-line-under"></span>
            <div class="input-group-append">
                <button type="button" class="btn">
                    <img src="dw_assets/images/search-icon.svg" alt="" class="img-fluid svg">
                </button>
            </div>
        </div>
    </form>
</div>
<!-- End of Nav Search Box -->


<!-- Page title -->
<div class="page-title">
    <div class="container">
        <h2>社区讨论</h2>
        <ul class="nav">
            <li>分享你的故事</li>
        </ul>
    </div>
</div>
<!-- End of Page title -->

<div class="container pt-120 pb-90">
    <div class="row">

        <c:forEach items="${rows }" var="ins" varStatus="vs">
            <!-- Post -->
            <div class="col-md-6">
                <div class="post-default post-has-no-thumb">
                    <div class="post-data">
                        <!-- Title -->
                        <div class="title">
                            <h2><a href="#" onclick="onSelect('${ins.aaa301}')">${ins.aaa303}</a></h2>
                        </div>
                        <!-- Post Meta -->
                        <ul class="nav meta align-items-center">
                            <li class="meta-author">
                                <a href="#">${ins.aaa103}</a>
                            </li>
                            <li class="meta-date"><a href="#">${ins.aaa302}</a></li>
                            <li class="meta-comments"><a href="#"><i class="fa fa-comment"></i> </a></li>
                        </ul>
                        <!-- Post Desc -->
                        <div class="desc">
                            <p>
                                    ${ins.aaa306}
                            </p>
                        </div>
                    </div>
                    <p><a href="#" id="view-more" class="btn btn-primary">view more</a></p>
                    <input type="hidden" id="hidden-title" value="${ins.aaa301}">
                    <c:if test="${ins.isUser == '1'}">
                        <p><a href="#"  onclick="onDel('${ins.aaa301}')" class="btn btn-primary">delete</a></p>
                    </c:if>
                </div>
            </div>
            <!-- End of Post -->
        </c:forEach>

    </div>

</div>



<!-- Back to Top Button -->
<div class="back-to-top d-flex align-items-center justify-content-center">
    <span><i class="fa fa-long-arrow-up"></i></span>
</div>
<!-- End of Back to Top Button -->

<!-- JS Files -->

<!-- ==== ajax ==== -->
<script src="ajax_js/BBS_ajax.js"></script>

<!-- ==== JQuery 1.12.1 js file ==== -->
<script src="dw_assets/js/jquery-1.12.1.min.js"></script>

<!-- ==== Bootstrap js file ==== -->
<script src="dw_assets/js/bootstrap.bundle.min.js"></script>

<!-- ==== Owl Carousel ==== -->
<script src="dw_assets/plugins/owl-carousel/owl.carousel.min.js"></script>

<!-- ==== Magnific Popup ==== -->
<script src="dw_assets/plugins/magnific-popup/jquery.magnific-popup.min.js"></script>

<!-- ==== Script js file ==== -->
<script src="dw_assets/js/scripts.js"></script>

<!-- ==== Custom js file ==== -->
<script src="dw_assets/js/custom.js"></script>
<form action="bBSBrowseSingle.html" method="post" id="tem"></form>
<%String path = request.getContextPath(); %>
<script type="text/javascript">

    function onSelect(aaa301) {
        var form = document.getElementById("tem");
        form.action = "<%=path%>/bBSBrowseSingle.html?aaa301=" + aaa301;
        alert('aaaaa');
        form.submit();

    }
    function onDel(aaa301) {
        var form = document.getElementById("tem");

        // todo 加入用户流水号参数
        form.action = "<%=path%>/bBSDelete.html?aaa301="+aaa301;
        form.submit();
    }

    function onBack() {
        var vform = document.getElementById("comment-form-id");
        var aaa304 =  document.getElementById('comment-content').value;

        vform.action = "<%=path%>/bBSBrowse.html"
        vform.submit();
    }

</script>

<p id="tem-data"></p>
</body>
</html>
