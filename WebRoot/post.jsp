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
    ����<input type="text" name="aaa303"><br>
    ����<div id="div1">
    <p>������������</p>
    </div>
    <textarea name="aaa304" id="text1" ></textarea>
    <textarea name="aaa306" id="text2" ></textarea>
    <% String filePath = request.getSession().getServletContext().getRealPath("/upload");%>
    <input type="hidden" name="filePath" value="<%=filePath%>">
    <input type="submit" value="����"></input>
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
        // ��ر仯��ͬ�����µ� textarea
        $text1.val(html)
        $text2.val(editor.txt.text())
    }

    editor.create()
    // ��ʼ�� textarea ��ֵ
    $text1.val(editor.txt.html())
    $text2.val(editor.txt.text())


</script>
</body>
</html>
