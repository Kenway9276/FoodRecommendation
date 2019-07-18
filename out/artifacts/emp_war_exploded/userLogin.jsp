<%@ page  language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
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
</head>
<body>
<div style="color:#FFFFFF">
${msg}
</div>
<br>
<form action="<%=path %>/userLogin.html" method="post">
<div class="signupform">.
<h1></h1>
	<div class="container">
		
		<div class="agile_info">
			<div class="w3l_form">
				<div class="left_grid_info">
					<h3>Welcome !</h3>
					<h4>我们的美食网站是最好的美食网站。</h4>
					<p> Our food website is one of the best.</p>
				</div>
			</div>
			<div class="w3_info">
				<h2>Sign In</h2>
				<p>赶紧登录臭弟弟</p>
						<div class="input-group">
							<span><i class="fa fa-user" aria-hidden="true"></i></span>
							<e:text name="aaa102" required="true" autofocus="true" />
						</div>

						<div class="input-group">
							<span><i class="fa fa-lock" aria-hidden="true"></i></span>
							<input name="aaa105" type="password">
						</div>    
       					<input class="btn btn-danger btn-block" type="submit" name="next" value="登录" >
						<a href="<%=path %>/userRegister.jsp">
						<input class="btn btn-danger btn-block" type="button" name="next" value="注册">
						</a> 
						<div style="display:inline">
						<a href="<%=path %>/busiLogin.jsp">
						<input style="width:49%" class="btn btn-danger btn-block" type="button" name="next" value="商家入口">
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