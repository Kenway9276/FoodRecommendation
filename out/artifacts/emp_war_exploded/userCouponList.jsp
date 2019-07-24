<%@ page  language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%String path=request.getContextPath(); %>
<html>
<head>
<meta charset=gb2312 />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="author" content="Colorlib">
    <meta name="description" content="#">
    <meta name="keywords" content="#">
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
    <script type="text/javascript"
            src="http://api.map.baidu.com/api?v=2.0&ak=LtaZG8G4TNzGd6Rs57WGyKMr7Hx7GxbU"></script>
<title>查看优惠券</title>
    <link rel="stylesheet" href="<%=path%>/css/xzs_bootstrap.min.css">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,400i,500,700,900" rel="stylesheet">
    <!-- Simple line Icon -->
    <link rel="stylesheet" href="<%=path%>/css/xzs_simple-line-icons.css">
    <!-- Themify Icon -->
    <link rel="stylesheet" href="<%=path%>/css/xzs_themify-icons.css">
    <!-- Hover Effects -->
    <link rel="stylesheet" href="<%=path%>/css/xzs_set1.css">
    <!-- Main CSS -->
    <link rel="stylesheet" href="<%=path%>/css/xzs_style.css">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" /> 
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="keywords" content="" />
<link href="<%=path %>/css/font-awesome.min.css" rel="stylesheet" type="text/css" media="all">
<link href="<%=path %>/css/style_login.css" rel="stylesheet" type="text/css" media="all"/>
<link href="http://fonts.googleapis.com/css?family=Raleway:400,500,600,700,800,900" rel="stylesheet">
<style type="text/css">

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


</style>

    <script type="text/javascript">


        var count=0;
        function onSelect(vstate)
        {
            vstate?count++:count--;
            var vdel=document.getElementById("del");
            vdel.disabled=(count==0);
        }

        function onDetail(vaab101)
        {
            //查看商家详情
            var vform = document.getElementById("myform");
            vform.action="<%=path%>/shopinfoFindById.html?aab101="+vaab101;
            vform.submit();
        }

        function onDelMark(vaaa401)
        {
            //取消收藏
            var vform = document.getElementById("myform");
            vform.action="<%=path%>/markDeleteById.html?aaa401="+vaaa401;
            vform.submit();
        }

        function onGet(aab503,aab506,aab101,aab504,aab505)
        {

            //取消收藏
            var vform = document.getElementById("myform");
            vform.action="<%=path%>/couponGet.html?aab503="+encodeURI(aab503) + "&aab506=" + aab506 + "&aab101=" + aab101 + "&aab504=" + aab504 + "&aab505=" + aab505;
            vform.submit();
        }

        function onDel(aab501)
        {
            //取消收藏
            var vform = document.getElementById("myform");
            vform.action="<%=path%>/couponUserDelete.html?aab501="+aab501;
            vform.submit();
        }

    </script>


</head>
<body>
<div style="color:#FFFFFF">
${msg}
</div>
<br>
<form id="myform" action="<%=path%>/markQuery.html" method="post">
<div class="signupform">.
<h1></h1>
	<div class="container" style="margin-top: 10%">
		
		<div class="agile_info">
			<div class="w3_info" style="-webkit-flex-basis: 100%">
				<h2 style="color: #87CEFA;">查看优惠券</h2>
						
        	
        	    <section>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-7 responsive-wrap">
                    <div class="row detail-filter-wrap">
                        <div class="col-md-4 featured-responsive">
                            <div class="detail-filter-text">
                                <p><span>优惠券</span></p>
                            </div>
                        </div>
                        <div class="col-md-8 featured-responsive">
                        </div>
                    </div>

                    <c:choose>
                        <c:when test="${rows!=null }">
                            <!-- 显示实际查询到的数据 -->
                            <c:forEach items="${rows }" var="row" varStatus="vs">
                                <div style="background-color:F8F8F8" class="row detail-checkbox-wrap">

                                    <span>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</span>
                                    <label class="custom-control custom-checkbox">
                                        <input type="checkbox" name="idlist" value="${row.aab501 }"
                                               onclick="onSelect(this.checked)" class="custom-control-input">
                                        <span class="custom-control-indicator"></span>
                                        <span>${row.aab503 }&nbsp</span>
                                        <span>有效日期：${row.aab506 }&nbsp</span>
                                        <span>满${row.aab505 }&nbsp</span>
                                        <span>减${row.aab504 }&nbsp</span>
                                        <span>数量：${row.count }&nbsp</span>
                                    </label>



                                </div>

                                <br>

                            </c:forEach>
                        </c:when>

                        <c:otherwise>
                            <br><br>
                            <h4>没有优惠券......</h4>
                        </c:otherwise>

                    </c:choose>
                <c:if test="${!empty sessionScope.busiID}">
                    <input type="submit" formaction="/emp/busiReturn.html" class="btn btn-outline-danger" value="返回" >
                </c:if>
                </div>
                <div class="col-md-5 responsive-wrap map-wrap">

                </div>
            </div>
        </div>
    </section>
            
            
            
            <!-- Add Pagination -->    
         	</div>
            
        </div>
						</div> 
						 
       					
			</div>
			<div class="clear"></div>

		<div class="footer">
 </div>
     <script src="js/jquery-3.2.1.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>


    <script>
        $(".map-icon").click(function() {
            $(".map-fix").toggle();
        });
    </script>
    <script>
        // Want to customize colors? go to snazzymaps.com
        function myMap() {
            var maplat = $('#map').data('lat');
            var maplon = $('#map').data('lon');
            var mapzoom = $('#map').data('zoom');
            // Styles a map in night mode.
            var map = new google.maps.Map(document.getElementById('map'), {
                center: {
                    lat: maplat,
                    lng: maplon
                },
                zoom: mapzoom,
                scrollwheel: false
            });
            var marker = new google.maps.Marker({
                position: {
                    lat: maplat,
                    lng: maplon
                },
                map: map,
                title: 'We are here!'
            });
        }
    </script>
    <!-- Map JS (Please change the API key below. Read documentation for more info) -->
    <script src="https://maps.googleapis.com/maps/api/js?callback=myMap&key=AIzaSyDMTUkJAmi1ahsx9uCGSgmcSmqDTBF9ygg"></script>
 
	</form>
	</body>
</html>
<script type="text/javascript">
    var map = new BMap.Map("allmap");
    var point = new BMap.Point(116.331398,39.897445);
    map.centerAndZoom(point,12);

    function myFun(result){
        var cityName = result.name;
        //document.getElementById("city").innerHTML="当前位置: "+cityName;
        document.getElementById("cityName").placeholder="当前定位: "+cityName;
        document.getElementById("localcity").value=cityName;
    }
    var myCity = new BMap.LocalCity();
    myCity.get(myFun);
</script>