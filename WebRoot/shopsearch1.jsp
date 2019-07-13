<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl" prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%String path=request.getContextPath(); %>
<html>
<head>
<title>��������</title>
<script src="http://libs.baidu.com/jquery/1.10.2/jquery.min.js"></script>
<script>
	$(function(){
		//��ȡ����¼��Ķ���
		$(".nav li").click(function(){
			//��ȡҪ��ʾ�����صĶ���
			var divShow = $(".content").children('.list');
			//�жϵ�ǰ�����Ƿ�ѡ�У����ûѡ�еĻ�����ifѭ��
			if (!$(this).hasClass('selected')) {
				//��ȡ��ǰ���������
				var index = $(this).index();
				//��ǰ�������ѡ����ʽ������ͬ���Ƴ�ѡ����ʽ��
				$(this).addClass('selected').siblings('li').removeClass('selected');
				//������Ӧ��div����ʾ
				$(divShow[index]).show();
				//������Ӧ��div���ͬ������
				$(divShow[index]).siblings('.list').hide();
			}
		});
	});
	
	function onSetMark(vaab101)
    {
  	  //��ӵ��ղؼ�
  	 var vform = document.getElementById("myform");
  	 vform.action="<%=path%>/markAdd.html?aab101="+vaab101;
  	 vform.submit();
  	 //�����̼�����ҳ��
  	 vform.action="<%=path%>/shopinfoFindById.html?aab101="+vaab101;
 	 vform.submit();
    }
	
	
	function onDelMark(vaab101)
    {
  	  //ȡ���ղ�
  	 var vform = document.getElementById("myform");
  	 vform.action="<%=path%>/markDeleteInShopDetail.html?aab101="+vaab101;
  	 vform.submit();
  	 //�����̼�����ҳ��
  	 vform.action="<%=path%>/shopinfoFindById.html?aab101="+vaab101;
 	 vform.submit();
    }
	
	
	
	
</script>


</head>
<body>



	<form id="myform" action="<%=path%>/shopinfoFind.html" method="post">


		<!-- ��ʱ�û���ˮ��,��ȡ��δʵ�ֻ�ȡ -->
		<input type="hidden" name="aaa101" value="2"> ${msg } <br>
		<c:if test="${ins!=null }">
			<br>
			<a>${ins.aab104 }</a>
			<br>
			<a>����: </a>
			<a>${ins.aab111 }</a>
			<br>
			<a>��ַ: </a>
			<a>${ins.aab106 }</a>
			<br>
			<a>�绰: </a>
			<a>${ins.aab107 }</a>
			<br>
			<input type="submit" name="next" value="д����">

			<br>
		</c:if>



		<!-- �ղذ�ť -->
		<c:if test="${empty IsMark }">
			<input type="submit" onclick="onSetMark('${ins.aab101}')" value="�ղ�">
		</c:if>
		<c:if test="${!empty IsMark }">
			<input type="submit" onclick="onDelMark('${ins.aab101}')"
				value="ȡ���ղ�">
		</c:if>





		<ul class="nav">
			<li>�˵�</li>
			<li>����ͼ</li>
			<li>���ʵ���</li>
		</ul>

		<br> <br>
		<div class="content">
			<div class="list ">
				<c:choose>
					<c:when test="${menus!=null }">
						<!-- ��ʾʵ�ʲ�ѯ�������� -->
						<c:forEach items="${menus }" var="menu" varStatus="vs">
							<br>
							<br>
							<a>ͼƬ: </a>
							<a>${menu.aab202 }</a>
							<br>
							<a>��Ʒ��: </a>
							<a>${menu.aab207 }</a>
							<br>
							<a>�۸�: </a>
							<a>${menu.aab203 }</a>
							<br>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<a>���̼���δ�ϴ��˵�!</a>
					</c:otherwise>
				</c:choose>
			</div>
			<div class="list">
				<br> <a>${ins.aab109 }</a>
			</div>
			<div class="list">
				<br> <a>${ins.aab108 }</a>
			</div>
		</div>


		<br> <br> <br> <br> <br>


		<c:choose>
			<c:when test="${comments!=null }">
				<!-- ��ʾʵ�ʲ�ѯ�������� -->
				<c:forEach items="${comments }" var="comment" varStatus="vs">
					<br>

					<c:if test="${comment.aaa305=='0' }">

						<a>�ǳ�: </a>
						<a>${comment.aaa103 }</a>
						<br>
						<a>����: </a>
						<a>${comment.aab307 }</a>
						<br>
						<a>��������: </a>
						<a>${comment.aab303 }</a>
						<br>
						<a>ͼƬ: </a>
						<a>${comment.aab306 }</a>
						<br>
						<a>ʱ��: </a>
						<a>${comment.aab304 }</a>

					</c:if>


				</c:forEach>
			</c:when>
			<c:otherwise>
				<a>���̼���δ�ϴ��˵�!</a>
			</c:otherwise>
		</c:choose>




	</form>


</body>

</html>