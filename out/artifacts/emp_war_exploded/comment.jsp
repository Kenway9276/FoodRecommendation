<%@ page contentType="text/html;charset=GBK" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%String path=request.getContextPath(); %>
<html>
<head>
    <title>写点评</title>
    <!-- Bootstrap core CSS -->
   <link href="https://cdn.bootcss.com/bootstrap/4.1.0/css/bootstrap.min.css" rel="stylesheet">
    <!-- FontAwesome core CSS -->
    <link href="http://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">

    <meta charset=gb2312 /> 
    <style>
        a {
            color: #f1c40f;
        }

        a:hover,
        a:active,
        a:focus {
            color: #dab10d;
        }

        .rating-stars {
            width: 100%;
            text-align: center;
        }

        .rating-stars .rating-stars-container {
            font-size: 0px;
        }

        .rating-stars .rating-stars-container .rating-star {
            display: inline-block;
            font-size: 32px;
            color: #555555;
            cursor: pointer;
            padding: 5px 10px;
        }

        .rating-stars .rating-stars-container .rating-star.is--active,
        .rating-stars .rating-stars-container .rating-star.is--hover {
            color: #f1c40f;
        }

        .rating-stars .rating-stars-container .rating-star.is--no-hover {
            color: #555555;
        }
    </style>
    
<script type="text/javascript">
function backto(vaab101)
{
	//返回上一页
	window.history.back(-1); 
	window.location.href="shopinfoFindById.html?aab101="+vaab101;
}
function addcomment(vaab101)
{
	alert("评论成功");
}
</script>
</head>
<body>
<%@ include file="navigate.jsp" %>
<form id="myform" action="<%=path%>/commentAdd.html"  method="post">
		
					<br>
					<br>
					
		            <h3 align="center">评分</h3>
		            <div class="rating-stars block" id="rating">
		                <input type="hidden" readonly required class="form-control rating-value" name="aab307" id="rating-stars-value">
		                <div class="rating-stars-container">
		                    <div class="rating-star">
		                        <i class="fa fa-star"></i>
		                    </div>
		                    <div class="rating-star">
		                        <i class="fa fa-star"></i>
		                    </div>
		                    <div class="rating-star">
		                        <i class="fa fa-star"></i>
		                    </div>
		                    <div class="rating-star">
		                        <i class="fa fa-star"></i>
		                    </div>
		                    <div class="rating-star">
		                        <i class="fa fa-star"></i>
		                    </div>
		                </div>
		            </div>
		            <br>
		            <br>	            
	<h3 align="center">点评内容</h3>
    <div id="div1" style="width:60%;height:50%;margin:0 auto;">
    </div>
    <div style="display:none">
    <textarea  name="htmltext" id="text1" ></textarea>
    <textarea  name="aab306" id="text2" ></textarea>
    </div>
    <input type="hidden" name="aab101" value="${ins.aab101 }">
    
    <% String filePath = request.getSession().getServletContext().getRealPath("/upload");%>
    
	<input type="hidden" name="filePath" value="<%=filePath%>">
	<br>
	<div align="center">
	
	<c:if test="${Status.status!='1' }"> 
    <input id="add" type="submit" onclick="addcomment()" value="提交">
    </c:if>
    
    <button type="button" onclick="backto(${ins.aab101 })">返回</button>
    </div>
</form>

<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="js/wangEditor.js"></script>
<script type="text/javascript">
    var E = window.wangEditor
    var editor = new E('#div1')
    editor.customConfig.uploadImgShowBase64 = true
    var $text1 = $('#text1')
    var $text2 = $('#text2')
    editor.customConfig.onchange = function (html) {
        $text1.val(html)
        $text2.val(editor.txt.text())
    }
    editor.customConfig.menus = [
    	'image'
    ]
    editor.create()
    // 初始化 textarea 的值
    $text1.val(editor.txt.html())
    $text2.val(editor.txt.text())


</script>
	<script type="text/javascript" src="js/xzs2_jquery.min.js"></script>
    <script type="text/javascript" src="js/xzs2_jquery.rating-stars.min.js"></script>
    <script type="text/javascript">
        var ratingOptions = {
            selectors: {
                starsSelector: '.rating-stars',
                starSelector: '.rating-star',
                starActiveClass: 'is--active',
                starHoverClass: 'is--hover',
                starNoHoverClass: 'is--no-hover',
                targetFormElementSelector: '.rating-value'
            }
        };

        $(".rating-stars").ratingStars(ratingOptions);
    </script>
</body>
</html>