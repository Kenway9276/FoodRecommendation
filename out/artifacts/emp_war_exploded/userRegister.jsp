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
<form action="<%=path %>/userRegister.html" method="post">
<div class="signupform">
<h1></h1>
	<div class="container">
		
		<div class="agile_info">
			<div class="w3l_form">
				<div class="left_grid_info">
					<h3>��ӭ !</h3><br>
					<h4>������˿�ڣ����۱̽�����</h4><br>
					<h4>��������«ѿ�̣����Ǻ�������ʱ��</h4><br>
					<h4>������ţ��Ϊ�֣�����һ�����ٱ���</h4><br>
					<h4>�����ƹ�֪������������ɽ�����㡣</h4>
					<hr width="400px" color="#FFFFFF">
					<p>�����Ǹɺ�ƶ�����أ�������ɲ�Ĵ󺣣�һ��ע��������ǻۣ����ܱ����ʳ���ؾ���</p>
					<br><br>
					<div style="display:${empty ins.aaa101?'none':''};margin-left:30%">
						<input class="btn btn-danger btn-clock"
						type="button" name="next" onclick="javascript:history.back(-1);" value="����">
					</div>

				</div>
			</div>
			<div class="w3_info">
				<div style="text-align:center">
					<h2>�û�${empty ins.aaa101?'ע��':'�޸�' }</h2>
				</div>
				<br><br>
						<div class="input-group">
							<span><i class="fa fa-user" aria-hidden="true"></i></span>
							<e:text id="username-input-text" placeholder="�������û���" name="aaa102" required="true" readonly="${empty ins.aaa101 ?false:true}" autofocus="true" defval="${ins.aaa102}"/>
							<p id="username-msg"></p>
						</div>
						<div class="input-group">
							<span><i class="fa fa-star" aria-hidden="true"></i></span>
							<e:text placeholder="�������ǳ�" name="aaa103" required="true" defval="${ins.aaa103}"/>
						</div>
						<div style="height:40px;vertical-align:middle" class="input-group">
							<span><i class="fa fa-male" aria-hidden="true"></i></span>
							<e:radio name="aaa104" value="��:1,Ů:2" defval="1" />
						</div>
						<div class="input-group">
							<span><i class="fa fa-lock" aria-hidden="true"></i></span>
							<input placeholder="��${empty ins.aaa101?'����':'ȷ��' }����" name="aaa105" type="password">
						</div>
						<div style="display:${empty ins.aaa101?'none':'show'}" class="input-group">
							<span><i class="fa fa-lock" aria-hidden="true"></i></span>
							<input placeholder="����ȷ��/�޸�����" name="raaa105" type="password">
						</div> 
						<div class="input-group">
							<span><i class="fa fa-envelope" aria-hidden="true"></i></span>
							<e:email placeholder="����������" name="aaa106" required="true" defval="${ins.aaa106}"/>
						</div> 
						<div class="input-group">
							<span><i class="fa fa-phone" aria-hidden="true"></i></span>
							<e:text placeholder="�������ֻ���" name="aaa107" required="true" defval="${ins.aaa107}" />
						</div>
						<div style="height:40px;vertical-align:middle" class="input-group">
							<span><i class="fa fa-birthday-cake" aria-hidden="true"></i></span>
							<e:date name="aaa108" required="true" defval="${ins.aaa108}" />
						</div>      
							<input id="submit-btn" class="btn btn-danger btn-block" type="submit" name="next" value="${empty ins.aaa101?'ע��':'�޸�' }"
        					formaction="<%=path%>/user${empty ins.aaa101?'Register':'Modify' }.html">      
							<a href="<%=path %>/${empty ins.aaa101?'userLogin.jsp':'logout.html'}">
							<input class="btn btn-danger btn-block" type="button" name="next" value="${empty ins.aaa101?'�����˺ţ����ϵ�¼':'�˳���¼' }">
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
<script src="ajax_js/register_ajax.js"></script>

	</body>
</html>