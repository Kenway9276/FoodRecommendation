<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: P7XXTMX-G
  Date: 2019/7/16
  Time: 10:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<script src="js/jquery-1.11.1.min.js"></script>
<script src="js/bootstrap.js"></script>
    <form class="form-inline" role="form" method="post" action="couponCheck.html" style="margin: auto;width: 50%;padding: 10px;">
        <div class="form-group">
            <label for="coupon-code-input">输入优惠券码</label>
            <input required id="coupon-code-input" type="text" name="aab502" value="${ins.aab502}" class="form-control">
        </div>
        <div class="form-group">
            <button type="submit" class="btn btn-outline-danger" value="查询">查询</button>
        </div>
    </form>
    <c:if test="${!empty ins}">
        <form method="post" action="couponDelete.html" style="margin: auto;width: 50%;padding: 10px;">
            <input type="hidden" value="${ins.aab501}" name="aab501">
            <p><h3>优惠券名称：${ins.aab503}</h3></p>
            <p><h3>满：${ins.aab504}</h3></p> <p> <h3>减：${ins.aab505}</h3></p>
            <p><button type="submit" class="btn btn-outline-danger" value="验证并删除">验证并删除</button></p>
        </form>
    </c:if>

</body>
</html>
