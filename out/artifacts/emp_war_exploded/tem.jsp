<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%String path=request.getContextPath(); %>
<%@ page contentType="text/html;charset=GBK" import="java.util.*" language="java" %>
<html lang="zh-CN">

<head>
    <meta charset="utf-8">
    <title>响应式博客幻灯片演示</title>


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

<form class="blog-slider">
<input type="hidden" name="aaa101" value="8"/>
    <div class="blog-slider__wrp swiper-wrapper">
        <div class="blog-slider__item swiper-slide">
            <c:if test="${empty rows }">
                <div class="blog-slider__img">
                    <img src="/upload/2bff830f-c745-4f00-9751-1989b33405a0.jpg" alt="${row.aab104 }">
                </div>
                <div class="blog-slider__content">
                    <span class="blog-slider__code">2018-08-31</span>
                    <div class="blog-slider__title">没有找到适合的餐厅哦</div>
                    <div class="blog-slider__text">请更换口味选择</div>
                    <input type="submit" formaction="<%=path%>/preferenceIndex.html" class="blog-slider__button" value="返回"></a>
                </div>
            </c:if>
            <input type="hidden" name="aab101" value="${rows[0].aab101 }">

            <c:forEach items="${rows }" var="row" varStatus="vs">

                    <input type="hidden" name="aab104"  value="${row.aab104 }">
                    <input type="hidden" name="aab207"  value="${row.aab207 }">
                    <input type="hidden" name="aaa202"  value="${row.aaa202 }">
                    <input type="hidden" name="aaa203"  value="${row.aaa203 }">
                    <input type="hidden" name="aaa204"  value="${row.aaa204 }">
                    <div class="blog-slider__img">
                        <img src="/upload/${row.aab113 }" alt="${row.aab104 }">
                    </div>
                    <div class="blog-slider__content">
                        <span class="blog-slider__code">2018-08-31</span>
                        <div class="blog-slider__title">${row.aab104 }</div>
                        <div class="blog-slider__text">这顿吃：${row.aab207 }<br>联系电话：${row.aab107 }<br>地址：${row.aab106 }<br>评分：${row.aab111 }</div>
                        <input type="submit" formaction="shopinfoFindById.html" class="blog-slider__button" value="就它了"/></a>
                        <input type="submit" formaction="recommendNext.html" class="blog-slider__button" value="下一个"/></a>
                    </div>


            </c:forEach>

        </div>


    </div>
    <div class="blog-slider__pagination"></div>
</form>
<script src="<%=path%>/js/swiper.min.js"></script>
<script src="<%=path%>/js/index.js"></script>

</body>

</html>