<%@ page  language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%String path=request.getContextPath(); %>
<html>
<head>
<title>商家详情</title>
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
							<e:text name="aab105" readonly="true" required="true" value="${ins.aab105=='0'?'还未通过审核':'已通过审核'}"/>
						</div>
						<div class="input-group">
							<span><i class="fa fa-star" aria-hidden="true"></i></span>
							<input name="aab111" readonly="readonly" type="text" placeholder="商家评分" value="${ins.aab111}(用户评分)">
						</div>    
       					<input class="btn btn-danger btn-block" type="submit" name="next" value="修改商家账户信息"
       					 formaction="<%=path%>/busiToModifyInfo.html" formnovalidate="formnovalidate">
       					 <input class="btn btn-danger btn-block" type="submit" name="next" value="查看商家页面"
       					 formaction="<%=path%>/shopinfoFindById.html" formnovalidate="formnovalidate">
       					 <input class="btn btn-danger btn-block" type="submit" name="next" value="公告"
       					 formaction="<%=path%>/busiNotice.html" formnovalidate="formnovalidate">
       					 <input class="btn btn-danger btn-block" type="submit" name="next" value="发布优惠券"
       					 formaction="<%=path%>/publishCoupon.jsp" formnovalidate="formnovalidate">
       					 <input class="btn btn-danger btn-block" type="submit" name="next" value="验证优惠券"
       					 formaction="<%=path%>/checkCoupon.jsp" formnovalidate="formnovalidate">
       					 <input class="btn btn-danger btn-block" type="submit" name="next" value="查看优惠券"
       					 formaction="<%=path%>/couponListShop.html" formnovalidate="formnovalidate">
       					 <input class="btn btn-danger btn-block" type="submit" name="next" value="资质证明"
       					 formaction="<%=path%>/busiToCertificationPage.html" formnovalidate="formnovalidate">
       					 <input class="btn btn-danger btn-block" type="submit" name="next" value="环境图"
       					 formaction="<%=path%>/busiToEnvironmentPage.html" formnovalidate="formnovalidate">
       					 <input class="btn btn-danger btn-block" type="submit" name="next" value="推广"
       					 formaction="<%=path%>/busiToPopularize.html">
       					 <input class="btn btn-danger btn-block" type="submit" name="next" value="管理菜单"
       					 formaction="<%=path%>/busiMenuManage.html" formnovalidate="formnovalidate">
       					 <input class="btn btn-danger btn-block" type="submit" name="next" value="用户订座"
       					 formaction="<%=path%>/busiManageReservation.html" formnovalidate="formnovalidate">
       					 <input class="btn btn-danger btn-block" type="submit" name="next" value="登出"
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