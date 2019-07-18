$(function() {
    //点击帖子标题获取帖子内容
    $("#view-more").click(function() {
        var hidden_title = $("#hidden-title")
        var title = hidden_title.val()
        alert("dddddd")
        $.ajax({
            type:"post",
            url:"ajaxTest.html",
            data:{title:title},
            scriptCharset:"utf-8",
            success:function(data) {
                window.location.href = "single.jsp";
                alert("success")
            },
            error:function(msg) {
                alert("error")
            }
        });
    });
});