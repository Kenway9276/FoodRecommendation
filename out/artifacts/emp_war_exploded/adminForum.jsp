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
<title>论坛管理</title>
<link rel="alternate" type="application/rss+xml" title="egrappler.com" href="feed/index.html">
<link href="http://fonts.googleapis.com/css?family=Raleway:700,300" rel="stylesheet"
        type="text/css">
<link rel="stylesheet" href="<%=path %>/css/style_adminhp.css">
<link rel="stylesheet" href="<%=path %>/css/prettify.css">
<link rel="stylesheet" href="<%=path %>/css/gyn.css">
<style type="text/css">
	.selected{
		color:black;
	}
	.adminNotice table{
	border:1px solid;
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
   var count=0;
   function onSelect(vstate)
   {
 	  vstate?count++:count--;
 	  var vdel=document.getElementById("del");
 	  vdel.disabled=(count==0);
   }
   
   function onDel(vaaa301)
   {
 	 var vform = document.getElementById("myform");
 	 vform.action="<%=path%>/adminDeleteByIdPost.html?aaa301="+vaaa301;
 	 vform.submit();
   } 
  
   function onEdit(vaaa301)
   {
   	 var vform = document.getElementById("myform");
   	 vform.action="<%=path%>/bBSBrowseSingle.html?aaa301="+vaaa301;
   	 vform.submit();
   }
</script>
</head>
<body >
<%request.getSession().getAttribute("ins");%>
<%request.getSession().getAttribute("管理员流水号");%>
<%@ include file="navigate.jsp" %>
<form id="myform" action="<%=path %>/adminForum.html" method="post">
<header>
  <div class="container">
    <h2 class="docs-header">煮酒论英雄~！</h2>
  </div>
</header>
<section>
  <div class="container">
    <ul class="docs-nav" id="menu-left">
      <li><strong>请开始你的管理！</strong></li>
      <li><a href="<%=path %>/adminInfo.html" class=" ">个人信息</a></li>
      <li><a href="<%=path %>/adminBusiness.jsp" class=" ">商家管理</a></li>
      <li><a href="<%=path %>/adminForum.jsp" class="selected">论坛管理  √</a></li>
      <li><a href="<%=path %>/adminNotice.jsp" class=" ">公告管理</a></li>
      <li><a href="<%=path %>/adminCoupon.jsp" class=" ">优惠券管理</a></li>
    </ul>
    <div class="docs-content">
      <h3 align="center"> 论坛管理</h3>
      <div class="adminNotice">
	<table width="100%" align="center">
	  <caption>
	               查询条件
	    <hr width="160">
	  </caption>
	  <tr>
		<td>标题</td>
	    <td>
			<e:text name="qaaa303" />
	    </td>
	    <td>发布人昵称</td>
	  	<td>
	  		<e:text name="qaaa103"/>
	  	</td>
	  </tr>
	  <tr>
	    <td>发布日期(起)</td>
	    <td>
	    	<e:date name="baaa302"/>
	    </td>
	   	<td>发布日期(止)</td>
	    <td>
	    	<e:date name="eaaa302"/>
	    </td>
	   </tr>
	   <tr>
	    <td>正文</td>
	  	<td>
	  		<e:text name="qaaa304"/>
	 	 </td>
	  </tr>
	</table>
	<br>
	<br>
<table  width="100%" align="center">
	<caption>
		帖子列表
		<hr width=160>
	</caption>
<!-- 系统自动生成公告流水号（aac201），并将管理员流水号（aac401）（只有管理员才可以发布公告）、 -->
<!-- 标题（aac201）、日期时间（aac201）、封面图片（aac201）、正文（aac201）、种类（aac201） -->
<!-- （种类分为测评文章、更新维护、优惠活动等，分别用1、2、3表示）、优先级（aac201）存入公告表ac02中。 -->
<!-- 优先级用0和1分辨，初始都置为0，表示无优先级，都按日期先后排列。优先级为1的则置顶显示， -->
<!-- 相同优先级也按日期先后排列。 -->
	<tr>
		<td style="text-align:center">批量删除</td>
		<td style="text-align:center">序号</td>
		<td style="text-align:center">发布日期</td>
		<td style="text-align:center">标题</td>
		<td style="text-align:center">昵称</td>
	</tr>
  <c:choose>
    <c:when test="${rows!=null }">
        <!-- 显示实际查询到的数据 -->
     <c:forEach items="${rows }" var="ins" varStatus="vs">
   	   	  <tr>
		    <td style="text-align:center">
		      <input type="checkbox" name="idlist" value="${ins.aaa301 }"
		             onclick="onSelect(this.checked)" >
		    </td>
		    <td style="text-align:center">${vs.count }</td>
		    <td style="text-align:center">${ins.aaa302 }</td>
		    <td style="width:250px">
			    <c:choose>
			    	<c:when test="${ins.aaa303!=null }">
			    		<a href="#" onclick="onEdit('${ins.aaa301}')">${ins.aaa303 }</a>
			    	</c:when>
			    	<c:otherwise>
			    		${ins.aaa304 }
			    	</c:otherwise>
			    </c:choose>
		    </td>
		    <td style="text-align:center">${ins.aaa103 }</td>
		    <td style="text-align:center">
		      <a href="#" onclick="onDel('${ins.aaa301}')">删除</a>
		    </td>
		  </tr>
      </c:forEach>
      <!-- 补充空行 -->
      <c:forEach begin="${fn:length(rows)+1 }" step="1" end="15">
	          <tr>
	            <td></td>
	            <td></td>
	            <td>吃</td>
	            <td>吃</td>
	            <td>吃</td>
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
          </tr>
       </c:forEach>
    </c:otherwise>
  </c:choose>
</table>
<div style="text-align:center">
       <button type="submit" name="next">查询</button>
       <button type="submit" id="del" name="next"  
              formaction="<%=path%>/adminDeletePost.html"  disabled="disabled">删除</button>
</div>

</div>
</div>
</div>
</section>
 

</form>
</body>
</html>
