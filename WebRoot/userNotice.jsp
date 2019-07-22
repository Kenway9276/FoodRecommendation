<%@ page  language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%String path=request.getContextPath();%>
<html>
<head>
<title>公告</title>

<style type="text/css">
	td
	{
	border:0;
	text-align:center;
	font-size:17px;
	}
	table tr:nth-child(odd)
	{
	background:#CCC;
	}
	table tr:nth-child(even)
	{
	background:#f33131;
	}
	table
	{
	border:1px solid black;
	}
	h2
	{
	 font-weight: 600;
  	font-family: 'Raleway', sans-serif;
	}
	.section-header .section-title {
  font-size: 44px;
  color: #F33131;
  position: relative;
  padding-bottom: 20px;
  margin: 0 0 20px;  

  border-bottom: 1px solid #E7E7E7;

  display: block;
  text-align: center;
}
</style>
<script type="text/javascript">

function onEdit(vaac201)
{
	 var vform = document.getElementById("myform");
	 vform.action="<%=path%>/findByIdNotice.html?aac201="+vaac201;
	 vform.submit();
}

</script>
</head>
<body>
<%@ include file="navigate.jsp" %>
<form id="myform" action="<%=path %>/userNotice.html" method="post">
<div class="section-header">
	<h2 class="section-title wow fadeInDown">公    告</h2>
</div>
<table width="60%" style="margin:0 auto">
	<tr>
		<td>标题</td>
		<td>发布日期</td>
		<td>种类</td>
		<td>优先级</td>		
	</tr>
  <c:choose>
    <c:when test="${rows!=null }">
        <!-- 显示实际查询到的数据 -->
     <c:forEach items="${rows }" var="ins" varStatus="vs">
   	   	  <tr>
   	   	  	<td style="text-align:left">
				<!-- #  空锚 -->
				<a style="color:#FFFFFF" href="#" onclick="onEdit('${ins.aac201}')">${ins.aac202 }</a>
			</td>
   		    <td style="color:#FFFFFF">${ins.aac203 }</td>
   		    <td style="color:#FFFFFF">		    	
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
		    </td>
   		    <td style="color:#FFFFFF">${ins.aac207==1?"置顶":"普通" }</td>
		  </tr>
      </c:forEach>
    </c:when>
    <c:otherwise>
       <c:forEach begin="1" step="1" end="15">
          <tr>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
          </tr>
       </c:forEach>
    </c:otherwise>
  </c:choose>
</table>
</form>
</body>
</html>