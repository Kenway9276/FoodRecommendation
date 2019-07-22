<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%String path=request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta name="description" content="">
<meta name="HandheldFriendly" content="True">
<meta name="MobileOptimized" content="320">
<meta name="viewport" content="initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>����Ա��Ϣ</title>
<link rel="alternate" type="application/rss+xml" title="egrappler.com" href="feed/index.html">
<link href="http://fonts.googleapis.com/css?family=Raleway:700,300" rel="stylesheet"
        type="text/css">
<link rel="stylesheet" href="<%=path %>/css/style_adminhp.css">
<link rel="stylesheet" href="<%=path %>/css/prettify.css">
<style type="text/css">
	.selected{
		color:black;
	}
	.adminInfo table{
	border:0 solid;
	}
	table tr:nth-child(odd)
	{
	background:#CCC;
	}
	table tr:nth-child(even)
	{
	background:#ff8040;
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
</head>
<body >
<%Map map=(Map)request.getAttribute("ins") ;
if(map != null){
	request.getSession().setAttribute("����Ա��ˮ��", map.get("aac401"));
}
 %>
<%request.getSession().getAttribute("����Ա��ˮ��");%>
<%request.getSession().setAttribute("ins", map); %>
<%@ include file="navigate.jsp" %>
<form action="<%=path %>/adminInfo.html" method="post">
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
    <h2 class="docs-header">֪��֪�ˣ���ս������</h2>
  </div>
</header>
<section>
  <div class="container">
    <ul class="docs-nav" id="menu-left">
      <li><strong>�뿪ʼ��Ĺ���</strong></li>
      <li><a href="<%=path %>/adminInfo.html" class="selected">������Ϣ  ��</a></li>
      <li><a href="<%=path %>/adminBusiness.html" class=" ">�̼ҹ���</a></li>
      <li><a href="<%=path %>/adminForum.html" class=" ">��̳����</a></li>
      <li><a href="<%=path %>/adminNotice.html" class=" ">�������</a></li>
      <li><a href="<%=path %>/adminCoupon.html" class=" ">�Ż�ȯ����</a></li>
    </ul>
    <div class="docs-content">
    ${msg }
      <div class="adminInfo">
        <p style="background-color:#DCDCDC;width:35%;height:50px;line-height:50px;margin:0 auto;align:center" align="center"> ��ĸ�����Ϣ</p>
        <br>
      <table style="margin:0 auto";>
	<tr>
		<td style="color:#FFFFFF">
		��ˮ��
		</td>
		<td style="color:#FFFFFF">
		<input type="text" name="aac401" value="<%=request.getSession().getAttribute("����Ա��ˮ��")%>">
		</td>
	</tr>
	<tr>
		<td style="color:#FFFFFF">
		����
		</td>
		<td style="color:#FFFFFF">
		<e:text name="aac402" readonly="true" defval="${ins.aac402}"/>
		</td>
	</tr>
		<tr>
		<td style="color:#FFFFFF">
		�û���
		</td>
		<td style="color:#FFFFFF">
		<e:text name="aac403" readonly="true" defval="${ins.aac403}"/>
		</td>
	</tr>
		<tr>
		<td style="color:#FFFFFF">
		����
		</td>
		<td style="color:#FFFFFF">
		<input type="password" name="aac404" />
		</td>
	</tr>
	<tr>
		<td style="color:#FFFFFF">
		��ע
		</td>
		<td style="color:#FFFFFF">
		<e:text name="aac405" defval="${ins.aac405}" />
		</td>
	</tr>
	<tr>
		<td style="color:#FFFFFF">
		���֤
		</td>
		<td style="color:#FFFFFF">
		<e:email name="aac406" readonly="true" defval="${ins.aac406}"/>
		</td>
	</tr>
</table>
<br>
<div style="margin:0 auto;width:100px">
	<button type="submit" name="next" formaction="<%=path %>/adminModifyInfo.html" name="next" >�޸�</button>
</div>
</div>
</div>
</div>
</section>
 

</form>
</body>
</html>
