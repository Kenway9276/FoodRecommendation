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
					��ӭ��${ins.aab104 }
				</span>
				<input type="hidden" name="aab101" value="${ins.aab101 }">
				<div class="wrap-input100 validate-input">
					<input type="text" class="input100" name="aab105" readonly="readonly" value="${ins.aab105=='0'?'��δͨ�����':'��ͨ�����'}" />
					<span class="focus-input100"></span>
					<span class="symbol-input100">
						<i class="fa fa-lock" aria-hidden="true"></i>
					</span>
				</div>
				�û�����
				<div class="wrap-input100 validate-input">
					<input type="text" class="input100" name="aab111" readonly="readonly" value="${ins.aab111}" />
					<span class="focus-input100"></span>
					<span class="symbol-input100">
						<i class="fa fa-star" aria-hidden="true"></i>
					</span>
				</div>
				
				<div class="wrap-input100 validate-input">
					<input class="login100-form-btn" type="submit" name="next" value="�޸��̼��˻���Ϣ"
					 formaction="<%=path%>/busiToModifyInfo.html" formnovalidate="formnovalidate">
				</div>
				<div class="container-login100-form-btn">
					<input class="login100-form-btn" type="submit" name="next" value="����"
					 formaction="<%=path%>/busiNotice.html">
				</div>
				<div class="container-login100-form-btn">
					<input class="login100-form-btn" type="submit" name="next" value="�����Ż�ȯ"
					 formaction="publishCoupon.jsp">
				</div>
				<div class="container-login100-form-btn">
					<input class="login100-form-btn" type="submit" name="next" value="��֤�Ż�ȯ"
					 formaction="checkCoupon.jsp">
				</div>
				<div class="container-login100-form-btn">
					<input class="login100-form-btn" type="submit" name="next" value="�ҵ��Ż�ȯ"
					 formaction="<%=path%>/couponListShop.html">
				</div>
				<br/>
				<div class="wrap-input100 validate-input">
					<input class="login100-form-btn" type="submit" name="next" value="����֤��"
					 formaction="<%=path%>/busiToCertificationPage.html" formnovalidate="formnovalidate">
				</div>
				
				<div class="wrap-input100 validate-input">
					<input class="login100-form-btn" type="submit" name="next" value="����ͼ"
					 formaction="<%=path%>/busiToEnvironmentPage.html" formnovalidate="formnovalidate">
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
				<div class="container-login100-form-btn">
					<input class="login100-form-btn" type="submit" name="next" value="�ǳ�"
					 formaction="<%=path%>/userLogin.jsp" formnovalidate="formnovalidate">
				</div>

			</form>
		</div>
	</div>
</div>

</body>
</html>