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
<!-- <!--     <script type="text/javascript">   --> -->
<!-- //     $(document).ready(function() -->
<!-- //     		{ -->
<!-- // 		        var a = Math.random() + ""          //产生一个随机数   -->
<!-- // 		        var rand1 = a.charAt(5)             //的到这个数的第五个字符(实际还是从0~9的数字)   -->
<!-- // 		        quotes = new Array              //创建消息数组   -->
<!-- // 		        quotes[1] = '语录1'               //这里分配十句随机出现的文本   -->
<!-- // 		        quotes[2] = '语录2'   -->
<!-- // 		        quotes[3] = '语录3'   -->
<!-- // 		        quotes[4] = '语录4'   -->
<!-- // 		        quotes[5] = '语录5'   -->
<!-- // 		        quotes[6] = '语录6'   -->
<!-- // 		        quotes[7] = '语录7'   -->
<!-- // 		        quotes[8] = '语录8'   -->
<!-- // 		        quotes[9] = '语录9'   -->
<!-- // 		        quotes[0] = '语录10'   -->
<!-- // 		        var quote = quotes[rand1]  -->
<!-- //         		document.getElementById("quote").innerHTML=quote;  -->
<!-- //     		}); -->
<!-- //    						//将上面选择的话写进页面   -->
<!-- <!--     </script>   --> -->
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
					<h3>欢迎 !</h3>
					<h4 id="quote"></h4>
					<p> Our food website is the most intimate food website.</p>
				</div>
			</div>
			<div class="w3_info">
				<h2>Sign In</h2>
				<p>商家登录</p>
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