<%@ page  language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%String path=request.getContextPath();%>

<html>
<head>
<title>历史记录管理</title>
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
			<h2 class="section-title wow fadeInDown">历史订座记录</h2>
		</div> 
			<div style="width:70%;margin:0 auto" class="row">
					<h4>请在下表输入查询条件。</h4>
					<ul class="menuPrice">
						<li>
							<a style="text-decoration:none" href="#">&nbsp;&nbsp;&nbsp;订餐日期&nbsp;&nbsp;&nbsp;<input type="date" name="qaac102">
							商家名&nbsp;&nbsp;&nbsp;<e:text name="qaab104"/>&nbsp;&nbsp;&nbsp;
							用餐日期&nbsp;&nbsp;&nbsp;<input type="date" name="qaac103"></a>
						</li>
						<li>
							<a style="text-decoration:none" href="#">&nbsp;&nbsp;&nbsp;人数&nbsp;&nbsp;&nbsp;<e:number step="1" name="qaac104"/>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;订座号&nbsp;&nbsp;&nbsp;<e:number step="1" name="qaac105"/></a>
						</li>
						<li>
							<a style="text-decoration:none" href="#">&nbsp;&nbsp;&nbsp;口味&nbsp;&nbsp;&nbsp;<e:number step="1" name="qaaa202"/>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;菜系&nbsp;&nbsp;&nbsp;<e:number step="1" name="qaaa203"/>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;种类&nbsp;&nbsp;&nbsp;<e:number step="1" name="qaaa204"/>
							</a>
						</li>
						<li>
							<a style="text-decoration:none" href="#">&nbsp;&nbsp;&nbsp;设备&nbsp;&nbsp;&nbsp;<e:number step="1" name="qaaa205"/>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;位置&nbsp;&nbsp;&nbsp;<e:text name="qaaa206"/></a>
						</li>
					</ul>
					<h4>查询结果将显示在这里。</h4>
	<table border="1px;solid" width="100%" align="center">
<!-- 	内容包括:用户名（aaa102）、商家名（aab102）、订座日期（aac102）、 -->
<!-- 	用餐日期（aac103）、用餐人数（aac104）、当天的订座号（aac105）、 -->
<!-- 	当天的用户偏好信息如口味（aab202）、菜系（aab203）、 -->
<!-- 	种类（aab204）、设备（aab205）、位置（aab206）。 -->
	<tr>
		<td></td>
		<td style="color:#FFFFFF;width:40px;text-align:center">序号</td>
		<td	style="color:#FFFFFF;text-align:center">订座日期</td>
		<td	style="color:#FFFFFF;width:80px;text-align:center">商家名</td>
		<td	style="color:#FFFFFF;text-align:center">用餐日期</td>
		<td	style="color:#FFFFFF;width:40px;text-align:center">人数</td>
		<td	style="color:#FFFFFF;width:40px;text-align:center">口味</td>
		<td	style="color:#FFFFFF;width:60px;text-align:center">菜系</td>
		<td	style="color:#FFFFFF;width:40px;text-align:center">种类</td>
		<td	style="color:#FFFFFF;width:40px;text-align:center">设备</td>
		<td	style="color:#FFFFFF;width:40px;text-align:center">位置</td>
		<td	style="color:#FFFFFF;width:40px;text-align:center">备注</td>		
		<td style="width:40px"></td>
	</tr>
  <c:choose>
    <c:when test="${rows!=null }">
        <!-- 显示实际查询到的数据 -->
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
		      <a style="color:#FFFFFF" href="#" onclick="onDel('${ins.aac101}')">删除</a>
		    </td>
		  </tr>
      </c:forEach>
      <!-- 补充空行 -->
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
        		暂无订座记录
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
       <button type="submit" name="next">查询</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       <button type="submit" id="del" name="next"  
              formaction="<%=path%>/userDeleteHistory.html"  disabled="disabled">删除</button>
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