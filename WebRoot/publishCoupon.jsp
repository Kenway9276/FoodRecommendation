<%@ page contentType="text/html;charset=GBK" language="java" %>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%String path=request.getContextPath(); %>
<html>
<head>
<title>商家发布优惠券</title>
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
					<h3 style="margin-top:50px; ">优惠券不只是利益所驱<br>也可以是一份暖人心意</h3>
				</div>
			</div>
			<div class="w3_info" style="-webkit-flex-basis: 60%">
			<form role="form" class="form-horizontal" action="couponPublish.html" method="post" accept-charset="GBK">
    <div class="form-group">
        <label for="coupon-name-input" class="col-sm-2 control-label" style="width:115px;">优惠券名字：</label>
        <div class="col-sm-10">
            <input id="coupon-name-input" class="form-control" type="text" name="aab503" style="width: 100%">
        </div>
    </div>
    <div class="form-group">
        <label for="coupon-money-input" class="col-sm-2 control-label" style="width:115px;">优惠条件：</label>
        <div class="col-sm-10">
            <input id="coupon-money-input" class="form-control" type="text" name="aab505" style="width: 100%">
        </div>
    </div>
    <div class="form-group">
        <label for="coupon-condition-input" class="col-sm-2 control-label" style="width:115px;">优惠金额：</label>
        <div class="col-sm-10">
            <input id="coupon-condition-input" class="form-control" type="text" name="aab504" style="width: 100%">
        </div>
    </div>
    <div class="form-group">
        <label for="coupon-data-input" class="col-sm-2 control-label" style="width:130px;">优惠有效期至：</label>
        <div class="col-sm-10">
            <input id="coupon-data-input" class="form-control" type="date" name="aab506" style="width: 100%">
        </div>
    </div>
    <div class="form-group">
        <label for="coupon-amount-input" class="col-sm-2 control-label" style="width:115px;">优惠券数量：</label>
        <div class="col-sm-10">
            <input id="coupon-amount-input" class="form-control" type="number" name="count" style="width: 100%">
        </div>
    </div>
    <div class="form-group" style="width: 30%;margin: 0 auto;display: inline;">
    	<div style="width:49%;margin-left: 17%;color: #fff;">
        <button type="submit"  class="btn btn-danger btn-block" value="发布" style="background-color: #87CEFA;border-color: #87CEFA;">发布</button>
        </div>
        <div  style="width:49%;margin-left: 17%;">
        <input type="submit" formaction="/emp/busiReturn.html" class="btn btn-danger btn-block" value="返回" style="background-color: #87CEFA;border-color: #87CEFA;">
  		 </div>
    </div>
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