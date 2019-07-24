<%@ page  language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%String path=request.getContextPath(); %>
<html>
<head>
<meta charset="GBK">
<title>商家菜单管理</title>
 <link rel="stylesheet" href="css/busi_style.css">
<script type="text/javascript">
      var count=0;
      function onSelect(vstate)
      {
    	  vstate?count++:count--;
    	  var vdel=document.getElementById("del");
    	  vdel.disabled=(count==0);
      }
      
      function onEdit(vaab201)
      {
    	 var vform = document.getElementById("myform");
    	 vform.action="<%=path%>/busiFindDishById.html?aab201="+vaab201;
    	 //alert(vform.action);
    	 vform.submit();
      }
      function onEditPic(vaab201)
      {
    	 var vform = document.getElementById("myform");
    	 vform.action="<%=path%>/busiDishPic.html?aab201="+vaab201;
    	 //alert(vform.action);
    	 vform.submit();
      }
      
      function onDel(vaab201)
      {
    	 var vform = document.getElementById("myform");
    	 vform.action="<%=path%>/busiDelDishById.html?aab201="+vaab201;
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
body {
    padding: 0;
    margin: 0;
    background: url(<%=path%>/images/9.jpg) no-repeat 0px 0px;
    background-size: cover;
    font-family: 'Raleway', sans-serif;
}
</style>
</head>
<body >
<div class="controls" >
	<input style="display: none;"  class="controls__slider" data-slider type="range" min="300" max="700" step="1" value="600" />
<h2 style="color:#FFF">用户申请订座信息</h2>
<div class="table-wrapper">
<form id="myform" method="post">
    <table class="fl-table">
        <thead>
        <tr>
            <th>序号</th>
	    	<th>用户昵称</th>
	    	<th>用餐日期</th>
	    	<th>用餐人数</th>
	    	<th>订座号</th>
	    	<th></th>
	    	<th></th>
        </tr>
        </thead>
        <tbody>
        <c:choose>
	     <c:when test="${rows!=null }">
	         <!-- 显示实际查询到的数据 -->
		     <c:forEach items="${rows }" var="ins" varStatus="vs">
	    	   	  <tr>
				    <td>${vs.count }</td>
				    <td>${ins.aaa103 }</td>
				    <td>${ins.aac103 }</td>
				    <td>${ins.aac104 }</td>
				    <td>${ins.aac105 }</td>
				    <td>
				      <a href="#" onclick="onAccess('${ins.aac101}')"><button>通过申请</button></a>
				    </td>
				    <td>
				      <a href="#" onclick="onRefuse('${ins.aac101}')"><button>拒绝申请</button></a>
				    </td>
				  </tr>
		      </c:forEach>
		      <!-- 补充空行 -->
		      <c:forEach begin="${fn:length(rows)+1 }" step="1" end="1">
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
    <h2 style="color:#FFF">已通过订座信息</h2>
        <table class="fl-table">
        <thead>
        <tr>
            <th>序号</th>
	    	<th>用户昵称</th>
	    	<th>用餐日期</th>
	    	<th>用餐人数</th>
	    	<th>订座号</th>
        </tr>
        </thead>
        <tbody>
        <c:choose>
	     <c:when test="${rows!=null }">
	         <!-- 显示实际查询到的数据 -->
		     <c:forEach items="${rows }" var="ins" varStatus="vs">
	    	   	  <tr>
				    <td>${vs.count }</td>
				    <td>${ins.aaa103 }</td>
				    <td>${ins.aac103 }</td>
				    <td>${ins.aac104 }</td>
				    <td>${ins.aac105 }</td>
				  </tr>
		      </c:forEach>
		      <!-- 补充空行 -->
		      <c:forEach begin="${fn:length(rows)+1 }" step="1" end="1">
			          <tr>
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
           <input type="submit" id="del" name="next" value="返回" 
           formaction="<%=path%>/busiReturn.html">
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
