<%--
  Created by IntelliJ IDEA.
  User: P7XXTMX-G
  Date: 2019/7/9
  Time: 10:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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


  <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
</head>
<body>
<form class="about-img1">
    <input type="submit" value="我的偏好管理" formaction="<%=path%>/preferenceIndex.html">
    <input type="submit" value="这顿吃什么" formaction="<%=path%>/preferenceIndex.html">
    <input type="submit" value="城市排行榜" formaction="<%=path%>/rankingCity.html">
    <input type="submit" value="人气排行榜" formaction="<%=path%>/rankingPopularity.html">
    <a href="/post.jsp">
        <button>发布帖子</button>
    </a>
    <input type="submit" value="浏览帖子" formaction="<%=path%>/bBSBrowse.html">
    <input type="text" name="aaa301">
    <input type="submit" value="查看帖子" formaction="<%=path%>/bBSBrowseSingle.html">
</form>
</body>
</html>
