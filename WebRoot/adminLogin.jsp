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
<link href="<%=path %>/css/style_adminLogin.css" rel="stylesheet" type="text/css" media="all"/>
<link href="http://fonts.googleapis.com/css?family=Raleway:400,500,600,700,800,900" rel="stylesheet">
</head>
<body>
<div style="color:#FFFFFF">
${msg}
</div>
<br>
<form action="<%=path %>/adminLogin.html" method="post">
<div class="signupform">
<h1></h1>
	<div class="container">
		
		<div class="agile_info">
			<div class="w3l_form">
				<div class="left_grid_info">
					<h3>��ӭ !</h3><br>
					<h4>ʱ�˲�ʶ����ľ��ֱ������ʼ���ߡ�</h4><br>
					<h4>ɽ����ߣ���������ܹ��²������¹��ġ�</h4><br>
					<hr width="400px" color="#FFFFFF">
					<p>�������'���'һ�ʵ�ʹ�ò��������ڳ����������������۴������������Լ�Ϊ�˵ľ��硣</p>
					<p>��������ع涨</p>
					
				</div>
			</div>
			<div class="w3_info">
				<div style="text-align:center">
					<h2>����Ա��¼</h2>				
				</div>
				<br><br><br>
						<div class="input-group">
							<span><i class="fa fa-user" aria-hidden="true"></i></span>
							<e:text name="aac403" required="true" autofocus="true" />
						</div>

						<div class="input-group">
							<span><i class="fa fa-lock" aria-hidden="true"></i></span>
							<input name="aac404" type="password">
						</div>  
						<input class="btn btn-danger btn-block" type="submit" name="next" value="��¼" >  
						<a href="userLogin.jsp">
							<input class="btn btn-danger btn-block" type="button" name="next"  value="����" >  
						</a>
					
			</div>
									</div>
			<div class="clear"></div>
			</div>
			
		</div>
		<div class="footer">
 </div>
	</div>
	</form>
	</body>
</html>