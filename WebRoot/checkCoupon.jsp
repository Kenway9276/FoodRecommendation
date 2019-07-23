<%@ page contentType="text/html;charset=GBK" language="java" %>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%String path=request.getContextPath(); %>
<html>
<head>
<title>商家验证优惠券</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" /> 
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="keywords" content="" />
<link href="<%=path %>/css/font-awesome.min.css" rel="stylesheet" type="text/css" media="all">
<link href="<%=path %>/css/style_login.css" rel="stylesheet" type="text/css" media="all"/>
<link href="http://fonts.googleapis.com/css?family=Raleway:400,500,600,700,800,900" rel="stylesheet">
<style type="text/css">
#preview{width:260px;height:190px;border:1px solid #000;overflow:hidden;}
#imghead {filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=image);}
.btn-danger {
    color: #fff;
    background-color: #87CEFA;
    border-color: #87CEFA;
}
body {
    padding: 0;
    margin: 0;
    background: url(<%=path%>/images/9.jpg) no-repeat 0px 0px;
    background-size: cover;
    font-family: 'Raleway', sans-serif;
}
</style>
<title>发布优惠券</title>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<script src="js/jquery-1.11.1.min.js"></script>
<script src="js/bootstrap.js"></script>
<div style="color:#FFFFFF">
${msg}
</div>
<br>

<div class="signupform">.
<h1></h1>
	<div class="container">
		
		<div class="agile_info" style="margin-top:150px">
		<div class="w3l_form" style="-webkit-flex-basis: 40%">
				<div class="left_grid_info">
					<h3 style="margin-top:30px; ">优惠券不只是利益所驱<br>也可以是一份暖人心意</h3>
				</div>
			</div>
			<div class="w3_info" style="-webkit-flex-basis: 60%">
			<form class="form-inline" role="form" method="post" action="couponCheck.html" style="margin: auto;width: 50%;padding: 10px;margin-top: 50px">
        <div class="form-group">
            <label for="coupon-code-input">输入优惠券码</label>
            <input required id="coupon-code-input" type="text" name="aab502" value="${ins.aab502}" class="form-control">
        </div>
        <div class="form-group">
            <button type="submit" class="btn btn-outline-danger"  style="background-color: #87CEFA;border-color: #87CEFA;color:#FFF;width:360%;" value="查询">查询</button>
            
        </div>
    </form>
    <c:if test="${!empty ins}">
        <form method="post" action="couponDelete.html" style="margin: auto;width: 50%;padding: 10px;">
            <input type="hidden" value="${ins.aab501}" name="aab501">
            <p><h3>优惠券名称：${ins.aab503}</h3></p>
            <p><h3>满：${ins.aab504}</h3></p> <p> <h3>减：${ins.aab505}</h3></p>
            <p><button type="submit" class="btn btn-outline-danger"  style="background-color: #87CEFA;border-color: #87CEFA;color:#FFF;width:49%;" value="验证并删除">验证并删除</button></p>
        </form>
    </c:if>
    <c:if test="${!empty msg && empty ins}">
        <div style="margin: auto;width: 50%;padding: 10px;"><h3>没有查询到相关优惠券</h3></div>
    </c:if>
    <form class="form-inline" role="form" method="post" style="margin: auto;width: 50%;padding: 10px;">
        <input type="submit" formaction="/emp/busiReturn.html" class="btn btn-outline-danger"  style="color:#FFF;background-color: #87CEFA;border-color: #87CEFA;width:74%;" value="返回" >
    </form>
			
			</div>
		</div>
			<div class="clear"></div>
			</div>
			
		</div>
		<div class="footer">
 </div>
	</body>
</html>