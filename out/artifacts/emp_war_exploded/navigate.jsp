<%@ page  language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>导航</title>
	<script type="text/javascript"
			src="http://api.map.baidu.com/api?v=2.0&ak=LtaZG8G4TNzGd6Rs57WGyKMr7Hx7GxbU"></script>
<link rel="stylesheet" href="css/style_nav.css"/>

<style type="text/css">

</style>

</head>
<body>
<div class="c-nav">
	<div class="container navFlex">
		<div class="flexItem">
			食分有料
		</div>
		<div class="flexItem show">
			<ul>
				<li><a href="${empty sessionScope.userID?'userLogin.jsp':'userInfo.html'}">${empty sessionScope.userID?'登录':'个人信息'}</a></li>
				<li><a href="shopsearch.jsp">搜索</a></li>
				<li><a href="bBSBrowseAll.html">美食社区</a></li>
				<li><a href="#" onclick="onSelectRanking()">排行榜</a></li>
				<span style="display:${empty sessionScope.userID?'none':''}">
				<li style="display:${empty sessionScope.adminID?'':'none'}"><a href="preferenceIndex.html">推荐</a></li>
				<li style="display:${empty sessionScope.adminID?'':'none'}"><a href="markQuery.html">收藏</a></li>
				<li style="display:${empty sessionScope.adminID?'':'none'}"><a href="userHistory.html">历史订单</a></li>
				<li style="display:${empty sessionScope.adminID?'':'none'}"><a href="couponList.html">优惠券</a></li>
				<li style="display:${empty sessionScope.adminID?'':'none'}"><a href="messageSearchUnRead.html">消息</a></li>
				<li style="display:${empty sessionScope.adminID?'':'none'}"><a href="userStory.html">关于你</a></li>
				</span>
				<li><a href="userNotice.html">公告</a></li>
				<li style="display:${empty sessionScope.adminID?'none':''}"><a href="adminInfo.html">后台</a></li>
			</ul>
		</div>
	</div>
</div>
<div id="allmap">
</div>

<form id="current-city-form" method="post">

</form>
	<div id="hidden-city-name" style="display: none"></div>

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="ajax_js/BBS_ajax.js"></script>
<script type="text/javascript">
var toggle = true;

$('.btnImg').click(function() {
	if (toggle) {
		$('.btnImg').css("border", "1px solid #b0ccf3");
		toggle = false
	} else {
		$('.btnImg').css("border", "1px solid transparent");
		toggle = true;
	}
	$(".show").slideToggle(300);
})
$(window).resize(function() {
	var windSize = $(window).width();

	if (windSize > 576) {
		$(".show").slideDown(0);
	} else {
		$(".show").slideUp(0);
	}
});
</script>
<!-- 百度地图api获取当前城市 -->
<script type="text/javascript">
	var map = new BMap.Map("allmap");
	var point = new BMap.Point(116.331398,39.897445);
	map.centerAndZoom(point,12);

	function myFun(result){
		var cityName = result.name;
		//document.getElementById("city").innerHTML="当前位置: "+cityName;
		//document.getElementById("cityName").placeholder="当前定位: "+cityName;
		//document.getElementById("localcity").value=cityName;
		$("#hidden-city-name").html(cityName)
	}
	var myCity = new BMap.LocalCity();
	myCity.get(myFun);
</script>
<script type="text/javascript">
	function onSelectRanking() {
		var form = document.getElementById("current-city-form");
		var currentCity = $("#hidden-city-name").html()
		currentCity = encodeURIComponent(currentCity)
		form.action = "/emp/ranking.html?currentCity=" + currentCity;
		form.submit();
	}
</script>
</body>
</html>
