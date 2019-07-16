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
</head>
<body>
    <form method="post" action="couponCheck.html">
        <p>输入优惠券码<input type="text" name="aab502" value="${ins.aab502}"></p>
        <p><input type="submit" value="查询"></p>
    </form>
    <p>${ins}</p>
    <c:if test="${!empty ins}">
        <form method="post" action="couponDelete.html">
            <input type="hidden" value="${ins.aab501}" name="aab501">
            <p>优惠券名称：${ins.aab503}</p>
            <p>满：${ins.aab504}</p> <p> 减：${ins.aab505}</p>
            <p><input type="submit" value="验证并删除"></p>
        </form>
    </c:if>

</body>
</html>
