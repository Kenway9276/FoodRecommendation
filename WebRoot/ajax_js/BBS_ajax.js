$(function() {
    //������ӱ����ȡ��������
    $("#view-more").click(function() {
        var hidden_title = $("#hidden-title")
        var title = hidden_title.val()
        $.ajax({
            type:"post",
            url:"bBSBrowseSingle.html?aaa301="+ title,
            data:{},
            dataType:"json",//���ص�
            scriptCharset:"utf-8",
            success:function(data) {
                alert(data.msg)
                $("#tem-data").html(data.msg)
            },
            error:function(jqXHR,textStatus,errorThrown,data) {
                console.log(data)
                console.log(textStatus)
                console.log(errorThrown)

            }
        });
    });

});