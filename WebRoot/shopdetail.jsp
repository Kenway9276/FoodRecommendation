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
    
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
    
    <link rel="stylesheet" type="text/css" href="<%=path%>/css/xzs_jquery.datetimepicker.css"/>
    <!-- Favicons -->
    <link rel="shortcut icon" href="#">
    <!-- Page Title -->
    <title>商家详情</title>
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
    
    <link rel="stylesheet" href="<%=path%>/css/xzs_icheck-bootstrap.css">
    
    
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=LtaZG8G4TNzGd6Rs57WGyKMr7Hx7GxbU"></script>
    
    <script>
	function onSetMark()
    {
  	  	//添加到收藏夹
  	 	var vform = document.getElementById("myform");
  	 	vform.action="<%=path%>/markAdd.html";
  		vform.submit();
    }
	
	
	function onDelMark(vaab101)
    {
  	  	//取消收藏
  	 	var vform = document.getElementById("myform");
  	 	vform.action="<%=path%>/markDeleteInShopDetail.html?aab101="+vaab101;
  		vform.submit();
    }
	
	function onQueryMark()
    {
  	  //查看收藏
  	 var vform = document.getElementById("myform");
  	 vform.action="<%=path%>/markQuery.html";
  	 vform.submit();
    }
	
	
	function onQueryMessage()
    {
  	  //查看消息
  	 var vform = document.getElementById("myform");
  	 vform.action="<%=path%>/messageSearchUnRead.html";
  	 vform.submit();
    }
	
	
	function onMenu(vaab101)
    {
  	  //查看菜单
  	 var vform = document.getElementById("myform");
  	 vform.action="<%=path%>/shopinfoFindMenu.html?aab101="+vaab101;
  	 vform.submit();
    }
	
	function onAddComment(vaab101)
    {
  	  //写点评
  	 var vform = document.getElementById("myform");
  	 vform.action="<%=path%>/commentToDo.html?aab101="+vaab101;
  	 vform.submit();
    }
	
	function onShowReply(vaab301)
    {
		//点击回复弹出文本域
		document.getElementById("ReplyText"+vaab301).style="display:block";
		document.getElementById("replybtn"+vaab301).style="display:none";
		document.getElementById("closebtn"+vaab301).style="display:block";
    }
	
	function onCloseReply(vaab301)
    {
		//点击关闭弹出文本域
		document.getElementById("ReplyText"+vaab301).style="display:none";
		document.getElementById("replybtn"+vaab301).style="display:block";
		document.getElementById("closebtn"+vaab301).style="display:none";
    }
	
	function onAddReply(vaab301,vaab101,vaaa101)
	{
		//提交回复
		var vform = document.getElementById("myform");
	  	vform.action="<%=path%>/commentReplyAdd.html?aab301="+vaab301+"&aab101="+vaab101+"&aaa101="+vaaa101;
	  	vform.submit();
	}
	
	function onDelCommentById(vaab301,vaab101)
	{
		//删除评论
		var vform = document.getElementById("myform");
	  	vform.action="<%=path%>/commentDelById.html?aab301="+vaab301;
	  	vform.submit();
	}
	
	function onShowReserveTable()
    {
		//点击弹出预定表单
		document.getElementById("reserveDiv").style="display:block";
    }
	
	function onCloseReserveTable()
    {
		//点击收起预定表单
		document.getElementById("reserveDiv").style="display:none";
    }
	
	function onSubmitReserveTable(vaab101)
	{
		//提交预定表单
		var vform = document.getElementById("myform");
	  	vform.action="<%=path%>/ReserveAdd.html?aab101"+vaab101;
	  	vform.submit();
	}
	
	function onMapGuide(vaab106)
	{
		//地图导航
		var vform = document.getElementById("myform");

		//将中文参数编码后再传递
	  	vform.action="<%=path%>/mapGuide.html?aab106="+encodeURI(vaab106);
	  	vform.submit();
	}
	
	function onShowReserveOff()
	{
		//提示无法订座
		alert("该商家暂不接受预定!");
	}
	
	function showGood()
	{
		//显示好评
		showAll();
		showDiv("5");
		hideDiv("4");
		hideDiv("3");
		hideDiv("2");
		hideDiv("1");
	}
	
	function showSoSo()
	{
		//显示中评
		showAll();
		hideDiv("5");
		showDiv("4");
		showDiv("3");
		hideDiv("2");
		hideDiv("1");
	}
	
	function showBad()
	{
		//显示差评
		showAll();
		hideDiv("5");
		hideDiv("4");
		hideDiv("3");
		showDiv("2");
		showDiv("1");
	}
	
	
	function showDiv(score)
	{
		//根据评分显示
		var divs=document.getElementsByName(score)
		for(var i=0;i<divs.length;i++)
		{
			var div=divs[i];
			div.style="display:block";
		}
	}
	
	function hideDiv(score)
	{
		//根据评分隐藏
		var divs=document.getElementsByName(score)
		for(var i=0;i<divs.length;i++)
		{
			var div=divs[i];
			div.style="display:none";
		}
	}
	
	
	function showYP()
	{
		//查看有图
		showAll();
		
		var divs=document.getElementsByName("yp")
		for(var i=0;i<divs.length;i++)
		{
			var div=divs[i];
			div.style="display:block";
		}
		var divs=document.getElementsByName("np")
		for(var i=0;i<divs.length;i++)
		{
			var div=divs[i];
			div.style="display:none";
		}
	}
	
	
	//全部显示
	function showAll()
	{
		var divs=document.getElementsByName("yp")
		for(var i=0;i<divs.length;i++)
		{
			var div=divs[i];
			div.style="display:block";
		}
		var divs=document.getElementsByName("np")
		for(var i=0;i<divs.length;i++)
		{
			var div=divs[i];
			div.style="display:block";
		}
		showDiv("5");
		showDiv("4");
		showDiv("3");
		showDiv("2");
		showDiv("1");
	}
	function onAssemble(vaab101)
    {
  	  	//拼座
  	 	var vform = document.getElementById("myform");
  	 	vform.action="<%=path%>/userToAssemblePage.html?aab101="+vaab101;
  		vform.submit();
    }
	
	
	//
	function onCloseShop(vaab101)
	{
		//管理员关停商家
		var vform = document.getElementById("myform");
	  	vform.action="<%=path%>/shopClose.html?aab101"+vaab101;
	  	alert("操作成功!");
	  	vform.submit();
	}
	
	
	function onReturnShop()
	{
		//返回商家管理
		var vform = document.getElementById("myform");
	  	vform.action="<%=path%>/busiReturn.html";
	  	vform.submit();
	}
	
</script>
<link rel="stylesheet" href="css/style_nav.css"/>

</head>

<body>

<form id="myform" method="post" >	
	<input id="shop_id" type="hidden" name="aab101" value="${ins.aab101 }"></input>
	<input type="hidden" id="MapAd" value="${ins.aab106 }"></input>
	<!--
	<input type="hidden" name="aaa101" value="1"></input>
	<input type="hidden" name="aaa" value="${param.aaa101 }"></input> 
	 -->
	

    <!--============================= HEADER =============================-->
    <c:if test="${sessionScope.busiID==null}">
    <div class="c-nav">
	<div class="container navFlex">
		<div class="flexItem">
		吃
		</div>
		<div class="flexItem show">
			<ul>
				<li><a href="${empty sessionScope.userID?'userLogin.jsp':'userInfo.html'}">${empty sessionScope.userID?'登录':'个人信息'}</a></li>
				<li><a href="shopsearch.jsp">搜索</a></li>
				<li style="display:${empty sessionScope.adminID?'':'none'}"><a href="preferenceIndex.html">推荐</a></li>
				<li style="display:${empty sessionScope.adminID?'':'none'}"><a href="markQuery.html">收藏</a></li>
				<li><a href="bBSBrowse.html">论坛</a></li>
				<li style="display:${empty sessionScope.adminID?'':'none'}"><a href="userHistory.html">历史订单</a></li>
				<li><a href="userNotice.html">公告</a></li>
				<li style="display:${empty sessionScope.adminID?'':'none'}"><a href="couponList.html">优惠券</a></li>
				<li><a href="messageSearchUnRead.html">消息</a></li>
				<li style="display:${empty sessionScope.adminID?'none':''}"><a href="adminInfo.html">后台</a></li>
				<li style="display:${empty sessionScope.adminID?'':'none'}"><a href="userStory.html">关于你</a></li>
			</ul>
		</div>
	</div>
	</div>
	</c:if>
    <!--//END HEADER -->
    <!--============================= BOOKING =============================-->
    <div>
        <!-- Swiper -->
        <div class="swiper-container">
        
        	<div class="swiper-wrapper">
        	
        	<c:forEach items="${Address }" var="ad" varStatus="vs">
        	
            <div class="swiper-slide">


            <div style="width:100%;height:300px">

                    <a href="<%=path%>/${ad.address }" class="grid image-link">
                        <img src="<%=path%>/${ad.address }" class="img-fluid" alt="#">

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
                        
                     
                        <c:if test="${sessionScope.userID!=null}">
                        <c:if test="${empty IsComment }">
                        <div class="review-btn">
                            <a href="#" onclick="onAddComment(${ins.aab101 })" class="btn btn-outline-danger">&nbsp&nbsp&nbsp&nbsp&nbsp写点评&nbsp&nbsp&nbsp&nbsp&nbsp</a>
                            <span><a>${ins.aab114 }</a><a>条点评</a></span>
                        </div>
                        </c:if>
                        
                        <c:if test="${!empty IsComment }">
                        <div class="review-btn">
                            <a style="color:grey" class="btn btn-outline-danger">&nbsp&nbsp&nbsp&nbsp&nbsp已点评&nbsp&nbsp&nbsp&nbsp&nbsp</a>
                            <span><a>${ins.aab114 }</a><a>条点评</a></span>
                        </div>
                        </c:if>
                        </c:if>
                        
                        
                        
                        <c:if test="${sessionScope.userID!=null}">
                        <c:choose>
                        <c:when test="${ins.aab110=='1' }"> 
                        <div class="reserve-btn">
                            <div class="featured-btn-wrap">
                                <a href="javascript:void(0)" onclick="onShowReserveTable()" class="btn btn-danger">订座</a>
                            </div>
                        </div>
                        </c:when>
                        <c:otherwise>
                        <div class="reserve-btn">
                            <div class="featured-btn-wrap">
                                <a style="color:white" href="javascript:void(0)" onclick="onShowReserveOff()" class="btn btn-danger">订座</a>
                            </div>
                        </div>
                        </c:otherwise>
                        </c:choose>
                        </c:if>
                        
                        
                        <c:if test="${sessionScope.userID!=null}">
                        <div class="reserve-btn">
                            <div class="featured-btn-wrap">
                                <a href="javascript:void(0)" onclick="onAssemble(${ins.aab101})" class="btn btn-danger">拼座</a>
                            </div>
                        </div>
                        </c:if>
                        
                        
                        <c:if test="${sessionScope.adminID!=null}">
                        <div class="reserve-btn">
                            <div class="featured-btn-wrap">
                                <a href="javascript:void(0)" onclick="onCloseShop(${ins.aab101 })" class="btn btn-danger">关停商家</a>
                            </div>
                        </div>
                        </c:if>
                        
                        <c:if test="${sessionScope.adminID!=null}">
                        <div class="reserve-btn">
                            <div class="featured-btn-wrap">
                                <a href="javascript:void(0)" onclick="onReturnShop()" class="btn btn-danger">返回</a>
                            </div>
                        </div>
                        </c:if>
                        
                                     
                        
                        
                        <c:if test="${sessionScope.userID!=null}">
                        <c:if test="${empty IsMark }">
						<div class="reserve-btn">
                            <div class="featured-btn-wrap">
                                <a href="javascript:void(0)" id="markbtn" onclick="onSetMark('${ins.aab101}')" class="btn btn-danger">收藏</a>
                            </div>
                        </div>
						</c:if>
						
						
						
						
						<c:if test="${!empty IsMark }">
						<div class="reserve-btn">
                            <div class="featured-btn-wrap">
                                <a href="javascript:void(0)" id="markbtn" onclick="onDelMark('${ins.aab101}')" class="btn btn-danger">取消收藏</a>
                            </div>
                        </div>
						</c:if> 
						</c:if>
						
						
						
						<div id="reserveDiv" style="display:none">
						<br>
						<br>
						<span>预定时间</span>
						<span><input type="text" name="aac103" value="" id="datetimepicker_mask"/></span>
						<span>用餐人数</span>
						<span><input type="number" name="aac104" min="1" max="15" /></span>
						
						<input type="hidden" name="aaa201" value='65'>						 
						<br>
						<br>
						<button  type="button" id="dell" name="next" class="btn btn-outline-danger" 
						onclick="onCloseReserveTable()" >取消</button>
						<!--<button  type="button" id="book-btn" name="next" class="btn btn-outline-danger"
						onclick="onSubmitReserveTable()">提交</button>-->
                            <button  type="button" id="book-btn" name="next" class="btn btn-outline-danger">提交</button>
						</div>

                        
                        
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
                            <a href="#" onclick="onMenu(${ins.aab101 })" class="btn btn-outline-danger">查看菜单</a>                          
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
                		<span class="custom-control-description">空调</span>
             			</label>
                        </div>
                        </c:when>
                        <c:otherwise>
                        <div class="col-sm-12 col-md-6 col-lg-4 col-xl-3">
                        <label class="custom-control custom-checkbox">
                		<input type="checkbox" onclick="return false;" class="custom-control-input">
                		<span class="custom-control-indicator"></span>
                		<span class="custom-control-description">空调</span>
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
                		<span class="custom-control-description">充电宝</span>
             			</label>
                        </div>
                        </c:when>
                        <c:otherwise>
                        <div class="col-sm-12 col-md-6 col-lg-4 col-xl-3">
                        <label class="custom-control custom-checkbox">
                		<input type="checkbox" onclick="return false;" class="custom-control-input">
                		<span class="custom-control-indicator"></span>
                		<span class="custom-control-description">充电宝</span>
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
                		<span class="custom-control-description">洗手间</span>
             			</label>
                        </div>
                        </c:when>
                        <c:otherwise>
                        <div class="col-sm-12 col-md-6 col-lg-4 col-xl-3">
                        <label class="custom-control custom-checkbox">
                		<input type="checkbox" onclick="return false;" class="custom-control-input">
                		<span class="custom-control-indicator"></span>
                		<span class="custom-control-description">洗手间</span>
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
                		<span class="custom-control-description">停车位</span>
             			</label>
                        </div>
                        </c:when>
                        <c:otherwise>
                        <div class="col-sm-12 col-md-6 col-lg-4 col-xl-3">
                        <label class="custom-control custom-checkbox">
                		<input type="checkbox" onclick="return false;" class="custom-control-input">
                		<span class="custom-control-indicator"></span>
                		<span class="custom-control-description">停车位</span>
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
                		<span class="custom-control-description">吸烟区</span>
             			</label>
                        </div>
                        </c:when>
                        <c:otherwise>
                        <div class="col-sm-12 col-md-6 col-lg-4 col-xl-3">
                        <label class="custom-control custom-checkbox">
                		<input type="checkbox" onclick="return false;" class="custom-control-input">
                		<span class="custom-control-indicator"></span>
                		<span class="custom-control-description">吸烟区</span>
              			</label>
                        </div>
                        </c:otherwise>
                        </c:choose>
                        
                        
                       
                        
                        
                        
                        

                        
                    </div>
                    </div>
                    
                                      
                    <div class="booking-checkbox_wrap mt-4">
                    	<c:choose> 
                        <c:when test="${rows!=null }">
                        
                        <h5 align="left"><a>点评</a><a style="color:grey">(${ins.aab114 })</a></h5>
                        <br>
                        
                        <div class="radio icheck-emerland" style="display:inline">
						<input type="radio"  onclick="showAll()" checked id="emerland1" name="emerland" />
						<label for="emerland1">全部&nbsp&nbsp&nbsp&nbsp</label>
						</div>
						<div class="radio icheck-emerland" style="display:inline">
						<input type="radio" onclick="showYP()" id="emerland2" name="emerland" />
						<label for="emerland2">有图(${Cal.haveP })&nbsp&nbsp&nbsp&nbsp</label>
						</div>
						<div class="radio icheck-emerland" style="display:inline">
						<input type="radio" onclick="showGood()" id="emerland3" name="emerland" />
						<label for="emerland3">好评(${Cal.good })&nbsp&nbsp&nbsp&nbsp</label>
						</div>
						<div class="radio icheck-emerland" style="display:inline">
						<input type="radio" onclick="showSoSo()" id="emerland4" name="emerland" />
						<label for="emerland4">中评(${Cal.soso })&nbsp&nbsp&nbsp&nbsp</label>
						</div>
						<div class="radio icheck-emerland" style="display:inline">
						<input type="radio" onclick="showBad()" id="emerland5" name="emerland" />
						<label for="emerland5">差评(${Cal.bad })&nbsp&nbsp&nbsp&nbsp</label>
						</div>
                        <hr>
                        
                        </c:when>
                        <c:otherwise>
                       	<h5><a>暂时还没有点评</a></h5>
                        </c:otherwise>
                        </c:choose>
                        
                        
                        <c:choose> 
                        <c:when test="${rows!=null }"> 
                        <c:forEach items="${rows }" var="row" varStatus="vs">
                        <c:if test="${row.aab305=='0'}">
                        
                        <div name="${empty row.aab306?'np':'yp' }">                  
                        <div class="customer-review_wrap" name="${row.aab307 }">
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
                                	
                                	
                                	<c:if test="${!empty cp.c0 }">              	
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
                                <a>商家回复:</a>
                                ${reply.aab303 }
                                </p>
                                </c:if>
                                </c:forEach>
                                
                                
                                
                                <!--
                                <span>${row.aab308 } 人觉得很赞</span>
                                <a href="#"><span class="icon-like"></span>赞</a>
                                 -->
                                
                                
                                
                                <c:if test="${sessionScope.busiID==ins.aab101 }">
                                <span>
                                <div id="replybtn${row.aab301 }">
                                <span><a href="javascript:void(0)" onclick="onShowReply(${row.aab301 })">回复</a></span>
                                </div>
                                <div id="closebtn${row.aab301 }" style="display:none">
                                <span><a href="javascript:void(0)" onclick="onCloseReply(${row.aab301 })">关闭</a></span>
                                </div>             
                                </span>
                                </c:if>
                                
                                
                                
                                <c:if test="${sessionScope.userID==row.aaa101 }">
                                <span>
                                <div id="delbtn${row.aab301 }" onclick="onDelCommentById(${row.aab301 },${ins.aab101 })">
                                <span><a href="javascript:void(0)" onclick="onDelCommentById(${row.aab301},${ins.aab101 } )">删除</a></span>
                                </div>
                                </span>
                                </c:if>
                                
                                
                                <c:if test="${sessionScope.adminID!=null}">
                                <span>
                                <div id="delbtn${row.aab301 }" onclick="onDelCommentById(${row.aab301 },${ins.aab101 })">
                                <span><a href="javascript:void(0)" onclick="onDelCommentById(${row.aab301},${ins.aab101 } )">删除</a></span>
                                </div>
                                </span>
                                </c:if>
                                
                                
                                
                                
                                                           
                                <br>
                                <br>
                                <div style="display:none" id="ReplyText${row.aab301 }">                           
                                <textarea style="width:300px; height:50px" name="ReplyText${row.aab301 }" ></textarea>
                                <a href="#" onclick="onAddReply(${row.aab301 },${ins.aab101 },${row.aaa101 })">提交</a>
                                </div>
                                
                                

                                
                            </div>
                        <hr>    
                        </div>
                        </div>
                        
                        </c:if>
                        </c:forEach>
                    	</c:when>
                    	</c:choose>
                      
                      
                      
                        
                    </div>
                    
                    
                    
                    
                    
                </div>
                <div class="col-md-4 responsive-wrap">
                    <div class="contact-info">
                        <div id="allmap" style="width:350px;height:350px"></div>
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
                            <div class="open-now">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp接受预定</div>
                            </c:when>
                            <c:otherwise>
                            <span class="icon-clock"></span>                          
                            <div class="closed-now">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp暂不接受预定</div>
                            </c:otherwise>
                            </c:choose>
                        </div>
                        <br>
                        <a href="#" onclick="onMapGuide('${ins.aab106 }')" class="btn btn-outline-danger btn-contact">查看地图详情/导航</a>
                        
                    </div>                    
                </div>
            </div>
        </div>
    </section>
    <!--//END BOOKING DETAILS -->




    <!-- jQuery, Bootstrap JS. -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script type="text/javascript" src="<%=path%>/js/xzs03_jquery.js"></script>
	<script type="text/javascript" src="<%=path%>/js/xzs03_jquery.datetimepicker.js"></script>
	<script type="text/javascript">
	var newDate = new Date();
    var t       = newDate.toJSON();
	$('#datetimepicker_mask').datetimepicker
	(
			{
				mask:'9999/19/39 29:59',
			}
	);
	
	</script>
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

    <!-- ==== ajax ==== -->
    <script src="ajax_js/shop_detail_ajax.js"></script>
</form>
</body>

</html>

<script type="text/javascript">
	// 百度地图API功能
	var map = new BMap.Map("allmap");
	var point = new BMap.Point(116.331398,39.897445);
	map.centerAndZoom(point,12);
	map.addControl(new BMap.NavigationControl());    
	map.addControl(new BMap.ScaleControl());    
	map.addControl(new BMap.OverviewMapControl());    
	// 创建地址解析器实例
	var myGeo = new BMap.Geocoder();
	// 将地址解析结果显示在地图上,并调整地图视野
	var address= document.getElementById("MapAd").value;
	myGeo.getPoint(address, function(point){
		if (point) {
			map.centerAndZoom(point, 16);
			map.addOverlay(new BMap.Marker(point));
		}else{
			alert("该商家地址暂时没有地图解析结果!");
		}
	}, "天津市");
</script>