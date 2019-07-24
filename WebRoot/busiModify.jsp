<%@ page  language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%String path=request.getContextPath(); %>
<html>
<head>
<title>�̼�����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" /> 
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="keywords" content="" />
<link href="<%=path %>/css/font-awesome.min.css" rel="stylesheet" type="text/css" media="all">
<link href="<%=path %>/css/style_login.css" rel="stylesheet" type="text/css" media="all"/>
<link href="http://fonts.googleapis.com/css?family=Raleway:400,500,600,700,800,900" rel="stylesheet">
<style type="text/css">
@media (max-width: 992px)
.login100-pic {
    width: 35%;
}
.w3_info h2
{
color: #87CEFA;
}
.btn-danger 
{
    background-color:#87CEFA;
}
i.fa.fa-lock
{
color: #87CEFA;
}
i.fa.fa-star
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
<body  >
<div style="color:#FFFFFF">
${msg}
</div>
<br>
<form action="<%=path %>/busiLogin.html" method="post" style="margin-top:-30px;">
<div class="signupform">.
<h1></h1>
	<div class="container">
		
		<div class="agile_info" style="height:auto">
			<div class="w3l_form">
				<div class="left_grid_info">
					<div class="login100-pic js-tilt" data-tilt>
						<img src="${ins.aab113}" alt="IMG" style="height: 300px">
					</div>
					
				</div>
			</div>
			<div class="w3_info">
				<h2>${ins.aab104 }</h2>
				<input type="hidden" name="aab101" value="${ins.aab101 }">
						<div class="input-group">
							<span><i class="fa fa-lock" aria-hidden="true"></i></span>
							<e:text name="aab105" readonly="true" required="true" value="${ins.aab105=='0'?'��δͨ�����':'��ͨ�����'}"/>
						</div>
						<div class="input-group">
							<span><i class="fa fa-star" aria-hidden="true"></i></span>
							<input name="aab111" readonly="readonly" type="text" placeholder="�̼�����" value="${ins.aab111}(�û�����)">
						</div>    
       					<input class="btn btn-danger btn-block" type="submit" name="next" value="�޸��̼��˻���Ϣ"
       					 formaction="<%=path%>/busiToModifyInfo.html" formnovalidate="formnovalidate">
       					 <input class="btn btn-danger btn-block" type="submit" name="next" value="�鿴�̼�ҳ��"
       					 formaction="<%=path%>/shopinfoFindById.html" formnovalidate="formnovalidate">
       					 <input class="btn btn-danger btn-block" type="submit" name="next" value="����"
       					 formaction="<%=path%>/busiNotice.html" formnovalidate="formnovalidate">
       					 <input class="btn btn-danger btn-block" type="submit" name="next" value="�����Ż�ȯ"
       					 formaction="<%=path%>/publishCoupon.jsp" formnovalidate="formnovalidate">
       					 <input class="btn btn-danger btn-block" type="submit" name="next" value="��֤�Ż�ȯ"
       					 formaction="<%=path%>/checkCoupon.jsp" formnovalidate="formnovalidate">
       					 <input class="btn btn-danger btn-block" type="submit" name="next" value="�鿴�Ż�ȯ"
       					 formaction="<%=path%>/couponListShop.html" formnovalidate="formnovalidate">
       					 <input class="btn btn-danger btn-block" type="submit" name="next" value="����֤��"
       					 formaction="<%=path%>/busiToCertificationPage.html" formnovalidate="formnovalidate">
       					 <input class="btn btn-danger btn-block" type="submit" name="next" value="����ͼ"
       					 formaction="<%=path%>/busiToEnvironmentPage.html" formnovalidate="formnovalidate">
       					 <input class="btn btn-danger btn-block" type="submit" name="next" value="�ƹ�"
       					 formaction="<%=path%>/busiToPopularize.html">
       					 <input class="btn btn-danger btn-block" type="submit" name="next" value="����˵�"
       					 formaction="<%=path%>/busiMenuManage.html" formnovalidate="formnovalidate">
       					 <input class="btn btn-danger btn-block" type="submit" name="next" value="�û�����"
       					 formaction="<%=path%>/busiManageReservation.html" formnovalidate="formnovalidate">
       					 <input class="btn btn-danger btn-block" type="submit" name="next" value="�ǳ�"
       					 formaction="<%=path%>/logout.html" formnovalidate="formnovalidate">
						
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