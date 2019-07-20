$(function() {
    //点击帖子标题获取帖子内容
    $("#book-btn").click(function() {
        var shop_id = $("#shop_id")
        var aab101 = shop_id.val()
        var form = $("#myform")
        console.log(form.serializeArray())
        $.ajax({
            type:"post",
            url:"reserveAdd.html?aab101="+ aab101,
            data:form.serializeArray(),
            scriptCharset:"utf-8",
            success:function(data) {
                alert("提交成功，请等待商家审核。")
            },
            error:function(jqXHR,textStatus,errorThrown,data) {
                console.log(data)
                console.log(textStatus)
                console.log(errorThrown)

            }
        });
    });

});