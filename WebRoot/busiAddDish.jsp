<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%String path=request.getContextPath();%>
<html>
<head>
<title>Insert title here</title>
<style type="text/css">
  td{
      height:30px;
  }
  msg{
     color:#FF0000
  }
</style>
</head>
<body>

${msg}
<br>
<br>
<form action="<%=path%>/addEmp.html" method="post">
<input type = "hidden" name="aab101" value="2">
<table  border="1" align="center" width="45%">
    <caption>
       	�ϴ���Ʒ
    <hr width="160">
    </caption>
   <tr>
     <td colspan="2">��Ʒ������Ϣ</td>
   </tr>
   <tr>
     <td>��Ʒ��</td>
     <td>
       <e:text name="aab207" required="true" autofocus="true" defval="${ins.aab207 }"/> 
     </td>
   </tr>
   <tr>
     <td>��ƷͼƬ</td>
     <td>
       <e:text name="aab202"  required="true" defval="${ins.aab202 }"/>
     </td>
   </tr>
   <tr>
     <td>��Ʒ�۸�</td>
     <td>
       <e:text name="aab203"  required="true" defval="${ins.aab203 }"/>
     </td>
   </tr>
   <tr>
   <td>��ζ</td>
   <td>
   		<c:forEach items="${row}" var="ins" varStatus="vs" >
 	   		 <c:if test="${ins.sfcode == 'aaa202' }"  >
 	   		 	<input type="checkbox" name="aab204" value="${ins.scode}">${ins.sname}
 	   		 </c:if>
   		</c:forEach>
   </td>
   </tr>
   
   <tr>
   <td>��ϵ</td>
   <td>
   		<c:forEach items="${row}" var="ins" varStatus="vs" >
 	   		 <c:if test="${ins.sfcode == 'aaa203' }"  >
 	   		 	<input type="checkbox" name="aab205" value="${ins.scode}">${ins.sname}
 	   		 </c:if>
   		</c:forEach>
   </td>
   </tr>
   
   
   <tr>
   <td>����</td>
   <td>
   		<c:forEach items="${row}" var="ins" varStatus="vs" >
 	   		 <c:if test="${ins.sfcode == 'aaa204' }"  >
 	   		 	<input type="radio" name="aab206" value="${ins.scode}">${ins.sname}
 	   		 </c:if>
   		</c:forEach>
   </td>
   </tr>
   <tr>
     <td colspan="2" align="center">
       <input type="submit" name="next" value="���"
              formaction="<%=path%>/busiAddDish.html">
       <input type="submit" name="next" value="����" 
              formaction="<%=path%>/busiModify.html"
              formnovalidate="formnovalidate">
     </td>
   </tr>
</table>
</form>
</body>
</html>