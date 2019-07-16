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
<title>��̳����</title>
<link rel="alternate" type="application/rss+xml" title="egrappler.com" href="feed/index.html">
<link href="http://fonts.googleapis.com/css?family=Raleway:700,300" rel="stylesheet"
        type="text/css">
<link rel="stylesheet" href="<%=path %>/css/style_adminhp.css">
<link rel="stylesheet" href="<%=path %>/css/prettify.css">
<link rel="stylesheet" href="<%=path %>/css/gyn.css">
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
   
   function onDel(vaaa301)
   {
 	 var vform = document.getElementById("myform");
 	 vform.action="<%=path%>/adminDeleteByIdPost.html?aaa301="+vaaa301;
 	 vform.submit();
   } 
  
   function onEdit(vaaa301)
   {
   	 var vform = document.getElementById("myform");
   	 vform.action="<%=path%>/bBSBrowseSingle.html?aaa301="+vaaa301;
   	 vform.submit();
   }
</script>
</head>
<body >
${ins }
<br>
<%=request.getSession().getAttribute("ins")%>
<%=request.getSession().getAttribute("����Ա��ˮ��")%>
<br>
<form id="myform" action="<%=path %>/adminForum.html" method="post">
<nav>
  <div class="container">
    <h1>Doc</h1>
    <div id="menu">
      <ul class="toplinks">
        <li><a href="#">Opineo Website </a></li>
        <li><a href="http://www.egrappler.com/">eGrappler</a></li>
        <li><a href="../doc-template/docs.jsp">Blue Theme</a></li>
        <li><a href="../doc-template-red/docs.jsp">Red Theme</a></li>
      </ul>
    </div>
    <a id="menu-toggle" href="#" class=" ">&#9776;</a> </div>
</nav>
<header>
  <div class="container">
    <h2 class="docs-header">�����Ӣ��~��</h2>
  </div>
</header>
<section>
  <div class="container">
    <ul class="docs-nav" id="menu-left">
      <li><strong>�뿪ʼ��Ĺ���</strong></li>
      <li><a href="<%=path %>/adminInfo.jsp" class=" ">������Ϣ</a></li>
      <li><a href="<%=path %>/adminBusiness.jsp" class=" ">�̼ҹ���</a></li>
      <li><a href="<%=path %>/adminForum.jsp" class="selected">��̳����  ��</a></li>
      <li><a href="<%=path %>/adminNotice.jsp" class=" ">�������</a></li>
      <li><a href="#license" class=" ">�Ż�ȯ����</a></li>
    </ul>
    <div class="docs-content">
      <h3 align="center"> ��̳����</h3>
      <div class="adminNotice">
	<table width="100%" align="center">
	  <caption>
	               ��ѯ����
	    <hr width="160">
	  </caption>
	  <tr>
		<td>����</td>
	    <td>
			<e:text name="qaaa303" />
	    </td>
	    <td>�������ǳ�</td>
	  	<td>
	  		<e:text name="qaaa103"/>
	  	</td>
	  </tr>
	  <tr>
	    <td>��������(��)</td>
	    <td>
	    	<e:date name="baaa302"/>
	    </td>
	   	<td>��������(ֹ)</td>
	    <td>
	    	<e:date name="eaaa302"/>
	    </td>
	   </tr>
	   <tr>
	    <td>����</td>
	  	<td>
	  		<e:text name="qaaa304"/>
	 	 </td>
	  </tr>
	</table>
	<br>
	<br>
<table  width="100%" align="center">
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
		<td>����ɾ��</td>
		<td>���</td>
		<td>��������</td>
		<td>����</td>
		<td>�ǳ�</td>
	</tr>
  <c:choose>
    <c:when test="${rows!=null }">
        <!-- ��ʾʵ�ʲ�ѯ�������� -->
     <c:forEach items="${rows }" var="ins" varStatus="vs">
   	   	  <tr>
		    <td>
		      <input type="checkbox" name="idlist" value="${ins.aaa301 }"
		             onclick="onSelect(this.checked)" >
		    </td>
		    <td>${vs.count }</td>
		    <td>${ins.aaa302 }</td>
		    <td style="width:250px">
			    <c:choose>
			    	<c:when test="${ins.aaa303!=null }">
			    		<a href="#" onclick="onEdit('${ins.aaa301}')">${ins.aaa303 }</a>
			    	</c:when>
			    	<c:otherwise>
			    		${ins.aaa304 }
			    	</c:otherwise>
			    </c:choose>
		    </td>
		    <td>${ins.aaa103 }</td>
		    <td>
		      <a href="#" onclick="onDel('${ins.aaa301}')">ɾ��</a>
		    </td>
		  </tr>
      </c:forEach>
      <!-- ������� -->
      <c:forEach begin="${fn:length(rows)+1 }" step="1" end="15">
	          <tr>
	            <td></td>
	            <td></td>
	            <td>��</td>
	            <td>��</td>
	            <td>��</td>
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
<table border="0" width="25%" align="center">
  <tr>
    <td style=" white-space:nowrap;" align="center">
       <button type="submit" name="next">��ѯ</button>
       <button type="submit" id="del" name="next"  
              formaction="<%=path%>/adminDeletePost.html"  disabled="disabled">ɾ��</button>
    </td>
  </tr>
</table>

</div>
</div>
</div>
</section>
 

</form>
</body>
</html>
