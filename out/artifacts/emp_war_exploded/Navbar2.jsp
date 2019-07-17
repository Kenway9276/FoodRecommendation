<%@ page  language="java" import="java.util.*" pageEncoding="GBK"%>
<%String path=request.getContextPath(); %>
<html>
<head>
<title>Home</title>
</head>
<body>
	<a href="<%=path %>/userRegister.jsp">
	<input type="button" name="next" value="注册">
	</a> 
	<a href="<%=path %>/userLogin.jsp">
	<input type="button" name="next" value="登录">
	</a> 
	<a href="<%=path %>/userHistory.jsp">
	<input type="button" name="next" value="历史记录">
	</a> 
	<form action="<%=path %>/userLogin.html" method="post">
	<input type="submit" formaction="<%=path %>/userNotice.html" name="next" value="公告">
	</form>
	<a href="<%=path %>/adminLogin.jsp">
	<input type="button" name="next" value="管理员登陆">
	</a> 
	
</body>
</html>