$(function() {
    //
    $("#username-input-text").bind('input propertychange', function(){
        var username = $(this).val()
        $.ajax({
            type:"post",
            url:"userNameCheck.html?aaa102=" + username,
            data:{},
            dataType:"json",//
            success:function(data) {
                var json = $.parseJSON(data)
                console.log(json)
                console.log(json.msg)
                if(json.msg == "1"){
                    $("#username-msg").html("�û����Ѵ���")
                    console.log("�û����Ѵ���")
                    $("#submit-btn").attr("disabled", false);
                }
                else {
                    $("#username-msg").html("�û�������")
                    console.log("�û�������")
                    $("#submit-btn").attr("disabled", true);
                }
            },
            error:function(jqXHR,textStatus,errorThrown,data) {
                console.log(data)
                console.log(textStatus)
                console.log(errorThrown)

            }
        });
    });
});