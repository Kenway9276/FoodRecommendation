<%@ page  language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%String path=request.getContextPath(); %>
<html lang="en">
<head>
<meta http-equiv="refresh" content="5;<%=path%>/userApplyAssemble.html">
</head>
<body οnlοad="run()">
<div>
您已申请与${ins.aaa103}的拼座，请耐心等待对方联系
</div>
<div>
即将返回商家页面，将在<span id="count">5</span>秒后，跳转...
</div>
<form>
<input name="aaa101" value="${ins.aaa101}" type="hidden">
<input name="aab101" value="${ins.aab101}" type="hidden">
</form>
<script type="text/javascript">
	var count =5
	function run(){
		document.getElementById("count").innerHTML = count
		setTimeout("run()",1000)
		count--;
	}
</script>
</body>

</html>