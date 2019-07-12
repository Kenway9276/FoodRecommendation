<%@ taglib prefix="e" uri="http://org.wangxg/jsp/extl" %>
<%--
  Created by IntelliJ IDEA.
  User: P7XXTMX-G
  Date: 2019/7/11
  Time: 15:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form id="postForm" action="/bBSPost.html" enctype="multipart/form-data" method="post">
    标题<input type="text" name="aaa303"><br>
    正文<div id="div1">
    <p>这里输入正文</p>
    </div>
    <textarea name="aaa304" id="text1" style="display: none"></textarea>
    <button id="subBtn" value="发布">发布</button>
</form>

<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="js/wangEditor.js"></script>
<script type="text/javascript">
    var E = window.wangEditor
    var editor = new E('#div1')
    editor.customConfig.uploadImgShowBase64 = true
    var $text1 = $('#text1')
    editor.customConfig.onchange = function (html) {
        // 监控变化，同步更新到 textarea
        $text1.val(html)
    }

    editor.create()
    // 初始化 textarea 的值
    $text1.val(editor.txt.html())


    document.getElementById('subBtn').addEventListener('click', function () {
        var vform = document.getElementById("postForm");
        // 读取 text
        var aaa306 = editor.txt.text()
        vform.action = "/bBSPost.html?aaa306="+aaa306;

    }, false)

</script>
<script type="text/javascript">
    function onSelect(vaaa306) {
        var vform = document.getElementById("postForm");

        vform.action = "/bBSPost.html?aaa306="+vaaa306;
        //alert(vform.action);
        vform.submit();
    }
</script>
</body>
</html>
