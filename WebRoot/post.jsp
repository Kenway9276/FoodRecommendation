<%@ taglib prefix="e" uri="http://org.wangxg/jsp/extl" %>
<%--
  Created by IntelliJ IDEA.
  User: P7XXTMX-G
  Date: 2019/7/11
  Time: 15:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=GBK" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form id="aaa" action="/bBSPost.html" method="post">
    标题<input type="text" name="aaa303"><br>
    正文<div id="div1">
    <p>这里输入正文</p>
    </div>
    <textarea name="aaa304" id="text1" ></textarea>
    <textarea name="aaa306" id="text2" ></textarea>
    <% String filePath = request.getSession().getServletContext().getRealPath("/upload");%>
    <input type="hidden" name="filePath" value="<%=filePath%>">
    <input type="submit" value="发布"></input>
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
