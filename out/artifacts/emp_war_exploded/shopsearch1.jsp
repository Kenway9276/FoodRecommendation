<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl" prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%String path=request.getContextPath(); %>
<html>
<head>
<title>店铺详情</title>
<script src="http://libs.baidu.com/jquery/1.10.2/jquery.min.js"></script>
<script>
	$(function(){
		//获取点击事件的对象
		$(".nav li").click(function(){
			//获取要显示或隐藏的对象
			var divShow = $(".content").children('.list');
			//判断当前对象是否被选中，如果没选中的话进入if循环
			if (!$(this).hasClass('selected')) {
				//获取当前对象的索引
				var index = $(this).index();
				//当前对象添加选中样式并且其同胞移除选中样式；
				$(this).addClass('selected').siblings('li').removeClass('selected');
				//索引对应的div块显示
				$(divShow[index]).show();
				//索引对应的div块的同胞隐藏
				$(divShow[index]).siblings('.list').hide();
			}
		});
	});
	
	function onSetMark(vaab101)
    {
  	  //添加到收藏夹
  	 var vform = document.getElementById("myform");
  	 vform.action="<%=path%>/markAdd.html?aab101="+vaab101;
  	 vform.submit();
  	 //返回商家详情页面
  	 vform.action="<%=path%>/shopinfoFindById.html?aab101="+vaab101;
 	 vform.submit();
    }
	
	
	function onDelMark(vaab101)
    {
  	  //取消收藏
  	 var vform = document.getElementById("myform");
  	 vform.action="<%=path%>/markDeleteInShopDetail.html?aab101="+vaab101;
  	 vform.submit();
  	 //返回商家详情页面
  	 vform.action="<%=path%>/shopinfoFindById.html?aab101="+vaab101;
 	 vform.submit();
    }
	
	
	
	
</script>


</head>
<body>



	<form id="myform" action="<%=path%>/shopinfoFind.html" method="post">


		<!-- 临时用户流水号,获取暂未实现获取 -->
		<input type="hidden" name="aaa101" value="2"> ${msg } <br>
		<c:if test="${ins!=null }">
			<br>
			<a>${ins.aab104 }</a>
			<br>
			<a>评分: </a>
			<a>${ins.aab111 }</a>
			<br>
			<a>地址: </a>
			<a>${ins.aab106 }</a>
			<br>
			<a>电话: </a>
			<a>${ins.aab107 }</a>
			<br>
			<input type="submit" name="next" value="写点评">

			<br>
		</c:if>



		<!-- 收藏按钮 -->
		<c:if test="${empty IsMark }">
			<input type="submit" onclick="onSetMark('${ins.aab101}')" value="收藏">
		</c:if>
		<c:if test="${!empty IsMark }">
			<input type="submit" onclick="onDelMark('${ins.aab101}')"
				value="取消收藏">
		</c:if>





		<ul class="nav">
			<li>菜单</li>
			<li>环境图</li>
			<li>资质档案</li>
		</ul>

		<br> <br>
		<div class="content">
			<div class="list ">
				<c:choose>
					<c:when test="${menus!=null }">
						<!-- 显示实际查询到的数据 -->
						<c:forEach items="${menus }" var="menu" varStatus="vs">
							<br>
							<br>
							<a>图片: </a>
							<a>${menu.aab202 }</a>
							<br>
							<a>菜品名: </a>
							<a>${menu.aab207 }</a>
							<br>
							<a>价格: </a>
							<a>${menu.aab203 }</a>
							<br>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<a>该商家尚未上传菜单!</a>
					</c:otherwise>
				</c:choose>
			</div>
			<div class="list">
				<br> <a>${ins.aab109 }</a>
			</div>
			<div class="list">
				<br> <a>${ins.aab108 }</a>
			</div>
		</div>


		<br> <br> <br> <br> <br>


		<c:choose>
			<c:when test="${comments!=null }">
				<!-- 显示实际查询到的数据 -->
				<c:forEach items="${comments }" var="comment" varStatus="vs">
					<br>

					<c:if test="${comment.aaa305=='0' }">

						<a>昵称: </a>
						<a>${comment.aaa103 }</a>
						<br>
						<a>评分: </a>
						<a>${comment.aab307 }</a>
						<br>
						<a>评论内容: </a>
						<a>${comment.aab303 }</a>
						<br>
						<a>图片: </a>
						<a>${comment.aab306 }</a>
						<br>
						<a>时间: </a>
						<a>${comment.aab304 }</a>

					</c:if>


				</c:forEach>
			</c:when>
			<c:otherwise>
				<a>该商家尚未上传菜单!</a>
			</c:otherwise>
		</c:choose>




	</form>


</body>

</html>