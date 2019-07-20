<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: P7XXTMX-G
  Date: 2019/7/17
  Time: 15:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%@ include file="navigate.jsp" %>
${rows}
<p>我们已陪你走过${rows[0].days}天</p>
<p>你存储了${rows[0].preferences}种口味</p>
<p>进行了${rows[0].books}次订座</p>
<p>走过了${rows[0].cities}个城市</p>

<p>盛宴饕餮，你最中意——${rows[0].aaa203}</p>
<p>金樽清酒、玉盘珍馐，你却独爱——${rows[0].aaa204}</p>
<span>口味万千，你最喜欢——${rows[0].aaa202}</span>
</body>
</html>
