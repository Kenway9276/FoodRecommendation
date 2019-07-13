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
      
      function onEdit(vaab201)
      {
    	 var vform = document.getElementById("myform");
    	 vform.action="<%=path%>/findByIdEmp.html?aab201="+vaab201;
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
</head>
<body>
${msg }
<br>
<%=session.getId() %>
<br>
<form id="myform" action="<%=path%>/queryEmp.html" method="post">
<input type="hidden" name="aab101" value="2">
  <!-- 查询条件区 -->
	<table border="1" width="95%" align="center">
	  <caption>
	               菜品管理
	    <hr width="160">
	  </caption>
	  <tr>
	    <td colspan="4" align="center">查询条件</td>
	  </tr>
	  <tr>
	   	 <td>菜品名</td>
	    	<td>
	      	<e:text name="qaab102"/>
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
	</table>
	<!-- 数据迭代区 -->
	<table border="1" width="95%" align="center">
	  <tr>
	    <td></td>
	    <td>序号</td>
	    <td>菜品名</td>
	    <td>图片</td>
	    <td>价格</td>
	    <td>口味</td>
	    <td>菜系</td>
	    <td>种类</td>
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
				    <td>${ins.aab202 }</td>
				    <td>${ins.aab203 }</td>
				    <td>${ins.aab204 }</td>
				    <td>${ins.aab205 }</td>
				    <td>${ins.aab206 }</td>
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
	</table>
	
	<!-- 功能按钮区 -->
	<table border="1" width="95%" align="center">
	  <tr>
	    <td align="center">
	       <input type="submit" name="next" value="查询">
	       <input type="submit" name="next" value="添加"
	              formaction="<%=path%>/busiToAddDishPage.html">
	       <input type="submit" id="del" name="next" value="删除" 
	              formaction="<%=path%>/delEmp.html"  disabled="disabled">
	    </td>
	  </tr>
	</table>
</form>
</body>
</html>