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
					<h3>Welcome !</h3>
					<h4>���ǵ���ʳ��վ�������ĵ���ʳ��վ��</h4>
					<p> Our food website is the most intimate food website.</p>
				</div>
			</div>
			<div class="w3_info">
				<h2>Sign In</h2>
				<p>�̼ҵ�¼</p>
						<div class="input-group">
							<span><i class="fa fa-user" aria-hidden="true"></i></span>
							<e:text name="aab102" required="true" autofocus="true" placeholder="�̼��û���"/>
						</div>
						<div class="input-group">
							<span><i class="fa fa-lock" aria-hidden="true"></i></span>
							<input name="aab103" type="password" placeholder="�̼�����">
						</div>    
       					<input class="btn btn-danger btn-block" type="submit" name="next" value="��¼" >
						<a href="<%=path %>/busiRegister.jsp">
						<input class="btn btn-danger btn-block" type="button" name="next" value="ע��">
						</a> 
						<div style="display:inline">
						<a href="<%=path %>/userLogin.jsp">
						<input style="width:49%" class="btn btn-danger btn-block" type="button" name="next" value="�û����">
						</a> 
						<a href="<%=path %>/adminLogin.jsp">
						<input style="width:49%" class="btn btn-danger btn-block" type="button" name="next" value="����Ա���">
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