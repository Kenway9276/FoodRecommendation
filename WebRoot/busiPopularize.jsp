<%@ page  language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%String path=request.getContextPath(); %>
<html>
<head>
<title>Home</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" /> 
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="keywords" content="" />
<link href="<%=path %>/css/font-awesome.min.css" rel="stylesheet" type="text/css" media="all">
<link href="<%=path %>/css/style_login.css" rel="stylesheet" type="text/css" media="all"/>
<link href="http://fonts.googleapis.com/css?family=Raleway:400,500,600,700,800,900" rel="stylesheet">
	<style type="text/css">
	.btn-danger
	{
	background-color: #87CEFA;
	}
	.w3_info h2
	{
	color: #87CEFA;
	}
	i.fa.fa-user
	{
	color: #87CEFA;
	}
	i.fa.fa-lock
	{
	color: #87CEFA;
	}
	#popularizeMonth
	{
	margin-top: 10px;
	}
	body {
    padding: 0;
    margin: 0;
    background: url(<%=path%>/images/9.jpg) no-repeat 0px 0px;
    background-size: cover;
    font-family: 'Raleway', sans-serif;
	}
	</style>
</head>
<body >
<div style="color:#FFFFFF">
${msg}
</div>
<br>
<form method="post">
<div class="signupform">.
<h1></h1>
	<div class="container">
		
		<div class="agile_info">
			<div class="w3l_form">
				<div class="left_grid_info">
					<h3>好的店铺应该让更多的人知道</h3>
				</div>
			</div>
			<div class="w3_info">
				<h2>申请推广</h2>
						<div class="input-group">
							<span><i class="fa fa-user" aria-hidden="true"></i></span>
							<c:if test="${ins.aab402=='0'}"><input type="text" readonly="readonly" name="aab404" value="未进行推广">
				       		</c:if>
				       		<c:if test="${ins.aab402=='1'}"><input type="text" readonly="readonly" name="aab404" value="${ins.aab404}（推广结束时间）">
				       		</c:if>
						</div>
						<div class="input-group" style="height: 40px">
							<span><i class="fa fa-calendar" aria-hidden="true"></i></span>
							<e:select name="popularizeMonth" id="popularizeMonth" value="请选择想要推广的时长:0,一个月:1,三个月:3,六个月:6,九个月:9,十二个月:12"/>
						</div>    
       					<input class="btn btn-danger btn-block" type="submit" name="next" value="申请" formaction="<%=path%>/busiPopularize.html">
						<a href="<%=path %>/busiReturn.html">
						<input class="btn btn-danger btn-block" type="button" name="next" value="返回"
						 formaction="<%=path%>/busiReturn.html" formnovalidate="formnovalidate">
						</a> 
			</div>
									</div>
			<div class="clear"></div>
			</div>
			
		</div>
		<div class="footer">
 </div>
	</form>
	</body>
</html>