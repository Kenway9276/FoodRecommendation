<%@ page  language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%String path=request.getContextPath(); %>
<html>
<head>
<title>�޸Ĳ�ƷͼƬ</title>
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
				<h2 style="color:#87CEFA">��ƷͼƬ�޸�</h2>
						
        	
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
       					 name="aab202"  multiple value="ѡ��ͼƬ����ʹ��controlһ��ѡ�꣩" required="required">
       					<input style="width:49%;height: 56px" class="btn btn-danger btn-block" type="submit" name="next" value="�ϴ���ƷͼƬ">
       					 <input class="btn btn-danger btn-block" type="submit" name="next" value="����" style="width: 98.8%;"
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
        ////////////////////////////////////////////////ͼƬ�ϴ�//////////////////////////////////////////////
        //��������
        var $button = $('#upload'),
            //ѡ���ļ���ť
            $file = $("#choose-file"),
            //���Ե��б�
            $list = $('.file-list'),
            //ѡ��Ҫ�ϴ��������ļ�
            fileList = [];
        //��ǰѡ���ϴ����ļ�
        var curFile;
        // ѡ��ťchange�¼���ʵ����fileReader,������readAsDataURL����ԭ��File���󴫸�����
        // ��������onload�¼���load���ȡ�Ľ����������result�������ˡ�����һ��base64��ʽ�ģ���ֱ�Ӹ�ֵ��һ��img��src.
        $file.on('change', function (e) {
            //�ϴ���ͼƬ���ٴ��ϴ�ʱ��ֵ����
            var numold = $('li').length;
            if(numold >= 6){
                layer.alert('����ϴ�6��ͼƬ');
                return;
            }
            //���Ƶ��������ϴ�������
            var num = e.target.files.length;
            var numall = numold + num;
            if(num >6 ){
               layer.alert('����ϴ�6��ͼƬ');
               return;
            }else if(numall > 6){
                layer.alert('����ϴ�6��ͼƬ');
                return;
            }
            //ԭ�����ļ������൱��$file.get(0).files;//files[0]Ϊ��һ��ͼƬ����Ϣ;
            curFile = this.files;
            //curFile = $file.get(0).files;
            //console.log(curFile);
            //��FileList����������
            fileList = fileList.concat(Array.from(curFile));
            //console.log(fileList);
            for (var i = 0, len = curFile.length; i < len; i++) {
                reviewFile(curFile[i])
            }
            $('.file-list').fadeIn(1000);
        })


        function reviewFile(file) {
            //ʵ����fileReader,
            var fd = new FileReader();
            //��ȡ��ǰѡ���ļ�������
            var fileType = file.type;
            //������readAsDataURL����ԭ��File���󴫸�����
            fd.readAsDataURL(file);//base64
            //��������onload�¼���load���ȡ�Ľ����������result��������
            fd.onload = function () {
                if (/^image\/[jpeg|png|jpg|gif]/.test(fileType)) {
                    $list.append('<li style="border:solid red px; margin:5px 5px;" class="file-item"><img src="' + this.result + '" alt="" height="70"><span class="file-del">ɾ��</span></li>').children(':last').hide().fadeIn(2500);
                } else {
                    $list.append('<li class="file-item"><span class="file-name">' + file.name + '</span><span class="file-del">ɾ��</span></li>')
                }

            }
        }

        //���ɾ����ť�¼���
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
        //����ϴ���ť�¼���
        $button.on('click', function () {
            var name = $('#name').val();
            // var catgory = $('#catgory').val();
            // var price = $('#price').val();
            // var desc = $('#desc').val();
            // var stock = $('#stock').val();
            // var status = $("input[type='radio']:checked").val();
            // var reg = /^[1-9]\d*$/;
            // if (!(reg.test(stock))) {
            //     layer.alert('��Ʒ���Ϊ����!');
            //     return;
            // }
            if (name == '') {
                layer.alert('��������Ʒ����');
                return;
            }
            // else if (status == null) {
            //     layer.alert('��������Ʒ��ʾ״̬');
            //     return;
            // }
            // else if (catgory == '') {
            //     layer.alert('��������Ʒ����');
            //     return;
            // }
            // else if (price == '') {
            //     layer.alert('��������Ʒ�۸�');
            //     return;
            // }
            // else if (stock == '') {
            //     layer.alert('��������Ʒ���');
            //     return;
            // }
            // else if (fileList.length == 0) {
            //     layer.alert('��ѡ����ƷͼƬ');
            //     return;
            // }
             if(fileList.length > 4){
                    layer.alert('��������ϴ�4��ͼƬ');
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