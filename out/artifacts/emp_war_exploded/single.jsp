<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="e" uri="http://org.wangxg/jsp/extl" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%--
  Created by IntelliJ IDEA.
  User: P7XXTMX-G
  Date: 2019/7/12
  Time: 14:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%String path = request.getContextPath(); %>
<html >
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
        <h2>${rows[0].aaa303}</h2>
        <ul class="nav">
            <li>${rows[0].aaa302}</li>
        </ul>
        <ul class="nav">
            <li><a href="bBSBrowse.html">返回首页</a></li>
            <li><a href="post.jsp">发布帖子</a></li>
            <li><a href="bBSBrowseUser.html">查看我发布的帖子</a></li>
        </ul>
        </ul>
    </div>
</div>
<!-- End of Page title -->

<div class="container pt-120 pb-120">
    <div class="row">
        <div class="col-md-10 offset-md-1">
            <div class="post-details-cover post-has-slide-thumb">

                <!-- Post Content -->
                <div class="post-content-cover my-drop-cap">
                    ${rows[0].aaa304}
                </div>
                <!-- End of Post Content -->

                <!-- Comments -->
                <button class="btn btn-comment" type="button" data-toggle="collapse" data-target="#commentToggle" aria-expanded="false" aria-controls="commentToggle">
                    隐藏回复
                </button>
                    <c:if test="${!empty rows[1]}">
                        <div class="collapse show" id="commentToggle">
                            <ul class="post-all-comments">
                                <c:forEach var="i" begin="1" end="${(fn:length(rows)) - 1}">
                                    <li class="single-comment-wrapper">
                                        <!-- Single Comment -->
                                        <div class="single-post-comment">
                                            <!-- Comment Content -->
                                            <div class="comment-content">
                                                <div class="comment-author-name">
                                                    <h6>${rows[i].aaa103}</h6> <span> ${rows[i].aaa302} </span>
                                                </div>
                                                <p>${rows[i].aaa304} </p>
                                            </div>
                                        </div>
                                        <!-- End of Single Comment -->
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                    </c:if>
                <!-- End of Comments -->

                <!-- Comment Form -->
                <div class="post-comment-form-cover">
                    <h3>回复帖子</h3>
                    <form id="comment-form-id" class="comment-form" method="post">
                        <div class="row">
                            <div class="col-md-12">
                                <textarea required id="comment-content" class="form-control"></textarea>
                            </div>
                            <div class="col-md-12">
                                <button onclick="onSubmit('${rows[0].aaa301}')" class="btn btn-primary">提交 </button>
                            </div>
                        </div>
                    </form>
                </div>
                <!-- End of Comment Form -->
            </div>
        </div>
    </div>
</div>





<!-- Back to Top Button -->
<div class="back-to-top d-flex align-items-center justify-content-center">
    <span><i class="fa fa-long-arrow-up"></i></span>
</div>
<!-- End of Back to Top Button -->
<div class="back-to-top d-flex align-items-center justify-content-center">
    <span><i class="fa fa-long-arrow-up"></i></span>
</div>

<!-- JS Files -->

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

<script type="text/javascript">

    function onSubmit(aaa301) {
        var vform = document.getElementById("comment-form-id");
        var aaa304 =  document.getElementById('comment-content').value;

        var path = "<%=path%>/bBSComment.html?aaa304="+aaa304 + "&aaa301="+aaa301

        vform.action = "<%=path%>/bBSComment.html?aaa304="+encodeURI(aaa304) + "&aaa301="+aaa301;
        vform.submit();
    }

    function onBack() {
        var vform = document.getElementById("comment-form-id");
        var aaa304 =  document.getElementById('comment-content').value;

        vform.action = "<%=path%>/bBSBrowse.html"
        vform.submit();
    }

</script>

</body>
</html>