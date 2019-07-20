<%@ page  language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%String path=request.getContextPath();%>
<html>
<head>
<title>��������</title>
<link href="<%=path %>/css/style_history.css" rel="stylesheet" type="text/css" media="all">
<style type="text/css">
	td{
	border:0;
	}
	table{
	background:#E7E7E7;
	}
	button{
	display:inline-block;
	border:none;
	background-color:#f33131;
	color:#FFFFFF;
	padding: 12px 28px;
    text-align: center;
    font-size: 16px;
    border-radius:8px;
	}
</style>
<script type="text/javascript">
function onEdit(vaac201)
{
	 var vform = document.getElementById("myform");
	 vform.action="<%=path%>/adminBeforeNoticeModify.html?aac201="+vaac201;
	 vform.submit();
} 
</script>
</head>
<body>
<%request.getSession().getAttribute("ins");%>
<form id="myform" action="<%=path %>/userNoticeInfo.html" enctype="multipart/form-data" method="post">
<section id="pricing">
	<div class="container">
		<div class="section-header">
			<h2 class="section-title wow fadeInDown">��������</h2>
		</div> 
			<div style="width:70%;margin:0 auto" class="row">
					<h4>�������ϸ�Ķ�Ŷ��</h4>
					<ul class="menuPrice">
						<li>
							<a style="text-decoration:none;text-align:center;font-weight:bold" href="#">${ins.aac202 }</a>
						</li>
						<li>
							<a style="text-decoration:none" href="#">&nbsp;&nbsp;&nbsp;��������&nbsp;&nbsp;&nbsp;${ins.aac203 }</a>
						</li>
						<li>
							<a style="text-decoration:none;text-align:center" href="#"><img height=300px src="${ins.aac204 }"></a>
						</li>
						<li>
							<a style="text-decoration:none" href="#">&nbsp;&nbsp;&nbsp;����</a>
						</li>
						<li>
							<div style="background-color: #FFFFFF">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${ins.aac205 }</div>
						</li>
						<li>
							<a style="text-decoration:none" href="#">&nbsp;&nbsp;&nbsp;��������&nbsp;&nbsp;
								<c:choose>
						    		<c:when test="${ins.aac206==1 }">
						    			��������
						    		</c:when>
						    		<c:when test="${ins.aac206==2 }">
						    			�Żݻ
						    		</c:when>
						    		<c:otherwise>
						    			����ά��
						    		</c:otherwise>
					    		</c:choose>
							</a>
						</li>
						<li>
							<a style="text-decoration:none" href="#">&nbsp;&nbsp;&nbsp;���ȼ���&nbsp;&nbsp;
								${ins.aac207==1?"�ö�":"��ͨ" }
							</a>
						</li>
					</ul>

<table border="0" width="100%" align="center">
  <tr>
    <td align="center">
		<a href="<%=path %>/busiNotice.html">
		<button name="next">����</button>
		</a> 
		<button  name="next" onclick="onEdit('${ins.aac201 }')">�༭</button>
    </td>
  </tr>
</table>
			</div>
	</div>
</section>
</form>
</body>
</html>