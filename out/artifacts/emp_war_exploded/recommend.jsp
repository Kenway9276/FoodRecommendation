<%@ page  language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%String path=request.getContextPath(); %>
<html lang="en">

<head>
    <!--必要样式-->
    <link rel="stylesheet" href="css/jquery-labelauty.css" />

    <style type="text/css">
        ul.dowebok{list-style-type: none;}
        li.aaa{display: inline-block;}
        li.aaa{margin: 10px 0;}
        input.labelauty + label{font:15px "Microsoft Yahei";}
    </style>

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

    </script>

</head>

<body>
<form id="myform" action="<%=path%>/markQuery.html" method="post">
    <!-- 暂时 -->

    <input type="hidden" name="aaa101" value="1"></input>
    <!--============================= HEADER =============================-->
    <div class="dark-bg sticky-top">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <nav class="navbar navbar-expand-lg navbar-light">
                        <a class="navbar-brand" href="index.html">Listing</a>
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="icon-menu"></span>
                        </button>
                        <div class="collapse navbar-collapse justify-content-end" id="navbarNavDropdown">
                            <ul class="navbar-nav">
                                <li class="nav-item dropdown">
                                    <a class="nav-link" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        Explore
                                        <span class="icon-arrow-down"></span>
                                    </a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                                        <a class="dropdown-item" href="#">Action</a>
                                        <a class="dropdown-item" href="#">Another action</a>
                                        <a class="dropdown-item" href="#">Something else here</a>
                                    </div>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link" href="#" id="navbarDropdownMenuLink1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        Listing
                                        <span class="icon-arrow-down"></span>
                                    </a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                                        <a class="dropdown-item" href="#">Action</a>
                                        <a class="dropdown-item" href="#">Another action</a>
                                        <a class="dropdown-item" href="#">Something else here</a>
                                    </div>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link" href="#" id="navbarDropdownMenuLink2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        Pages
                                        <span class="icon-arrow-down"></span>
                                    </a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                                        <a class="dropdown-item" href="#">Action</a>
                                        <a class="dropdown-item" href="#">Another action</a>
                                        <a class="dropdown-item" href="#">Something else here</a>
                                    </div>
                                </li>
                                <li class="nav-item active">
                                    <a class="nav-link" href="#">About</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#">Blog</a>
                                </li>
                                <li><a href="#" class="btn btn-outline-light top-btn"><span class="ti-plus"></span> Add Listing</a></li>
                            </ul>
                        </div>
                    </nav>
                </div>
            </div>
        </div>
    </div>
    <!--//END HEADER -->
    <!--============================= DETAIL =============================-->
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

                    <!-- 显示实际查询到的数据 -->
                    ${rows }
                    <c:forEach items="${rows }" var="row" varStatus="vs">
                        <div style="background-color:F8F8F8" class="row detail-checkbox-wrap">


<form id="aaa">
    <c:forEach items="${rows }" var="row" varStatus="vs">
        店名：${row.aab104 }<br>
        菜名：${row.aab207 }<br>
        <input type="hidden" name="aab104"  value="${row.aab104 }">
        <input type="hidden" name="aab101"  value="${row.aab101 }">
        <input type="hidden" name="aab207"  value="${row.aab207 }">
        <input type="hidden" name="aaa202"  value="${row.aaa202 }">
        <input type="hidden" name="aaa203"  value="${row.aaa203 }">
        <input type="hidden" name="aaa204"  value="${row.aaa204 }">
    </c:forEach>
    <c:choose>
        <c:when test="${empty rows}">
            ${msg}
        </c:when>
        <c:otherwise>
            ${row }
            <input type="submit" value="就它了！" formaction="recommendSelect.html">
            <input type="submit" value="下一个" formaction="recommendNext.html">
        </c:otherwise>
    </c:choose>


    <input type="hidden" name="qaaa101" value="<%=request.getSession().getAttribute("用户流水号")%>">
                            <span>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</span>
                            <label class="custom-control custom-checkbox">
                                <input type="checkbox" name="idlist" value="${row.aab501 }"
                                       onclick="onSelect(this.checked)" class="custom-control-input">
                                <span class="custom-control-indicator"></span>

                                <span>菜系：${row.aaa203 }&nbsp</span>
                                <span>满${row.aab505 }&nbsp</span>
                                <span>减${row.aab504 }&nbsp</span>
                                <span><a href="#" onclick="onDelMark('${row.aaa401}')">领取优惠券</a></span>

                            </label>



                        </div>

                        <br>

                    </c:forEach>
                </div>
                <div class="col-md-5 responsive-wrap map-wrap">
                    <div class="map-fix">
                        <!-- data-toggle="affix" -->
                        <!-- Google map will appear here! Edit the Latitude, Longitude and Zoom Level below using data-attr-*  -->
                        <div id="map" data-lat="40.674" data-lon="-73.945" data-zoom="14"></div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--//END DETAIL -->




    <!-- jQuery, Bootstrap JS. -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="js/jquery.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.js"></script>


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
    <script type="text/javascript" src="css/jquery-labelauty.js"></script>
    <script src="js/jquery-1.11.1.min.js"></script>
    <script type="text/javascript">
        $(function(){
            $(':input').labelauty();
        });
    </script>
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