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
<form action="<%=path%>/busiAddDish.html" method="post">
<input type = "hidden" name="aab101" value="2">
<input type = "hidden" name="aab201" value="${dins.aab201}">
<table  border="1" align="center" width="45%">
    <caption>
       	${empty param.aab201?'添加':'修改'}菜品
    <hr width="160">
    </caption>
   <tr>
     <td colspan="2">菜品基本信息</td>
   </tr>
   <tr>
     <td>菜品名</td>
     <td>
       <e:text name="aab207" required="true" autofocus="true" defval="${dins.aab207 }"/> 
     </td>
   </tr>
   <tr>
     <td>菜品价格</td>
     <td>
       <e:text name="aab203"  required="true" defval="${dins.aab203 }"/>
     </td>
   </tr>
   <tr>
   <td>口味</td>
   <td>
   		<c:forEach items="${row}" var="ins" varStatus="vs" >
 	   		 <c:if test="${ins.sfcode == 'aaa202' }"  >
 	   		 	 <input type="checkbox" name="aab204" value="${ins.scode}">${ins.sname}
 	   		 </c:if>
   		</c:forEach>
   </td>
   </tr>
   
   <tr>
   <td>菜系</td>
   <td>
   		<c:forEach items="${row}" var="ins" varStatus="vs" >
 	   		 <c:if test="${ins.sfcode == 'aaa203' }"  >
 	   		 	 <input type="checkbox" name="aab205" value="${ins.scode}">${ins.sname}
 	   		 </c:if>
   		</c:forEach>
   </td>
   </tr>
   
   
   <tr>
   <td>种类</td>
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
       <input type="submit" name="next" value="${empty param.aab201?'添加':'修改' }"
              formaction="<%=path%>/${empty param.aab201?'busiAddDish':'busiModifyDish' }.html">
       <input type="submit" name="next" value="返回" 
              formaction="<%=path%>/busiReturnMenuManage.html"
              formnovalidate="formnovalidate">
     </td>
   </tr>
</table>
</form>
</body>
</html>