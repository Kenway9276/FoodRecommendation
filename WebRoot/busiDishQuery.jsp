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
</style>
</head>
<body>
<div class="controls" >
	<input style="display: none;"  class="controls__slider" data-slider type="range" min="300" max="700" step="1" value="600" />
<h2>菜品管理</h2>
<div class="table-wrapper">
<form id="myform" action="<%=path%>/busiQuery.html" method="post">
<input type="hidden" name="aab101" value="${ins.aab101}">
    <table class="fl-table">
        <thead>
        <tr>
            <td colspan="4" align="center">查询条件</td>
        </tr>
        </thead>
        <tbody>
        <tr>
           <td>菜品名</td>
	    	<td>
	      	<e:text name="qaab207"/>
	    	</td>
        </tr>
        <tr>
            <td>口味</td>
	    	<td>
	      	<c:forEach items="${row}" var="ins" varStatus="vs" >
 	   			<c:if test="${ins.sfcode == 'aaa202' }" >
 	   		 		<input type="checkbox" name="qaab204" value="${ins.scode}">${ins.sname}
 	   		 	</c:if>
   			</c:forEach>
	    	</td>
        </tr>
        <tr>
            <td>菜系</td>
	    	<td>
	      	<c:forEach items="${row}" var="ins" varStatus="vs" >
 	   		 	<c:if test="${ins.sfcode == 'aaa203' }"  >
 	   		 		<input type="checkbox" name="qaab205" value="${ins.scode}">${ins.sname}
 	   		 	</c:if>
   			</c:forEach>	
	    	</td>
        </tr>
        <tr>
            <td>种类</td>
	    	<td>
	      	<c:forEach items="${row}" var="ins" varStatus="vs" >
 	   		 	<c:if test="${ins.sfcode == 'aaa204' }"  >
 	   		 		<input type="radio" name="qaab206" value="${ins.scode}">${ins.sname}
 	   		 	</c:if>
   			</c:forEach>
	    	</td>
        </tr>
        <tbody>
    </table>
    <table class="fl-table">
        <thead>
        <tr>
            <th></th>
	    	<th>序号</th>
	    	<th>菜品名</th>
	    	<th>图片</th>
	    	<th>价格</th>
	    	<th>口味</th>
		    <th>菜系</th>
		    <th>种类</th>
	    	<th></th>
        </tr>
        </thead>
        <tbody>
        <c:choose>
	     <c:when test="${rows!=null }">
	         <!-- 显示实际查询到的数据 -->
		     <c:forEach items="${rows}" var="ins" varStatus="vs">
	    	   	  <tr>
				    <td>
				      <input type="checkbox" name="idlist" value="${ins.aab201}"
				             onclick="onSelect(this.checked)" >
				    </td>
				    <td>${vs.count}</td>
				    <td>
				      <!-- #  空锚 -->
				      <a href="#" onclick="onEdit('${ins.aab201}')">${ins.aab207}</a>
				    </td>
				    <td>
				  		<a href="#" onclick="onEditPic('${ins.aab201}')">修改图片</a>
				    </td>
				    <td>${ins.aab203}</td>
				    <td>${ins.aab204}</td>
				    <td>${ins.aab205}</td>
				    <td>${ins.aab206}</td>
				    <td>
				      <a href="#" onclick="onDel('${ins.aab201}')">删除</a>
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
	       <input type="submit" name="next" value="查询">
	       <input type="submit" name="next" value="添加"
	              formaction="<%=path%>/busiToAddDishPage.html">
	       <input type="submit" id="del" name="next" value="删除" 
	              formaction="<%=path%>/busiBatchDelDish.html"  disabled="disabled">
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
