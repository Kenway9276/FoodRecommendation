<%@ page  language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%String path=request.getContextPath(); %>
<html>
<head>
<title>�̼�ע��</title>
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
i.fa.fa-shopping-basket
{
color: #87CEFA;
}
i.fa.fa-map-o
{
color: #87CEFA;
}
i.fa.fa-phone
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
<form action="<%=path %>/busiRegister.html" method="post">
<div class="signupform">
<h1></h1>
	<div class="container">
		
		<div class="agile_info">
			<div class="w3l_form">
				<div class="left_grid_info">
					<h3>Welcome !</h3>
					<h4>���ǵ���ʳ��վ�������ĵ���ʳ��վ��</h4>
					<p> Our food website is the most intimate food website.</p>
					<br><br>
				</div>
			</div>
			<div class="w3_info">
				<h2>Create Your Account</h2>
				<p>�̼��˻�ע��</p>
						<div class="input-group">
							<span><i class="fa fa-user" aria-hidden="true"></i></span>
							<e:text id="businame-input-text" placeholder="�������̼��û��������ڵ�½�����ɸ��ģ�" name="aab102" required="true" autofocus="true"/>
							<p id="businame-msg"></p>
						</div>
						<div class="input-group">
							<span><i class="fa fa-lock" aria-hidden="true"></i></span>
							<e:text placeholder="�������̼�����" name="aab103" required="true"/>
						</div>
						<div class="input-group">
							<span><i class="fa fa-shopping-basket" aria-hidden="true"></i></span>
							<e:text placeholder="�������̼ҵ�����" name="aab104" required="true"/>
						</div>
						<div class="input-group">
							<span><i class="fa fa-map-o" aria-hidden="true"></i></span>
							<e:text placeholder="�������̼ҵ�ַ����ʽ��xx��+�̼Ҿ����ַ��" name="aab106" required="true"/>
						</div>
						<div class="input-group">
							<span><i class="fa fa-phone" aria-hidden="true"></i></span>
							<e:text placeholder="�������̼���ϵ�绰" name="aab107" required="true"/>
						</div>
							<input id="busi-submit-btn" class="btn btn-danger btn-block" type="submit" name="next" value="ע��"
        					formaction="<%=path%>/busiRegister.html">
							<a href="<%=path %>/busiLogin.jsp">
							<input class="btn btn-danger btn-block" type="button" name="next" value="�����˺ţ����ϵ�¼">
							</a> 
			</div>
			<div class="clear"></div>
			</div>
			
		</div>
		<div class="footer">
 </div>
	</div>
	</form>
<!-- ==== JQuery 1.12.1 js file ==== -->
<script src="dw_assets/js/jquery-1.12.1.min.js"></script>
<script src="ajax_js/busi_register_ajax.js"></script>

	</body>
</html>