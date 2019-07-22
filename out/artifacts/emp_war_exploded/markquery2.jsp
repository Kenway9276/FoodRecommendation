<%@ page  language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%String path=request.getContextPath(); %>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset=gb2312 /> 
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="author" content="Colorlib">
    <meta name="description" content="#">
    <meta name="keywords" content="#">
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
	<script type="text/javascript"
	src="http://api.map.baidu.com/api?v=2.0&ak=LtaZG8G4TNzGd6Rs57WGyKMr7Hx7GxbU"></script>
    <!-- Page Title -->
    <title>Listing &amp; Directory Website Template</title>
    <!-- Bootstrap CSS -->
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
<%@ include file="navigate.jsp" %>
<form id="myform" action="<%=path%>/markQuery.html" method="post">
	<!-- 暂时 -->

	<input type="hidden" name="aaa101" value="8"></input>

    <!--============================= DETAIL =============================-->
    <section>
        <div class="container-fluid" style="margin: 0 auto;">
            <div class="row">
                <div class="col-md-7 responsive-wrap">
                    <div class="row detail-filter-wrap">
                        <div class="col-md-4 featured-responsive">
                            <div class="detail-filter-text">
                                <c:if test="${rows[0].isUser == 1}">
                                    <p><span><a href="couponList.html">浏览优惠券</a></span></p>
                                </c:if>
                                <c:if test="${rows[0].isUser == 0}">
                                    <p><span><a href="couponUserList.html">我的优惠券</a></span></p>
                                </c:if>

                            </div>
                        </div>
                        <div class="col-md-8 featured-responsive">
                        </div>
                    </div>

                    <c:choose>
                        <c:when test="${rows[0].aab503!=null }">
                        <!-- 显示实际查询到的数据 -->
                            <c:forEach items="${rows }" var="row" varStatus="vs">
                            <div style="background-color:F8F8F8" class="row detail-checkbox-wrap">
                                <span>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</span>
                                <label class="custom-control custom-checkbox">
                                <input type="checkbox" name="idlist" value="${row.aab501 }"
                                onclick="onSelect(this.checked)" class="custom-control-input">
                                <span class="custom-control-indicator"></span>
                                <span><a href="#" onclick="onDetail('${row.aab101}')">${row.aab104 }</a></span>
                                    <span>${row.aab503 }&nbsp</span>
                                <span>有效日期：${row.aab506 }&nbsp</span>
                                    <span>满${row.aab505 }&nbsp</span>
                                    <span>减${row.aab504 }&nbsp</span>

                                    <c:if test="${row.isUser != 1}">
                                        <span>剩余：${row.remain }&nbsp</span>
                                    </c:if>

                                <span>

                                    <c:choose>
                                        <c:when test="${row.isUser == 1}">
                                            <span>优惠券码：${row.aab502 }&nbsp</span>
                                            <a href="#" onclick="onDel('${row.aab501}')">删除</a>
                                        </c:when>
                                        <c:otherwise>
                                            <a href="#" onclick="onGet('${row.aab503 }','${row.aab506 }','${row.aab101}','${row.aab504}','${row.aab505}')">领取优惠券</a>
                                        </c:otherwise>
                                    </c:choose>
                                </span>

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
                    
                </div>
                <div class="col-md-5 responsive-wrap map-wrap">

                </div>
            </div>
        </div>
    </section>
    <!--//END DETAIL -->




    <!-- jQuery, Bootstrap JS. -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
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


<!-- 百度地图api获取当前城市 -->
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