<%@ page language="java" import="java.util.*" pageEncoding="GBK" %>
<%@ taglib uri="http://org.wangxg/jsp/extl" prefix="e" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%String path = request.getContextPath(); %>
<html>
<head>
    <title>Insert title here</title>

    <script type="text/javascript">

        function onSelect(vaaa203,vaaa202,vaaa204) {
            var vform = document.getElementById("selectForm");

            vform.action = "<%=path%>/recommendGet.html?aaa203=" + vaaa203 + "&aaa204=" + vaaa204 + "&aaa202="+ vaaa202;
            //alert(vform.action);
            vform.submit();
        }

        function onDel(vaaa201) {
            var vform = document.getElementById("tem");
            vform.action = "<%=path%>/preferenceDelete.html?aaa201=" + vaaa201;
            alert(vaaa201);
            //alert(vform.action);
            vform.submit();
        }

    </script>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
</head>
<body>
<form id="tem" action="<%=path%>/preferenceAdd.html" method="post">
    用户名<br>
    菜系<br>
    <c:forEach items="${headers }" var="ins" varStatus="vs">
        <c:if test="${ins.sfcode == 'aaa203'}">
            <e:checkbox name="aaa203" value="${ins.scode }"/>${ins.sname }
        </c:if>
    </c:forEach>

    <br>
    种类<br>
    <c:forEach items="${headers }" var="ins" varStatus="vs">
        <c:if test="${ins.sfcode == 'aaa204'}">
            <e:checkbox name="aaa204" value="${ins.scode }"/>${ins.sname }
        </c:if>
    </c:forEach>
    <br>
    口味<br>
    <c:forEach items="${headers }" var="ins" varStatus="vs">
        <c:if test="${ins.sfcode == 'aaa202'}">
            <e:checkbox name="aaa202" value="${ins.scode }"/>${ins.sname }
        </c:if>
    </c:forEach>
    <br>
    地址
    <e:text name="aaa206" required="true"/>
    <input type="submit" name="next" value="添加到列表">
    <input type="submit" name="next" value="获取餐厅" formaction="recommendGet.html">

    <br>

</form>



我的口味列表
<!-- 显示实际查询到的数据 -->

<div id="preferenceList">
    <form id="selectForm">
        <table>
            <tr>
                <td>口味</td>
                <td>菜系</td>
                <td>种类</td>
                <td>设备</td>
                <td>位置</td>
                <td>备注</td>
            </tr>
            ${rows }
            <c:forEach items="${rows }" var="ins" varStatus="vs">


                <tr>
                    <td>${ins.aaa202 }</td>
                    <td>${ins.aaa203 }</td>
                    <td>${ins.aaa204 }</td>
                    <td>${ins.aaa205 }</td>
                    <td>${ins.aaa206 }</td>
                    <td>${ins.aaa207 }</td>
                    <e:hidden name="qaaa204" value="${ins.qaaa204 }"/>
                    <e:hidden name="qaaa202" value="${ins.qaaa202 }"/>
                    <e:hidden name="qaaa203" value="${ins.qaaa203 }"/>
                    <e:hidden name="aaa201" value="${ins.aaa201 }"/>
                    <td>
                        <a href="#" onclick="onDel('${ins.aaa201}')">删除</a>
                        <a href="#" onclick="onSelect('${ins.qaaa203 }','${ins.qaaa202 }','${ins.qaaa204 }')">选择</a>
                    </td>
                </tr>

            </c:forEach>
        </table>
    </form>
</div>

</body>
</html>