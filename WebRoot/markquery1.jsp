<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl" prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%String path=request.getContextPath(); %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK" />
<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
<script type="text/javascript">

	  var count=0;
      function onSelect(vstate)
      {
  	    vstate?count++:count--;
  	    var vdel=document.getElementById("del");
  	    vdel.disabled=(count==0);
      }
      
      function onDetail(vaab101)
      {
    	  //�鿴�̼�����
    	 var vform = document.getElementById("myform");
    	 vform.action="<%=path%>/shopinfoFindById.html?aab101="+vaab101;
    	 vform.submit();
      }
      
      function onDelMark(vaaa401)
      {
    	  //ȡ���ղ�
    	 var vform = document.getElementById("myform");
    	 vform.action="<%=path%>/markDeleteById.html?aaa401="+vaaa401;
    	 vform.submit();
      }
      
</script>
</head>
<body>
	<form id="myform" action="<%=path%>/markQuery.html" method="post">


		${msg }

		<!-- ��ʱ�û���ˮ��,��ȡ��δʵ�ֻ�ȡ -->
		<input type="hidden" name="aaa101" value="1"> <a>�ҵ��ղؼ�</a> <br>
		<input type="submit" name="next" value="�鿴�ղؼ�">


		<c:if test="${rows!=null }">
			<!-- ����ɾ�� -->
			<input type="submit" id="del" name="next" value="����ɾ��"
				formaction="<%=path%>/markBatchDelete.html" disabled="disabled">
			<!-- ����ղؼ� -->
			<input type="submit" id="dell" name="next" value="����ղؼ�"
				formaction="<%=path%>/markDeleteAll.html">
		</c:if>


		<br> <br> <br> <br>

		<c:if test="${rows!=null }">
			<!-- ��ʾʵ�ʲ�ѯ�������� -->
			<c:forEach items="${rows }" var="row" varStatus="vs">
				<br>
				<input type="checkbox" name="idlist" value="${row.aaa401 }"
					onclick="onSelect(this.checked)">
				<br>
				<a href="#" onclick="onDetail('${row.aab101}')">${row.aab104 }</a>
				<br>
				<a>����: </a>
				<a>${row.aab111 }</a>
				<br>
				<a>��ַ: </a>
				<a>${row.aab106 }</a>
				<br>
				<a>�ղ�ʱ��: </a>
				<a>${row.aaa402 }</a>
				<br>
				<a href="#" onclick="onDelMark('${row.aaa401}')">ȡ���ղ�</a>
				<br>
			</c:forEach>
		</c:if>





	</form>


</body>
</html>