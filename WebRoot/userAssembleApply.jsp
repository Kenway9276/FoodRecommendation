<%@ page  language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%String path=request.getContextPath(); %>
<html>
<head>
<title>拼座申请</title>
</head>
<body>
${ins}
${msg}

<form id="busiRegisterForm" action="<%=path%>/userAssmbleApply.html" method="post">
<input type="hidden" name="aab101" value="${ins.aab101 }">
<table border="1" align="center" width="45%">
	<tr>
     	<td colspan="2" align="center">拼座申请</td>
    </tr>
    <tr>
     	<td>拼座人数</td>
     	<td>
       		<e:text name="aaa504" required="true"/> 
     	</td>
   	</tr>
   	<tr>
     	<td>拼座开始时间</td>
     	<td>
<%--      		<e:date name="aaa502" required="true"/> --%>
       		<input type="datetime-local" name="aaa502" required="required" /> 
     	</td>
   	</tr>
  	<tr>
     	<td>拼座结束时间</td>
     	<td>
<%--      	<e:date name="aaa503" required="true"/> --%>
       		<input type="datetime-local" name="aaa503" required="required"/>
     	</td>
   	</tr>

  	<tr>
     	<td colspan="2" align="center">
     		<input type="submit" name="next" value="申请" formaction="<%=path%>/userAssembleApply.html">
			</a>
     	</td>
  	</tr>
</table>
</form>	
</body>
</html>