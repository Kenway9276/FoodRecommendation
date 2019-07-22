
<%@ page  language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%String path=request.getContextPath(); %>
<html lang="zh-CN">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312" /> 
	<title>�̼ҵ�¼</title>
	<meta charset="gbk">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<!--ͼ��-->
	<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
	
	<!--���ֿ��-->
	<link rel="stylesheet" type="text/css" href="css/util.css">
	
	<!--��Ҫ��ʽ-->
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
					�̼ҵ�¼
				</span>

				<div class="wrap-input100 validate-input">
					<input class="input100" type="text" name="aab102" required="required" placeholder="�̼��û���">
					<span class="focus-input100"></span>
					<span class="symbol-input100">
						<i class="fa fa-user-circle-o" aria-hidden="true"></i>
					</span>
				</div>

				<div class="wrap-input100 validate-input">
					<input class="input100" type="password" name="aab103" required="required" placeholder="�̼�����">
					<span class="focus-input100"></span>
					<span class="symbol-input100">
						<i class="fa fa-lock" aria-hidden="true"></i>
					</span>
				</div>
				
				<div class="container-login100-form-btn">
					<input class="login100-form-btn" type="submit" name="next" value="��¼"
					 formaction="<%=path%>/busiLogin.html">
				</div>

				<div class="text-center p-t-136">
					<a class="txt2" href="<%=path%>/busiRegister.jsp">
							��û���˺ţ�����ע��
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