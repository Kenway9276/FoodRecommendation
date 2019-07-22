<%@ page  language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%String path=request.getContextPath(); %>
<html>
<head>
<meta charset="GBK">
<title>商家菜单管理</title>
<script src="<%=path%>/js/jquery-1.11.1.min.js"></script>
<script src="<%=path%>/js/jquery.validate.maximin.js"></script>
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
    background: rgba( 71, 147, 227, 1);
}
h2{
    text-align: center;
    font-size: 18px;
    text-transform: uppercase;
    letter-spacing: 1px;
    color: white;
    padding: 30px 0;
}

/* Table Styles */

.table-wrapper{
	width:50%;
    margin: 10px 70px 70px;
    box-shadow: 0px 35px 50px rgba( 0, 0, 0, 0.2 );
    position:absolute;
    left:22%;
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
<script>

$('#month').each(function() {
$(this).onlypressPositiveInteger();//只允许输入正整数

});

</script>
</head>
<body>
${Msg }
<%=session.getId() %>
<h2>推广申请</h2>
<div class="table-wrapper">
<form id="myform" action="<%=path%>/busiPopularize.html" method="post">
<input type="hidden" name="aab101" value="${ins.aab101}">
    <table class="fl-table">
<!--         <thead> -->
<!--         <tr> -->
<!--             <th>推广申请</th> -->
<!--         </tr> -->
<!--         </thead> -->
        <tbody>
        <tr>
           <td>推广结束时间</td>
	    	<td>
	      	<c:if test="${ins.aab402=='0'}">推广未生效
       		</c:if>
       		<c:if test="${ins.aab402=='1'}"><input type="text" readonly="readonly" name="aab404" value="${ins.aab404}">
       		</c:if>
	    	</td>
        </tr>
        <tr>
            <td>推广时长</td>
            <td>
	      		<e:select name="popularizeMonth" value=" 请选择想要推广的时长:0,一个月:1,三个月:3,六个月:6,九个月:9,十二个月:12"/>
	    	</td>
        </tr>
        <tr>
            <td colspan="3" align="center">
     		<input type="submit" name="next" value="申请"
     		 formaction="<%=path%>/busiPopularize.html">
			<input class="login100-form-btn" type="submit" name="next" value="返回"
	 			formaction="<%=path%>/busiReturn.html" formnovalidate="formnovalidate">
     	</td>
        </tr>
        <tbody>
    </table>
</div>


</body>
</html>
