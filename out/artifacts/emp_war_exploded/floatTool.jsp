<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<style type="text/css">
	.guide{width:60px;margin-left:570px;position:fixed;left:50%;bottom:300px;_position:absolute;_top:expression(documentElement.scrollTop+documentElement.clientHeight - this.clientHeight - 134+'px');display:block;}
	.guide a{display:block;width:60px;height:50px;background:url(images/sprite_v2.png) no-repeat;margin-top:10px;text-decoration:none;font:16px/50px "Microsoft YaHei";text-align:center;color:#fff;border-radius:2px;}
	.guide a span{display:none;text-align:center;}
	.guide a:hover{text-decoration:none;background-color:#39F;color:#fff;}
	.guide a:hover span{display:block;width:60px;background:#324960}
	.guide .top{background-position:-145px -185px;}
	.guide .bottom{background-position:-145px -185px;transform:rotate(180deg);}
</style>
</head>
<body>
<div class="guide">
	<div class="guide-wrap">
		<a href="javascript:window.scrollTo(0,0)" class="top" title="回顶部"><span>回顶部</span></a>
		<a href="#bottom" class="bottom" title="到底部"><span style="transform:rotate(180deg);">到底部</span></a>
	</div>
</div>
</body>
</html>