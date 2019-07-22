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
	background-color: #01cd74;
	}
	.w3_info h2
	{
	color: #01cd74;
	}
	i.fa.fa-user
	{
	color: #01cd74;
	}
	i.fa.fa-lock
	{
	color: #01cd74;
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
					<h3>没有找到合适的？不妨发出申请，静待有缘人</h3>
				</div>
			</div>
			
			<div class="w3_info">
			<div class="input-group">
				<span><i class="fa fa-male" aria-hidden="true" style="margin-top:12px;color:#01cd74"></i></span>
				<input name="aaa504" type="text" required="required" placeholder="拼座人数">
			</div>
			<div class="input-group" style="height:45px">
				<span><i class="fa fa-calendar" aria-hidden="true" style="color:#01cd74" ></i></span>
				<input style="margin-top: 10px" name="aaa502" type="datetime-local" required="required" placeholder="拼座开始时间">(开始时间)
			</div>
			<div class="input-group" style="height:45px">
				<span><i class="fa fa-calendar" aria-hidden="true" style="color:#01cd74"></i></span>
				<input style="margin-top: 10px" name="aaa503" type="datetime-local" required="required" placeholder="拼座结束时间">(结束时间)
			</div>
 					<input class="btn btn-danger btn-block" type="submit" name="next" formaction="<%=path%>/userAssembleApply.html" value="申请">

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