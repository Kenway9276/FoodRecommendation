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

 
    
    function showRead()
    {
  	  //�鿴�Ѷ�
  	 var vform = document.getElementById("myform");
  	 vform.action="<%=path%>/messageSearchRead.html?R=";
  	 vform.submit();
    }
    
    function showUnRead()
    {
    //�鿴δ��
  	 var vform = document.getElementById("myform");
  	 vform.action="<%=path%>/messageSearchUnRead.html";
  	 vform.submit();
    }
    
    function readAll()
    {
  	  //ȫ����Ϊ�Ѷ�
  	 var vform = document.getElementById("myform");
  	 vform.action="<%=path%>/messageSetAllRead.html";
  	 vform.submit();
    }
    
    function delAll()
    {
  	  //ȫ��ɾ��
  	 var vform = document.getElementById("myform");
  	 vform.action="<%=path%>/messageDeleteAll.html";
  	 vform.submit();
    }
    
    function onSetRead(vaac301)
    {
    	//��Ϊ�Ѷ�
    	var vform = document.getElementById("myform");
     	vform.action="<%=path%>/messageSetRead.html?aac301="+vaac301;
     	vform.submit();
    }
    
    function onDelById(vaac301)
    {
    	//��һɾ��
    	var vform = document.getElementById("myform");
     	vform.action="<%=path%>/messageDelById.html?aac301="+vaac301;
     	vform.submit();
    }
    
	</script>
    
</head>

<body>
<form id="myform" action="<%=path%>/messageSearchUnRead.html" method="post">
	<!-- ��ʱ -->
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
                            

                                <c:if test="${Status.status=='Read' }">
                                <h5 id="ht5">�Ѷ���Ϣ</h5>
                                </c:if>
                                <c:if test="${Status.status=='UnRead' }">
                                <h5 id="ht5">δ����Ϣ</h5>
                                </c:if>
                                
                                                            
                                
                                <c:if test="${Status.status=='UnRead' }">
                                <div id="UR" >                             
								<!-- �鿴�Ѷ� -->
								<button  id="del" name="next" class="btn btn-outline-danger"
								onclick="showRead()" >�鿴�Ѷ�</button>						
								<!-- ȫ����Ϊ�Ѷ�-->
								<button  id="del" name="next" class="btn btn-outline-danger" 
								onclick="readAll()" >ȫ���Ѷ�</button>
								</div>
								</c:if>
								
								
								<c:if test="${Status.status=='Read' }">
								<div id="R">				
								<!-- �鿴δ�� -->
								<button  id="del" name="next" class="btn btn-outline-danger" 
								onclick="showUnRead()" >�鿴δ��</button>								
								<!-- ȫ��ɾ�� -->
								<button  id="del" name="next" class="btn btn-outline-danger" 
								onclick="delAll()" >ȫ��ɾ��</button>
								</div>
								</c:if>
								
								

		
                            </div>
                        </div>
                        <div class="col-md-8 featured-responsive">
                        </div>
                    </div>
                    
                    <c:choose>
                    <c:when test="${rows!=null }">
					<!-- ��ʾʵ�ʲ�ѯ�������� -->
					<c:forEach items="${rows }" var="row" varStatus="vs">
                    <div style="background-color:F8F8F8" class="row detail-checkbox-wrap">
                   
                        
                        
                       	<span>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</span>
                        
                        <label class="custom-control custom-checkbox">
                		<span class="custom-control-indicator"></span>
                		<span>${row.aac302 }</span>
                		<span>${row.aac303 }</span>
                		<c:if test="${Status.status=='UnRead' }">
                		<span><a href="#" onclick="onSetRead('${row.aac301}')">�Ѷ�</a></span>
                		</c:if>
                		<c:if test="${Status.status=='Read' }">
                		<span><a href="#" onclick="onDelById('${row.aac301}')">ɾ��</a></span>                		
              			</label>
              			</c:if>
             			
                          			
                        
                    </div>
                    
                    <br>
                    
                    </c:forEach>
                    </c:when>
                    
                    <c:otherwise>
                    <br><br>
                    <c:if test="${Status.status=='Read' }">              
                    <h4>��ʱ��û���Ѷ���Ϣ......</h4>
                    </c:if>
                    <c:if test="${Status.status=='UnRead' }">              
                    <h4>��ʱ��û��δ����Ϣ......</h4>
                    </c:if>
                    </c:otherwise>
                    
                    </c:choose>
                    
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


<!-- �ٶȵ�ͼapi��ȡ��ǰ���� -->
<script type="text/javascript">
	var map = new BMap.Map("allmap");
	var point = new BMap.Point(116.331398,39.897445);
	map.centerAndZoom(point,12);

	function myFun(result){
		var cityName = result.name;
		//document.getElementById("city").innerHTML="��ǰλ��: "+cityName;
		document.getElementById("cityName").placeholder="��ǰ��λ: "+cityName;
		document.getElementById("localcity").value=cityName;
	}
	var myCity = new BMap.LocalCity();
	myCity.get(myFun);
</script>