<%@ page  language="java" import="java.util.*" pageEncoding="GBK"%>
<%String path=request.getContextPath(); %>
<html>
<head>
<title>Home</title>
</head>
<body>
	<a href="<%=path %>/userRegister.jsp">
	<input type="button" name="next" value="ע��">
	</a> 
	<a href="<%=path %>/userLogin.jsp">
	<input type="button" name="next" value="��¼">
	</a> 
	<a href="<%=path %>/userHistory.jsp">
	<input type="button" name="next" value="��ʷ��¼">
	</a> 
	<form action="<%=path %>/userLogin.html" method="post">
	<input type="submit" formaction="<%=path %>/userNotice.html" name="next" value="����">
	</form>
	<a href="<%=path %>/adminLogin.jsp">
	<input type="button" name="next" value="����Ա��½">
	</a> 
	
</body>
</html>