
<%@ page  language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%String path=request.getContextPath(); %>
<html lang="zh-CN">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312" /> 
	<title>商家登录</title>
	<meta charset="gbk">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<!--图标-->
	<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
	
	<!--布局框架-->
	<link rel="stylesheet" type="text/css" href="css/util.css">
	
	<!--主要样式-->
	<link rel="stylesheet" type="text/css" href="css/main.css">
</head>

<body>
${msg }
<div class="login">
	<div class="container-login100">
		<div class="wrap-login100">
			<div class="login100-pic js-tilt" data-tilt>
				<img src="images/img-01.png" alt="IMG">
			</div>

			<form class="login100-form validate-form" >
				<span class="login100-form-title">
					商家登录
				</span>

				<div class="wrap-input100 validate-input">
					<input class="input100" type="text" name="aab102" required="required" placeholder="商家用户名">
					<span class="focus-input100"></span>
					<span class="symbol-input100">
						<i class="fa fa-user-circle-o" aria-hidden="true"></i>
					</span>
				</div>

				<div class="wrap-input100 validate-input">
					<input class="input100" type="password" name="aab103" required="required" placeholder="商家密码">
					<span class="focus-input100"></span>
					<span class="symbol-input100">
						<i class="fa fa-lock" aria-hidden="true"></i>
					</span>
				</div>
				
				<div class="container-login100-form-btn">
					<input class="login100-form-btn" type="submit" name="next" value="登录"
					 formaction="<%=path%>/busiLogin.html">
				</div>

				<div class="text-center p-t-136">
					<a class="txt2" href="<%=path%>/busiRegister.jsp">
							还没有账号？立即注册
						<i class="fa fa-long-arrow-right m-l-5" aria-hidden="true"></i>
					</a>
				</div>
			</form>
		</div>
	</div>
</div>
<script type="text/javascript">
// window.onload=function()
// {
// 	if(msg!=null&&msg!="")
// 		{
// 		alert(msg)
// 		}
// }

</script>
</body>
</html>