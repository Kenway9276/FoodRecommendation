<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl" prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%String path=request.getContextPath(); %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK" />
<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
<script type="text/javascript">

	  var count=0;
      function onSelect(vstate)
      {
  	    vstate?count++:count--;
  	    var vdel=document.getElementById("del");
  	    vdel.disabled=(count==0);
      }
      
      function onDetail(vaab101)
      {
    	  //查看商家详情
    	 var vform = document.getElementById("myform");
    	 vform.action="<%=path%>/shopinfoFindById.html?aab101="+vaab101;
    	 vform.submit();
      }
      
      function onDelMark(vaaa401)
      {
    	  //取消收藏
    	 var vform = document.getElementById("myform");
    	 vform.action="<%=path%>/markDeleteById.html?aaa401="+vaaa401;
    	 vform.submit();
      }
      
</script>
</head>
<body>
	<form id="myform" action="<%=path%>/markQuery.html" method="post">


		${msg }

		<!-- 临时用户流水号,获取暂未实现获取 -->
		<input type="hidden" name="aaa101" value="1"> <a>我的收藏夹</a> <br>
		<input type="submit" name="next" value="查看收藏夹">


		<c:if test="${rows!=null }">
			<!-- 批量删除 -->
			<input type="submit" id="del" name="next" value="批量删除"
				formaction="<%=path%>/markBatchDelete.html" disabled="disabled">
			<!-- 清空收藏夹 -->
			<input type="submit" id="dell" name="next" value="清空收藏夹"
				formaction="<%=path%>/markDeleteAll.html">
		</c:if>


		<br> <br> <br> <br>

		<c:if test="${rows!=null }">
			<!-- 显示实际查询到的数据 -->
			<c:forEach items="${rows }" var="row" varStatus="vs">
				<br>
				<input type="checkbox" name="idlist" value="${row.aaa401 }"
					onclick="onSelect(this.checked)">
				<br>
				<a href="#" onclick="onDetail('${row.aab101}')">${row.aab104 }</a>
				<br>
				<a>评分: </a>
				<a>${row.aab111 }</a>
				<br>
				<a>地址: </a>
				<a>${row.aab106 }</a>
				<br>
				<a>收藏时间: </a>
				<a>${row.aaa402 }</a>
				<br>
				<a href="#" onclick="onDelMark('${row.aaa401}')">取消收藏</a>
				<br>
			</c:forEach>
		</c:if>





	</form>


</body>
</html>