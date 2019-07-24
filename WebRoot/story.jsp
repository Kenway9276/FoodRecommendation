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
	<title>�û�����</title>
	
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
        <h3 class="wow fadeInUp" style="visibility: visible; animation-name: fadeInUp;">���Ǻ���Ĺ���</h3>
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
                     			���¿���֮��Ī���ѣ�����֮��Ī��ʳ��<br>
                            	�����������߹�${rows[0].days}�죬<br>
                            	��������������գ�
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
                            	û�б��Ȱ���ʳ����ϵİ���<br>
                            	���Ѿ�������洢��${rows[0].preferences}�ֿ�ζ��<br>
                            	��ʳ��飬Ҳ�����Ǹе��Ҹ���
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
                            	��ҹ����ᣬ�����Ѿ߳¡�<br>
                            	���Ѿ�������${rows[0].books}�ζ�����<br>
                            	���������ѣ�����Ǹ�����������Ȼ��Ӱ������Ҳ��������顣
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
                            	���������磬��·���ƺơ�<br>
                            	���Ѿ��߹���${rows[0].cities}�����У�<br>
                            	ɽ��ˮԶ����;����������ǰ·������ã��Ҫ�ǵ���������ıܷ�ۡ�
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
                                <c:if test="${!empty rows[0].aaa202}">��ζ��ǧ������ϲ������${rows[0].aaa202}<br></c:if>
                                <c:if test="${!empty rows[0].aaa203}">ʢ�����ѣ��������⡪��${rows[0].aaa203}<br></c:if>
                                <c:if test="${!empty rows[0].aaa204}">������ơ��������ʣ���ȴ��������${rows[0].aaa204}<br></c:if>
								���ǻ�ǵ����ÿ��һ�����飬ÿ����ͷ��ɰ��
                            </p>
                        </div>
                    </div>
                </li>
                <li style="width: 253px; float: left; display: block;">
                    <div class="item">
                        <h3></h3>
                        <div class="desc">
                            <p>������ϸ�����ƣ���β�������͡�</p>
                        </div>
                    </div>
                </li>
                <li style="width: 253px; float: left; display: block;">
                    <div class="item">
                        <h3></h3>
                        <div class="desc">
                            <p>
                            	��Ѱ���³����ˣ�ȡ����Ϻ����͡�<br>
                            	<div style="text-align:center">
                            	<button name="Submit" onclick="javascript:history.back(-1);">����</button>
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