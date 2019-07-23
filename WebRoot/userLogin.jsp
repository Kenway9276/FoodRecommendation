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
					<h3>欢迎 !</h3><br>
					<h4>雪沫乳花浮午盏，蓼茸蒿笋试春盘。</h4><br>
					<h4>白鳞鲙细供春酒，红尾羹香奉晚餐。</h4><br>
					<hr width="400px" color="#FFFFFF">
					<p>春江水暖，刀鱼最鲜；夏天滋补，笋干炖鸡；秋季肥美，鱼头不容错过；冬日最爱，必是那热腾腾的火锅。</p>
				</div>
			</div>
			<div class="w3_info">
				<div style="text-align:center">
					<h2>用户登录</h2>				
				</div>
				<br><br><br>
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