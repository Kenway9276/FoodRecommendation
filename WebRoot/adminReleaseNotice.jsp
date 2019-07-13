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
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" /> 
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
</style>
<script type="text/javascript">

</script>
</head>
<body >
<br>
<%=request.getSession().getAttribute("ins")%>
<%=request.getSession().getAttribute("����Ա��ˮ��")%>
<br>
<form id="myform" action="<%=path %>/adminReleaseNotice.html" enctype="multipart/form-data" method="post">
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
    <h2 class="docs-header">������Ϣ�������֮��</h2>
  </div>
</header>
<section>
  <div class="container">
    <ul class="docs-nav" id="menu-left">
      <li><strong>�뿪ʼ��Ĺ���</strong></li>
      <li><a href="<%=path %>/adminInfo.jsp" class=" ">������Ϣ</a></li>
      <li><a href="<%=path %>/adminBusiness.jsp" class=" ">�̼ҹ���</a></li>
      <li><a href="<%=path %>/adminForum.jsp" class=" ">��̳����</a></li>
      <li><a href="<%=path %>/adminNotice.jsp" class="selected">�������  ��</a></li>
      <li><a href="#license" class=" ">�Ż�ȯ����</a></li>
    </ul>
    <div class="docs-content">
      <h3 align="center"> �������</h3>
      <div class="adminNotice">
	<table width="90%" align="center">
	  <caption>
	              ��������
	    <hr width="160">
	  </caption>
	  <tr>
	  	<td>
			<input type="hidden" name="aac401" value="<%=request.getSession().getAttribute("����Ա��ˮ��")%>">
	  	</td>
	  </tr>
	  <tr>
  	    <td>����</td>
	  	<td>
	  		<e:text name="aac202" required="true"/>
	  	</td>
	  </tr>
	  <tr>
	    <td>ͼƬ</td>
	    <td>
	    <input type="file" name="aac204">
	    </td>
	   </tr>
	   <tr>
	    <td>����</td>
	  	<td>
	  		<e:textarea cols="40" rows="5" name="aac205" required="true"/>
	  	</td>
	  </tr>
	  <tr>
	    <td>���ȼ�</td>
	    <td>
	  		<e:radio name="aac207" value="��ͨ:0,�ö�:1" required="true" />
	    </td>
	   </tr>
	   <tr>
	    <td>����</td>
	  	<td>
	  		<e:radio name="aac206" value="��������:1,�Żݻ:2,����ά��:3" required="true" />
	 	 </td>
	  </tr>
	</table>
	<br>
	<br>
<table border="1" width="25%" align="center">
  <tr>
    <td align="center">
       <input type="submit" name="next" value="����">
		<a href="<%=path %>/adminNotice.jsp">
		<input class="btn btn-danger btn-block" type="button" name="next" value="����">
		</a> 
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
