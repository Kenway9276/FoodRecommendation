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
  <!-- ��ѯ������ -->
	<table border="1" width="95%" align="center">
	  <caption>
		ƴ����ѯ
	    <hr width="160">
	  </caption>
	  <tr>
	    <td colspan="6">��ѯ����</td>
	  </tr>
	  <tr>
	    <td>������</td>
	    <td>
	      <e:text name="qaab104"/>
	    </td>
	    <td>ƴ��������</td>
	    <td>
	      <e:text name="qaaa103"/>
	    </td>
	    <td>ƴ������</td>
	    <td>
	      <e:text name="qaaa504"/>
	    </td>
	  </tr>
	  <tr>
	    <td>��ʼʱ��</td>
	    <td colspan="2">
	      <e:date name="qaaa502" />
	    </td>
	    <td>����ʱ��</td>
	    <td colspan="2">
	      <e:date name="qaaa503"/>
	    </td>
	  </tr>
	</table>
	<!-- ���ݵ����� -->
	<table border="1" width="95%" align="center">
	  <tr>
	    <td></td>
	    <td>������</td>
	    <td>ƴ��������</td>
	    <td>ƴ������</td>
	    <td>ƴ����ʼʱ��</td>
	    <td>ƴ������ʱ��</td>
	    <td>ƴ��״̬</td>
	  </tr>
	  <!--
	         ע������
	    1.$�������ŵĽ������ }��˫����֮��,��������ֿո�
	    2.���е�����֮������Ҫ��һ���ո�,���򱨴�
	    3.var ����,�൱����ҳ�涨���������,���  ins����������$ {  }
	   -->
	   <c:choose>
	     <c:when test="${rows!=null}">
	         <!-- ��ʾʵ�ʲ�ѯ�������� -->
		     <c:forEach items="${rows}" var="ins" varStatus="vs">
	    	   	  <tr>
				    <td>${vs.count}</td>
				    <td>${ins.aab104 }</td>
				    <td>${ins.aaa103 }</td>
				    <td>${ins.aaa504 }</td>
				    <td>${ins.aaa502 }</td>
				    <td>${ins.aaa503 }</td>
				    <td>
				      <a href="#" onclick="onApply('${ins.aaa501}')"><button>����ƴ��</button></a>
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
	
	<!-- ���ܰ�ť�� -->
	<table border="1" width="95%" align="center">
	  <tr>
	    <td align="center">
	       <input type="submit" name="next" value="��ѯ" formaction="<%=path%>/userAssemble.html">
	       <input type="submit" name="next" value="����ƴ��" 
	              formaction="<%=path%>/userAssembleApply.jsp">
	    </td>
	  </tr>
	</table>
</form>
</body>
</html>