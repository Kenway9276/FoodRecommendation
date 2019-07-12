<%@ page  language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
   <title>Insert title here</title>
   <style type="text/css">
     tr
     {
        height:30px;
     }
   </style>
</head>
<body>
${msg }
<br>
<br>
<form action="<%=request.getContextPath()%>/queryEmp.html" method="post">
  <!-- 查询条件区 -->
	<table border="1" width="95%" align="center">
	  <caption>
	               员工管理
	    <hr width="160">
	  </caption>
	  <tr>
	    <td colspan="4">查询条件</td>
	  </tr>
	  <tr>
	    <td>姓名</td>
	    <td>
	      <e:text name="qaab102"/>
	    </td>
	    <td>员工编号</td>
	    <td>
	      <e:text name="qaab103"/>
	    </td>
	  </tr>
	  <tr>
	    <td>性别</td>
	    <td>
	      <e:radio name="qaab105" value="男:1,女:2,不确定:3,不限定:''" defval=""/>
	    </td>
	    <td>民族</td>
	    <td>
	      <e:select name="qaab106" value="汉族:01,满族:02,蒙族:03,藏族:04,哈萨克:05" header="true" />
	    </td>
	  </tr>
	  <tr>
	    <td>生日[B]</td>
	    <td>
	      <e:date name="baab104"/>
	    </td>
	    <td>生日[E]</td>
	    <td>
	      <e:date name="eaab104"/>
	    </td>
	  </tr>
	</table>
	${rows }
	<!-- 数据迭代区 -->
	<table border="1" width="95%" align="center">
	  <tr>
	    <td></td>
	    <td>序号</td>
	    <td>姓名</td>
	    <td>编号</td>
	    <td>生日</td>
	    <td>性别</td>
	    <td>民族</td>
	    <td>手机号码</td>
	    <td>电子邮件</td>
	    <td></td>
	  </tr>
	  <!--
	         注意事项
	    1.$及大括号的结束标记 }与双引号之间,不允许出现空格
	    2.所有的属性之间至少要有一个空格,否则报错
	    3.var 属性,相当于在页面定义变量名称,因此  ins不允许再用$ {  }
	   -->
	  <c:if test="${rows!=null }">
	     <c:forEach items="${rows }" var="ins" varStatus="vs">
    	   	  <tr>
			    <td></td>
			    <td>${vs.count }</td>
			    <td>${ins.aab102 }</td>
			    <td>${ins.aab103 }</td>
			    <td>${ins.aab104 }</td>
			    <td>${ins.aab105 }</td>
			    <td>${ins.aab106 }</td>
			    <td>${ins.aab108 }</td>
			    <td>${ins.aab109 }</td>
			    <td></td>
			  </tr>
	      </c:forEach>
	  </c:if>
	</table>
	
	<!-- 功能按钮区 -->
	<table border="1" width="95%" align="center">
	  <tr>
	    <td align="center">
	       <input type="submit" name="next" value="查询">
	       <input type="submit" name="next" value="添加" 
	              formaction="<%=request.getContextPath()%>/addEmp.jsp">
	       <input type="submit" name="next" value="删除" disabled="disabled">
	    </td>
	  </tr>
	</table>
</form>
</body>
</html>