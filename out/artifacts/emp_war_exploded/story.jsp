<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%String path=request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head lang="zh-CN">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
	<title>用户故事</title>
	
    <link rel="stylesheet" href="<%=path %>/css/public_userstory.css">
	
	<script src="<%=path %>/js/jquery.min.js"></script>
	<script src="<%=path %>/js/jquery_flexslider.js"></script>
	<style type="text/css">
		button{
		display:inline-block;
		border:none;
		background-color:#CCC;
		color:#FFFFFF;
		padding: 12px 28px;
	    text-align: center;
	    font-size: 16px;
	    border-radius:6px;
		}
	</style>
</head>
<body>
<div class="about-history" id="fzlc">
    <header class="about-title title-white">
        <h3 class="wow fadeInUp" style="visibility: visible; animation-name: fadeInUp;">我们和你的故事</h3>
        <hr width="230" align="left">
        <p class="wow fadeInUp" data-wow-delay=".2s" style="visibility: visible; animation-delay: 0.2s; animation-name: fadeInUp;">Our Story</p>
    </header>
    <div class="about-history-list wow zoomIn" data-wow-delay=".4s" style="visibility: visible; animation-delay: 0.4s; animation-name: zoomIn;">		
        <div class="flex-viewport" style="overflow: hidden; position: relative;">
            <ul class="slides clearfix list" style="width: 2600%; transition-duration: 0s; transform: translate3d(0px, 0px, 0px);">

                <li style="width: 253px; float: left; display: block;">
                    <div class="item">
                        <h3>TIME</h3>
                        <div class="desc">
                            <p>
                     			天下快意之事莫若友，快友之事莫若食。<br>
                            	我们已陪你走过${rows[0].days}天，<br>
                            	往后的日子请多关照！
                            </p>
                        </div>
                    </div>
                </li>
                <c:if test="${!empty rows[0].preferences}">
                <li style="width: 253px; float: left; display: block;">
                    <div class="item">
                        <h3>LOVE</h3>
                        <div class="desc">
                            <p>
                            	没有比热爱饮食更真诚的爱！<br>
                            	你已经在这里存储了${rows[0].preferences}种口味，<br>
                            	饮食相伴，也让我们感到幸福。
                            </p>
                        </div>
                    </div>
                </li>
                </c:if>
                <c:if test="${!empty rows[0].books}">
                <li style="width: 253px; float: left; display: block;">
                    <div class="item">
                        <h3>RESERVATION</h3>
                        <div class="desc">
                            <p>
                            	今夜良宴会，欢乐难具陈。<br>
                            	你已经进行了${rows[0].books}次订座，<br>
                            	是三两好友，亦或是高朋满座，纵然对影成三，也有我们相伴。
                            </p>
                        </div>
                    </div>
                </li>
                </c:if>
                <c:if test="${!empty rows[0].cities}">
                <li style="width: 253px; float: left; display: block;">
                    <div class="item">
                        <h3>DESTINATION</h3>
                        <div class="desc">
                            <p>
                            	还顾望旧乡，长路漫浩浩。<br>
                            	你已经走过了${rows[0].cities}个城市，<br>
                            	山长水远，归途或许漫长，前路或许迷茫，要记得我们是你的避风港。
                            </p>
                        </div>
                    </div>
                </li>
                </c:if>

                <li style="width: 253px; float: left; display: block;">
                    <div class="item">
                        <h3>TASTE</h3>
                        <div class="desc">
                            <p>
                                <c:if test="${!empty rows[0].aaa202}">口味万千，你最喜欢——${rows[0].aaa202}<br></c:if>
                                <c:if test="${!empty rows[0].aaa203}">盛宴饕餮，你最中意——${rows[0].aaa203}<br></c:if>
                                <c:if test="${!empty rows[0].aaa204}">金樽清酒、玉盘珍馐，你却独爱——${rows[0].aaa204}<br></c:if>
								我们会记得你的每个一见钟情，每道心头朱砂。
                            </p>
                        </div>
                    </div>
                </li>
                <li style="width: 253px; float: left; display: block;">
                    <div class="item">
                        <h3></h3>
                        <div class="desc">
                            <p>白鳞鲙细供春酒，红尾羹香奉晚餐。</p>
                        </div>
                    </div>
                </li>
                <li style="width: 253px; float: left; display: block;">
                    <div class="item">
                        <h3></h3>
                        <div class="desc">
                            <p>
                            	招寻伴侣乘秋兴，取次鱼虾伴晚餐。<br>
                            	<div style="text-align:center">
                            	<button name="Submit" onclick="javascript:history.back(-1);">返回</button>
                            	</div>
                            </p>
                        </div>
                    </div>
                </li>
                
                <li style="width: 253px; float: left; display: block;"></li>
            </ul>
        </div>
        <ul class="flex-direction-nav">
            <li class="flex-nav-prev"><a class="flex-prev" href="#">&lt;</a></li>
            <li class="flex-nav-next"><a class="flex-next" href="#">&gt;</a></li>
         </ul>
    </div>
</div>

<script>
	$(function(){

			$(".about-history-list").flexslider({animation:"slide",slideshow:false,controlNav:false,itemWidth:253,itemMargin:31,prevText:"<",nextText:">",move:1});
	});
</script>

</body>
</html>