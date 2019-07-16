<%@ taglib prefix="e" uri="http://org.wangxg/jsp/extl" %>
<%@ page contentType="text/html;charset=GBK" language="java" %>
<html>
<head>
    <title>Title</title>
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
</head>
<body>
<div class="col-md-5 p-lg-5 mx-auto my-5">
		            <h3>评分</h3>
		            <div class="rating-stars block" id="rating">
		                <input type="hidden" readonly class="form-control rating-value" name="rating-stars-value" id="rating-stars-value">
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
		            <br />
		            <br />		            
</div>
<form id="aaa" action="/bBSPost.html" method="post">
    <div id="div1">
    </div>
    <textarea name="aaa303" id="text1" ></textarea>
    <textarea name="aaa306" id="text2" ></textarea>
    <input type="submit" value="发布"></input>
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