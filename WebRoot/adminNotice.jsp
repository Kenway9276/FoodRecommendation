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
<title>�������</title>
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
	button{
	display:inline-block;
	border:none;
	background-color:#ff8040;
	color:#FFFFFF;
	padding: 12px 28px;
    text-align: center;
    font-size: 16px;
    border-radius:6px;

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
   
   function onDel(vaac201)
   {
 	 var vform = document.getElementById("myform");
 	 vform.action="<%=path%>/adminDeleteByIdNotice.html?aac201="+vaac201;
 	 vform.submit();
   } 
   
   function onPop(vaac201)
   {
 	 var vform = document.getElementById("myform");
 	 vform.action="<%=path%>/adminPopByIdNotice.html?aac201="+vaac201;
 	 vform.submit();
   } 
   
   function onCancel(vaac201)
   {
 	 var vform = document.getElementById("myform");
 	 vform.action="<%=path%>/adminCancelByIdNotice.html?aac201="+vaac201;
 	 vform.submit();
   } 
  
   function onEdit(vaac201)
   {
   	 var vform = document.getElementById("myform");
   	 vform.action="<%=path%>/findByIdNotice.html?aac201="+vaac201;
   	 vform.submit();
   }
</script>
</head>
<body >
<%request.getSession().getAttribute("ins");%>
<%request.getSession().getAttribute("����Ա��ˮ��");%>
<%@ include file="navigate.jsp" %>
<form id="myform" action="<%=path %>/adminNotice.html" method="post">
<header>
  <div class="container">
    <h2 class="docs-header">������Ϣ�������֮��</h2>
  </div>
</header>
<section>
  <div class="container">
    <ul class="docs-nav" id="menu-left">
      <li><strong>�뿪ʼ��Ĺ���</strong></li>
      <li><a href="<%=path %>/adminInfo.html" class=" ">������Ϣ</a></li>
      <li><a href="<%=path %>/adminBusiness.jsp" class=" ">�̼ҹ���</a></li>
      <li><a href="<%=path %>/adminForum.jsp" class=" ">��̳����</a></li>
      <li><a href="<%=path %>/adminNotice.jsp" class="selected">�������  ��</a></li>
      <li><a href="<%=path %>/adminCoupon.jsp" class=" ">�Ż�ȯ����</a></li>
    </ul>
    <div class="docs-content">
      <h3 align="center"> �������</h3>
      <div class="adminNotice">
	<table width="100%" align="center">
	  <caption>
	               ��ѯ����
	    <hr width="160">
	  </caption>
	  <tr>
		<td>����</td>
	    <td>
			<e:text name="qaac202" />
	    </td>
	  </tr>
	  <tr>
	    <td>��������</td>
	    <td>
	    	<e:date name="qaac203"/>
	    </td>
	    <td>�����˹���</td>
	  	<td>
	  		<e:text name="qaac402"/>
	  	</td>
	  </tr>
	  <tr>
	    <td>����</td>
	  	<td>
	  		<e:radio name="qaac206" value="��������:1,�Żݻ:2,����ά��:3" />
	 	 </td>
	 	<td>���ȼ�</td>
	    <td>
	    	<e:radio name="qaac207" value="��ͨ:0,�ö�:1"  />
	    </td>
	  </tr>
	</table>
	<br>
	<br>
<table  width="90%" style="margin:0 auto">
	<caption>
		�����б�
		<hr width=160>
	</caption>
<!-- ϵͳ�Զ����ɹ�����ˮ�ţ�aac201������������Ա��ˮ�ţ�aac401����ֻ�й���Ա�ſ��Է������棩�� -->
<!-- ���⣨aac201��������ʱ�䣨aac201��������ͼƬ��aac201�������ģ�aac201�������ࣨaac201�� -->
<!-- �������Ϊ�������¡�����ά�����Żݻ�ȣ��ֱ���1��2��3��ʾ�������ȼ���aac201�����빫���ac02�С� -->
<!-- ���ȼ���0��1�ֱ棬��ʼ����Ϊ0����ʾ�����ȼ������������Ⱥ����С����ȼ�Ϊ1�����ö���ʾ�� -->
<!-- ��ͬ���ȼ�Ҳ�������Ⱥ����С� -->
	<tr>
		<td style="width:80px;text-align:center">����ɾ��</td>
		<td style="width:40px;text-align:center">���</td>
		<td style="text-align:center">��������</td>
		<td style="text-align:center">����</td>
		<td style="width:40px;text-align:center">����</td>
		<td style="width:60px;text-align:center">���ȼ�</td>	
	</tr>
  <c:choose>
    <c:when test="${rows!=null }">
        <!-- ��ʾʵ�ʲ�ѯ�������� -->
     <c:forEach items="${rows }" var="ins" varStatus="vs">
   	   	  <tr>
		    <td style="text-align:center">
		      <input type="checkbox" name="idlist" value="${ins.aac201 }"
		             onclick="onSelect(this.checked)" >
		    </td>
		    <td style="text-align:center">${vs.count }</td>
		    <td style="text-align:center">${ins.aac203 }</td>
		    <td style="width:150px"><a href="#" onclick="onEdit('${ins.aac201}')">${ins.aac202 }</a></td>
		    <td style="width:80px;text-align:center"> 
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
		    </td>
		    <td style="text-align:center">${ins.aac207==1?"�ö�":"��ͨ" }</td>
		    <td style="width:40px;text-align:center">
		      <a href="#" onclick="onDel('${ins.aac201}')">ɾ��</a>
		      <c:if test="${ins.aac207 !='1' }">
		      	<a href="#" onclick="onPop('${ins.aac201}')">�ö�</a>
		      </c:if>
		      <c:if test="${ins.aac207 =='1' }">
		      	<a href="#" onclick="onCancel('${ins.aac201}')">ȡ��</a>
		      </c:if>
		    </td>
		  </tr>
      </c:forEach>
      <!-- ������� -->
      <c:forEach begin="${fn:length(rows)+1 }" step="1" end="15">
	          <tr>
	            <td></td>
	            <td></td>
	            <td style="text-align:center">��</td>
	            <td>��</td>
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
       <button type="submit" name="next">��ѯ</button>
       <button type="submit" id="del" name="next"  
              formaction="<%=path%>/adminDeleteNotice.html"  disabled="disabled">ɾ��</button>
		<button formaction="<%=path %>/adminReleaseNotice.jsp" name="next" >����</button>
</div>

</div>
</div>
</div>
</section>
 

</form>
</body>
</html>
