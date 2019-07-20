<%@ page  language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%String path=request.getContextPath();%>
<html>
<head>
<title>公告详情</title>
<link href="<%=path %>/css/style_history.css" rel="stylesheet" type="text/css" media="all">
<style type="text/css">
	td{
	border:0;
	}
	table{
	background:#E7E7E7;
	}
	button{
	display:inline-block;
	border:none;
	background-color:#f33131;
	color:#FFFFFF;
	padding: 12px 28px;
    text-align: center;
    font-size: 16px;
    border-radius:8px;
	}
	.guide{width:60px;margin-left:570px;position:fixed;left:50%;bottom:300px;_position:absolute;_top:expression(documentElement.scrollTop+documentElement.clientHeight - this.clientHeight - 134+'px');display:block;}
	.guide a{display:block;width:60px;height:50px;background:url(images/sprite_v2.png) no-repeat;margin-top:10px;text-decoration:none;font:16px/50px "Microsoft YaHei";text-align:center;color:#fff;border-radius:2px;}
	.guide a span{display:none;text-align:center;}
	.guide a:hover{text-decoration:none;background-color:#39F;color:#fff;}
	.guide a:hover span{display:block;width:60px;background:#f33131}
	.guide .top{background-position:-145px -185px;}
	.guide .bottom{background-position:-145px -185px;transform:rotate(180deg);}
</style>
<script type="text/javascript">
function onEdit(vaac201)
{
	 var vform = document.getElementById("myform");
	 vform.action="<%=path%>/adminBeforeNoticeModify.html?aac201="+vaac201;
	 vform.submit();
} 
</script>
</head>
<body>
<%request.getSession().getAttribute("ins");%>
<form id="myform" action="<%=path %>/busiNotice.html" enctype="multipart/form-data" method="post">
<section id="pricing">
	<div class="container">
		<div class="section-header">
			<h2 class="section-title wow fadeInDown">公告详情</h2>
		</div> 
			<div style="width:70%;margin:0 auto" class="row">
					<h4>请务必仔细阅读哦。</h4>
					<ul class="menuPrice">
						<li>
							<a style="text-decoration:none;text-align:center;font-weight:bold" href="#">${ins.aac202 }</a>
						</li>
						<li>
							<a style="text-decoration:none" href="#">&nbsp;&nbsp;&nbsp;发布日期&nbsp;&nbsp;&nbsp;${ins.aac203 }</a>
						</li>
						<li>
							<a style="text-decoration:none;text-align:center" href="#"><img height=300px src="${ins.aac204 }"></a>
						</li>
						<li>
							<a style="text-decoration:none" href="#">&nbsp;&nbsp;&nbsp;正文</a>
						</li>
						<li>
							<div style="background-color: #FFFFFF">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${ins.aac205 }</div>
						</li>
						<li>
							<a style="text-decoration:none" href="#">&nbsp;&nbsp;&nbsp;公告类型&nbsp;&nbsp;
								<c:choose>
						    		<c:when test="${ins.aac206==1 }">
						    			测评文章
						    		</c:when>
						    		<c:when test="${ins.aac206==2 }">
						    			优惠活动
						    		</c:when>
						    		<c:otherwise>
						    			更新维护
						    		</c:otherwise>
					    		</c:choose>
							</a>
						</li>
						<li>
							<a style="text-decoration:none" href="#">&nbsp;&nbsp;&nbsp;优先级别&nbsp;&nbsp;
								${ins.aac207==1?"置顶":"普通" }
							</a>
						</li>
					</ul>

<table border="0" width="100%" align="center">
  <tr>
    <td align="center">
<<<<<<< HEAD
		<button type="submit" formaction="<%=path %>/busiNotice.html" name="next">返回</button>
=======
		<button  type="submit" formaction="<%=path %>/userNotice.html" name="next" id="return">返回</button>
>>>>>>> 89db06d6227f57efde55e453cca40eac4ebf8f78
		<button  name="next" onclick="onEdit('${ins.aac201 }')">编辑</button>
    </td>
  </tr>
</table>
			</div>
			<div class="guide">
	<div class="guide-wrap">
		<a href="javascript:window.scrollTo(0,0)" class="top" title="回顶部"><span>回顶部</span></a>
		<a href="#return" class="bottom" title="到底部"><span style="transform:rotate(180deg);">到底部</span></a>
	</div>
</div>
	</div>
</section>
</form>
</body>
</html>