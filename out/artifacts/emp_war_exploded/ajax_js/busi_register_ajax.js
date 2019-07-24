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
                    $("#username-msg").html("用户名已存在")
                    console.log("用户名已存在")
                    $("#submit-btn").attr("disabled", false);
                }
                else {
                    $("#username-msg").html("用户名可用")
                    console.log("用户名可用")
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