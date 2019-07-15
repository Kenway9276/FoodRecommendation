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
<title>公告管理</title>
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
   
   function onDel(vaac201)
   {
 	 var vform = document.getElementById("myform");
 	 vform.action="<%=path%>/adminDeleteByIdNotice.html?aac201="+vaac201;
 	 vform.submit();
   } 
  
   function onEdit(vaac201)
   {
   	 var vform = document.getElementById("myform");
   	 vform.action="<%=path%>/findByIdNotice.html?aac201="+vaac201;
   	 vform.submit();
   }
</script>
</head>
<body >
${ins }
<br>
<%=request.getSession().getAttribute("ins")%>
<%=request.getSession().getAttribute("管理员流水号")%>
<br>
<form id="myform" action="<%=path %>/adminNotice.html" method="post">
<nav>
  <div class="container">
    <h1>Doc</h1>
    <div id="menu">
      <ul class="toplinks">
        <li><a href="#">Opineo Website </a></li>
        <li><a href="http://www.egrappler.com/">eGrappler</a></li>
        <li><a href="../doc-template/docs.jsp">Blue Theme</a></li>
        <li><a href="../doc-template-red/docs.jsp">Red Theme</a></li>
      </ul>
    </div>
    <a id="menu-toggle" href="#" class=" ">&#9776;</a> </div>
</nav>
<header>
  <div class="container">
    <h2 class="docs-header">既有消息，广而告之！</h2>
  </div>
</header>
<section>
  <div class="container">
    <ul class="docs-nav" id="menu-left">
      <li><strong>请开始你的管理！</strong></li>
      <li><a href="<%=path %>/adminInfo.jsp" class=" ">个人信息</a></li>
      <li><a href="<%=path %>/adminBusiness.jsp" class=" ">商家管理</a></li>
      <li><a href="<%=path %>/adminForum.jsp" class=" ">论坛管理</a></li>
      <li><a href="<%=path %>/adminNotice.jsp" class="selected">公告管理  √</a></li>
      <li><a href="#license" class=" ">优惠券管理</a></li>
    </ul>
    <div class="docs-content">
      <h3 align="center"> 公告管理</h3>
      <div class="adminNotice">
	<table width="100%" align="center">
	  <caption>
	               查询条件
	    <hr width="160">
	  </caption>
	  <tr>
		<td>标题</td>
	    <td>
			<e:text name="qaac202" />
	    </td>
	  </tr>
	  <tr>
	    <td>发布日期</td>
	    <td>
	    	<e:date name="qaac203"/>
	    </td>
	    <td>发布人工号</td>
	  	<td>
	  		<e:text name="qaac402"/>
	  	</td>
	  </tr>
	  <tr>
	    <td>种类</td>
	  	<td>
	  		<e:radio name="qaac206" value="测评文章:1,优惠活动:2,更新维护:3" />
	 	 </td>
	 	<td>优先级</td>
	    <td>
	    	<e:radio name="qaac207" value="普通:0,置顶:1"  />
	    </td>
	  </tr>
	</table>
	<br>
	<br>
<table  width="90%" align="center">
	<caption>
		公告列表
		<hr width=160>
	</caption>
<!-- 系统自动生成公告流水号（aac201），并将管理员流水号（aac401）（只有管理员才可以发布公告）、 -->
<!-- 标题（aac201）、日期时间（aac201）、封面图片（aac201）、正文（aac201）、种类（aac201） -->
<!-- （种类分为测评文章、更新维护、优惠活动等，分别用1、2、3表示）、优先级（aac201）存入公告表ac02中。 -->
<!-- 优先级用0和1分辨，初始都置为0，表示无优先级，都按日期先后排列。优先级为1的则置顶显示， -->
<!-- 相同优先级也按日期先后排列。 -->
	<tr>
		<td>批量删除</td>
		<td>序号</td>
		<td>发布日期</td>
		<td>标题</td>
		<td>种类</td>
		<td>优先级</td>	
	</tr>
  <c:choose>
    <c:when test="${rows!=null }">
        <!-- 显示实际查询到的数据 -->
     <c:forEach items="${rows }" var="ins" varStatus="vs">
   	   	  <tr>
		    <td>
		      <input type="checkbox" name="idlist" value="${ins.aac201 }"
		             onclick="onSelect(this.checked)" >
		    </td>
		    <td>${vs.count }</td>
		    <td>${ins.aac203 }</td>
		    <td><a href="#" onclick="onEdit('${ins.aac201}')">${ins.aac202 }</a></td>
		    <td> 
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
		    <td>${ins.aac207==1?"置顶":"普通" }</td>
		    <td>
		      <a href="#" onclick="onDel('${ins.aac201}')">删除</a>
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
            <td></td>
          </tr>
       </c:forEach>
    </c:otherwise>
  </c:choose>
</table>
<table border="0" width="25%" align="center">
  <tr>
    <td style=" white-space:nowrap;" align="center">
       <button type="submit" name="next">查询</button>
       <button type="submit" id="del" name="next"  
              formaction="<%=path%>/adminDeleteNotice.html"  disabled="disabled">删除</button>
		<button formaction="<%=path %>/adminReleaseNotice.jsp" name="next" >发布</button>
    </td>
  </tr>
</table>

</div>
</div>
</div>
</section>
 

</form>
</body>
</html>
