$(function() {
    //������ӱ����ȡ��������
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
                alert("�ύ�ɹ�����ȴ��̼���ˡ�")
            },
            error:function(jqXHR,textStatus,errorThrown,data) {
                console.log(data)
                console.log(textStatus)
                console.log(errorThrown)

            }
        });
    });

});