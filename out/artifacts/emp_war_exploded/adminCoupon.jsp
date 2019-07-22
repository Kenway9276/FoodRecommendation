<%@ page  language="java" import="java.util.*" pageEncoding="GBK"%>
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
<title>优惠券管理</title>
<link rel="alternate" type="application/rss+xml" title="egrappler.com" href="feed/index.html">
<link href="http://fonts.googleapis.com/css?family=Raleway:700,300" rel="stylesheet"
        type="text/css">
<link rel="stylesheet" href="<%=path %>/css/style_adminhp.css">
<link rel="stylesheet" href="<%=path %>/css/prettify.css">
<style type="text/css">
	.selected{
		color:black;
	}
	.adminNotice table{
	border:1px solid;
	}
	thead {
    color: #ffffff;
    background: #ff8040;
	}
	.forSubmit{
	display:inline-block;
	border:none;
	background-color:#ff8040;
	color:#FFFFFF;
	padding: 12px 28px;
    text-align: center;
    font-size: 16px;
    border-radius:6px;
	}
	.forSelect{
	display:inline-block;
	border:none;
	background-color:#324960;
	color:#FFFFFF;
	padding: 8px 8px;
    text-align: center;
    font-size: 10px;
    border-radius:4px;
	}
</style>
<script type="text/javascript">
   var count=0;
   function onSelect(vstate)
   {
 	  vstate?count++:count--;
 	  var vdel=document.getElementById("del");
 	  vdel.disabled=(count==0);
   }
   
   function onDel(vaab501)
   {
 	 var vform = document.getElementById("myform");
 	 vform.action="<%=path%>/adminDeleteByIdCoupon.html?aab501="+vaab501;
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
<%request.getSession().getAttribute("ins");%>
<%request.getSession().getAttribute("管理员流水号");%>
<%@ include file="navigate.jsp" %>
<%@ include file="floatTool.jsp" %>
<form id="myform" action="<%=path %>/adminCoupon.html" method="post">
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
    <h2 class="docs-header">人无利己，谁肯早起！</h2>
  </div>
</header>
<section>
  <div class="container">
    <ul class="docs-nav" id="menu-left">
      <li><strong>请开始你的管理！</strong></li>
      <li><a href="<%=path %>/adminInfo.html" class=" ">个人信息</a></li>
      <li><a href="<%=path %>/adminBusiness.html" class=" ">商家管理</a></li>
      <li><a href="<%=path %>/adminForum.html" class=" ">论坛管理</a></li>
      <li><a href="<%=path %>/adminNotice.html" class=" ">公告管理</a></li>
      <li><a href="<%=path %>/adminCoupon.html" class="selected">优惠券管理  √</a></li>
    </ul>
    <div class="docs-content">
      <h3 align="center"> 优惠券管理</h3>
      <div class="adminNotice">
	<table width="100%" align="center">
	  <caption>
	               查询条件
	    <hr width="160">
	  </caption>
	  <tr>
		<td>店铺名</td>
	    <td>
			<e:text name="qaab104" />
	    </td>
	    <td>优惠券名</td>
	    <td>
	    	<e:text name="qaab503" />
	    </td>
	   </tr>
	   <tr>
	    <td>优惠券码</td>
	  	<td>
	  		<e:text name="qaab502"/>
	  	</td>
	    <td>金额</td>
	  	<td>
	  		<e:text name="qaab504"/>
	 	 </td>
	  </tr>
	  <tr>
	 	<td>优惠条件</td>
	    <td>
	    	<e:text name="qaab505"/>
	    </td>
	    <td>过期时间</td>
	    <td>
	    	<e:date name="qaab506"/>
	    </td>
	  </tr>
	</table>
	<br>
	<br>
<table  width="90%" style="margin:0 auto">
	<caption>
		优惠券列表
		<hr width=160>
	</caption>
<!-- 系统自动生成公告流水号（aac201），并将管理员流水号（aac401）（只有管理员才可以发布公告）、 -->
<!-- 标题（aac201）、日期时间（aac201）、封面图片（aac201）、正文（aac201）、种类（aac201） -->
<!-- （种类分为测评文章、更新维护、优惠活动等，分别用1、2、3表示）、优先级（aac201）存入公告表ac02中。 -->
<!-- 优先级用0和1分辨，初始都置为0，表示无优先级，都按日期先后排列。优先级为1的则置顶显示， -->
<!-- 相同优先级也按日期先后排列。 -->
	<thead>
	<tr>
		<td style="width:80px;text-align:center">批量删除</td>
		<td style="text-align:center">序号</td>
		<td style="text-align:center">店铺名</td>
		<td style="text-align:center">优惠券码</td>
		<td style="text-align:center">优惠券名</td>
		<td style="text-align:center">优惠内容</td>
		<td></td>	
	</tr>
	</thead>
  <c:choose>
    <c:when test="${rows!=null }">
        <!-- 显示实际查询到的数据 -->
     <c:forEach items="${rows }" var="ins" varStatus="vs">
   	   	  <tr>
		    <td>
		      <input type="checkbox" name="idlist" value="${ins.aab501 }"
		             onclick="onSelect(this.checked)" >
		    </td>
		    <td style="text-align:center">${vs.count }</td>
		    <td style="text-align:center"><a href="#" onclick="onEdit('${ins.aab101}')">${ins.aab104 }</a></td>
		    <td style="text-align:center">${ins.aab502 }</td>
		    <td style="text-align:center">${ins.aab503 }</td>
		    <td style="text-align:center">满${ins.aab505 }减${ins.aab504 }</td>
		    <td style="width:40px;text-align:center">
		      <a href="#" onclick="onDel('${ins.aab501}')"><button class="forSelect">删除</button></a>
		    </td>
		  </tr>
      </c:forEach>
      <!-- 补充空行 -->
      <c:forEach begin="${fn:length(rows)+1 }" step="1" end="15">
	          <tr>
	            <td></td>
	            <td></td>
	            <td style="text-align:center">吃</td>
	            <td style="text-align:center">吃</td>
	            <td style="text-align:center">吃</td>
	            <td style="text-align:center">吃</td>
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
            <td></td>
            <td></td>
          </tr>
       </c:forEach>
    </c:otherwise>
  </c:choose>
</table>
<div style="text-align:center">
       <button type="submit" name="next" id="bottom" class="forSubmit">查询</button>
       <button type="submit" id="del" name="next" class="forSubmit" 
              formaction="<%=path%>/adminDeleteCoupon.html"  disabled="disabled">删除</button>
</div>
</div>
</div>
</div>
</section>
 

</form>
</body>
</html>
