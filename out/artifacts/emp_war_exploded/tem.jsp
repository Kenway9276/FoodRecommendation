<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%String path=request.getContextPath(); %>
<%@ page contentType="text/html;charset=GBK" import="java.util.*" language="java" %>
<html lang="zh-CN">

<head>
    <meta charset="utf-8">
    <title>推荐</title>


    <link rel="stylesheet" href="<%=path%>/css/swiper.min.css">
    <link rel="stylesheet" href="<%=path%>/css/recommend_style.css">
    <script type="text/javascript">
        var count=0;
        function onSelect(vstate)
        {
            vstate?count++:count--;
            var vdel=document.getElementById("del");
            vdel.disabled=(count==0);
        }

        function onEdit(vaab101)
        {
            var vform = document.getElementById("myform");
            vform.action="<%=path%>/findByIdEmp.html?aab101="+vaab101;
            //alert(vform.action);
            vform.submit();
        }

        function onDel(vaab101)
        {
            var vform = document.getElementById("myform");
            vform.action="<%=path%>/delByIdEmp.html?aab101="+vaab101;
            //alert(vform.action);
            vform.submit();
        }

    </script>
</head>

<body>
<%@ include file="navigate.jsp" %>
<form class="blog-slider">

<input type="hidden" name="aaa101" value="8"/>

    <div class="blog-slider__wrp swiper-wrapper">
        <div class="blog-slider__item swiper-slide">
            <c:if test="${empty rows }">
                <div class="blog-slider__img">
                    <img src="/upload/2bff830f-c745-4f00-9751-1989b33405a0.jpg" alt="${rows.aab104 }">
                </div>
                <div class="blog-slider__content">
                    <span class="blog-slider__code">2018-08-31</span>
                    <div class="blog-slider__title">没有找到适合的餐厅哦</div>
                    <div class="blog-slider__text">请更换口味选择</div>
                    <input type="submit" formaction="<%=path%>/preferenceIndex.html" class="blog-slider__button" value="返回"></a>
                </div>
            </c:if>
            <input type="hidden" name="aab101" value="${rows.aab101 }">
            <c:if test="${!empty rows }">
                <input type="hidden" name="aab104"  value="${rows.aab104 }">
                <input type="hidden" name="aab207"  value="${rows.aab207 }">
                <input type="hidden" name="aaa202"  value="${rows.aaa202 }">
                <input type="hidden" name="aaa203"  value="${rows.aaa203 }">
                <input type="hidden" name="aaa204"  value="${rows.aaa204 }">
                <div class="blog-slider__img">
                    <img src="/upload/${rows.aab113 }" alt="${rows.aab104 }">
                </div>
                <div class="blog-slider__content">
                    <span class="blog-slider__code">2018-08-31</span>
                    <div class="blog-slider__title">${rows.aab104 }</div>
                    <div class="blog-slider__text">这顿吃：${rows.aab207 }<br>联系电话：${rows.aab107 }<br>地址：${rows.aab106 }<br>评分：${rows.aab111 }</div>
                    <input type="submit" formaction="shopinfoFindById.html" class="blog-slider__button" value="就它了"/></a>
                    <input type="submit" formaction="recommendNext.html" class="blog-slider__button" value="下一个"/></a>
                </div>
            </c:if>

        </div>

    </div>
    <div class="blog-slider__pagination"></div>
</form>
<script src="<%=path%>/js/swiper.min.js"></script>
<script src="<%=path%>/js/index.js"></script>

</body>

</html>