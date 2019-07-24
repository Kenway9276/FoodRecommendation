<%@ page  language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%String path=request.getContextPath(); %>
<html>
<head>
<title>申请拼座</title>
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
	.btn-danger 
	{
    background-color: #01cd74;
	}
	</style>
</head>
<body>
<%@ include file="navigate.jsp" %>
<div style="color:#FFFFFF">
${msg}
</div>
<br>
<form method="post">
<input name="aaa101" value="${ains.aaa101}" type="hidden">
<input name="aab101" value="${ins.aab101}" type="hidden">
<div class="signupform" style="margin-top: 10%">.
<h1></h1>
	<div class="container">
		
		<div class="agile_info">
			<div class="w3l_form">
				<div class="left_grid_info">
					<h3>您已申请与${ains.aaa103}的拼座，请耐心等待对方联系</h3>
				</div>
			</div>
			<div class="w3_info">
       					<input  class="btn btn-danger btn-block" type="submit" name="next" formaction="<%=path%>/shopinfoFindById.html" value="返回商家页面" style="margin-top: 25%;">
		
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