<%@ page  language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%String path=request.getContextPath(); %>
<html lang="zh-CN">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312" /> 
	<title>�̼�ע��</title>
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

<div class="login">
	<div class="container-login100">
		<div class="wrap-login100">
			<div class="login100-pic js-tilt" data-tilt>
				<img src="${ins.aab113}" alt="IMG">
			</div>

			<form class="login100-form validate-form" >
				<span class="login100-form-title">
					�̼���Ϣ
				</span>
				<div class="wrap-input100 validate-input">
					<input class="login100-form-btn" type="submit" name="next" value="�޸��û�ͷ��"
					 formaction="<%=path%>/busiToAddProfilPicturePage.html" formnovalidate="formnovalidate">
				</div>
				<input type="hidden" name="aab101" value="2">
				<div class="wrap-input100 validate-input">
					<input type="text" class="input100" name="aab102" required="required" readonly="readonly" value="${ins.aab102}" />
					<span class="focus-input100"></span>
					<span class="symbol-input100">
						<i class="fa fa-envelope" aria-hidden="true"></i>
					</span>
				</div>

				<div class="wrap-input100 validate-input">
					<input type="text" class="input100" name="aab103" required="required" value="${ins.aab103}" />
					<span class="focus-input100"></span>
					<span class="symbol-input100">
						<i class="fa fa-lock" aria-hidden="true"></i>
					</span>
				</div>
				
				<div class="wrap-input100 validate-input">
					<input type="text" class="input100" name="aab104" required="required" value="${ins.aab104}" />
					<span class="focus-input100"></span>
					<span class="symbol-input100">
						<i class="fa fa-lock" aria-hidden="true"></i>
					</span>
				</div>
				
				<div class="wrap-input100 validate-input">
					<input type="text" class="input100" name="aab106" required="required" value="${ins.aab106}" />
					<span class="focus-input100"></span>
					<span class="symbol-input100">
						<i class="fa fa-lock" aria-hidden="true"></i>
					</span>
				</div>
				
				<div class="wrap-input100 validate-input">
					<input type="text" class="input100" name="aab107" required="required" value="${ins.aab107}" />
					<span class="focus-input100"></span>
					<span class="symbol-input100">
						<i class="fa fa-lock" aria-hidden="true"></i>
					</span>
				</div>
				
				<div class="wrap-input100 validate-input">
					<input class="login100-form-btn" type="submit" name="next" value="����֤��"
					 formaction="<%=path%>/busiToCertificatePage.html" formnovalidate="formnovalidate">
				</div>
				
				<div class="wrap-input100 validate-input">
					<input class="login100-form-btn" type="submit" name="next" value="����ͼ"
					 formaction="<%=path%>/busiToEnvironmentPage.html" formnovalidate="formnovalidate">
				</div>
				
				<div class="wrap-input100 validate-input">
					<e:radio  name="aab110" value="��:0,��:1" defval="${empty ins.aab101?'1':ins.aab110}"/>
					<span class="focus-input100"></span>
					<span class="symbol-input100">
						<i class="fa fa-lock" aria-hidden="true"></i>
					</span>
				</div>
				
				<div class="wrap-input100 validate-input">
					<input type="text" class="input100" name="aab112" required="required" value="${ins.aab112}" />
					<span class="focus-input100"></span>
					<span class="symbol-input100">
						<i class="fa fa-lock" aria-hidden="true"></i>
					</span>
				</div>
				
				
				<div class="container-login100-form-btn">
					<input class="login100-form-btn" type="submit" name="next" value="�޸�"
					 formaction="<%=path%>/busiModify.html">
				</div>
				<div class="container-login100-form-btn">
					<input class="login100-form-btn" type="submit" name="next" value="�ƹ�"
					 formaction="<%=path%>/busiToPopularize.html">
				</div>
				<div class="container-login100-form-btn">
					<input class="login100-form-btn" type="submit" name="next" value="����˵�"
					 formaction="<%=path%>/busiMenuManage.html" formnovalidate="formnovalidate">
				</div>
				<div class="container-login100-form-btn">
					<input class="login100-form-btn" type="submit" name="next" value="�û�����"
					 formaction="<%=path%>/busiManageReservation.html" formnovalidate="formnovalidate">
				</div>

			</form>
		</div>
	</div>
</div>

</body>
</html>