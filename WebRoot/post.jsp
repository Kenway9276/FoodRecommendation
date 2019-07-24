<%@ taglib prefix="e" uri="http://org.wangxg/jsp/extl" %>
<%--
  Created by IntelliJ IDEA.
  User: P7XXTMX-G
  Date: 2019/7/11
  Time: 15:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=gbk" language="java" %>
<html>
<head>
    <!-- Bootstrap core CSS -->
    <link href="https://cdn.bootcss.com/bootstrap/4.1.0/css/bootstrap.min.css" rel="stylesheet">
    <title>Title</title>
</head>
<body>
<%@ include file="navigate.jsp" %>
<form id="aaa" action="/emp/bBSPost.html" method="post">
    <br>
    <p align="center">标题 &nbsp;&nbsp;<input type="text" name="aaa303"></p><br>
    <div id="div0" class="toolbar">
    </div>
    <div id="div1" style="width:60%;height:50%;margin:0 auto;">
        <p>这里输入正文</p>
    </div>
    <textarea name="aaa304" id="text1" style="display: none"></textarea>
    <textarea name="aaa306" id="text2" style="display: none"></textarea>
    <% String filePath = request.getSession().getServletContext().getRealPath("/upload");%>
    <input type="hidden" name="filePath" value="<%=filePath%>">
    <p align="center">
        <button class="btn btn-outline-danger" type="submit" value="发布">发布</button>
        <button class="btn btn-outline-danger" formaction="/emp/bBSBrowseAll.html" type="submit" value="返回">返回</button>
    </p>

</form>

<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="js/wangEditor.js"></script>
<script type="text/javascript">
    var E = window.wangEditor
    var editor = new E('#div1')
    editor.customConfig.uploadImgShowBase64 = true
    var $text1 = $('#text1')
    var $text2 = $('#text2')
    editor.customConfig.onchange = function (html) {
        // 监控变化，同步更新到 textarea
        $text1.val(html)
        $text2.val(editor.txt.text())
    }

    editor.create()
    // 初始化 textarea 的值
    $text1.val(editor.txt.html())
    $text2.val(editor.txt.text())


</script>
</body>
</html>
