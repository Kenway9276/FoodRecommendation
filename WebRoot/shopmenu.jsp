<%@ page  language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%String path=request.getContextPath(); %>
<html lang="en">
<head>
<title>Home</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset=gb2312 /> 
<meta name="keywords" content="" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- bootstrap-css -->
<link href="<%=path%>/css/xzs1_bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<!--// bootstrap-css -->
<!-- css -->
<link rel="stylesheet" href="<%=path%>/css/xzs1_style.css" type="text/css" media="all" />
<!--// css -->
<link rel="stylesheet" href="<%=path%>/css/xzs1_lightbox.css">  
<link rel="stylesheet" href="<%=path%>/css/xzs1_owl.carousel.css" type="text/css" media="all">
<link href="<%=path%>/css/xzs1_owl.theme.css" rel="stylesheet">
<!-- font-awesome icons -->
<link href="<%=path%>/css/xzs1_font-awesome.css" rel="stylesheet"> 
<!-- //font-awesome icons -->
<!-- font -->
<link href="http://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i" rel="stylesheet">
<link href="http://fonts.googleapis.com/css?family=Catamaran:100,200,300,400,500,600,700,800,900" rel="stylesheet">
<!-- //font -->
<script src="<%=path%>/js/xzs1_jquery-1.11.1.min.js"></script>
<script src="<%=path%>/js/xzs1_bootstrap.js"></script>
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
<script>
function onback()
{
	history.back(-1)
}
</script>
<style>
.lb-data .lb-caption {
    font-size: 20px;
    line-height: 1.8em;
    color: #fff;
    letter-spacing: 1px;
}
</style>

<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
<![endif]-->
</head>
<body>
<%@ include file="navigate.jsp" %>
	
	<!-- //services -->
	<!--gallery-->
	<div class="services" id="services">
		<div class="container">
			<div class="w3-welcome-heading">
				<h3>菜&nbsp&nbsp单</h3>
				<div class="more-button" align="center">
				<a href="#" onclick="onback()">返回</a>
				</div>
			</div>
			<div class="agileinfo-gallery">
				
				
				<!-- 显示菜单 -->
				<c:choose>
					<c:when test="${menus!=null }">
						<c:forEach items="${menus }" var="menu" varStatus="vs">
							
							
							<div class="col-md-3 w3-agileits-gallery-grids">
							<a class="wow zoomIn animated" data-wow-delay=".5s" href="<%=path%>/${menu.aab202 }" data-lightbox="example-set" data-title="${menu.aab207 }">
							<img  src="<%=path%>/${menu.aab202 }" width="100%" height="100%" class="img-responsive zoom-img" alt=""/>
							<div class="agile-b-wrapper">
							<h5><span>&yen</span>${menu.aab203 }</h5>
							</div>
							</a>
							</div>
							
						</c:forEach>
					</c:when>
					<c:otherwise>
						<h4>该商家尚未上传菜单!</h4>
					</c:otherwise>
				</c:choose>				


				<div class="clearfix"> </div>
				<script src="js/xzs1_lightbox-plus-jquery.min.js"> </script>
			</div>	
		</div>	
	</div>	
	
	
	<!-- //footer -->
	<script src="<%=path%>/js/xzs1_jarallax.js"></script>
	<script src="<%=path%>/js/xzs1_SmoothScroll.min.js"></script>
	<script type="text/javascript">
		/* init Jarallax */
		$('.jarallax').jarallax({
			speed: 0.5,
			imgWidth: 1366,
			imgHeight: 768
		})
	</script>
	<script src="<%=path%>/js/xzs1_responsiveslides.min.js"></script>
	<script type="text/javascript" src="<%=path%>/js/xzs1_move-top.js"></script>
	<script type="text/javascript" src="<%=path%>/js/xzs1_easing.js"></script>
	<!-- here stars scrolling icon -->
	<script type="text/javascript">
		$(document).ready(function() {
			/*
				var defaults = {
				containerID: 'toTop', // fading element id
				containerHoverID: 'toTopHover', // fading element hover id
				scrollSpeed: 1200,
				easingType: 'linear' 
				};
			*/
								
			$().UItoTop({ easingType: 'easeOutQuart' });
								
			});
	</script>
	<!-- //here ends scrolling icon -->
	<!-- Tabs-JavaScript -->
	<script src="<%=path%>/js/xzs1_owl.carousel.js"></script>  
</body>	
</html>