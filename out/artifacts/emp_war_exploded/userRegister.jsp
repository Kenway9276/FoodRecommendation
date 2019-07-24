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
					<h3>欢迎 !</h3><br>
					<h4>鲜鲫银丝脍，香芹碧涧羹。</h4><br>
					<h4>蒌蒿满地芦芽短，正是河豚欲上时。</h4><br>
					<h4>烹羊宰牛且为乐，会须一饮三百杯。</h4><br>
					<h4>长江绕郭知鱼美，好竹连山觉笋香。</h4>
					<hr width="400px" color="#FFFFFF">
					<p>无论是干旱贫瘠的土地，还是深不可测的大海，一旦注入人类的智慧，都能变成美食的秘境。</p>
					<br><br>
					<div style="display:${empty ins.aaa101?'none':''};margin-left:30%">
						<input class="btn btn-danger btn-clock"
						type="button" name="next" onclick="javascript:history.back(-1);" value="返回">
					</div>

				</div>
			</div>
			<div class="w3_info">
				<div style="text-align:center">
					<h2>用户${empty ins.aaa101?'注册':'修改' }</h2>
				</div>
				<br><br>
						<div class="input-group">
							<span><i class="fa fa-user" aria-hidden="true"></i></span>
							<e:text id="username-input-text" placeholder="请输入用户名" name="aaa102" required="true" readonly="${empty ins.aaa101 ?false:true}" autofocus="true" defval="${ins.aaa102}"/>
							<p id="username-msg"></p>
						</div>
						<div class="input-group">
							<span><i class="fa fa-star" aria-hidden="true"></i></span>
							<e:text placeholder="请输入昵称" name="aaa103" required="true" defval="${ins.aaa103}"/>
						</div>
						<div style="height:40px;vertical-align:middle" class="input-group">
							<span><i class="fa fa-male" aria-hidden="true"></i></span>
							<e:radio name="aaa104" value="男:1,女:2" defval="1" />
						</div>
						<div class="input-group">
							<span><i class="fa fa-lock" aria-hidden="true"></i></span>
							<input placeholder="请${empty ins.aaa101?'输入':'确认' }密码" name="aaa105" type="password">
						</div>
						<div style="display:${empty ins.aaa101?'none':'show'}" class="input-group">
							<span><i class="fa fa-lock" aria-hidden="true"></i></span>
							<input placeholder="二次确认/修改密码" name="raaa105" type="password">
						</div> 
						<div class="input-group">
							<span><i class="fa fa-envelope" aria-hidden="true"></i></span>
							<e:email placeholder="请输入邮箱" name="aaa106" required="true" defval="${ins.aaa106}"/>
						</div> 
						<div class="input-group">
							<span><i class="fa fa-phone" aria-hidden="true"></i></span>
							<e:text placeholder="请输入手机号" name="aaa107" required="true" defval="${ins.aaa107}" />
						</div>
						<div style="height:40px;vertical-align:middle" class="input-group">
							<span><i class="fa fa-birthday-cake" aria-hidden="true"></i></span>
							<e:date name="aaa108" required="true" defval="${ins.aaa108}" />
						</div>      
							<input id="submit-btn" class="btn btn-danger btn-block" type="submit" name="next" value="${empty ins.aaa101?'注册':'修改' }"
        					formaction="<%=path%>/user${empty ins.aaa101?'Register':'Modify' }.html">      
							<a href="<%=path %>/${empty ins.aaa101?'userLogin.jsp':'logout.html'}">
							<input class="btn btn-danger btn-block" type="button" name="next" value="${empty ins.aaa101?'已有账号，马上登录':'退出登录' }">
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