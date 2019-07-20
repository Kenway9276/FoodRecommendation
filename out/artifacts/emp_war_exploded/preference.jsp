<%@ page language="java" import="java.util.*" pageEncoding="GBK" %>
<%@ taglib uri="http://org.wangxg/jsp/extl" prefix="e" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%String path = request.getContextPath(); %>
<html>
<head>

    <!--必要样式-->
    <link rel="stylesheet" href="css/jquery-labelauty.css" />

    <style type="text/css">
        ul{list-style-type: none;}
        li{display: inline-block;}
        li{margin: 10px 0;}
        input.labelauty + label{font:15px "Microsoft Yahei";}
        *{
    box-sizing: border-box;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
}
body{
    font-family: Helvetica;
    -webkit-font-smoothing: antialiased;
    background: #FFFFFF;
}
h2{
    text-align: center;
    font-size: 20px;
    text-transform: uppercase;
    letter-spacing: 1px;
    color: black;
    padding: 30px 0;
}

/* Table Styles */

.table-wrapper{
    margin: 10px 70px 70px;
    box-shadow: 0px 35px 50px rgba( 0, 0, 0, 0.2 );
}

.fl-table {
    border-radius: 5px;
    font-size: 15px;
    font-weight: normal;
    border: none;
    border-collapse: collapse;
    width: 100%;
    max-width: 100%;
    white-space: nowrap;
    background-color: white;
}

.fl-table td, .fl-table th {
    text-align: center;
    padding: 8px;
}

.fl-table td {
    border-right: 1px solid #f8f8f8;
    font-size: 14px;
}

.fl-table thead th {
    color: #ffffff;
    background: #4169E1;
}


.fl-table thead th:nth-child(odd) {
    color: #ffffff;
    background: #324960;
}

.fl-table tr:nth-child(even) {
    background: #F8F8F8;
}

/* Responsive */

@media (max-width: 767px) {
    .fl-table {
        display: block;
        width: 100%;
    }
    .table-wrapper:before{
        content: "Scroll horizontally >";
        display: block;
        text-align: right;
        font-size: 11px;
        color: white;
        padding: 0 0 10px;
    }
    .fl-table thead, .fl-table tbody, .fl-table thead th {
        display: block;
    }
    .fl-table thead th:last-child{
        border-bottom: none;
    }
    .fl-table thead {
        float: left;
    }
    .fl-table tbody {
        width: auto;
        position: relative;
        overflow-x: auto;
    }
    .fl-table td, .fl-table th {
        padding: 20px .625em .625em .625em;
        height: 60px;
        vertical-align: middle;
        box-sizing: border-box;
        overflow-x: hidden;
        overflow-y: auto;
        width: 120px;
        font-size: 13px;
        text-overflow: ellipsis;
    }
    .fl-table thead th {
        text-align: left;
        border-bottom: 1px solid #f7f7f9;
    }
    .fl-table tbody tr {
        display: table-cell;
    }
    .fl-table tbody tr:nth-child(odd) {
        background: none;
    }
    .fl-table tr:nth-child(even) {
        background: transparent;
    }
    .fl-table tr td:nth-child(odd) {
        background: #F8F8F8;
        border-right: 1px solid #E6E4E4;
    }
    .fl-table tr td:nth-child(even) {
        border-right: 1px solid #E6E4E4;
    }
    .fl-table tbody td {
        display: block;
        text-align: center;
    }
}

	.forSubmit {
	display:inline-block;
	border:none;
	background-color:#6495ED;
	color:#FFFFFF;
	padding: 12px 28px;
    text-align: center;
    font-size: 16px;
    border-radius:6px;
	}
	
	.forSelect{
	display:inline-block;
	border:none;
	background-color:#324960;
	color:#FFFFFF;
	padding: 8px 14px;
    text-align: center;
    font-size: 10px;
    border-radius:4px;
	}
    </style>

    <title>推荐</title>
    <script type="text/javascript"
            src="http://api.map.baidu.com/api?v=2.0&ak=LtaZG8G4TNzGd6Rs57WGyKMr7Hx7GxbU"></script>
    <script type="text/javascript">

        function onSelect22(vaaa203,vaaa202,vaaa204) {
            var vform = document.getElementById("selectForm");

            vform.action = "<%=path%>/recommendGet.html?aaa203=" + vaaa203 + "&aaa204=" + vaaa204 + "&aaa202="+ vaaa202;
            //alert(vform.action);
            vform.submit();
        }

        function onDel(vaaa201) {
            var vform = document.getElementById("selectForm");
            vform.action = "<%=path%>/preferenceDelete.html?aaa201=" + vaaa201;

            //alert(vform.action);
            vform.submit();
        }

    </script>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
</head>
<body>
<%@ include file="navigate.jsp" %>
<h2>我的口味列表</h2>
<div class="table-wrapper">
    <form id="selectForm" method="post">
    <table class="fl-table">
        <thead>
        <tr>
            <th>口味</th>
            <th>菜系</th>
            <th>种类</th>
            <th>设备</th>
            <th>位置</th>
            <th>备注</th>
            <th></th>
        </tr>
        </thead>
        <tbody id="preference-list-body">

         <c:forEach items="${rows }" var="ins" varStatus="vs">
           <tr>
               <td>${ins.aaa202 }</td>
               <td>${ins.aaa203 }</td>
               <td>${ins.aaa204 }</td>
               <td>${ins.aaa205 }</td>
               <td>${ins.aaa206 }</td>
               <td>${ins.aaa207 }</td>
               <e:hidden name="qaaa204" value="${ins.qaaa204 }"/>
               <e:hidden name="qaaa202" value="${ins.qaaa202 }"/>
               <e:hidden name="qaaa203" value="${ins.qaaa203 }"/>
               <e:hidden name="aaa201" value="${ins.aaa201 }"/>
               <div class="hidden-city-name">

               </div>

               <td>
                   <a href="#" onclick="onDel('${ins.aaa201}')"><button class="forSelect">删除</button></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                   <a href="#" onclick="onSelect22('${ins.qaaa203 }','${ins.qaaa202 }','${ins.qaaa204 }')"><button class="forSelect">选择</button></a>
               </td>
           </tr>
          </c:forEach>
        <tbody>
    </table>
    </form>
</div>
<form id="tem" method="post">

    <div class="hidden-city-name">

    </div>
<h2>想尝试新口味吗？赶紧选择吧！</h2>
    <h3>&nbsp;&nbsp;&nbsp;菜系</h3>
    <ul class="dowebok">
        <c:forEach items="${headers }" var="ins" varStatus="vs">
            <c:if test="${ins.sfcode == 'aaa203'}">
                <li><input value="${ins.scode }" type="checkbox" name="aaa203" data-labelauty="${ins.sname }"></li>
            </c:if>
        </c:forEach>
    </ul>
    <h3>&nbsp;&nbsp;&nbsp;种类</h3>
    <ul class="dowebok">
        <c:forEach items="${headers }" var="ins" varStatus="vs">
            <c:if test="${ins.sfcode == 'aaa204'}">
                <li><input value="${ins.scode }" type="checkbox" name="aaa204" data-labelauty="${ins.sname }"></li>
            </c:if>
        </c:forEach>
    </ul>
    <h3>&nbsp;&nbsp;&nbsp;口味</h3>
    <ul class="dowebok">
        <c:forEach items="${headers }" var="ins" varStatus="vs">
            <c:if test="${ins.sfcode == 'aaa202'}">
                <li><input value="${ins.scode }" type="checkbox" name="aaa202" data-labelauty="${ins.sname }"></li>
            </c:if>
        </c:forEach>
    </ul>
    <div id="current-city">
    <h3>&nbsp;&nbsp;&nbsp;当前地址：</h3></div>
    <br>
    <div style="text-align:center">
        <input class="hidden-city-name" name="currentCity" type="hidden" value=""/>
    <button formaction="preferenceAdd.html" name="next" class="forSubmit" >添加到列表</button>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <button type="submit" name="next" formaction="recommendGet.html" class="forSubmit">获取推荐</button>
    </div>
    <br>

</form>
<div id="allmap">
</div>
<!-- ==== JQuery 1.12.1 js file ==== -->
<script src="dw_assets/js/jquery-1.12.1.min.js"></script>
<script type="text/javascript" src="css/jquery-labelauty.js"></script>

<script type="text/javascript">
    $(function(){
        $(':input').labelauty();
    });
</script>
<!-- 百度地图api获取当前城市 -->
<script type="text/javascript">
    var map = new BMap.Map("allmap");
    var point = new BMap.Point(116.331398,39.897445);
    map.centerAndZoom(point,12);

    function myFun(result){
        var cityName = result.name;
        //document.getElementById("city").innerHTML="当前位置: "+cityName;
        //document.getElementById("cityName").placeholder="当前定位: "+cityName;
        //document.getElementById("localcity").value=cityName;
        $("#current-city").html("<h3>&nbsp;&nbsp;&nbsp;当前地址：" + cityName + "</h3>")
        $(".hidden-city-name").html("<input name=\"currentCity\" type=\"hidden\" value=\"" + cityName +  "\"/>")
    }
    var myCity = new BMap.LocalCity();
    myCity.get(myFun);
</script>
</body>
</html>