$(function() {
    //
    $("#businame-input-text").bind('input propertychange', function(){
        var businame = $(this).val()
        $.ajax({
            type:"get",
            url:"busiNameCheck.html?aab102=" + businame,
            data:{},
            dataType:"json",//
            success:function(data) {
                var json = $.parseJSON(data)
                console.log(json)
                console.log(json.msg)
                if(json.msg == "1"){
                    $("#businame-msg").html("�û����Ѵ���")
                    console.log("�û����Ѵ���")
                    $("#busi-submit-btn").attr("disabled", true);
                }
                else {
                    $("#businame-msg").html("�û�������")
                    console.log("�û�������")
                    $("#busi-submit-btn").attr("disabled", false);
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