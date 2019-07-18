<%@ page  language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>导航</title>

<link rel="stylesheet" href="css/style_nav.css"/>

</head>
<body>

<div class="c-nav">
	<div class="container navFlex">
		<div class="flexItem">
		吃
		</div>
		<div class="flexItem show">
			<ul>
				<li><a href="${empty sessionScope.userID?'userLogin.jsp':'userInfo.html'}">${empty sessionScope.userID?'登录':'个人信息'}</a></li>
				<li><a href="#">搜索</a></li>
				<li><a href="preferenceIndex.html">推荐</a></li>
				<li><a href="#">收藏</a></li>
				<li><a href="bBSBrowse.html">论坛</a></li>
				<li><a href="userHistory.html">历史订单</a></li>
				<li><a href="userNotice.html">公告</a></li>
				<li><a href="couponList.html">优惠券</a></li>
				<li><a href="#">消息</a></li>
			</ul>
		</div>
	</div>
</div>

<script type="text/javascript" src="js/jquery.min.js"></script>
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

</body>
</html>
