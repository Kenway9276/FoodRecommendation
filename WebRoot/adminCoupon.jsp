<%@ page  language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%String path=request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta name="description" content="">
<meta name="HandheldFriendly" content="True">
<meta name="MobileOptimized" content="320">
<meta name="viewport" content="initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>�Ż�ȯ����</title>
<link rel="alternate" type="application/rss+xml" title="egrappler.com" href="feed/index.html">
<link href="http://fonts.googleapis.com/css?family=Raleway:700,300" rel="stylesheet"
        type="text/css">
<link rel="stylesheet" href="<%=path %>/css/style_adminhp.css">
<link rel="stylesheet" href="<%=path %>/css/prettify.css">
<style type="text/css">
	.selected{
		color:black;
	}
	.adminNotice table{
	border:1px solid;
	}
	thead {
    color: #ffffff;
    background: #ff8040;
	}
	.forSubmit{
	display:inline-block;
	border:none;
	background-color:#ff8040;
	color:#FFFFFF;
	padding: 12px 28px;
    text-align: center;
    font-size: 16px;
    border-radius:6px;
	}
	.forSelect{
	display:inline-block;
	border:none;
	background-color:#324960;
	color:#FFFFFF;
	padding: 8px 8px;
    text-align: center;
    font-size: 10px;
    border-radius:4px;
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
   
   function onDel(vaab501)
   {
 	 var vform = document.getElementById("myform");
 	 vform.action="<%=path%>/adminDeleteByIdCoupon.html?aab501="+vaab501;
 	 vform.submit();
   } 
  
   function onEdit(vaab101)
   {
   	 var vform = document.getElementById("myform");
   	 vform.action="<%=path%>/shopinfoFindById.html?aab101="+vaab101;
   	 vform.submit();
   }
</script>
</head>
<body >
<%request.getSession().getAttribute("ins");%>
<%request.getSession().getAttribute("����Ա��ˮ��");%>
<%@ include file="navigate.jsp" %>
<%@ include file="floatTool.jsp" %>
<form id="myform" action="<%=path %>/adminCoupon.html" method="post">
<!-- <nav> -->
<!--   <div class="container"> -->
<!--     <h1>Doc</h1> -->
<!--     <div id="menu"> -->
<!--       <ul class="toplinks"> -->
<!--         <li><a href="#">Opineo Website </a></li> -->
<!--         <li><a href="http://www.egrappler.com/">eGrappler</a></li> -->
<!--         <li><a href="../doc-template/docs.jsp">Blue Theme</a></li> -->
<!--         <li><a href="../doc-template-red/docs.jsp">Red Theme</a></li> -->
<!--       </ul> -->
<!--     </div> -->
<!--     <a id="menu-toggle" href="#" class=" ">&#9776;</a> </div> -->
<!-- </nav> -->
<header>
  <div class="container">
    <h2 class="docs-header">����������˭������</h2>
  </div>
</header>
<section>
  <div class="container">
    <ul class="docs-nav" id="menu-left">
      <li><strong>�뿪ʼ��Ĺ���</strong></li>
      <li><a href="<%=path %>/adminInfo.html" class=" ">������Ϣ</a></li>
      <li><a href="<%=path %>/adminBusiness.html" class=" ">�̼ҹ���</a></li>
      <li><a href="<%=path %>/adminForum.html" class=" ">��̳����</a></li>
      <li><a href="<%=path %>/adminNotice.html" class=" ">�������</a></li>
      <li><a href="<%=path %>/adminCoupon.html" class="selected">�Ż�ȯ����  ��</a></li>
    </ul>
    <div class="docs-content">
      <h3 align="center"> �Ż�ȯ����</h3>
      <div class="adminNotice">
	<table width="100%" align="center">
	  <caption>
	               ��ѯ����
	    <hr width="160">
	  </caption>
	  <tr>
		<td>������</td>
	    <td>
			<e:text name="qaab104" />
	    </td>
	    <td>�Ż�ȯ��</td>
	    <td>
	    	<e:text name="qaab503" />
	    </td>
	   </tr>
	   <tr>
	    <td>�Ż�ȯ��</td>
	  	<td>
	  		<e:text name="qaab502"/>
	  	</td>
	    <td>���</td>
	  	<td>
	  		<e:text name="qaab504"/>
	 	 </td>
	  </tr>
	  <tr>
	 	<td>�Ż�����</td>
	    <td>
	    	<e:text name="qaab505"/>
	    </td>
	    <td>����ʱ��</td>
	    <td>
	    	<e:date name="qaab506"/>
	    </td>
	  </tr>
	</table>
	<br>
	<br>
<table  width="90%" style="margin:0 auto">
	<caption>
		�Ż�ȯ�б�
		<hr width=160>
	</caption>
<!-- ϵͳ�Զ����ɹ�����ˮ�ţ�aac201������������Ա��ˮ�ţ�aac401����ֻ�й���Ա�ſ��Է������棩�� -->
<!-- ���⣨aac201��������ʱ�䣨aac201��������ͼƬ��aac201�������ģ�aac201�������ࣨaac201�� -->
<!-- �������Ϊ�������¡�����ά�����Żݻ�ȣ��ֱ���1��2��3��ʾ�������ȼ���aac201�����빫���ac02�С� -->
<!-- ���ȼ���0��1�ֱ棬��ʼ����Ϊ0����ʾ�����ȼ������������Ⱥ����С����ȼ�Ϊ1�����ö���ʾ�� -->
<!-- ��ͬ���ȼ�Ҳ�������Ⱥ����С� -->
	<thead>
	<tr>
		<td style="width:80px;text-align:center">����ɾ��</td>
		<td style="text-align:center">���</td>
		<td style="text-align:center">������</td>
		<td style="text-align:center">�Ż�ȯ��</td>
		<td style="text-align:center">�Ż�ȯ��</td>
		<td style="text-align:center">�Ż�����</td>
		<td></td>	
	</tr>
	</thead>
  <c:choose>
    <c:when test="${rows!=null }">
        <!-- ��ʾʵ�ʲ�ѯ�������� -->
     <c:forEach items="${rows }" var="ins" varStatus="vs">
   	   	  <tr>
		    <td>
		      <input type="checkbox" name="idlist" value="${ins.aab501 }"
		             onclick="onSelect(this.checked)" >
		    </td>
		    <td style="text-align:center">${vs.count }</td>
		    <td style="text-align:center"><a href="#" onclick="onEdit('${ins.aab101}')">${ins.aab104 }</a></td>
		    <td style="text-align:center">${ins.aab502 }</td>
		    <td style="text-align:center">${ins.aab503 }</td>
		    <td style="text-align:center">��${ins.aab505 }��${ins.aab504 }</td>
		    <td style="width:40px;text-align:center">
		      <a href="#" onclick="onDel('${ins.aab501}')"><button class="forSelect">ɾ��</button></a>
		    </td>
		  </tr>
      </c:forEach>
      <!-- ������� -->
      <c:forEach begin="${fn:length(rows)+1 }" step="1" end="15">
	          <tr>
	            <td></td>
	            <td></td>
	            <td style="text-align:center">��</td>
	            <td style="text-align:center">��</td>
	            <td style="text-align:center">��</td>
	            <td style="text-align:center">��</td>
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
          </tr>
       </c:forEach>
    </c:otherwise>
  </c:choose>
</table>
<div style="text-align:center">
       <button type="submit" name="next" id="bottom" class="forSubmit">��ѯ</button>
       <button type="submit" id="del" name="next" class="forSubmit" 
              formaction="<%=path%>/adminDeleteCoupon.html"  disabled="disabled">ɾ��</button>
</div>
</div>
</div>
</div>
</section>
 

</form>
</body>
</html>
