<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl" prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%String path=request.getContextPath(); %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK" />
<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
<script type="text/javascript"
	src="http://api.map.baidu.com/api?v=2.0&ak=LtaZG8G4TNzGd6Rs57WGyKMr7Hx7GxbU"></script>
<script type="text/javascript">
	
	
	function onSearchUnRead()
    {
  	 //�鿴δ��
  	 var vform = document.getElementById("myform");
  	 vform.action="<%=path%>/messageSearchUnRead.html";
  	 vform.submit();
    }
	
	
	function onSearchRead()
    {
  	 //�鿴�Ѷ�
  	 var vform = document.getElementById("myform");
  	 vform.action="<%=path%>/messageSearchRead.html";
  	 vform.submit();
    }
	
	function onSetAllRead()
    {
  	 //ȫ��Ϊ�Ѷ�
  	 var vform = document.getElementById("myform");
  	 vform.action="<%=path%>/messageSetAllRead.html";
  	 vform.submit();
    }
	
	function onDeleteAllRead()
    {
  	 //ɾ���Ѷ�
  	 var vform = document.getElementById("myform");
  	 vform.action="<%=path%>/messageDeleteAll.html";
  	 vform.submit();
    }
	
	function onSetRead(vaac301)
    {
  	 //��Ϊ�Ѷ�
  	 var vform = document.getElementById("myform");
  	 vform.action="<%=path%>/messageSetRead.html?aac301="+vaac301;
  	 vform.submit();
    }
	
	function onDelById(vaac301)
    {
  	 //ɾ����Ϣ
  	 var vform = document.getElementById("myform");
  	 vform.action="<%=path%>/messageDelById.html?aac301="+vaac301;
  	 vform.submit();
    }
	

      
</script>
</head>
<body>
	<div id="allmap"></div>
	<form id="myform" action="<%=path%>/shopinfoFind.html" method="post">


		${msg }

		<!-- ��ǰ���� -->
		<a id="city" href="#"></a>
		<e:hidden name="cityName" id="cityName" />

		<!-- ��ʱ�û���ˮ��,��ȡ��δʵ�ֻ�ȡ -->
		<input type="hidden" name="aaa101" value="1"> <br> <br>
		<br> <a href="#" onclick="onSearchUnRead()">�鿴δ��</a> <a href="#"
			onclick="onSearchRead()">�鿴�Ѷ�</a> <br> <br> <input
			type="submit" id="read" onclick="onSetAllRead()" value="ȫ���Ѷ�">
		<input type="submit" id="del" onclick="onDeleteAllRead()" value="ȫ��ɾ��">
		<br>
		<c:if test="${rows!=null }">
			<!-- ��ʾʵ�ʲ�ѯ�������� -->
			<c:forEach items="${rows }" var="row" varStatus="vs">
				<br>
				<a>��Ϣ����: </a>
				<a>${row.aac302 }</a>
				<br>
				<a>ʱ��: </a>
				<a>${row.aac303 }</a>
				<c:choose>
					<c:when test="${row.aac304=='1' }">
						<a href="#" onclick="onSetRead(${row.aac301})">�Ѷ�</a>
					</c:when>
					<c:otherwise>
						<a href="#" onclick="onDelById(${row.aac301})">ɾ��</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</c:if>






	</form>

	<div id="allmap"></div>

</body>
</html>

<!-- �ٶȵ�ͼapi��ȡ��ǰ���� -->
<script type="text/javascript">
	var map = new BMap.Map("allmap");
	var point = new BMap.Point(116.331398,39.897445);
	map.centerAndZoom(point,12);

	function myFun(result){
		var cityName = result.name;
		document.getElementById("city").innerHTML="��ǰλ��: "+cityName;
		document.getElementById("cityName").value=cityName;
	}
	var myCity = new BMap.LocalCity();
	myCity.get(myFun);
</script>