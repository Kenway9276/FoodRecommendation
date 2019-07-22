<%--
  Created by IntelliJ IDEA.
  User: P7XXTMX-G
  Date: 2019/7/16
  Time: 9:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=GBK" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<script src="js/jquery-1.11.1.min.js"></script>
<script src="js/bootstrap.js"></script>
<form role="form" class="form-horizontal" action="couponPublish.html" method="post" accept-charset="GBK">
    <div class="form-group">
        <label for="coupon-name-input" class="col-sm-2 control-label">优惠券名字：</label>
        <div class="col-sm-10">
            <input id="coupon-name-input" class="form-control" type="text" name="aab503" style="width: 50%">
        </div>
    </div>
    <div class="form-group">
        <label for="coupon-money-input" class="col-sm-2 control-label">优惠金额：</label>
        <div class="col-sm-10">
            <input id="coupon-money-input" class="form-control" type="text" name="aab505" style="width: 50%">
        </div>
    </div>
    <div class="form-group">
        <label for="coupon-condition-input" class="col-sm-2 control-label">优惠条件：</label>
        <div class="col-sm-10">
            <input id="coupon-condition-input" class="form-control" type="text" name="aab504" style="width: 50%">
        </div>
    </div>
    <div class="form-group">
        <label for="coupon-data-input" class="col-sm-2 control-label">优惠有效期至：</label>
        <div class="col-sm-10">
            <input id="coupon-data-input" class="form-control" type="date" name="aab506" style="width: 50%">
        </div>
    </div>
    <div class="form-group">
        <label for="coupon-amount-input" class="col-sm-2 control-label">优惠券数量：</label>
        <div class="col-sm-10">
            <input id="coupon-amount-input" class="form-control" type="number" name="count" style="width: 50%">
        </div>
    </div>
    <div class="form-group" style="width: 30%;margin: 0 auto;">
        <button type="submit" class="btn btn-outline-danger" value="发布" >发布</button>
    </div>
</form>
</body>
</html>
