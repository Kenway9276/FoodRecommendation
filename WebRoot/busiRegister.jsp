<%@ page  language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%String path=request.getContextPath(); %>
<html lang="zh-CN">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312" /> 
	<title>商家注册</title>
	<meta charset="gbk">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<!--图标-->
	<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
	
	<!--布局框架-->
	<link rel="stylesheet" type="text/css" href="css/util.css">
	
	<!--主要样式-->
	<link rel="stylesheet" type="text/css" href="css/main.css">
	<link rel="stylesheet" type="text/css" href="css/nevigation_style.css">
	
	<script type="text/javascript" src="js/jquery-3.2.1.js"></script>
	<script type="text/javascript">
		function check_username(val)
		{
			$.ajax({  
     		  type: "POST",      
      		  url: "check", //看下面xml的配置     
      		  data: "aab102="+val,   //形成一对key-value，提交对象可以通过request.getParameter("username");获得val值
       		 success: function(data){  //提交成功后调用的方法
      		  if(data=="false"){//后台返回表示重名
        	$("#span").html("X");
      		  }
      		  else if(data=="true"){
        			$("#span").html("√");
  
       		 }   
       		 }
	  		  //error://提交失败将调用的方法
     		   });  
		}
</script>
	
</head>

<body>

<%-- <%@include file="nevigation.jsp"%> --%>

<div class="login">
	<div class="container-login100">
		<div class="wrap-login100">
			<div class="login100-pic js-tilt" data-tilt>
				<img src="images/img-01.png" alt="IMG">
			</div>

			<form class="login100-form validate-form" >
				<span class="login100-form-title">
					商家注册(基础信息)
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
				
				<div class="wrap-input100 validate-input">
					<input class="input100" type="text" name="aab104" required="required" placeholder="店铺名">
					<span class="focus-input100"></span>
					<span class="symbol-input100">
						<i class="fa fa-shopping-basket" aria-hidden="true"></i>
					</span>
				</div>
				
				<div class="wrap-input100 validate-input">
					<input class="input100" type="text" name="aab106" required="required" placeholder="地址">
					<span class="focus-input100"></span>
					<span class="symbol-input100">
						<i class="fa fa-map-o" aria-hidden="true"></i>
					</span>
				</div>
				
				<div class="wrap-input100 validate-input">
					<input class="input100" type="text" name="aab107" required="required" placeholder="联系电话">
					<span class="focus-input100"></span>
					<span class="symbol-input100">
						<i class="fa fa-phone" aria-hidden="true"></i>
					</span>
				</div>
				
				<div class="container-login100-form-btn">
					<input class="login100-form-btn" type="submit" name="next" value="注册"
					 formaction="<%=path%>/busiRegister.html">
				</div>

				<div class="text-center p-t-136">
					<a class="txt2" href="<%=path%>/busiLogin.jsp">
							已有账号?立即登录
						<i class="fa fa-long-arrow-right m-l-5" aria-hidden="true"></i>
					</a>
				</div>
			</form>
		</div>
	</div>
</div>

</body>
</html>