$(function() {
    //点击帖子标题获取帖子内容
    $("#view-more").click(function() {
        var hidden_title = $("#hidden-title")
        var title = hidden_title.val()
        $.ajax({
            type:"post",
            url:"bBSBrowseSingle.html?aaa301="+ title,
            data:{},
            dataType:"json",//返回的
            scriptCharset:"utf-8",
            success:function(data) {
                alert(data)
                $("#tem-data").html(data[0].aaa301)
            },
            error:function(jqXHR,textStatus,errorThrown,data) {
                console.log(data)
                console.log(textStatus)
                console.log(errorThrown)

            }
        });
    });

});