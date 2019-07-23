<%@ page  language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%String path=request.getContextPath(); %>
<html>
<head>
<meta charset="GBK">
<title>用户拼座</title>
 <link rel="stylesheet" href="css/busi_style.css">
<script type="text/javascript">
      var count=0;
      
      function onApply(vaaa501)
      {
    	 var vform = document.getElementById("myform");
    	 vform.action="<%=path%>/userToApplyAssemble.html?aaa501="+vaaa501;
    	 //alert(vform.action);
    	 vform.submit();
      }  
</script>
<style>
*{
    box-sizing: border-box;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
}
body{
    font-family: Helvetica;
    -webkit-font-smoothing: antialiased;
    background: #87CEFA;
}
h2{
    text-align: center;
    font-size: 18px;
    text-transform: uppercase;
    letter-spacing: 1px;
    color: black;
    padding: 30px 0;
}

/* Table Styles */

.table-wrapper{
    margin: 10px 70px 70px;
    box-shadow: 0px 35px 50px rgba( 0, 0, 0, 0.2 );
}

.fl-table {
    border-radius: 5px;
    font-size: 12px;
    font-weight: normal;
    border: none;
    border-collapse: collapse;
    width: 100%;
    max-width: 100%;
    white-space: nowrap;
    background-color: white;
}

.fl-table td, .fl-table th {
    text-align: center;
    padding: 8px;
}

.fl-table td {
    border-right: 1px solid #f8f8f8;
    font-size: 12px;
}

.fl-table thead th {
    color: #ffffff;
    background: #4FC3A1;
}


.fl-table thead th:nth-child(odd) {
    color: #ffffff;
    background: #324960;
}

.fl-table tr:nth-child(even) {
    background: #F8F8F8;
}

/* Responsive */

@media (max-width: 767px) {
    .fl-table {
        display: block;
        width: 100%;
    }
    .table-wrapper:before{
        content: "Scroll horizontally >";
        display: block;
        text-align: right;
        font-size: 11px;
        color: white;
        padding: 0 0 10px;
    }
    .fl-table thead, .fl-table tbody, .fl-table thead th {
        display: block;
    }
    .fl-table thead th:last-child{
        border-bottom: none;
    }
    .fl-table thead {
        float: left;
    }
    .fl-table tbody {
        width: auto;
        position: relative;
        overflow-x: auto;
    }
    .fl-table td, .fl-table th {
        padding: 20px .625em .625em .625em;
        height: 60px;
        vertical-align: middle;
        box-sizing: border-box;
        overflow-x: hidden;
        overflow-y: auto;
        width: 120px;
        font-size: 13px;
        text-overflow: ellipsis;
    }
    .fl-table thead th {
        text-align: left;
        border-bottom: 1px solid #f7f7f9;
    }
    .fl-table tbody tr {
        display: table-cell;
    }
    .fl-table tbody tr:nth-child(odd) {
        background: none;
    }
    .fl-table tr:nth-child(even) {
        background: transparent;
    }
    .fl-table tr td:nth-child(odd) {
        background: #F8F8F8;
        border-right: 1px solid #E6E4E4;
    }
    .fl-table tr td:nth-child(even) {
        border-right: 1px solid #E6E4E4;
    }
    .fl-table tbody td {
        display: block;
        text-align: center;
    }
}
</style>
</head>
<body style="margin-top: -80px">
<div class="controls" >
<%@ include file="navigate.jsp" %>
	<input style="display: none;"  class="controls__slider" data-slider type="range" min="300" max="700" step="1" value="600" />
<h2>拼座查询</h2>
<div class="table-wrapper">
<form id="myform" action="<%=path%>/userAssemble.html" method="post">
<input type="hidden" name="aab101" value="${ins.aab101}">
    <table class="fl-table">
        <thead>
        <tr>
            <td colspan="4" align="center">查询条件</td>
        </tr>
        </thead>
        <tbody>
        <tr>
           	<td>拼座发起人</td>
	    	<td>
	      		<e:text name="qaaa103"/>
	    	</td>
	    	<td>拼座人数</td>
	    	<td>
	      		<e:text name="qaaa504"/>
	    	</td>
        </tr>
        <tr>
           	<td>开始时间</td>
	    	<td>
	      		<input type="datetime-local" name="qaaa502"/>
	    	</td>
	    	<td>结束时间</td>
	    	<td>
	      		<input type="datetime-local"  name="qaaa503"/>
	    	</td>
        </tr>
        <tbody>
    </table>
    <table class="fl-table">
        <thead>
        <tr>
            <th></th>
	    	<th>店铺名</th>
	    	<th>拼座发起人</th>
	    	<th>拼座人数</th>
	    	<th>拼座开始时间</th>
	    	<th>拼座结束时间</th>
		    <th>拼座状态</th>
        </tr>
        </thead>
        <tbody>
        <c:choose>
	     <c:when test="${rows!=null }">
	         <!-- 显示实际查询到的数据 -->
		     <c:forEach items="${rows}" var="ins" varStatus="vs">
	    	   	  <tr>
				    <td>${vs.count}</td>
				    <td>${ins.aab104 }</td>
				    <td>${ins.aaa103 }</td>
				    <td>${ins.aaa504 }</td>
				    <td>${ins.aaa502 }</td>
				    <td>${ins.aaa503 }</td>	
				    <td>
				      <a href="#" onclick="onApply('${ins.aaa501}')"><button>申请拼座</button></a>
				    </td>
				  </tr>
		      </c:forEach>
		      <!-- 补充空行 -->
		      <c:forEach begin="${fn:length(rows)+1 }" step="1" end="15">
			          <tr>
			           	 <td></td>
			             <td></td>
			             <td></td>
			             <td></td>
			             <td></td>
			             <td></td>
			             <td></td>
			          </tr>
		      </c:forEach>
	     </c:when>
	     <c:otherwise>
	        <c:forEach begin="1" step="1" end="15">
	           <tr>
	             <td></td>
	             <td></td>
	             <td></td>
	             <td></td>
	             <td></td>
	             <td></td>
	             <td></td>
	           </tr>
	        </c:forEach>
	     </c:otherwise>
	   </c:choose>
        <tbody>
    </table>
    <table class="fl-table">
        <tbody>
        <tr>
            <td align="center">
	       <input type="submit" name="next" value="查询" formaction="<%=path%>/userAssemble.html">
	       <input type="submit" name="next" value="发起拼座申请" 
	              formaction="<%=path%>/userToAssembleApply.html">
           <input type="submit" name="next" value="返回" 
           formaction="<%=path%>/shopinfoFindById.html">
	    </td>
        </tr>
        <tbody>
    </table>
    </form>
</div>
<script src="js/busi_index.js"></script>
</div>
</body>
</html>
