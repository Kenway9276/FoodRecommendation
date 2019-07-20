<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%String path=request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta name="description" content="">
<meta name="HandheldFriendly" content="True">
<meta name="MobileOptimized" content="320">
<meta name="viewport" content="initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>商家管理</title>
<link rel="alternate" type="application/rss+xml" title="egrappler.com" href="feed/index.html">
<link href="http://fonts.googleapis.com/css?family=Raleway:700,300" rel="stylesheet"
        type="text/css">
<link rel="stylesheet" href="<%=path %>/css/style_adminhp.css">
<link rel="stylesheet" href="<%=path %>/css/prettify.css">
<style type="text/css">
	.selected{
		color:black;
	}
	.adminInfo table{
	border:0 solid;
	}
	table tr:nth-child(odd)
	{
	background:#CCC;
	}
	table tr:nth-child(even)
	{
	background:#ff8040;
	}
		button{
	display:inline-block;
	border:none;
	background-color:#ff8040;
	color:#FFFFFF;
	padding: 12px 28px;
    text-align: center;
    font-size: 16px;
    border-radius:6px;
	}
</style>
<script type="text/javascript">
function onPass(vaab101)
{
	 var vform = document.getElementById("myform");
	 vform.action="<%=path%>/busiPass.html?aab101="+vaab101;
	 //alert(vform.action);
	 vform.submit();
} 
function onEdit(vaab101)
{
	 var vform = document.getElementById("myform");
	 vform.action="<%=path%>/shopinfoFindById.html?aab101="+vaab101;
	 vform.submit();
}
</script>
</head>
<body >
<%Map map=(Map)request.getAttribute("ins") ;
if(map != null){
	request.getSession().setAttribute("管理员流水号", map.get("aac401"));
}
 %>
<%request.getSession().getAttribute("管理员流水号");%>
<%request.getSession().setAttribute("ins", map); %>
<%@ include file="navigate.jsp" %>
<form id="myform" action="<%=path %>/adminBusiness.html" method="post">
<!-- <nav> -->
<!--   <div class="container"> -->
<!--     <h1>Doc</h1> -->
<!--     <div id="menu"> -->
<!--       <ul class="toplinks"> -->
<!--         <li><a href="#">Opineo Website </a></li> -->
<!--         <li><a href="http://www.egrappler.com/">eGrappler</a></li> -->
<!--         <li><a href="../doc-template/docs.jsp">Blue Theme</a></li> -->
<!--         <li><a href="../doc-template-red/docs.jsp">Red Theme</a></li> -->
<!--       </ul> -->
<!--     </div> -->
<!--     <a id="menu-toggle" href="#" class=" ">&#9776;</a> </div> -->
<!-- </nav> -->
<header>
  <div class="container">
    <h2 class="docs-header">
    	不以规矩，不成方圆！
    </h2>
  </div>
</header>
<section>
  <div class="container">
    <ul class="docs-nav" id="menu-left">
      <li><strong>请开始你的管理！</strong></li>
      <li><a href="<%=path %>/adminInfo.html" class=" ">个人信息</a></li>
      <li><a href="<%=path %>/adminBusiness.jsp" class="selected">商家管理  √</a></li>
      <li><a href="<%=path %>/adminForum.jsp" class=" ">论坛管理</a></li>
      <li><a href="<%=path %>/adminNotice.jsp" class=" ">公告管理</a></li>
      <li><a href="<%=path %>/adminCoupon.jsp" class=" ">优惠券管理</a></li>
    </ul>
    <div class="docs-content">
      <div class="adminInfo">
        <p style="background-color:#DCDCDC;width:35%;margin:0 auto" align="center"> 查询待审核的商家</p>
        <br>
        <c:choose>
        	<c:when test="${rows!=null }">
        <c:forEach items="${rows }" var="ins" varStatus="vs">
		 <table id="${ins.aab101 }" style="margin:0 auto" width=50%>
			<tr>
				<td style="color:#FFFFFF;width:30%">
				商家用户名
				</td>
				<td style="color:#FFFFFF;text-align:center">
					${ins.aab102 }
				</td>
			</tr>
			<tr>
				<td style="color:#FFFFFF">
				商家店名
				</td>
				<td style="text-align:center">
					<a style="color:#FFFFFF;text-decoration: none" href="#" onclick="onEdit('${ins.aab101}')">${ins.aab104 }</a>
				</td>
			</tr>
				<tr>
				<td style="color:#FFFFFF">
				资质证明
				</td>
				<td style="color:#FFFFFF">
				<a href="${ins.aab108 }">
				<img src="${ins.aab108 }">
				</a>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
				<a style="color:#FFFFFF" href="#" onclick="onPass('${ins.aab101}')">Pass</a>
				</td>
			</tr>
		</table>
		<br>
      </c:forEach>
        	</c:when>
        	<c:otherwise>
        	</c:otherwise>
        </c:choose>
        <div style="margin:0 auto;width:100px">
                 <button type="submit" name="next">查询</button>
        </div>
</div>
</div>
</div>
</section>
 
</form>

</body>
</html>
