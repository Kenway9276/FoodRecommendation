<%@ page  language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%String path=request.getContextPath(); %>
<html lang="en">
<head>
<meta http-equiv="refresh" content="5;<%=path%>/userApplyAssemble.html">
</head>
<body ��nl��ad="run()">
<div>
����������${ins.aaa103}��ƴ���������ĵȴ��Է���ϵ
</div>
<div>
���������̼�ҳ�棬����<span id="count">5</span>�����ת...
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