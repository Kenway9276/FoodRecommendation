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
  <!-- ��ѯ������ -->
  <input type="hidden" name="aab101" value = "2">
	<table border="1" width="95%" align="center">
	  <caption>
	       	�û����붩����Ϣ
	    <hr width="160">
	  </caption>
	</table>
	<!-- ���ݵ����� -->
	<table border="1" width="95%" align="center">
	  <tr>
	    <td>���</td>
	    <td>�û��ǳ�</td>
	    <td>�ò�����</td>
	    <td>�ò�����</td>
	    <td>������</td>
	    <td></td>
	    <td></td>
	  </tr>
	  <!--
	         ע������
	    1.$�������ŵĽ������ }��˫����֮��,��������ֿո�
	    2.���е�����֮������Ҫ��һ���ո�,���򱨴�
	    3.var ����,�൱����ҳ�涨���������,���  ins����������$ {  }
	   -->
	   <c:choose>
	     <c:when test="${rows!=null }">
	         <!-- ��ʾʵ�ʲ�ѯ�������� -->
		     <c:forEach items="${rows }" var="ins" varStatus="vs">
	    	   	  <tr>
				    <td>${vs.count }</td>
				    <td>${ins.aaa103 }</td>
				    <td>${ins.aac103 }</td>
				    <td>${ins.aac104 }</td>
				    <td>${ins.aac105 }</td>
				    <td>
				      <a href="#" onclick="onAccess('${ins.aac101}')">ͨ������</a>
				    </td>
				    <td>
				      <a href="#" onclick="onRefuse('${ins.aac101}')">�ܾ�����</a>
				    </td>
				  </tr>
		      </c:forEach>
		      <!-- ������� -->
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
	       	��ͨ��������Ϣ
	    <hr width="160">
	  </caption>
	</table>
	<!-- ���ݵ����� -->
	<table border="1" width="95%" align="center">
	  <tr>
	    <td>���</td>
	    <td>�û��ǳ�</td>
	    <td>�ò�����</td>
	    <td>�ò�����</td>
	    <td>������</td>
	  </tr>
	  <!--
	         ע������
	    1.$�������ŵĽ������ }��˫����֮��,��������ֿո�
	    2.���е�����֮������Ҫ��һ���ո�,���򱨴�
	    3.var ����,�൱����ҳ�涨���������,���  ins����������$ {  }
	   -->
	   <c:choose>
	     <c:when test="${row!=null }">
	         <!-- ��ʾʵ�ʲ�ѯ�������� -->
		     <c:forEach items="${row }" var="ins" varStatus="vs">
	    	   	  <tr>
				    <td>${vs.count }</td>
				    <td>${ins.aaa103 }</td>
				    <td>${ins.aac103 }</td>
				    <td>${ins.aac104 }</td>
				    <td>${ins.aac105 }</td>
				  </tr>
		      </c:forEach>
		      <!-- ������� -->
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
	
	<!-- ���ܰ�ť�� -->
	<table border="1" width="95%" align="center">
	  <tr>
	    <td align="center">
	       <input type="submit" id="del" name="next" value="����"
	              formaction="<%=path%>/busiModify.jsp">
	    </td>
	  </tr>
	</table>
</form>
</body>
</html>