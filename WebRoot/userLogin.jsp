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
					<h3>��ӭ !</h3><br>
					<h4>ѩĭ�黨����յ��ޤ�������Դ��̡�</h4><br>
					<h4>������ϸ�����ƣ���β�������͡�</h4><br>
					<hr width="400px" color="#FFFFFF">
					<p>����ˮů���������ʣ������̲�������������＾��������ͷ���ݴ����������������������ڵĻ����</p>
				</div>
			</div>
			<div class="w3_info">
				<div style="text-align:center">
					<h2>�û���¼</h2>				
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
       					<input class="btn btn-danger btn-block" type="submit" name="next" value="��¼" >
						<a href="<%=path %>/userRegister.jsp">
						<input class="btn btn-danger btn-block" type="button" name="next" value="ע��">
						</a> 
						<div style="display:inline">
						<a href="<%=path %>/busiLogin.jsp">
						<input style="width:49%" class="btn btn-danger btn-block" type="button" name="next" value="�̼����">
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