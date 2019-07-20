$(function() {
    $("div").delegate("#add-to-preference","click",function() {
        $.ajax({
            type:"post",
            url:"preferenceAdd.html",
            data:$("#tem").serializeArray(),
            dataType:"text",//·µ»ØµÄ
            scriptCharset:"utf-8",
            success:function(data) {
                var json = $.parseJSON(data)
                console.log("data: " + json)
                showAll(json)
            },
            error:function(msg) {
                alert("error")
                console.log("error")
            }
        });
    });
});

function showAll(json) {
    var preference_list = $("#preference-list-body")
    preference_list.html("")
    $.each(json,function (index,obj) {
        var tr = "<tr>\n" +
            "               <td>" +
            obj.aaa202 +
            "</td>\n" +
            "               <td>" +
            obj.aaa203  +
            "</td>\n" +
            "               <td>" +
            obj.aaa204 +
            "</td>\n" +
            "               <td>" +
            obj.aaa205 +
            "</td>\n" +
            "               <td>" +
            obj.aaa206 +
            "</td>\n" +
            "               <td>" +
            obj.aaa207 +
            "</td>\n" +
            "               <e:hidden name=\"qaaa204\" value=\"" +
            obj.qaaa204 +
            "\"/>\n" +
            "               <e:hidden name=\"qaaa202\" value=\"" +
            obj.qaaa202 +
            "\"/>\n" +
            "               <e:hidden name=\"qaaa203\" value=\"" +
            obj.qaaa203 +
            "\"/>\n" +
            "               <e:hidden name=\"aaa201\" value=\"" +
            obj.qaaa201 +
            "\"/>\n" +
            "               <td>\n" +
            "                   <a href=\"#\" onclick=\"onDel('" +
            obj.aaa201 +
            "')\"><button class=\"forSelect\">É¾³ý</button></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n" +
            "                   <a href=\"#\" onclick=\"onSelect('" +
            obj.qaaa203 +
            "','" +
            obj.qaaa202 +
            "','" +
            obj.qaaa204 +
            "')\"><button class=\"forSelect\">Ñ¡Ôñ</button></a>\n" +
            "               </td>\n" +
            "           </tr>"
        preference_list.append(tr)
    })
    console.log(preference_list)

}