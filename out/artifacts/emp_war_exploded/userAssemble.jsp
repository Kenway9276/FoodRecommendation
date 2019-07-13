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
      
      function onEdit(vaab101)
      {
    	 var vform = document.getElementById("myform");
    	 vform.action="<%=path%>/findByIdEmp.html?aab101="+vaab101;
    	 //alert(vform.action);
    	 vform.submit();
      }

      function onApply(vaab101)
      {
    	 var vform = document.getElementById("myform");
    	 vform.action="<%=path%>/userAssembleMsg.html?aab101="+vaab101;
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
<form id="myform" action="<%=path%>/userAssemble.html" method="post">
  <!-- 查询条件区 -->
	<table border="1" width="95%" align="center">
	  <caption>
		拼座查询
	    <hr width="160">
	  </caption>
	  <tr>
	    <td colspan="6">查询条件</td>
	  </tr>
	  <tr>
	    <td>店铺名</td>
	    <td>
	      <e:text name="qaab104"/>
	    </td>
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
	    <td colspan="2">
	      <e:date name="qaaa502" />
	    </td>
	    <td>结束时间</td>
	    <td colspan="2">
	      <e:date name="qaaa503"/>
	    </td>
	  </tr>
	</table>
	<!-- 数据迭代区 -->
	<table border="1" width="95%" align="center">
	  <tr>
	    <td></td>
	    <td>店铺名</td>
	    <td>拼座发起人</td>
	    <td>拼座人数</td>
	    <td>拼座开始时间</td>
	    <td>拼座结束时间</td>
	    <td>拼座状态</td>
	  </tr>
	  <!--
	         注意事项
	    1.$及大括号的结束标记 }与双引号之间,不允许出现空格
	    2.所有的属性之间至少要有一个空格,否则报错
	    3.var 属性,相当于在页面定义变量名称,因此  ins不允许再用$ {  }
	   -->
	   <c:choose>
	     <c:when test="${rows!=null}">
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
	</table>
	
	<!-- 功能按钮区 -->
	<table border="1" width="95%" align="center">
	  <tr>
	    <td align="center">
	       <input type="submit" name="next" value="查询" formaction="<%=path%>/userAssemble.html">
	       <input type="submit" name="next" value="申请拼座" 
	              formaction="<%=path%>/userAssembleApply.jsp">
	    </td>
	  </tr>
	</table>
</form>
</body>
</html>