<%@ page  language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%String path=request.getContextPath(); %>
<html>
<head>
<title>申请推广</title>
</head>

<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta content="width=device-width, initial-scale=1,maximum-scale=1, user-scalable=no" name="viewport" />

<style type="text/css">
body {
	font: 14px/150% microsoft yahei,tahoma;
	}
.clear {
	clear: both
	}
.RadioStyle input {
	display: none
	}
.RadioStyle label {
	border: 1px solid #00a4ff;
	padding: 2px 10px 2px 5px;
	line-height: 28px;
	min-width: 80px;
	text-align: center;
	float: left;
	margin: 2px;
	border-radius: 4px
	}
.RadioStyle input:checked + label {
	background: url(images/ico_checkon.svg) no-repeat right bottom;
	background-size: 21px 21px;
	color: #00a4ff
	}
</style>

<body>
${msg}
<form id="busiRegisterForm" action="<%=path%>/busiPopularize.html" method="post">
<div class="RadioStyle">
    <div class="Block PaddingL">
        <input type="radio" name="popularizeMonth" value="3" id="model1" autofocus="autofocus"/>
        <label for="model1">三个月</label>
        <input type="radio" name="popularizeMonth" value="6" id="model2" />
        <label for="model2">六个月</label>
        <input type="radio" name="popularizeMonth" value="9" id="model3" />
        <label for="model3">九个月</label>
        <input type="radio" name="popularizeMonth" value="12" id="model4" checked />
        <label for="model4">一年</label>
    </div>
</div>
<input type="hidden" name="aab101" value="4">
<table border="1" align="center" width="45%">
	<tr>
     	<td colspan="3" align="center">推广申请</td>
    </tr>
    
   	<tr>
     	<td>推广时长</td>
     	<td>
       		<e:text placeholder="请输入想要申请的月数" name="popularizeMonth" required="true" autofocus="true"/>月 
     	</td>
  	<tr>
     	<td colspan="3" align="center">
     		<input type="submit" name="next" value="申请"
     		 formaction="<%=path%>/busiPopularize.html">
			<a href="<%=path%>/busiModify.jsp">
				<input type="button" name="next" value="返回">
			</a>
     	</td>
  	</tr>
</table>
</form>
</body>
</html>