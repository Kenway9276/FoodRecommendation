<%@ page  language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%String path=request.getContextPath(); %>
<html>
<head>
<title>商家登陆</title>
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
	body {
    padding: 0;
    margin: 0;
    background: url(<%=path%>/images/9.jpg) no-repeat 0px 0px;
    background-size: cover;
    font-family: 'Raleway', sans-serif;
}
	</style>
</head>
<body>
<div style="color:#FFFFFF">
${msg}
</div>
<br>
<form action="<%=path %>/busiLogin.html" method="post">
<div class="signupform">.
<h1></h1>
	<div class="container">
		
		<div class="agile_info">
			<div class="w3l_form">
				<div class="left_grid_info">
					<h3>欢迎 !</h3><br>
					<h4>风吹柳花满店香，吴姬压酒唤客尝。</h4><br>
					<h4>堆盘栗子炒深黄，客到长谈素酒尝。</h4><br>
					<hr width="400px" color="#FFFFFF">
					<p>有一千双手，就有一千种味道，中国烹饪，无比神秘，难以复制，从深山到闹市，厨艺的传授，仍然遵循口耳相传，心领神会的传统方式。</p>
				</div>
			</div>
			<div class="w3_info">
				<div style="text-align:center">
					<h2>商家登录</h2>				
				</div>
				<br><br><br>

						<div class="input-group">
							<span><i class="fa fa-user" aria-hidden="true"></i></span>
							<e:text name="aab102" required="true" autofocus="true" placeholder="商家用户名"/>
						</div>
						<div class="input-group">
							<span><i class="fa fa-lock" aria-hidden="true"></i></span>
							<input name="aab103" type="password" required="required" placeholder="商家密码">
						</div>    
       					<input class="btn btn-danger btn-block" type="submit" name="next" value="登录" >
						<a href="<%=path %>/busiRegister.jsp">
						<input class="btn btn-danger btn-block" type="button" name="next" value="注册">
						</a> 
						<div style="display:inline">
						<a href="<%=path %>/userLogin.jsp">
						<input style="width:49%" class="btn btn-danger btn-block" type="button" name="next" value="用户入口">
						</a> 
						<a href="<%=path %>/adminLogin.jsp">
						<input style="width:49%" class="btn btn-danger btn-block" type="button" name="next" value="管理员入口">
						</a> 
						</div>
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