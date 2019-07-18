<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="e" uri="http://org.wangxg/jsp/extl" %>
<%--
  Created by IntelliJ IDEA.
  User: P7XXTMX-G
  Date: 2019/7/8
  Time: 15:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page  language="java" import="java.util.*" pageEncoding="GBK"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
${rows }
<%String path=request.getContextPath(); %>

<form id="aaa">
    <c:forEach items="${rows }" var="row" varStatus="vs">
        店名：${row.aab104 }<br>
        菜名：${row.aab207 }<br>
        <input type="hidden" name="aab104"  value="${row.aab104 }">
        <input type="hidden" name="aab101"  value="${row.aab101 }">
        <input type="hidden" name="aab207"  value="${row.aab207 }">
        <input type="hidden" name="aaa202"  value="${row.aaa202 }">
        <input type="hidden" name="aaa203"  value="${row.aaa203 }">
        <input type="hidden" name="aaa204"  value="${row.aaa204 }">
    </c:forEach>
    <c:choose>
        <c:when test="${empty rows}">
            ${msg}
        </c:when>
        <c:otherwise>
            ${row }
            <input type="submit" value="就它了！" formaction="recommendSelect.html">
            <input type="submit" value="下一个" formaction="recommendNext.html">
        </c:otherwise>
    </c:choose>


    <input type="hidden" name="qaaa101" value="<%=request.getSession().getAttribute("用户流水号")%>">
</form>
${rows }
</body>
</html>
