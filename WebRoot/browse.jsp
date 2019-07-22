<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
        <ul class="nav">
            <li><a href="bBSBrowseAll.html">返回首页</a></li>
            <li><a href="post.jsp">发布帖子</a></li>
            <li><a href="bBSBrowseUser.html">查看我发布的帖子</a></li>
        </ul>
    </div>
</div>
<!-- End of Page title -->

<div class="container pt-120 pb-90">
    <div class="row">

        <c:forEach items="${rows }" var="ins" varStatus="vs">
            <c:if test="${vs.count != fn:length(rows)}">

                <!-- Post -->
                <div class="col-md-6">
                    <div class="post-default post-has-no-thumb">
                        <div class="post-data">
                            <!-- Title -->
                            <div class="title">
                                <h2><a href="#" onclick="onSelect('${rows[vs.count - 1].aaa301}')">${ins.aaa303}</a></h2>
                            </div>
                            <!-- Post Meta -->
                            <ul class="nav meta align-items-center">
                                <li class="meta-author">
                                    <a href="#">${rows[vs.count - 1].aaa103}</a>
                                </li>
                                <li class="meta-date"><a href="#">${rows[vs.count - 1].aaa302}</a></li>
                                <li class="meta-comments"><a href="#"><i class="fa fa-comment"></i> </a></li>
                            </ul>
                            <!-- Post Desc -->
                            <div class="desc">
                                <p>
                                        ${rows[vs.count - 1].aaa306}
                                </p>
                            </div>
                        </div>
                        <p><a href="#" id="view-more" onclick="onSelect('${rows[vs.count - 1].aaa301}')" class="btn btn-primary">more</a></p>
                        <input type="hidden" id="hidden-title" value="${rows[vs.count - 1].aaa301}">
                        <c:if test="${rows[vs.count - 1].isUser == '1'}">
                            <p><a href="#"  onclick="onDel('${rows[vs.count - 1].aaa301}')" class="btn btn-primary">delete</a></p>
                        </c:if>
                    </div>
                </div>
                <!-- End of Post -->
            </c:if>

        </c:forEach>
        <%
            List<Map<String,String>> list = (List<Map<String,String>>) request.getAttribute("rows");
            Map<String,String> map = list.get(list.size() - 1);
            request.setAttribute("currentPage", map.get("currentPage"));
            request.setAttribute("totalPages", map.get("totalPages"));
            request.setAttribute("isUser", map.get("isUser"));
        %>
        <c:if test="${isUser != '1'}">
            <div id="page-number" class="post-pagination d-flex justify-content-center">
                <input type="hidden" name="currentPage" value="${currentPage}">
                <span id="current-page" class="current">${currentPage}</span>
                <c:choose>
                    <c:when test="${(currentPage + 3) > totalPages}">
                        <c:forEach begin="${currentPage}" end="${currentPage}" varStatus="vs">
                            <a id="selectable-page" class="page-btn" href="#">${currentPage + vs.count}</a>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <a id="selectable-page" class="page-btn" href="#">${currentPage + 1}</a>
                        <a id="selectable-page" class="page-btn" href="#">${currentPage + 2}</a>
                        <a id="selectable-page" class="page-btn" href="#">${currentPage + 3}</a>
                    </c:otherwise>
                </c:choose>
            </div>
        </c:if>

    </div>
</div>



<!-- Back to Top Button -->
<div class="back-to-top d-flex align-items-center justify-content-center">
    <span><i class="fa fa-long-arrow-up"></i></span>
</div>
<!-- End of Back to Top Button -->

<!-- JS Files -->

<script type="text/javascript" src="ajax_js/BBS_ajax.js"></script>

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
        form.submit();

    }
    function onDel(aaa301) {
        var form = document.getElementById("tem");

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

</body>
</html>
