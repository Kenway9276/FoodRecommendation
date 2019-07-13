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
  <!-- ��ѯ������ -->
	<table border="1" width="95%" align="center">
	  <caption>
	               ��Ʒ����
	    <hr width="160">
	  </caption>
	  <tr>
	    <td colspan="4" align="center">��ѯ����</td>
	  </tr>
	  <tr>
	   	 <td>��Ʒ��</td>
	    	<td>
	      	<e:text name="qaab102"/>
	    	</td>
	  </tr>
	  <tr>
	    <td>��ζ</td>
	    <td>
	      	<c:forEach items="${row}" var="ins" varStatus="vs" >
 	   			<c:if test="${ins.sfcode == 'aaa202' }" >
 	   		 		<input type="checkbox" name="qaab204" value="${ins.scode}">${ins.sname}
 	   		 	</c:if>
   			</c:forEach>
	    </td>
	  </tr>
	  <tr>
	    <td>��ϵ</td>
	    <td>
	      	<c:forEach items="${row}" var="ins" varStatus="vs" >
 	   		 	<c:if test="${ins.sfcode == 'aaa203' }"  >
 	   		 		<input type="checkbox" name="qaab205" value="${ins.scode}">${ins.sname}
 	   		 	</c:if>
   			</c:forEach>	
	    </td>
	  </tr>
	  <tr>
	    <td>����</td>
	    <td>
	      	<c:forEach items="${row}" var="ins" varStatus="vs" >
 	   		 	<c:if test="${ins.sfcode == 'aaa204' }"  >
 	   		 		<input type="radio" name="qaab206" value="${ins.scode}">${ins.sname}
 	   		 	</c:if>
   			</c:forEach>
	    </td>
	  </tr>
	</table>
	<!-- ���ݵ����� -->
	<table border="1" width="95%" align="center">
	  <tr>
	    <td></td>
	    <td>���</td>
	    <td>��Ʒ��</td>
	    <td>ͼƬ</td>
	    <td>�۸�</td>
	    <td>��ζ</td>
	    <td>��ϵ</td>
	    <td>����</td>
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
		     <c:forEach items="${rows}" var="ins" varStatus="vs">
	    	   	  <tr>
				    <td>
				      <input type="checkbox" name="idlist" value="${ins.aab201}"
				             onclick="onSelect(this.checked)" >
				    </td>
				    <td>${vs.count}</td>
				    <td>
				      <!-- #  ��ê -->
				      <a href="#" onclick="onEdit('${ins.aab201}')">${ins.aab207}</a>
				    </td>
				    <td>${ins.aab202 }</td>
				    <td>${ins.aab203 }</td>
				    <td>${ins.aab204 }</td>
				    <td>${ins.aab205 }</td>
				    <td>${ins.aab206 }</td>
				    <td>
				      <a href="#" onclick="onDel('${ins.aab201}')">ɾ��</a>
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
	
	<!-- ���ܰ�ť�� -->
	<table border="1" width="95%" align="center">
	  <tr>
	    <td align="center">
	       <input type="submit" name="next" value="��ѯ">
	       <input type="submit" name="next" value="���"
	              formaction="<%=path%>/busiToAddDishPage.html">
	       <input type="submit" id="del" name="next" value="ɾ��" 
	              formaction="<%=path%>/delEmp.html"  disabled="disabled">
	    </td>
	  </tr>
	</table>
</form>
</body>
</html>