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
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" /> 
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
	td div {
	width:650px;
}
</style>
<script type="text/javascript">
</script>
</head>
<body >
<%request.getSession().getAttribute("管理员流水号");%>
<%@ include file="navigate.jsp" %>
<form id="myform" action="<%=path %>/adminReleaseNotice.html" enctype="multipart/form-data" method="post">
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
    <h2 class="docs-header">既有消息，广而告之！</h2>
  </div>
</header>
<section>
  <div class="container">
    <ul class="docs-nav" id="menu-left">
      <li><strong>请开始你的管理！</strong></li>
      <li><a href="<%=path %>/adminInfo.html" class=" ">个人信息</a></li>
      <li><a href="<%=path %>/adminBusiness.jsp" class=" ">商家管理</a></li>
      <li><a href="<%=path %>/adminForum.jsp" class=" ">论坛管理</a></li>
      <li><a href="<%=path %>/adminNotice.jsp" class="selected">公告管理  √</a></li>
      <li><a href="<%=path %>/adminCoupon.jsp" class=" ">优惠券管理</a></li>
    </ul>
    <div class="docs-content">
      <h3 align="center"> 公告管理</h3>
      <div class="adminNotice">
	<table width="90%" style="margin:0 auto">
	  <caption>
	         ${empty ins.aac201?'发布':'修改' }公告
	    <hr width="160">
	  </caption>
	  <tr>
	  	<td>
			<input type="hidden" name="aac401" value="<%=request.getSession().getAttribute("管理员流水号")%>">
	  	</td>
	  </tr>
	  <tr>
  	    <td width=60px>标题</td>
	  	<td>
	  		<e:text name="aac202" required="true" defval="${ins.aac202 }"/>
	  	</td>
	  </tr>
	  <tr>
	    <td style="width:60px">封面</td>
	    <td>
	    <c:choose>
	    	<c:when test="${empty ins.aac201}">
	    		<input type="file" name="aac204" id="myfile">	    	
	    	</c:when>
	    	<c:otherwise>
	    		原封面<br>
	    		<img width="200" src="${ins.aac204 }">
	    		<br>
	    		你希望改成<br>
	    		<input type="file" name="aac204" id="myfile">	    	
	    	</c:otherwise>
	    </c:choose>

	    <br>
		<img src="" id="show" width="200">
		<script type="text/javascript">
			$(function() {
 
				$("#myfile").change(function() {
					var readFile = new FileReader();
					var mfile = $("#myfile")[0].files[0];  //注意这里必须时$("#myfile")[0]，document.getElementById('file')等价与$("#myfile")[0]
					readFile.readAsDataURL(mfile);
					readFile.onload = function() {
						var img = $("#show");
						img.attr("src", this.result);
					}
 
				});
 
			})
		</script>
	    </td>
	   </tr>
	   <tr>
	    <td style="width:60px">正文</td>
	  	<td>
	  		<div id="div1">
    			<p>${ins.aac205 }</p>
   			</div>
   			 <textarea name="aac205" id="text1" style="display:none"></textarea>
    		<% String filePath = request.getSession().getServletContext().getRealPath("/upload");%>
    		<input type="hidden" name="filePath" value="<%=filePath%>">
	  	</td>
	  </tr>
	  <tr>
	    <td style="width:60px">优先级</td>
	    <td>
	  		<e:radio name="aac207" value="普通:0,置顶:1" required="true" defval="${ins.aac207 }"/>
	    </td>
	   </tr>
	   <tr>
	    <td style="width:60px">种类</td>
	  	<td>
	  		<e:radio name="aac206" value="测评文章:1,优惠活动:2,更新维护:3" required="true" defval="${ins.aac206 }" />
	 	 </td>
	  </tr>
	</table>
	<br>
	<br>
<div style="text-align:center">
      <e:hidden name="aac201" value="${ins.aac201 }" />
   	    <c:choose>
	    	<c:when test="${empty ins.aac201}">
       			<button type="submit" name="next">发布</button>	    	
       		</c:when>
	    	<c:otherwise>
	    		<button name="next" type="submit" formaction="<%=path %>/adminNoticeModify.html" formenctype="multipart/form-data">修改</button>
	    	</c:otherwise>
	    </c:choose>
		<a href="<%=path %>/adminNotice.html">
		<button class="btn btn-danger btn-block" name="next">管理</button>
		</a> 
</div>

</div>
</div>
</div>
</section>
 <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="js/wangEditor.js"></script>
<script type="text/javascript">
    var E = window.wangEditor
    var editor = new E('#div1')
    editor.customConfig.uploadImgShowBase64 = true
    var $text1 = $('#text1')
    var $text2 = $('#text2')
    editor.customConfig.onchange = function (html) {
        // 监控变化，同步更新到 textarea
        $text1.val(html)
        $text2.val(editor.txt.text())
    }
    editor.customConfig.menus = [
        'head',  // 标题
        'bold',  // 粗体
        'fontSize',  // 字号
        'fontName',  // 字体
        'italic',  // 斜体
        'underline',  // 下划线
        'strikeThrough',  // 删除线
        'foreColor',  // 文字颜色
        'backColor',  // 背景颜色
        'link',  // 插入链接
        'list',  // 列表
        'justify',  // 对齐方式
        'quote',  // 引用
        'emoticon',  // 表情
        'image',  // 插入图片
        'table',  // 表格
    ]
    editor.create()
    // 初始化 textarea 的值
    $text1.val(editor.txt.html())
    $text2.val(editor.txt.text())


</script>

</form>
</body>
</html>
