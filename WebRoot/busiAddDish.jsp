<%@ page  language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%String path=request.getContextPath(); %>
<html>
<head>
<title>商家${empty param.aab201?'添加':'修改'}菜品</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" /> 
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="keywords" content="" />
<link href="<%=path %>/css/font-awesome.min.css" rel="stylesheet" type="text/css" media="all">
<link href="<%=path %>/css/style_login.css" rel="stylesheet" type="text/css" media="all"/>
<link href="http://fonts.googleapis.com/css?family=Raleway:400,500,600,700,800,900" rel="stylesheet">
<style type="text/css">
#preview{width:260px;height:190px;border:1px solid #000;overflow:hidden;}
#imghead {filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=image);}
#aab206
{
margin-top: 15px;
}
.btn-danger 
{
background-color: #87CEFA;
}
i.fa.fa-star
{
color:#87CEFA;
}
</style>
</head>
<body>
<div style="color:#FFFFFF">
${msg}
</div>
<br>
<form action="<%=path%>/busiAddDish.html" method="post">
<input type = "hidden" name="aab201" value="${dins.aab201}">
<div class="signupform">.
<h1></h1>
	<div class="container">
		
		<div class="agile_info">
			<div class="w3_info" style="-webkit-flex-basis: 100%">
				<h2 style="color:#87CEFA;">${empty param.aab201?'添加':'修改'}菜品</h2>
						<div class="input-group">
							<span><i class="fa fa-star" aria-hidden="true"></i></span>
							<e:text name="aab207" required="true" placeholder="菜品名" autofocus="true" defval="${dins.aab207 }" style="width:200px"/>(菜品名) 
						</div>
						<div class="input-group">
							<span><i class="fa fa-star" aria-hidden="true"></i></span>
							<e:text name="aab203" required="true" placeholder="菜品价格" autofocus="true" defval="${dins.aab203 }" style="width:200px"/> (菜品价格)
						</div>  
						<div class="input-group">
							<span><i class="fa fa-star" aria-hidden="true"></i></span>
							<c:forEach items="${row}" var="ins" varStatus="vs" >
 	   		 					<c:if test="${ins.sfcode == 'aaa202' }"  >
 	   		 						<input type="checkbox" name="aab204" value="${ins.scode}">${ins.sname}
 	   		 					</c:if>
   							</c:forEach> 
						</div>  
						<div class="input-group">
							<span><i class="fa fa-star" aria-hidden="true"></i></span>
							<c:forEach items="${row}" var="ins" varStatus="vs" >
					 	   		 <c:if test="${ins.sfcode == 'aaa203' }"  >
					 	   		 	 <input type="checkbox" name="aab205" value="${ins.scode}">${ins.sname}
					 	   		 </c:if>
					   		</c:forEach>
						</div>   
						<div class="input-group" style="height:45px">
							<span><i class="fa fa-star" aria-hidden="true"></i></span>
						<c:forEach items="${row}" var="ins" varStatus="vs" >
				 	   		 <c:if test="${ins.sfcode == 'aaa204' }"  >
				 	   		 	<input type="radio" id="aab206" name="aab206" value="${ins.scode}">${ins.sname}
				 	   		 </c:if>
				   		</c:forEach>
						</div>   
       					<input style="width:98.8%" class="btn btn-danger btn-block"  type="submit" name="aab113" 
       					value="${empty param.aab201?'添加':'修改' }"  formaction="<%=path%>/${empty param.aab201?'busiAddDish':'busiModifyDish' }.html">
       					 <input class="btn btn-danger btn-block" type="submit" name="next" value="返回" style="width: 98.8%;"
       					 formaction="<%=path%>/busiReturnMenuManage.html" formnovalidate="formnovalidate">
			</div>
		</div>
			<div class="clear"></div>
			</div>
			
		</div>
		<div class="footer">
 </div>
	</form>
	</body>
</html>