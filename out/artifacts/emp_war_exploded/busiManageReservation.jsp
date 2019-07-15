<%@ page  language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%String path=request.getContextPath(); %>
<html>
<head>
   <title>Insert title here</title>
   <style type="text/css">
     tr
     {
        height:25px;
     }
   </style>
   
   <script type="text/javascript">
      var count=0;
      function onSelect(vstate)
      {
    	  vstate?count++:count--;
    	  var vdel=document.getElementById("del");
    	  vdel.disabled=(count==0);
      }
      
      function onAccess(vaac101)
      {
    	 var vform = document.getElementById("myform");
    	 vform.action="<%=path%>/busiAccessReservation.html?aac101="+vaac101;
    	 //alert(vform.action);
    	 vform.submit();
      }
      
      function onRefuse(vaac101)
      {
    	 var vform = document.getElementById("myform");
    	 vform.action="<%=path%>/busiRefuseReservation.html?aac101="+vaac101;
    	 //alert(vform.action);
    	 vform.submit();
      }
      
   </script>
</head>
<body>
${msg }
<br>

<br>
<form id="myform" action="<%=path%>/busiManageReservation.html" method="post">
  <!-- 查询条件区 -->
  <input type="hidden" name="aab101" value = "2">
	<table border="1" width="95%" align="center">
	  <caption>
	       	用户申请订座信息
	    <hr width="160">
	  </caption>
	</table>
	<!-- 数据迭代区 -->
	<table border="1" width="95%" align="center">
	  <tr>
	    <td>序号</td>
	    <td>用户昵称</td>
	    <td>用餐日期</td>
	    <td>用餐人数</td>
	    <td>订座号</td>
	    <td></td>
	    <td></td>
	  </tr>
	  <!--
	         注意事项
	    1.$及大括号的结束标记 }与双引号之间,不允许出现空格
	    2.所有的属性之间至少要有一个空格,否则报错
	    3.var 属性,相当于在页面定义变量名称,因此  ins不允许再用$ {  }
	   -->
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
				      <a href="#" onclick="onAccess('${ins.aac101}')">通过申请</a>
				    </td>
				    <td>
				      <a href="#" onclick="onRefuse('${ins.aac101}')">拒绝申请</a>
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
	</table>
	
	<table border="1" width="95%" align="center">
	  <caption>
	       	已通过订座信息
	    <hr width="160">
	  </caption>
	</table>
	<!-- 数据迭代区 -->
	<table border="1" width="95%" align="center">
	  <tr>
	    <td>序号</td>
	    <td>用户昵称</td>
	    <td>用餐日期</td>
	    <td>用餐人数</td>
	    <td>订座号</td>
	  </tr>
	  <!--
	         注意事项
	    1.$及大括号的结束标记 }与双引号之间,不允许出现空格
	    2.所有的属性之间至少要有一个空格,否则报错
	    3.var 属性,相当于在页面定义变量名称,因此  ins不允许再用$ {  }
	   -->
	   <c:choose>
	     <c:when test="${row!=null }">
	         <!-- 显示实际查询到的数据 -->
		     <c:forEach items="${row }" var="ins" varStatus="vs">
	    	   	  <tr>
				    <td>${vs.count }</td>
				    <td>${ins.aaa103 }</td>
				    <td>${ins.aac103 }</td>
				    <td>${ins.aac104 }</td>
				    <td>${ins.aac105 }</td>
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
	</table>
	
	<!-- 功能按钮区 -->
	<table border="1" width="95%" align="center">
	  <tr>
	    <td align="center">
	       <input type="submit" id="del" name="next" value="返回"
	              formaction="<%=path%>/busiModify.jsp">
	    </td>
	  </tr>
	</table>
</form>
</body>
</html>