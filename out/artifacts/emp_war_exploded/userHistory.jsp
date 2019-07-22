<%@ page  language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%String path=request.getContextPath();%>

<html>
<head>
<title>��ʷ��¼����</title>
<link href="<%=path %>/css/style_history.css" rel="stylesheet" type="text/css" media="all">
<style type="text/css">
	td
	{
	border:0;
	}
	table tr:nth-child(odd)
	{
	background:#CCC;
	}
	table tr:nth-child(even)
	{
	background:#f33131;
	}
	button{
	display:inline-block;
	border:none;
	background-color:#f33131;
	color:#FFFFFF;
	padding: 8px 16px;
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
   
   function onDel(vaac101)
   {
 	 var vform = document.getElementById("myform");
 	 vform.action="<%=path%>/userDeleteByIdHistory.html?aac101="+vaac101;
 	 vform.submit();
   } 
  
</script>
</head>
<body>
<%@ include file="navigate.jsp" %>
<form id="myform" action="<%=path %>/userHistory.html" method="post">
<section id="pricing">
	<div class="container">
		<div class="section-header">
			<h2 class="section-title wow fadeInDown">��ʷ������¼</h2>
		</div> 
			<div style="width:70%;margin:0 auto" class="row">
					<h4>�����±������ѯ������</h4>
					<ul class="menuPrice">
						<li>
							<a style="text-decoration:none" href="#">&nbsp;&nbsp;&nbsp;��������&nbsp;&nbsp;&nbsp;<input type="date" name="qaac102">
							�̼���&nbsp;&nbsp;&nbsp;<e:text name="qaab104"/>&nbsp;&nbsp;&nbsp;
							�ò�����&nbsp;&nbsp;&nbsp;<input type="date" name="qaac103"></a>
						</li>
						<li>
							<a style="text-decoration:none" href="#">&nbsp;&nbsp;&nbsp;����&nbsp;&nbsp;&nbsp;<e:number step="1" name="qaac104"/>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;������&nbsp;&nbsp;&nbsp;<e:number step="1" name="qaac105"/></a>
						</li>
						<li>
							<a style="text-decoration:none" href="#">&nbsp;&nbsp;&nbsp;��ζ&nbsp;&nbsp;&nbsp;<e:number step="1" name="qaaa202"/>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��ϵ&nbsp;&nbsp;&nbsp;<e:number step="1" name="qaaa203"/>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;����&nbsp;&nbsp;&nbsp;<e:number step="1" name="qaaa204"/>
							</a>
						</li>
						<li>
							<a style="text-decoration:none" href="#">&nbsp;&nbsp;&nbsp;�豸&nbsp;&nbsp;&nbsp;<e:number step="1" name="qaaa205"/>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;λ��&nbsp;&nbsp;&nbsp;<e:text name="qaaa206"/></a>
						</li>
					</ul>
					<h4>��ѯ�������ʾ�����</h4>
	<table border="1px;solid" width="100%" align="center">
<!-- 	���ݰ���:�û�����aaa102�����̼�����aab102�����������ڣ�aac102���� -->
<!-- 	�ò����ڣ�aac103�����ò�������aac104��������Ķ����ţ�aac105���� -->
<!-- 	������û�ƫ����Ϣ���ζ��aab202������ϵ��aab203���� -->
<!-- 	���ࣨaab204�����豸��aab205����λ�ã�aab206���� -->
	<tr>
		<td></td>
		<td style="color:#FFFFFF;width:40px;text-align:center">���</td>
		<td	style="color:#FFFFFF;text-align:center">��������</td>
		<td	style="color:#FFFFFF;width:80px;text-align:center">�̼���</td>
		<td	style="color:#FFFFFF;text-align:center">�ò�����</td>
		<td	style="color:#FFFFFF;width:40px;text-align:center">����</td>
		<td	style="color:#FFFFFF;width:40px;text-align:center">��ζ</td>
		<td	style="color:#FFFFFF;width:60px;text-align:center">��ϵ</td>
		<td	style="color:#FFFFFF;width:40px;text-align:center">����</td>
		<td	style="color:#FFFFFF;width:40px;text-align:center">�豸</td>
		<td	style="color:#FFFFFF;width:40px;text-align:center">λ��</td>
		<td	style="color:#FFFFFF;width:40px;text-align:center">��ע</td>		
		<td style="width:40px"></td>
	</tr>
  <c:choose>
    <c:when test="${rows!=null }">
        <!-- ��ʾʵ�ʲ�ѯ�������� -->
     <c:forEach items="${rows }" var="ins" varStatus="vs">
   	   	  <tr>
		    <td>
		      <input type="checkbox" name="idlist" value="${ins.aac101 }"
		             onclick="onSelect(this.checked)" >
		    </td>
		    <td	style="color:#FFFFFF;text-align:center">${vs.count }</td>
		    <td	style="color:#FFFFFF;text-align:center">${ins.aac102 }</td>
		    <td	style="color:#FFFFFF;text-align:center">${ins.aab104 }</td>
		    <td	style="color:#FFFFFF;text-align:center">${ins.aac103 }</td>
		    <td	style="color:#FFFFFF;text-align:center">${ins.aac104 }</td>
		    <td	style="color:#FFFFFF;text-align:center">${ins.aaa202 }</td>
		    <td	style="color:#FFFFFF;text-align:center">${ins.aaa203 }</td>
		    <td	style="color:#FFFFFF;text-align:center">${ins.aaa204 }</td>
		    <td	style="color:#FFFFFF;text-align:center">${ins.aaa205 }</td>
		    <td	style="color:#FFFFFF;text-align:center">${ins.aaa206 }</td>
		    <td	style="color:#FFFFFF;text-align:center">${ins.aaa207 }</td>
		    <td style="color:#FFFFFF;text-align:center">
		      <a style="color:#FFFFFF" href="#" onclick="onDel('${ins.aac101}')">ɾ��</a>
		    </td>
		  </tr>
      </c:forEach>
      <!-- ������� -->
      <c:forEach begin="${fn:length(rows)+1 }" step="1" end="15">
	          <tr>
	            <td></td>
	            <td></td>
	            <td></td>
	            <td style="color:#FFFFFF;text-align:center">...</td>
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
    <tr>
    	<td style="color:#FFFFFF" colspan="13">
    		<div style="text-align:center">    
        		���޶�����¼
        	</div>
        </td>
    </tr>
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
            <td></td>
            <td></td>
            <td></td>
            <td></td>
          </tr>
       </c:forEach>
    </c:otherwise>
  </c:choose>
</table>

<table border="1" width="100%" align="center">
  <tr>
    <td align="center">
       <button type="submit" name="next">��ѯ</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       <button type="submit" id="del" name="next"  
              formaction="<%=path%>/userDeleteHistory.html"  disabled="disabled">ɾ��</button>
    </td>
  </tr>
</table>
			</div>
	</div>
</section>
	<br>
	<br>


</form>
</body>
</html>