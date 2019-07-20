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

	
      function onDetail(vaab101)
      {
    	  //查看商家详情
    	 var vform = document.getElementById("myform");
    	 vform.action="<%=path%>/shopinfoFindById.html?aab101="+vaab101;
    	 vform.submit();
      }
      
      function onSortByScore()
      {
    	  //按评分排序
    	 var vform = document.getElementById("myform");
    	 vform.action="<%=path%>/shopinfoSortByScore.html";
    	 vform.submit();
      }
      
      function onSortByCommentCount()
      {
    	  //按点评数排序
    	 var vform = document.getElementById("myform");
    	 vform.action="<%=path%>/shopinfoSortByCommentCount.html";
    	 vform.submit();
      }
      
      window.onload = function(){
          var btn = document.getElementById("BackToTop");
          var timer = null;
          var oScroll = true;
          //滚动条事件,触发时清空定时器
          window.onscroll = function(){
              if(!oScroll){
                  clearInterval(timer);
              }
              oScroll = false;
          }
          btn.onclick = function(){
              //加入定时器让他又快到慢滚动到顶部
              timer = setInterval(function(){
                  //获取当前scrollTop的高度位置（兼容ie和chrom浏览器）
                  var oTop = document.documentElement.scrollTop || document.body.scrollTop;
                  //设置速度由快到慢
                  var ispeed = Math.floor(-oTop / 7);
                  document.documentElement.scrollTop = document.body.scrollTop = oTop + ispeed;
                  oScroll = true;
                  if(oTop == 0){
                      clearInterval(timer);
                  }
              },30);
          }
      }
	</script>
</head>

<body>

    <%@ include file="navigate.jsp" %>
	
    <!-- SLIDER -->
        <!-- <img src="images/slider.jpg" class="img-fluid" alt="#"> -->
        <section class="slider d-flex align-items-center">
        <div class="container">
            <div class="row d-flex justify-content-center">
                <div class="col-md-12">
                    	<div class="slider-title_box">
                    	<div class="row">
                            	<div class="col-md-12">
                                    <h2 style="color:white">智能美食推荐助手</h2>
                                </div>
                        </div>
                        <div class="row d-flex justify-content-center">
                            <div class="col-md-10">
                                <form class="form-wrap mt-4" id="myform" action="<%=path%>/shopinfoFind.html" method="post">
                                    <div class="btn-group" role="group" aria-label="Basic example">
                                    
                                    	<!-- 隐藏:当前城市 -->
										<e:hidden name="localcity" id="localcity" />
										<!-- 隐藏:当前搜索关键词 -->
										<input type="hidden" name="CurrentKeywords" value="${ins.CurrentKeywords }"/>
										<input type="hidden" name="CurrentCityName" value="${ins.CurrentCityName }"/>
																			
										
                                    	<input id="cityName" name="cityName" type="text" placeholder="当前定位: " class="btn-group2">
                                        <input type="text" name="keywords" placeholder="搜索餐厅名或菜品名" required="required" class="btn-group1" />
                                        <button type="submit" class="btn-form"><span class="icon-magnifier search-icon"></span>搜索<i class="pe-7s-angle-right"></i></button>
                                        
                                    </div>
                                </form>                              
                            </div>
                        </div>
                    </div>
                 </div>
            </div>
        </div>
    </section>
    <!--// SLIDER -->
    <!--//END HEADER -->
    <!--============================= FIND PLACES =============================-->



		 
		
		
    <!--//END FIND PLACES -->
    <!--============================= FEATURED PLACES =============================-->
    
   
    
    <section class="main-block light-bg">
        <div class="container">
            <div class="row justify-content-center">
            	
  
                <div class="col-md-5">
                	<c:choose>
                	<c:when test="${empty msg }"> 
                	<c:if test="${rows!=null }"> 
                    <div class="styled-heading">
                        <h3>搜索结果</h3>
                        <br>
                        <div class="review-btn">
                            <a href="#" onclick="onSortByScore()" class="btn btn-outline-danger">评分↓</a>                          
                        </div>
                        <div class="review-btn">
                            <a href="#" onclick="onSortByCommentCount()" class="btn btn-outline-danger">点评数↓</a>
                        </div>
                    </div>
                    </c:if>
                    </c:when>
                    <c:otherwise> 
                    <div class="styled-heading">
                        <h3>暂无搜索结果!</h3>
                    </div>
                    </c:otherwise>
                    </c:choose>
                </div>
                
            </div>

            <div class="row">
		        <c:if test="${rows!=null }">           	
				<c:forEach items="${rows }" var="row" varStatus="vs">       	
                <div class="col-md-4 featured-responsive">
                    <div class="featured-place-wrap">
                        <a href="#" onclick="onDetail('${row.aab101}')">                       
                            <img src="upload/${row.aab113}" class="img-fluid" alt="#">             
                            <span class="featured-rating">${row.aab111 }</span>
                            
                            <div class="featured-title-box">
                                <h6>${row.aab104 }</h6>
                                <p>${row.aab114 }</p> <p>条点评</p>
                                <ul>
                                    <li><span class="icon-location-pin"></span>
                                        <p>${row.aab106 }</p>
                                    </li>
                                    <li><span class="icon-screen-smartphone"></span>
                                        <p>${row.aab107 }</p>
                                    </li>
                                </ul>
                                <div class="bottom-icons">
                                	<c:choose>
                                	<c:when test="${row.aab110=='1' }">                         
                                    <div class="open-now">接受预定</div>
                                    <span class="ti-heart"></span>
                                    <span class="ti-bookmark"></span>
                                    </c:when>
                                    <c:otherwise>                          
                                    <div class="closed-now">暂不接受预定</div>
                                    <span class="ti-heart"></span>
                                    <span class="ti-bookmark"></span>
                                    </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>
                        </a>
                    </div>
                </div>
                </c:forEach>
 			    </c:if>
                
                
            </div>
            
            <c:if test="${rows!=null }">
            <div class="row justify-content-center">
                <div class="col-md-4">
                    <div class="featured-btn-wrap">
                    	<br>
                    	<br>
                        <a href="#" id="BackToTop" class="btn btn-danger">返回顶部</a>
                    </div>
                </div>
            </div>
            </c:if>
           
        </div>
    </section>

    
    <div id="allmap">
	</div>
    
 
    <!-- jQuery, Bootstrap JS. -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="<%=path%>/js/xzs_jquery-3.2.1.min.js"></script>
    <script src="<%=path%>/js/xzs_popper.min.js"></script>
    <script src="<%=path%>/js/xzs_bootstrap.min.js"></script>

    <script>
        $(window).scroll(function() {
            // 100 = The point you would like to fade the nav in.

            if ($(window).scrollTop() > 100) {

                $('.fixed').addClass('is-sticky');

            } else {

                $('.fixed').removeClass('is-sticky');

            };
        });
    </script>
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