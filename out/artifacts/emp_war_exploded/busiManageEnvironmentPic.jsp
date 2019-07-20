<%@ page  language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%String path=request.getContextPath(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <!-- Required meta tags -->
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
    
    <script>
	
    
    
	function onSetMark(vaab101)
    {
  	  //��ӵ��ղؼ�
  	 var vform = document.getElementById("myform");
  	 vform.action="<%=path%>/markAdd.html?aab101="+vaab101;
  	 vform.submit();
  	document.getElementById("markbtn").innerHTML="ȡ���ղ�";
  	//�����̼�����ҳ��
  	 vform.action="<%=path%>/shopinfoFindById.html?aab101="+vaab101;
 	 vform.submit();
 	document.getElementById("markbtn").innerHTML="ȡ���ղ�";
    }
	
	
	function onDelMark(vaab101)
    {
  	  //ȡ���ղ�
  	 var vform = document.getElementById("myform");
  	 vform.action="<%=path%>/markDeleteInShopDetail.html?aab101="+vaab101;
  	 vform.submit();
  	 document.getElementById("markbtn").innerHTML="�ղ�";
  	//�����̼�����ҳ��
 	 vform.action="<%=path%>/shopinfoFindById.html?aab101="+vaab101;
	 vform.submit();
	 document.getElementById("markbtn").innerHTML="�ղ�";
    }
	

	
</script>
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


</style>
</head>

<body>
<form id="myform" action="<%=path%>/busiModifyEnvironmentPic.html" method="post" enctype="multipart/form-data">
<input type="hidden" name="aab101" value="${ins.aab101 }">		
	<input type="hidden" name="aab101" value="${ins.aab101 }"></input>
	<input type="hidden" name="aaa101" value="1"></input>
    <!--============================= HEADER =============================-->
    <!--//END HEADER -->
    <!--============================= BOOKING =============================-->
    <div>
        <!-- Swiper -->
        <div class="swiper-container" style="height:400px">
        
        	<div class="swiper-wrapper">
        	
        	<c:forEach items="${Address }" var="ad" varStatus="vs">
        	
            <div class="swiper-slide">
            <div style="width:672px;height:300px">
                 <img src="${ad.address }" class="img-fluid" alt="#">
            </div>
            </div>
            </c:forEach>
            
            
            
            <!-- Add Pagination -->
            <div class="swiper-pagination swiper-pagination-white"></div>
            <!-- Add Arrows -->
            <div class="swiper-button-next swiper-button-white"></div>
            <div class="swiper-button-prev swiper-button-white"></div>
            
            </div>
        </div>
        <div style="height:200px">
            <div style="height: 30%">
        		<span>��ѡ�񻷾�ͼ(��һ����ѡ������ͼƬ)</span>
       			<input type="file" name="aab202" id="choose-file" required="required" multiple/>
        		<!--<input type="file" name="" id="choose-file" />-->
    		</div>
   			<div style="height: 70%">
    			<ul class="file-list "></ul>
			</div>
		<input type="submit" name="next" value="�ϴ�">
		<input class="login100-form-btn" type="submit" name="next" value="����"
	 			formaction="<%=path%>/busiReturn.html?aab101=${ins.aab101}" formnovalidate="formnovalidate">
        </div>
    </div>
    <!--//END BOOKING -->
    <!--============================= RESERVE A SEAT =============================-->
    <!--//END RESERVE A SEAT -->
    <!--============================= BOOKING DETAILS =============================-->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
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
             if(fileList.length > 6){
                    layer.alert('��������ϴ�6��ͼƬ');
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