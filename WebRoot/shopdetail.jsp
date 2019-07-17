<%@ page  language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
    <link rel="stylesheet" href="<%=path%>/css/xzs_bootstrap.min.css">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,400i,500,700,900" rel="stylesheet">
    <!-- Simple line Icon -->
    <link rel="stylesheet" href="<%=path%>/css/xzs_simple-line-icons.css">
    <!-- Themify Icon -->
    <link rel="stylesheet" href="<%=path%>/css/xzs_themify-icons.css">
    <!-- Hover Effects -->
    <link rel="stylesheet" href="<%=path%>/css/xzs_set1.css">
    <!-- Swipper Slider -->
    <link rel="stylesheet" href="<%=path%>/css/xzs_swiper.min.css">
    <!-- Magnific Popup CSS -->
    <link rel="stylesheet" href="<%=path%>/css/xzs_magnific-popup.css">
    <!-- Main CSS -->
    <link rel="stylesheet" href="<%=path%>/css/xzs_style.css">
    
    <script>
	
    
    
	function onSetMark(vaab101)
    {
  	  //��ӵ��ղؼ�
  	 var vform = document.getElementById("vform");
  	 vform.action="<%=path%>/markAdd.html?aab101="+vaab101;
  	 vform.submit();
  	//�����̼�����ҳ��
  	 vform.action="<%=path%>/shopinfoFindById.html?aab101="+vaab101;
 	 vform.submit();
    }
	
	
	function onDelMark(vaab101)
    {
  	  //ȡ���ղ�
  	 var vform = document.getElementById("vform");
  	 vform.action="<%=path%>/markDeleteInShopDetail.html?aab101="+vaab101;
  	 vform.submit();
  	//�����̼�����ҳ��
 	 vform.action="<%=path%>/shopinfoFindById.html?aab101="+vaab101;
	 vform.submit();
    }
	
	function onQueryMark(vaab101)
    {
  	  //�鿴�ղ�
  	 var vform = document.getElementById("vform");
  	 vform.action="<%=path%>/markQuery.html";
  	 vform.submit();
    }
	
	function onMenu(vaab101)
    {
  	  //�鿴�˵�
  	 var vform = document.getElementById("myform");
  	 vform.action="<%=path%>/shopinfoFindMenu.html?aab101="+vaab101;
  	 vform.submit();
    }
	
	function onAddComment(vaab101)
    {
  	  //д����
  	 var vform = document.getElementById("myform");
  	 vform.action="<%=path%>/commentToDo.html?aab101="+vaab101;
  	 vform.submit();
    }
	
	function onShowReply(vaab301)
    {
		//����ظ������ı���
		document.getElementById("ReplyText"+vaab301).style="display:block";
		document.getElementById("replybtn"+vaab301).style="display:none";
		document.getElementById("closebtn"+vaab301).style="display:block";
    }
	
	function onCloseReply(vaab301)
    {
		//����رյ����ı���
		document.getElementById("ReplyText"+vaab301).style="display:none";
		document.getElementById("replybtn"+vaab301).style="display:block";
		document.getElementById("closebtn"+vaab301).style="display:none";
    }
	
	function onAddReply(vaab301)
	{
		var vform = document.getElementById("myform");
	  	vform.action="<%=path%>/commentReplyAdd.html?aab301="+vaab301;
	  	vform.submit();
	}
	
	function onDelCommentById(vaab301)
	{
		var vform = document.getElementById("myform");
	  	vform.action="<%=path%>/commentDelById.html?aab301="+vaab301;
	  	vform.submit();
	}
	
	

	
	
</script>
</head>

<body>
<form id="vform">
	<input type="hidden" name="aab101" value="${ins.aab101 }"></input>
	<input type="hidden" name="aaa101" value="1"></input>
	<input type="hidden" name="aaa" value="${param.aaa101 }"></input>
</form>
<form id="myform" method="post" >	
	<input type="hidden" name="aab101" value="${ins.aab101 }"></input>
	<input type="hidden" name="aaa101" value="1"></input>
	<input type="hidden" name="aaa" value="${param.aaa101 }"></input>

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
                                    <a class="nav-link" onclick="onQueryMark()" href="#">�ղؼ�</a>
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
    <!--============================= BOOKING =============================-->
    <div>
        <!-- Swiper -->
        <div class="swiper-container">
        
        	<div class="swiper-wrapper">
        	
        	<c:forEach items="${Address }" var="ad" varStatus="vs">
        	
            <div class="swiper-slide">
            <div style="width:672px;height:300px">
                    <a href="upload/${ad.address }" class="grid image-link">
                        <img src="upload/${ad.address }" class="img-fluid" alt="#">
                    </a>
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
    </div>
    <!--//END BOOKING -->
    <!--============================= RESERVE A SEAT =============================-->
    <section class="reserve-block">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <h5>${ins.aab104 }</h5>
                </div>
                <div class="col-md-6">
                    <div class="reserve-seat-block">
                        <div class="reserve-rating">
                            <span>${ins.aab111 }</span>
                        </div>
                        
                     
                        
                        <c:if test="${empty IsComment }">
                        <div class="review-btn">
                            <a href="#" onclick="onAddComment(${ins.aab101 })" class="btn btn-outline-danger">&nbsp&nbsp&nbsp&nbsp&nbspд����&nbsp&nbsp&nbsp&nbsp&nbsp</a>
                            <span><a>${ins.aab114 }</a><a>������</a></span>
                        </div>
                        </c:if>
                        
                        <c:if test="${!empty IsComment }">
                        <div class="review-btn">
                            <a style="color:grey" class="btn btn-outline-danger">&nbsp&nbsp&nbsp&nbsp&nbsp�ѵ���&nbsp&nbsp&nbsp&nbsp&nbsp</a>
                            <span><a>${ins.aab114 }</a><a>������</a></span>
                        </div>
                        </c:if>
                        
                        
                        <c:choose>
                        <c:when test="${ins.aab110=='1' }"> 
                        <div class="reserve-btn">
                            <div class="featured-btn-wrap">
                                <a href="#" class="btn btn-danger">����</a>
                            </div>
                        </div>
                        </c:when>
                        <c:otherwise>
                        <div class="reserve-btn">
                            <div class="featured-btn-wrap">
                                <a style="color:white" class="btn btn-danger">����</a>
                            </div>
                        </div>
                        </c:otherwise>
                        </c:choose>
                        
                        <c:if test="${empty IsMark }">
						<div class="reserve-btn">
                            <div class="featured-btn-wrap" onclick="onSetMark('${ins.aab101}')" >
                                <a href="#" id="markbtn" onclick="onSetMark('${ins.aab101}')" class="btn btn-danger">�ղ�</a>
                            </div>
                        </div>
						</c:if>
						
						<c:if test="${!empty IsMark }">
						<div class="reserve-btn">
                            <div class="featured-btn-wrap" onclick="onDelMark('${ins.aab101}')" >
                                <a href="#" id="markbtn" onclick="onDelMark('${ins.aab101}')" class="btn btn-danger">ȡ���ղ�</a>
                            </div>
                        </div>
						</c:if>                   
                        
                        
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--//END RESERVE A SEAT -->
    <!--============================= BOOKING DETAILS =============================-->
    <section class="light-bg booking-details_wrap">
        <div class="container">
            <div class="row">
                <div class="col-md-8 responsive-wrap">
                    <div class="booking-checkbox_wrap">
                        <div class="booking-checkbox">
                            <div class="review-btn">
                            <a href="#" onclick="onMenu(${ins.aab101 })" class="btn btn-outline-danger">�鿴�˵�</a>                          
                        	</div>
                            <hr>
                        </div>
                        <div class="row detail-checkbox-wrap">
                        
                        
                        
                        <c:choose>
                        <c:when test="${Equipment.e0=='1' }">
                        <div class="col-sm-12 col-md-6 col-lg-4 col-xl-3">
                        <label class="custom-control custom-checkbox">
                		<input type="checkbox" onclick="return false;" checked="checked" class="custom-control-input">
                		<span class="custom-control-indicator"></span>
                		<span class="custom-control-description">�յ�</span>
             			</label>
                        </div>
                        </c:when>
                        <c:otherwise>
                        <div class="col-sm-12 col-md-6 col-lg-4 col-xl-3">
                        <label class="custom-control custom-checkbox">
                		<input type="checkbox" onclick="return false;" class="custom-control-input">
                		<span class="custom-control-indicator"></span>
                		<span class="custom-control-description">�յ�</span>
              			</label>
                        </div>
                        </c:otherwise>
                        </c:choose>
                        
                        
                        <c:choose>
                        <c:when test="${Equipment.e1=='1' }">
                        <div class="col-sm-12 col-md-6 col-lg-4 col-xl-3">
                        <label class="custom-control custom-checkbox">
                		<input type="checkbox" onclick="return false;" checked="checked" class="custom-control-input">
                		<span class="custom-control-indicator"></span>
                		<span class="custom-control-description">WIFI</span>
             			</label>
                        </div>
                        </c:when>
                        <c:otherwise>
                        <div class="col-sm-12 col-md-6 col-lg-4 col-xl-3">
                        <label class="custom-control custom-checkbox">
                		<input type="checkbox" onclick="return false;" class="custom-control-input">
                		<span class="custom-control-indicator"></span>
                		<span class="custom-control-description">WIFI</span>
              			</label>
                        </div>
                        </c:otherwise>
                        </c:choose>
                        
                        
                        <c:choose>
                        <c:when test="${Equipment.e2=='1' }">
                        <div class="col-sm-12 col-md-6 col-lg-4 col-xl-3">
                        <label class="custom-control custom-checkbox">
                		<input type="checkbox" onclick="return false;" checked="checked" class="custom-control-input">
                		<span class="custom-control-indicator"></span>
                		<span class="custom-control-description">��籦</span>
             			</label>
                        </div>
                        </c:when>
                        <c:otherwise>
                        <div class="col-sm-12 col-md-6 col-lg-4 col-xl-3">
                        <label class="custom-control custom-checkbox">
                		<input type="checkbox" onclick="return false;" class="custom-control-input">
                		<span class="custom-control-indicator"></span>
                		<span class="custom-control-description">��籦</span>
              			</label>
                        </div>
                        </c:otherwise>
                        </c:choose>
                        
                        
                        <c:choose>
                        <c:when test="${Equipment.e3=='1' }">
                        <div class="col-sm-12 col-md-6 col-lg-4 col-xl-3">
                        <label class="custom-control custom-checkbox">
                		<input type="checkbox" onclick="return false;" checked="checked" class="custom-control-input">
                		<span class="custom-control-indicator"></span>
                		<span class="custom-control-description">ϴ�ּ�</span>
             			</label>
                        </div>
                        </c:when>
                        <c:otherwise>
                        <div class="col-sm-12 col-md-6 col-lg-4 col-xl-3">
                        <label class="custom-control custom-checkbox">
                		<input type="checkbox" onclick="return false;" class="custom-control-input">
                		<span class="custom-control-indicator"></span>
                		<span class="custom-control-description">ϴ�ּ�</span>
              			</label>
                        </div>
                        </c:otherwise>
                        </c:choose>
                        
                        
                        
                        <c:choose>
                        <c:when test="${Equipment.e4=='1' }">
                        <div class="col-sm-12 col-md-6 col-lg-4 col-xl-3">
                        <label class="custom-control custom-checkbox">
                		<input type="checkbox" onclick="return false;" checked="checked" class="custom-control-input">
                		<span class="custom-control-indicator"></span>
                		<span class="custom-control-description">ͣ��λ</span>
             			</label>
                        </div>
                        </c:when>
                        <c:otherwise>
                        <div class="col-sm-12 col-md-6 col-lg-4 col-xl-3">
                        <label class="custom-control custom-checkbox">
                		<input type="checkbox" onclick="return false;" class="custom-control-input">
                		<span class="custom-control-indicator"></span>
                		<span class="custom-control-description">ͣ��λ</span>
              			</label>
                        </div>
                        </c:otherwise>
                        </c:choose>
                        
                        
                        
                        <c:choose>
                        <c:when test="${Equipment.e5=='1' }">
                        <div class="col-sm-12 col-md-6 col-lg-4 col-xl-3">
                        <label class="custom-control custom-checkbox">
                		<input type="checkbox" onclick="return false;" checked="checked" class="custom-control-input">
                		<span class="custom-control-indicator"></span>
                		<span class="custom-control-description">������</span>
             			</label>
                        </div>
                        </c:when>
                        <c:otherwise>
                        <div class="col-sm-12 col-md-6 col-lg-4 col-xl-3">
                        <label class="custom-control custom-checkbox">
                		<input type="checkbox" onclick="return false;" class="custom-control-input">
                		<span class="custom-control-indicator"></span>
                		<span class="custom-control-description">������</span>
              			</label>
                        </div>
                        </c:otherwise>
                        </c:choose>
                        
                        
                       
                        
                        
                        
                        

                        
                    </div>
                    </div>
                    
                                      
                    <div class="booking-checkbox_wrap mt-4">
                    	<c:choose> 
                        <c:when test="${rows!=null }">
                        <h5><a>${ins.aab114 }</a><a>������</a></a></h5>
                        <hr>
                        </c:when>
                        <c:otherwise>
                       	<h5><a>��ʱ��û�е���</a></h5>
                        </c:otherwise>
                        </c:choose>
                        
                        
                        <c:choose> 
                        <c:when test="${rows!=null }"> 
                        <c:forEach items="${rows }" var="row" varStatus="vs">
                        <c:if test="${row.aab305=='0'}">
                        <div class="customer-review_wrap">
                            <div class="customer-img">                           
                                <p>${row.aaa103 }</p>
                            </div>
                            <div class="customer-content-wrap">
                                <div class="customer-content">
	                               	<div class="customer-review">                                      
                                        
                                        <c:if test="${row.aab307=='5'}">
                                        <span></span>
                                        <span></span>
                                        <span></span>
                                        <span></span>
                                        <span></span>
                                        </c:if>
                                        <c:if test="${row.aab307=='4'}">
                                        <span></span>
                                        <span></span>
                                        <span></span>
                                        <span></span>
                                        </c:if> 
                                        <c:if test="${row.aab307=='3'}">
                                        <span></span>
                                        <span></span>
                                        <span></span>
                                        </c:if>
                                        <c:if test="${row.aab307=='2'}">
                                        <span></span>
                                        <span></span>
                                        </c:if>  
                                        <c:if test="${row.aab307=='1'}">
                                        <span></span>
                                        <span></span>
                                        </c:if>                                
                                        <p>${row.aab304 }</p>
                                    </div>
                                    
                                    
                                    
                                    <div class="customer-rating customer-rating">${row.aab307 }</div>
                                 
                                    
                                    
                                    
                                </div>
                                <p class="customer-text">
                                ${row.aab303 }
                                </p>
                                
                                
                                <c:if test="${CommentPhoto!=null}">
                                
                                <ul>
                                
                                
                                <c:forEach items="${CommentPhoto }" var="cp" varStatus="vss">                              
                                	<c:if test="${cp.aab301==row.aab301}">
                                	
                                	<ul>
                                	
                                	
                                	<c:if test="${cp.c0!=null}">              	
                                    <li>
                                    <div href="upload/${cp.c0 }"  class="grid image-link">
                                    <img width="100px" height="100px" src="upload/${cp.c0 }" class="img-fluid" alt="#">
                                    </div>
                                    </li>
                                    </c:if>
                                    <c:if test="${cp.c1!=null}">              	
                                    <li>
                                    <div href="upload/${cp.c1 }"  class="grid image-link">
                                    <img width="100px" height="100px" src="upload/${cp.c1 }" class="img-fluid" alt="#">
                                    </div>
                                    </li>
                                    </c:if>
                                    <c:if test="${cp.c2!=null}">              	
                                    <li>
                                    <div href="upload/${cp.c2 }"  class="grid image-link">
                                    <img width="100px" height="100px" src="upload/${cp.c2 }" class="img-fluid" alt="#">
                                    </div>
                                    </li>
                                    </c:if>
                                    <c:if test="${cp.c3!=null}">              	
                                    <li>
                                    <div href="upload/${cp.c3 }"  class="grid image-link">
                                    <img width="100px" height="100px" src="upload/${cp.c3 }" class="img-fluid" alt="#">
                                    </div>
                                    </li>
                                    </c:if>
                                    <c:if test="${cp.c4!=null}">              	
                                    <li>
                                    <div href="upload/${cp.c4 }"  class="grid image-link">
                                    <img width="100px" height="100px" src="upload/${cp.c4 }" class="img-fluid" alt="#">
                                    </div>
                                    </li>
                                    </c:if>
                                    <c:if test="${cp.c5!=null}">              	
                                    <li>
                                    <div href="upload/${cp.c5 }"  class="grid image-link">
                                    <img width="100px" height="100px" src="upload/${cp.c5 }" class="img-fluid" alt="#">
                                    </div>
                                    </li>
                                    </c:if>
                                    
                                    
                                    </ul>
                                    
                                    </c:if>                            
                                </c:forEach>
                                
                                
                                </ul>
                                </c:if>
                                
                                
                                
                                
                                
                                
                                <c:forEach items="${rows }" var="reply" varStatus="vs">
                                <c:if test="${reply.aab305==row.aab301}">
                                <p class="customer-text">
                                <a>�̼һظ�:</a>
                                ${reply.aab303 }
                                </p>
                                </c:if>
                                </c:forEach>
                                
                                
                                
                                
                                <span>${row.aab308 } �˾��ú���</span>
                                <a href="#"><span class="icon-like"></span>��</a>
                                
                                
                                
                                
                                <span>
                                <div id="replybtn${row.aab301 }">
                                <span><a href="javascript:void(0)" onclick="onShowReply(${row.aab301 })">�ظ�</a></span>
                                </div>
                                <div id="closebtn${row.aab301 }" style="display:none">
                                <span><a href="javascript:void(0)" onclick="onCloseReply(${row.aab301 })">�ر�</a></span>
                                </div>             
                                </span>
                                
                                
                                
                                <span>
                                <div id="delbtn${row.aab301 }" onclick="onDelCommentById(${row.aab301 })">
                                <span><a href="javascript:void(0)" onclick="onCloseReply(${row.aab301 })">ɾ��</a></span>
                                </div>
                                </span>
                                
                                
                                
                                
                                                           
                                <br>
                                <br>
                                <div style="display:none" id="ReplyText${row.aab301 }">                           
                                <textarea style="width:300px; height:50px" name="ReplyText${row.aab301 }" ></textarea>
                                <a href="#" onclick="onAddReply(${row.aab301 })">�ύ</a>
                                </div>
                                
                                

                                
                            </div>
                        </div>
                        <hr>
                        </c:if>
                        </c:forEach>
                    	</c:when>
                    	</c:choose>
                      
                      
                      
                        
                    </div>
                    
                    
                    
                    
                    
                </div>
                <div class="col-md-4 responsive-wrap">
                    <div class="contact-info">
                        <img src="images/map.jpg" class="img-fluid" alt="#">
                        <div class="address">
                            <span class="icon-location-pin"></span>
                            <p>${ins.aab106 }</p>
                        </div>
                        <div class="address">
                            <span class="icon-screen-smartphone"></span>
                            <p>${ins.aab107 }</p>
                        </div>
                        <div class="address">
                            <c:choose>
                            <c:when test="${ins.aab110=='1' }">
                            <span class="icon-clock"></span>                         
                            <div class="open-now">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp����Ԥ��</div>
                            </c:when>
                            <c:otherwise>
                            <span class="icon-clock"></span>                          
                            <div class="closed-now">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp�ݲ�����Ԥ��</div>
                            </c:otherwise>
                            </c:choose>
                        </div>
                        <br>
                        <a href="#" class="btn btn-outline-danger btn-contact">�鿴��ͼ����/����</a>
                    </div>                    
                </div>
            </div>
        </div>
    </section>
    <!--//END BOOKING DETAILS -->




    <!-- jQuery, Bootstrap JS. -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src=" <%=path%>/js/xzs_jquery-3.2.1.min.js"></script>
    <script src=" <%=path%>/js/xzs_popper.min.js"></script>
    <script src=" <%=path%>/js/xzs_bootstrap.min.js"></script>
    <!-- Magnific popup JS -->
    <script src=" <%=path%>/js/xzs_jquery.magnific-popup.js"></script>
    <!-- Swipper Slider JS -->
    <script src=" <%=path%>/js/xzs_swiper.min.js"></script>
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