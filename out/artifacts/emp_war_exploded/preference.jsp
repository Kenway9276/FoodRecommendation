<%@ page language="java" import="java.util.*" pageEncoding="GBK" %>
<%@ taglib uri="http://org.wangxg/jsp/extl" prefix="e" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%String path = request.getContextPath(); %>
<html>
<head>

    <!--��Ҫ��ʽ-->
    <link rel="stylesheet" href="css/jquery-labelauty.css" />

    <style type="text/css">
        ul{list-style-type: none;}
        li{display: inline-block;}
        li{margin: 10px 0;}
        input.labelauty + label{font:15px "Microsoft Yahei";}
    </style>

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

            //alert(vform.action);
            vform.submit();
        }

    </script>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
</head>
<body>
<form id="tem" action="<%=path%>/preferenceAdd.html" method="post">
    <h3>��ϵ</h3>
    <ul class="dowebok">
        <c:forEach items="${headers }" var="ins" varStatus="vs">
            <c:if test="${ins.sfcode == 'aaa203'}">
                <li><input value="${ins.scode }" type="checkbox" name="aaa203" data-labelauty="${ins.sname }"></li>
            </c:if>
        </c:forEach>
    </ul>
    <h3>����</h3>
    <ul class="dowebok">
        <c:forEach items="${headers }" var="ins" varStatus="vs">
            <c:if test="${ins.sfcode == 'aaa204'}">
                <li><input value="${ins.scode }" type="checkbox" name="aaa204" data-labelauty="${ins.sname }"></li>
            </c:if>
        </c:forEach>
    </ul>
    <h3>��ζ</h3>
    <ul class="dowebok">
        <c:forEach items="${headers }" var="ins" varStatus="vs">
            <c:if test="${ins.sfcode == 'aaa202'}">
                <li><input value="${ins.scode }" type="checkbox" name="aaa202" data-labelauty="${ins.sname }"></li>
            </c:if>
        </c:forEach>
    </ul>
    <h3>��ǰ��ַ��</h3>
    <input type="submit" name="next" value="��ӵ��б�">
    <input type="submit" name="next" value="��ȡ����" formaction="recommendGet.html">

    <br>

</form>



�ҵĿ�ζ�б�
<!-- ��ʾʵ�ʲ�ѯ�������� -->

<div id="preferenceList">
    <form id="selectForm">
        <table>
            <tr>
                <td>��ζ</td>
                <td>��ϵ</td>
                <td>����</td>
                <td>�豸</td>
                <td>λ��</td>
                <td>��ע</td>
            </tr>
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
                        <a href="#" onclick="onDel('${ins.aaa201}')">ɾ��</a>
                        <a href="#" onclick="onSelect('${ins.qaaa203 }','${ins.qaaa202 }','${ins.qaaa204 }')">ѡ��</a>
                    </td>
                </tr>

            </c:forEach>
        </table>
    </form>
</div>
<script type="text/javascript" src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js"></script>
<script type="text/javascript" src="css/jquery-labelauty.js"></script>
<script type="text/javascript">
    $(function(){
        $(':input').labelauty();
    });
</script>
</body>
</html>