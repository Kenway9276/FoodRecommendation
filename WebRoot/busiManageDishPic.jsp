<%@ page  language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%String path=request.getContextPath(); %>
<html>
<head>
<title>修改菜品图片</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" /> 
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="keywords" content="" />
<link href="<%=path %>/css/font-awesome.min.css" rel="stylesheet" type="text/css" media="all">
<link href="<%=path %>/css/style_login.css" rel="stylesheet" type="text/css" media="all"/>
<link href="http://fonts.googleapis.com/css?family=Raleway:400,500,600,700,800,900" rel="stylesheet">
<style type="text/css">

    <meta charset=gb2312 /> 
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="author" content="Colorlib">
    <meta name="description" content="#">
    <meta name="keywords" content="#">
    <!-- Favicons -->
    <link rel="shortcut icon" href="#">
    <!-- Page Title -->
    <title>Listing &amp; Directory Website Template</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/xzs_bootstrap.min.css">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,400i,500,700,900" rel="stylesheet">
    <!-- Simple line Icon -->
    <link rel="stylesheet" href="css/xzs_simple-line-icons.css">
    <!-- Themify Icon -->
    <link rel="stylesheet" href="css/xzs_themify-icons.css">
    <!-- Hover Effects -->
    <link rel="stylesheet" href="css/xzs_set1.css">
    <!-- Swipper Slider -->
    <link rel="stylesheet" href="css/xzs_swiper.min.css">
    <!-- Magnific Popup CSS -->
    <link rel="stylesheet" href="css/xzs_magnific-popup.css">
    <!-- Main CSS -->
    <link rel="stylesheet" href="css/xzs_style.css">


#preview{width:260px;height:190px;border:1px solid #000;overflow:hidden;}
#imghead {filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=image);}
.btn-danger 
{
background-color: #87CEFA;
}
</style>
 <style>

    .add_div {
        width: 400px;
        height: 500px;
        border: solid #ccc 1px;
        margin-top: 40px;
        margin-left: 170px;
        padding-left: 20px;
    }

    .file-list {
        height: 125px;
        display: none;
        list-style-type: none;
    }

    .file-list img {
        max-width: 70px;
        vertical-align: middle;
    }

    .file-list .file-item {
        margin-bottom: 10px;
        float: left;
        margin-left: 20px;
    }


    .file-list .file-item .file-del {
        display: block;
        margin-left: 20px;
        margin-top: 5px;
        cursor: pointer;
    }
	body {
    padding: 0;
    margin: 0;
    background: url(<%=path%>/images/9.jpg) no-repeat 0px 0px;
    background-size: cover;
    font-family: 'Raleway', sans-serif;
	}

</style>
</head>
<body >
<div style="color:#FFFFFF;">
</div>
<br>
<form id="myform" action="<%=path%>/busiModifyDishPic.html" method="post" enctype="multipart/form-data">
<input type="hidden" name="aab201" value="${ins.aab201 }">	
<div class="signupform">.
<h1></h1>
	<div class="container">
		
		<div class="agile_info">
			<div class="w3_info" style="-webkit-flex-basis: 100%">
				<h2 style="color:#87CEFA">菜品图片修改</h2>
						
        	
        	<c:forEach items="${Address}" var="ad" varStatus="vs">
        	
            	<div class="swiper-slide" style="margin-left: 27%">
	            	<div style="width:500px;height:250px">
	                 	<img src="${ad.address}" class="img-fluid" alt="#" style="max-height:250px">
	            	</div>
            	</div>
            </c:forEach>
            
            
            
            <!-- Add Pagination -->    
            <div style="height: 12%">
    						<ul class="file-list "></ul>
						</div>
            <input style="width:49%" id="choose-file" class="btn btn-danger btn-block" type="file"
       					 name="aab202"  multiple value="选择图片（请使用control一次选完）" required="required">
       					<input style="width:49%;height: 56px" class="btn btn-danger btn-block" type="submit" name="next" value="上传菜品图片">
       					 <input class="btn btn-danger btn-block" type="submit" name="next" value="返回" style="width: 98.8%;"
       					 formaction="<%=path%>/busiMenuManage.html" formnovalidate="formnovalidate">     
            </div>
            
        </div>
	</div> 
						 
       					
			</div>
			<div class="clear"></div>

		<div class="footer">
 </div>
  <script src="js/xzs_jquery-3.2.1.min.js"></script>
    <script src="js/xzs_popper.min.js"></script>
    <script src="js/xzs_bootstrap.min.js"></script>
    <!-- Magnific popup JS -->
    <script src="js/xzs_jquery.magnific-popup.js"></script>
    <!-- Swipper Slider JS -->
    <script src="js/xzs_swiper.min.js"></script>
    <script src="js/jquery.min.js"></script>
	<script src="layer/layer.js"></script>
	<script>
    $(function () {
        ////////////////////////////////////////////////图片上传//////////////////////////////////////////////
        //声明变量
        var $button = $('#upload'),
            //选择文件按钮
            $file = $("#choose-file"),
            //回显的列表
            $list = $('.file-list'),
            //选择要上传的所有文件
            fileList = [];
        //当前选择上传的文件
        var curFile;
        // 选择按钮change事件，实例化fileReader,调它的readAsDataURL并把原生File对象传给它，
        // 监听它的onload事件，load完读取的结果就在它的result属性里了。它是一个base64格式的，可直接赋值给一个img的src.
        $file.on('change', function (e) {
            //上传过图片后再次上传时限值数量
            var numold = $('li').length;
            if(numold >= 6){
                layer.alert('最多上传6张图片');
                return;
            }
            //限制单次批量上传的数量
            var num = e.target.files.length;
            var numall = numold + num;
            if(num >6 ){
               layer.alert('最多上传6张图片');
               return;
            }else if(numall > 6){
                layer.alert('最多上传6张图片');
                return;
            }
            //原生的文件对象，相当于$file.get(0).files;//files[0]为第一张图片的信息;
            curFile = this.files;
            //curFile = $file.get(0).files;
            //console.log(curFile);
            //将FileList对象变成数组
            fileList = fileList.concat(Array.from(curFile));
            //console.log(fileList);
            for (var i = 0, len = curFile.length; i < len; i++) {
                reviewFile(curFile[i])
            }
            $('.file-list').fadeIn(1000);
        })


        function reviewFile(file) {
            //实例化fileReader,
            var fd = new FileReader();
            //获取当前选择文件的类型
            var fileType = file.type;
            //调它的readAsDataURL并把原生File对象传给它，
            fd.readAsDataURL(file);//base64
            //监听它的onload事件，load完读取的结果就在它的result属性里了
            fd.onload = function () {
                if (/^image\/[jpeg|png|jpg|gif]/.test(fileType)) {
                    $list.append('<li style="border:solid red px; margin:5px 5px;" class="file-item"><img src="' + this.result + '" alt="" height="70"><span class="file-del">删除</span></li>').children(':last').hide().fadeIn(2500);
                } else {
                    $list.append('<li class="file-item"><span class="file-name">' + file.name + '</span><span class="file-del">删除</span></li>')
                }

            }
        }

        //点击删除按钮事件：
        $(".file-list").on('click', '.file-del', function () {
            let $parent = $(this).parent();
            console.log($parent);
            let index = $parent.index();
            fileList.splice(index, 1);
            $parent.fadeOut(850, function () {
                $parent.remove()
            });
            //$parent.remove()
        });
        //点击上传按钮事件：
        $button.on('click', function () {
            var name = $('#name').val();
            // var catgory = $('#catgory').val();
            // var price = $('#price').val();
            // var desc = $('#desc').val();
            // var stock = $('#stock').val();
            // var status = $("input[type='radio']:checked").val();
            // var reg = /^[1-9]\d*$/;
            // if (!(reg.test(stock))) {
            //     layer.alert('商品库存为整数!');
            //     return;
            // }
            if (name == '') {
                layer.alert('请输入商品名称');
                return;
            }
            // else if (status == null) {
            //     layer.alert('请输入商品显示状态');
            //     return;
            // }
            // else if (catgory == '') {
            //     layer.alert('请输入商品分类');
            //     return;
            // }
            // else if (price == '') {
            //     layer.alert('请输入商品价格');
            //     return;
            // }
            // else if (stock == '') {
            //     layer.alert('请输入商品库存');
            //     return;
            // }
            // else if (fileList.length == 0) {
            //     layer.alert('请选择商品图片');
            //     return;
            // }
             if(fileList.length > 4){
                    layer.alert('最多允许上传4张图片');
                    return;
            } else {
                var formData = new FormData();
                for (var i = 0, len = fileList.length; i < len; i++) {
                    //console.log(fileList[i]);
                    formData.append('upfile[]', fileList[i]);
                }
                formData.append('name', name);
                // formData.append('catgory', catgory);
                // formData.append('price', price);
                // formData.append('desc', desc);
                // formData.append('stock', stock);
                // formData.append('status', status);
                //console.log(formData);
                $.ajax({
                    url: './product_add.php',
                    type: 'post',
                    data: formData,
                    dataType: 'json',
                    processData: false,
                    contentType: false,
                    success: function (data) {
                        if (data.status == '1') {
                            layer.msg(data.content, {icon: 6});
                        } else if (data.status == '2') {
                            layer.msg(data.content, {icon: 1});
                        }
                    }
                })
            }
        })
    })


	</script>
<script>
        var swiper = new Swiper('.swiper-container', {
            slidesPerView: 3,
            slidesPerGroup: 3,
            loop: true,
            loopFillGroupWithBlank: true,
            pagination: {
                el: '.swiper-pagination',
                clickable: true,
            },
            navigation: {
                nextEl: '.swiper-button-next',
                prevEl: '.swiper-button-prev',
            },
        });
</script>
<script>
        if ($('.image-link').length) {
            $('.image-link').magnificPopup({
                type: 'image',
                gallery: {
                    enabled: true
                }
            });
        }
        if ($('.image-link2').length) {
            $('.image-link2').magnificPopup({
                type: 'image',
                gallery: {
                    enabled: true
                }
            });
        }
</script>
	</form>
	</body>
</html>