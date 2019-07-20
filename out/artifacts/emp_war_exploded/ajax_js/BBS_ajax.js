$(function() {
    //获取当前页码的帖子列表
    $("#to-BBS").click(function() {
        $.ajax({
            type:"post",
            url:"bBSBrowse.html",
            data:{},
            dataType:"json",//返回的
            scriptCharset:"utf-8",
            success:function(data) {
            },
            error:function(jqXHR,textStatus,errorThrown,data) {
                console.log(data)
                console.log(textStatus)
                console.log(errorThrown)

            }
        });
    });
});

$(function() {
    //获取当前页码的帖子列表
    $("div").delegate("#selectable-page","click",function() {
        var currentPage = $(this).html()
        $.ajax({
            type:"post",
            url:"bBSBrowseForPage.html?currentPage="+currentPage,
            data:{},
            dataType:"json",//返回的
            scriptCharset:"utf-8",
            success:function(data) {
                // 开始遍历json展示帖子列表
                showAll(data)
                $("#tem-data22").html(data[0].aaa306)
            },
            error:function(jqXHR,textStatus,errorThrown,data) {
                console.log(data)
                console.log(textStatus)
                console.log(errorThrown)
                alert("error")
            }
        });
    });


});

function showAll(BBS_list) {
    var row = $(".row")
    var page = null
    $("#page-number").html("")
    row.html("")

    var count = 0
    var total = getJsonLength(BBS_list) - 1
    console.log(BBS_list)
    $.each(BBS_list,function (index,obj) {
        if(count != total){
            var post = "<!-- Post -->\n" +
                "            <div class=\"col-md-6\">\n" +
                "                <div class=\"post-default post-has-no-thumb\">\n" +
                "                    <div class=\"post-data\">\n" +
                "                        <!-- Title -->\n" +
                "                        <div class=\"title\">\n" +
                "                            <h2><a href=\"#\" onclick=\"onSelect('" +
                obj.aaa301 +
                "                                                           ')\">" + obj.aaa303 + "</a></h2>\n" +
                "                        </div>\n" +
                "                        <!-- Post Meta -->\n" +
                "                        <ul class=\"nav meta align-items-center\">\n" +
                "                            <li class=\"meta-author\">\n" +
                "                                <a href=\"#\">" + obj.aaa103 + "</a>\n" +
                "                            </li>\n" +
                "                            <li class=\"meta-date\"><a href=\"#\">" + obj.aaa302 + "</a></li>\n" +
                "                            <li class=\"meta-comments\"><a href=\"#\"><i class=\"fa fa-comment\"></i> </a></li>\n" +
                "                        </ul>\n" +
                "                        <!-- Post Desc -->\n" +
                "                        <div class=\"desc\">\n" +
                "                            <p>\n" +
                obj.aaa306 +
                "                            </p>\n" +
                "                        </div>\n" +
                "                    </div>\n" +
                "                    <p><a href=\"#\" onclick=\"onSelect('" +
                obj.aaa301 +
                "                                                           ')\" id=\"view-more\" class=\"btn btn-primary\">view more</a></p>\n" +
                "                    <input type=\"hidden\" id=\"hidden-title\" value=\"" +
                obj.aaa301 +
                "                                                                       \">\n"


            if(obj.isUser == '1'){
                post = post + "                    <c:if test=\"${rows[vs.count - 1].isUser == '1'}\">\n" +
                    "                        <p><a href=\"#\"  onclick=\"onDel('${rows[vs.count - 1].aaa301}')\" class=\"btn btn-primary\">delete</a></p>\n" +
                    "                    </c:if>\n"
            }

            post = post+
                "                </div>\n" +
                "            </div>"
            row.append(post)
        }
        else {

            page = "<div id=\"page-number\" class=\"post-pagination d-flex justify-content-center\">\n" +
                "            <input type=\"hidden\" name=\"currentPage\" value=\"" +
                obj.currentPage +
                "                                                                           \">\n"

            if((obj.currentPage - 3) < 0){
                for (var i = 1; i < obj.currentPage; i++) {
                    page = page + "<a id=\"selectable-page\" class=\"page-btn\" href=\"#\">" +
                        i +
                        "</a>\n"
                }
            }
            else{
                page = page +
                    "                    <a id=\"selectable-page\" class=\"page-btn\" href=\"#\">" +
                    1 +
                    "</a>\n" +
                    "                    <a id=\"selectable-page\" class=\"page-btn\" href=\"#\">" +
                    2 +
                    "</a>\n" +
                    "                    <a id=\"selectable-page\" class=\"page-btn\" href=\"#\">" +
                    3 +
                    "</a>\n"
            }

            page = page +
                "            <span class=\"current\">" +
                obj.currentPage +
                "</span>\n"

            if((Number(obj.currentPage) + 3) > obj.totalPages){
                console.log((obj.currentPage + 3))
                console.log(obj.totalPages)
                for (var i = obj.currentPage; i < obj.totalPages; i++) {
                    page = page + "<a id=\"selectable-page\" class=\"page-btn\" href=\"#\">" +
                        (Number(obj.currentPage) + Number(i)) +
                        "</a>\n"
                }
            }
            else{
                page = page +
                    "                    <a id=\"selectable-page\" class=\"page-btn\" href=\"#\">" +
                    (Number(obj.currentPage) + 1) +
                    "</a>\n" +
                    "                    <a id=\"selectable-page\" class=\"page-btn\" href=\"#\">" +
                    (Number(obj.currentPage) + 2) +
                    "</a>\n" +
                    "                    <a id=\"selectable-page\" class=\"page-btn\" href=\"#\">" +
                    (Number(obj.currentPage) + 3) +
                    "</a>\n"
            }
            page = page + "        </div>"
        }
        count = count + 1
    })



    row.append(page)
}

function getJsonLength(json) {
    var count = 0
    $.each(json,function (index,obj) {
        count = count + 1
    })
    return count
}